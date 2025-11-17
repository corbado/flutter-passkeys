#ifndef FLUTTER_PLUGIN_WEBAUTHN_HELPER_H_
#define FLUTTER_PLUGIN_WEBAUTHN_HELPER_H_

#include <windows.h>
#include <string>
#include <vector>

namespace passkeys_windows
{

    // Helper functions for encoding/decoding
    std::wstring Utf8ToWide(const std::string &utf8);
    std::string WideToUtf8(const std::wstring &wide);
    std::vector<uint8_t> DecodeBase64Url(const std::string &input);
    std::string EncodeBase64Url(const uint8_t *data, size_t size);

    // Helper to escape JSON strings
    std::string EscapeJsonString(const std::string &input);

    // Helper to create client data JSON
    std::string CreateClientDataJSON(
        const std::string &type,
        const std::string &challenge,
        const std::string &origin);

    // Helper to get HWND from registrar
    HWND GetWindowHandle(void *registrar);

    // Helper to validate RP ID format
    bool IsValidRpId(const std::string &rp_id);

} // namespace passkeys_windows

#endif // FLUTTER_PLUGIN_WEBAUTHN_HELPER_H_
