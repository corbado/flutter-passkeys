#include "include/passkeys_windows/passkeys_windows_plugin.h"
#include "messages.g.h"
#include "webauthn_helper.h"

// Download webauthn.h from https://github.com/microsoft/webauthn
// and place it in windows/include/
#include <webauthn.h>

#include <flutter/plugin_registrar_windows.h>

#include <memory>
#include <sstream>
#include <stdexcept>

namespace passkeys_windows
{

  // Implementation of PasskeysApi using Windows WebAuthn API
  class PasskeysApiImpl : public PasskeysApi
  {
  public:
    PasskeysApiImpl(flutter::PluginRegistrarWindows *registrar)
        : registrar_(registrar)
    {
      // Get initial cancellation ID from Windows
      WebAuthNGetCancellationId(&cancellation_id_);
    }

    virtual ~PasskeysApiImpl() = default;

    void CanAuthenticate(
        std::function<void(ErrorOr<bool> reply)> result) override
    {
      BOOL is_available = FALSE;
      HRESULT hr = WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable(&is_available);

      if (SUCCEEDED(hr))
      {
        result(is_available != FALSE);
      }
      else
      {
        result(false);
      }
    }

    void HasPasskeySupport(
        std::function<void(ErrorOr<bool> reply)> result) override
    {
      // Check if WebAuthn API is available (Windows 10 1903+)
      DWORD version = WebAuthNGetApiVersionNumber();
      result(version >= WEBAUTHN_API_VERSION_1);
    }

    void Register(
        const std::string &challenge,
        const RelyingParty &relying_party,
        const User &user,
        const AuthenticatorSelection *authenticator_selection,
        const flutter::EncodableList *pub_key_cred_params,
        const int64_t *timeout,
        const std::string *attestation,
        const flutter::EncodableList &exclude_credentials,
        std::function<void(ErrorOr<RegisterResponse> reply)> result) override
    {

      try
      {
        HWND hwnd = GetWindowHandle(registrar_);
        if (!hwnd)
        {
          result(FlutterError("NO_WINDOW", "Failed to get window handle"));
          return;
        }

        // Validate RP ID
        if (!IsValidRpId(relying_party.id()))
        {
          result(FlutterError("INVALID_RP_ID", "Invalid Relying Party ID format"));
          return;
        }

        // Decode user ID from base64url
        std::vector<uint8_t> user_id_bytes = DecodeBase64Url(user.id());

        // Create origin from RP ID
        std::string origin = "https://" + relying_party.id();

        // Create client data JSON
        std::string client_data_json = CreateClientDataJSON(
            "webauthn.create", challenge, origin);

        // Setup RP entity info
        std::wstring rp_id_wide = Utf8ToWide(relying_party.id());
        std::wstring rp_name_wide = Utf8ToWide(relying_party.name());

        WEBAUTHN_RP_ENTITY_INFORMATION rp_info = {};
        rp_info.dwVersion = WEBAUTHN_RP_ENTITY_INFORMATION_CURRENT_VERSION;
        rp_info.pwszId = rp_id_wide.c_str();
        rp_info.pwszName = rp_name_wide.c_str();

        // Setup user entity info
        std::wstring user_name_wide = Utf8ToWide(user.name());
        std::wstring user_display_name_wide = Utf8ToWide(user.display_name());

        WEBAUTHN_USER_ENTITY_INFORMATION user_info = {};
        user_info.dwVersion = WEBAUTHN_USER_ENTITY_INFORMATION_CURRENT_VERSION;
        user_info.cbId = static_cast<DWORD>(user_id_bytes.size());
        user_info.pbId = user_id_bytes.data();
        user_info.pwszName = user_name_wide.c_str();
        user_info.pwszDisplayName = user_display_name_wide.c_str();

        // Setup client data
        WEBAUTHN_CLIENT_DATA client_data = {};
        client_data.dwVersion = WEBAUTHN_CLIENT_DATA_CURRENT_VERSION;
        client_data.cbClientDataJSON = static_cast<DWORD>(client_data_json.size());
        client_data.pbClientDataJSON = reinterpret_cast<PBYTE>(const_cast<char *>(client_data_json.data()));
        client_data.pwszHashAlgId = WEBAUTHN_HASH_ALGORITHM_SHA_512;

        // Setup credential parameters
        std::vector<WEBAUTHN_COSE_CREDENTIAL_PARAMETER> cred_params;
        if (pub_key_cred_params && !pub_key_cred_params->empty())
        {
          for (const auto &param : *pub_key_cred_params)
          {
            if (const auto *custom_value = std::get_if<flutter::CustomEncodableValue>(&param))
            {
              const auto &param_obj = std::any_cast<const PubKeyCredParam &>(*custom_value);
              WEBAUTHN_COSE_CREDENTIAL_PARAMETER cp = {};
              cp.dwVersion = WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION;
              cp.pwszCredentialType = WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY;
              cp.lAlg = static_cast<LONG>(param_obj.alg());
              cred_params.push_back(cp);
            }
          }
        }
        else
        {
          // Default algorithms: ES256 and RS256
          WEBAUTHN_COSE_CREDENTIAL_PARAMETER es256 = {};
          es256.dwVersion = WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION;
          es256.pwszCredentialType = WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY;
          es256.lAlg = WEBAUTHN_COSE_ALGORITHM_ECDSA_P521_WITH_SHA512;
          cred_params.push_back(es256);

          WEBAUTHN_COSE_CREDENTIAL_PARAMETER rs256 = {};
          rs256.dwVersion = WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION;
          rs256.pwszCredentialType = WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY;
          rs256.lAlg = WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA512;
          cred_params.push_back(rs256);
        }

        WEBAUTHN_COSE_CREDENTIAL_PARAMETERS cred_params_list = {};
        cred_params_list.cCredentialParameters = static_cast<DWORD>(cred_params.size());
        cred_params_list.pCredentialParameters = cred_params.data();

        // Setup exclude credentials
        std::vector<WEBAUTHN_CREDENTIAL_EX> exclude_creds;
        std::vector<std::vector<uint8_t>> exclude_cred_ids;

        for (const auto &cred : exclude_credentials)
        {
          if (const auto *custom_value = std::get_if<flutter::CustomEncodableValue>(&cred))
          {
            const auto &cred_obj = std::any_cast<const ExcludeCredential &>(*custom_value);
            std::vector<uint8_t> cred_id = DecodeBase64Url(cred_obj.id());
            exclude_cred_ids.push_back(std::move(cred_id));

            WEBAUTHN_CREDENTIAL_EX ex = {};
            ex.dwVersion = WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION;
            ex.cbId = static_cast<DWORD>(exclude_cred_ids.back().size());
            ex.pbId = exclude_cred_ids.back().data();
            ex.pwszCredentialType = WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY;
            ex.dwTransports = WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK;
            exclude_creds.push_back(ex);
          }
        }

        WEBAUTHN_CREDENTIAL_LIST exclude_list = {};
        if (!exclude_creds.empty())
        {
          std::vector<PWEBAUTHN_CREDENTIAL_EX> exclude_ptrs;
          for (auto &cred : exclude_creds)
          {
            exclude_ptrs.push_back(&cred);
          }
          exclude_list.cCredentials = static_cast<DWORD>(exclude_ptrs.size());
          exclude_list.ppCredentials = exclude_ptrs.data();
        }

        // Setup options
        WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS options = {};
        options.dwVersion = WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION;
        options.dwTimeoutMilliseconds = timeout ? static_cast<DWORD>(*timeout) : 60000;
        options.dwAuthenticatorAttachment = WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY;
        options.bRequireResidentKey = FALSE;
        options.bPreferResidentKey = FALSE;
        options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED;

        // Map attestation preference
        options.dwAttestationConveyancePreference = WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT;
        if (attestation)
        {
          if (*attestation == "none")
          {
            options.dwAttestationConveyancePreference = WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_NONE;
          }
          else if (*attestation == "indirect")
          {
            options.dwAttestationConveyancePreference = WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_INDIRECT;
          }
          else if (*attestation == "direct")
          {
            options.dwAttestationConveyancePreference = WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT;
          }
          else if (*attestation == "enterprise")
          {
            options.dwAttestationConveyancePreference = WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT;
            options.dwEnterpriseAttestation = WEBAUTHN_ENTERPRISE_ATTESTATION_PLATFORM_MANAGED;
          }
        }

        options.pCancellationId = &cancellation_id_;
        options.pExcludeCredentialList = exclude_creds.empty() ? nullptr : &exclude_list;

        if (authenticator_selection)
        {
          if (authenticator_selection->authenticator_attachment())
          {
            const std::string &attachment = *authenticator_selection->authenticator_attachment();
            if (attachment == "platform")
            {
              options.dwAuthenticatorAttachment = WEBAUTHN_AUTHENTICATOR_ATTACHMENT_PLATFORM;
            }
            else if (attachment == "cross-platform")
            {
              options.dwAuthenticatorAttachment = WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM;
            }
          }

          // Handle resident key properly
          const std::string &resident_key = authenticator_selection->resident_key();
          if (resident_key == "required")
          {
            options.bRequireResidentKey = TRUE;
          }
          else if (resident_key == "preferred")
          {
            options.bPreferResidentKey = TRUE;
          }
          else if (resident_key == "discouraged")
          {
            options.bRequireResidentKey = FALSE;
            options.bPreferResidentKey = FALSE;
          }

          // Legacy requireResidentKey overrides if set
          if (authenticator_selection->require_resident_key())
          {
            options.bRequireResidentKey = TRUE;
          }

          const std::string &user_verification = authenticator_selection->user_verification();
          if (user_verification == "required")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED;
          }
          else if (user_verification == "preferred")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED;
          }
          else if (user_verification == "discouraged")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED;
          }
        }

        // Call Windows WebAuthn API
        struct CredentialAttestationDeleter
        {
          void operator()(PWEBAUTHN_CREDENTIAL_ATTESTATION p) const
          {
            if (p)
              WebAuthNFreeCredentialAttestation(p);
          }
        };
        PWEBAUTHN_CREDENTIAL_ATTESTATION raw_attestation = nullptr;
        HRESULT hr = WebAuthNAuthenticatorMakeCredential(
            hwnd, &rp_info, &user_info, &cred_params_list,
            &client_data, &options, &raw_attestation);

        if (FAILED(hr))
        {
          std::string error_code = MapHResultToErrorCode(hr);
          std::string error_message = GetErrorMessage(hr);
          result(FlutterError(error_code, error_message));
          return;
        }

        // Extract response data
        std::unique_ptr<WEBAUTHN_CREDENTIAL_ATTESTATION, CredentialAttestationDeleter> attestation_result(raw_attestation);
        std::string id = EncodeBase64Url(attestation_result->pbCredentialId, attestation_result->cbCredentialId);
        std::string client_data_json_b64 = EncodeBase64Url(
            reinterpret_cast<const uint8_t *>(client_data_json.data()),
            client_data_json.size());
        std::string attestation_object = EncodeBase64Url(
            attestation_result->pbAttestationObject, attestation_result->cbAttestationObject);

        // Get transports
        flutter::EncodableList transports;
        const struct
        {
          DWORD flag;
          const char *name;
        } transport_flags[] = {
            {WEBAUTHN_CTAP_TRANSPORT_USB, "usb"},
            {WEBAUTHN_CTAP_TRANSPORT_NFC, "nfc"},
            {WEBAUTHN_CTAP_TRANSPORT_BLE, "ble"},
            {WEBAUTHN_CTAP_TRANSPORT_INTERNAL, "internal"}};
        for (const auto &tf : transport_flags)
        {
          if (attestation_result->dwTransports & tf.flag)
          {
            transports.push_back(flutter::EncodableValue(tf.name));
          }
        }

        RegisterResponse response(id, id, client_data_json_b64, attestation_object, transports);

        result(response);
      }
      catch (const std::exception &e)
      {
        result(FlutterError("EXCEPTION", e.what()));
      }
    }

    void Authenticate(
        const std::string &relying_party_id,
        const std::string &challenge,
        const int64_t *timeout,
        const std::string *user_verification,
        const flutter::EncodableList *allow_credentials,
        const bool *prefer_immediately_available_credentials,
        std::function<void(ErrorOr<AuthenticateResponse> reply)> result) override
    {

      try
      {
        HWND hwnd = GetWindowHandle(registrar_);
        if (!hwnd)
        {
          result(FlutterError("NO_WINDOW", "Failed to get window handle"));
          return;
        }

        if (!IsValidRpId(relying_party_id))
        {
          result(FlutterError("INVALID_RP_ID", "Invalid Relying Party ID format"));
          return;
        }

        // Create origin from RP ID
        std::string origin = "https://" + relying_party_id;

        // Create client data JSON
        std::string client_data_json = CreateClientDataJSON(
            "webauthn.get", challenge, origin);

        // Setup client data
        WEBAUTHN_CLIENT_DATA client_data = {};
        client_data.dwVersion = WEBAUTHN_CLIENT_DATA_CURRENT_VERSION;
        client_data.cbClientDataJSON = static_cast<DWORD>(client_data_json.size());
        client_data.pbClientDataJSON = reinterpret_cast<PBYTE>(const_cast<char *>(client_data_json.data()));
        client_data.pwszHashAlgId = WEBAUTHN_HASH_ALGORITHM_SHA_512;

        // Setup allow credentials
        std::vector<WEBAUTHN_CREDENTIAL_EX> allow_creds;
        std::vector<std::vector<uint8_t>> allow_cred_ids;

        if (allow_credentials && !allow_credentials->empty())
        {
          for (const auto &cred : *allow_credentials)
          {
            if (const auto *custom_value = std::get_if<flutter::CustomEncodableValue>(&cred))
            {
              const auto &cred_obj = std::any_cast<const AllowCredential &>(*custom_value);
              std::vector<uint8_t> cred_id = DecodeBase64Url(cred_obj.id());
              allow_cred_ids.push_back(std::move(cred_id));

              WEBAUTHN_CREDENTIAL_EX ex = {};
              ex.dwVersion = WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION;
              ex.cbId = static_cast<DWORD>(allow_cred_ids.back().size());
              ex.pbId = allow_cred_ids.back().data();
              ex.pwszCredentialType = WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY;
              ex.dwTransports = WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK;
              allow_creds.push_back(ex);
            }
          }
        }

        WEBAUTHN_CREDENTIAL_LIST allow_list = {};
        std::vector<PWEBAUTHN_CREDENTIAL_EX> allow_ptrs;
        if (!allow_creds.empty())
        {
          for (auto &cred : allow_creds)
          {
            allow_ptrs.push_back(&cred);
          }
          allow_list.cCredentials = static_cast<DWORD>(allow_ptrs.size());
          allow_list.ppCredentials = allow_ptrs.data();
        }

        // Setup options
        std::wstring rp_id_wide = Utf8ToWide(relying_party_id);

        WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS options = {};
        options.dwVersion = WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION;
        options.dwTimeoutMilliseconds = timeout ? static_cast<DWORD>(*timeout) : 60000;
        options.dwAuthenticatorAttachment = WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY;
        options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED;
        options.pCancellationId = &cancellation_id_;
        options.pAllowCredentialList = allow_creds.empty() ? nullptr : &allow_list;

        if (user_verification)
        {
          if (*user_verification == "required")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED;
          }
          else if (*user_verification == "preferred")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED;
          }
          else if (*user_verification == "discouraged")
          {
            options.dwUserVerificationRequirement = WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED;
          }
        }

        // Handle prefer_immediately_available_credentials
        if (prefer_immediately_available_credentials && *prefer_immediately_available_credentials)
        {
          options.bAutoFill = TRUE;
        }

        // Call Windows WebAuthn API
        struct AssertionDeleter
        {
          void operator()(PWEBAUTHN_ASSERTION p) const
          {
            if (p)
              WebAuthNFreeAssertion(p);
          }
        };
        PWEBAUTHN_ASSERTION raw_assertion = nullptr;
        HRESULT hr = WebAuthNAuthenticatorGetAssertion(
            hwnd, rp_id_wide.c_str(), &client_data, &options, &raw_assertion);

        if (FAILED(hr))
        {
          std::string error_code = MapHResultToErrorCode(hr);
          std::string error_message = GetErrorMessage(hr);
          result(FlutterError(error_code, error_message));
          return;
        }

        // Extract response data
        std::unique_ptr<WEBAUTHN_ASSERTION, AssertionDeleter> assertion(raw_assertion);
        std::string id = EncodeBase64Url(
            assertion->Credential.pbId, assertion->Credential.cbId);
        std::string client_data_json_b64 = EncodeBase64Url(
            reinterpret_cast<const uint8_t *>(client_data_json.data()),
            client_data_json.size());
        std::string authenticator_data = EncodeBase64Url(
            assertion->pbAuthenticatorData, assertion->cbAuthenticatorData);
        std::string signature = EncodeBase64Url(
            assertion->pbSignature, assertion->cbSignature);
        std::string user_handle = assertion->cbUserId > 0
                                      ? EncodeBase64Url(assertion->pbUserId, assertion->cbUserId)
                                      : "";

        AuthenticateResponse response(
            id, id, client_data_json_b64, authenticator_data, signature, user_handle);

        // Memory freed automatically by unique_ptr deleter

        result(response);
      }
      catch (const std::exception &e)
      {
        result(FlutterError("EXCEPTION", e.what()));
      }
    }

    void CancelCurrentAuthenticatorOperation(
        std::function<void(std::optional<FlutterError> reply)> result) override
    {
      HRESULT hr = WebAuthNCancelCurrentOperation(&cancellation_id_);

      if (SUCCEEDED(hr))
      {
        // Get new cancellation ID for next operation
        WebAuthNGetCancellationId(&cancellation_id_);
        result(std::nullopt);
      }
      else
      {
        result(FlutterError("CANCEL_FAILED", "Failed to cancel operation"));
      }
    }

  private:
    flutter::PluginRegistrarWindows *registrar_;
    GUID cancellation_id_;

    std::string MapHResultToErrorCode(HRESULT hr)
    {
      switch (hr)
      {
      case NTE_USER_CANCELLED:
        return "user-cancelled";
      case NTE_NOT_SUPPORTED:
        return "not-supported";
      case HRESULT_FROM_WIN32(ERROR_TIMEOUT):
        return "timeout";
      case NTE_NOT_FOUND:
        return "not-found";
      case NTE_EXISTS:
        return "credential-excluded";
      case NTE_TOKEN_KEYSET_STORAGE_FULL:
        return "storage-full";
      default:
        // Try to get W3C exception for better error mapping
        if (hr == HRESULT_FROM_WIN32(ERROR_CANCELLED))
        {
          return "user-cancelled";
        }
        return "unknown-error";
      }
    }

    std::string GetErrorMessage(HRESULT hr)
    {
      PCWSTR error_name = WebAuthNGetErrorName(hr);
      if (error_name)
      {
        return WideToUtf8(error_name);
      }

      std::stringstream ss;
      ss << "WebAuthn error: 0x" << std::hex << hr;
      return ss.str();
    }
  };

  // Plugin implementation
  PasskeysWindowsPlugin::PasskeysWindowsPlugin(
      flutter::PluginRegistrarWindows *registrar)
      : registrar_(registrar),
        api_(std::make_unique<PasskeysApiImpl>(registrar))
  {
    PasskeysApi::SetUp(registrar->messenger(), api_.get());
  }

  PasskeysWindowsPlugin::~PasskeysWindowsPlugin()
  {
    PasskeysApi::SetUp(registrar_->messenger(), nullptr);
  }

  void PasskeysWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto plugin = std::make_unique<PasskeysWindowsPlugin>(registrar);
    registrar->AddPlugin(std::move(plugin));
  }

} // namespace passkeys_windows
