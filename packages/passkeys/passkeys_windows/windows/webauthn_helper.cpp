#include "webauthn_helper.h"
#include <flutter/plugin_registrar_windows.h>
#include <wincrypt.h>
#include <bcrypt.h>
#include <stdexcept>

#pragma comment(lib, "bcrypt.lib")
#pragma comment(lib, "crypt32.lib")

namespace passkeys_windows
{

  std::wstring Utf8ToWide(const std::string &utf8)
  {
    if (utf8.empty())
      return std::wstring();

    int size = MultiByteToWideChar(CP_UTF8, 0, utf8.c_str(), -1, nullptr, 0);
    if (size == 0)
    {
      throw std::runtime_error("Failed to convert UTF-8 to wide string");
    }

    std::wstring result(size - 1, 0);
    MultiByteToWideChar(CP_UTF8, 0, utf8.c_str(), -1, &result[0], size);
    return result;
  }

  std::string WideToUtf8(const std::wstring &wide)
  {
    if (wide.empty())
      return std::string();

    int size = WideCharToMultiByte(CP_UTF8, 0, wide.c_str(), -1, nullptr, 0, nullptr, nullptr);
    if (size == 0)
    {
      throw std::runtime_error("Failed to convert wide string to UTF-8");
    }

    std::string result(size - 1, 0);
    WideCharToMultiByte(CP_UTF8, 0, wide.c_str(), -1, &result[0], size, nullptr, nullptr);
    return result;
  }

  std::vector<uint8_t> DecodeBase64Url(const std::string &input)
  {
    if (input.empty())
      return std::vector<uint8_t>();

    // Base64url to Base64 conversion
    std::string base64 = input;
    for (char &c : base64)
    {
      if (c == '-')
        c = '+';
      else if (c == '_')
        c = '/';
    }

    // Add padding
    size_t padding = (4 - base64.length() % 4) % 4;
    base64.append(padding, '=');

    // Decode using Windows CryptStringToBinary
    DWORD decoded_size = 0;
    if (!CryptStringToBinaryA(base64.c_str(), 0, CRYPT_STRING_BASE64,
                              nullptr, &decoded_size, nullptr, nullptr))
    {
      throw std::runtime_error("Failed to calculate base64 decode size");
    }

    std::vector<uint8_t> decoded(decoded_size);
    if (!CryptStringToBinaryA(base64.c_str(), 0, CRYPT_STRING_BASE64,
                              decoded.data(), &decoded_size, nullptr, nullptr))
    {
      throw std::runtime_error("Failed to decode base64");
    }

    decoded.resize(decoded_size);
    return decoded;
  }

  std::string EncodeBase64Url(const uint8_t *data, size_t size)
  {
    if (size == 0)
      return std::string();

    DWORD base64_size = 0;
    if (!CryptBinaryToStringA(data, static_cast<DWORD>(size),
                              CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF,
                              nullptr, &base64_size))
    {
      throw std::runtime_error("Failed to calculate base64 encode size");
    }

    std::string base64(base64_size, 0);
    DWORD written_size = base64_size;
    if (!CryptBinaryToStringA(data, static_cast<DWORD>(size),
                              CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF,
                              &base64[0], &written_size))
    {
      throw std::runtime_error("Failed to encode base64");
    }

    // Resize to actual content length (excluding null terminator if present)
    // CryptBinaryToStringA writes 'written_size' chars which may include null terminator
    if (written_size > 0 && base64[written_size - 1] == '\0')
    {
      base64.resize(written_size - 1);
    }
    else
    {
      base64.resize(written_size);
    }

    // Base64 to Base64url conversion
    for (char &c : base64)
    {
      if (c == '+')
        c = '-';
      else if (c == '/')
        c = '_';
    }

    // Remove padding
    while (!base64.empty() && base64.back() == '=')
    {
      base64.pop_back();
    }

    return base64;
  }

  std::string CreateClientDataJSON(
      const std::string &type,
      const std::string &challenge,
      const std::string &origin)
  {
    // Build JSON manually with proper escaping
    std::string json = "{";
    json += "\"type\":\"" + EscapeJsonString(type) + "\",";
    json += "\"challenge\":\"" + EscapeJsonString(challenge) + "\",";
    json += "\"origin\":\"" + EscapeJsonString(origin) + "\"";
    json += "}";
    return json;
  }

  std::string EscapeJsonString(const std::string &input)
  {
    std::string output;
    output.reserve(input.size());

    for (char c : input)
    {
      switch (c)
      {
      case '"':
        output += "\\\"";
        break;
      case '\\':
        output += "\\\\";
        break;
      case '\b':
        output += "\\b";
        break;
      case '\f':
        output += "\\f";
        break;
      case '\n':
        output += "\\n";
        break;
      case '\r':
        output += "\\r";
        break;
      case '\t':
        output += "\\t";
        break;
      default:
        if (static_cast<unsigned char>(c) < 0x20)
        {
          // Control characters - encode as \uXXXX
          char buf[7];
          snprintf(buf, sizeof(buf), "\\u%04x", static_cast<unsigned char>(c));
          output += buf;
        }
        else
        {
          output += c;
        }
        break;
      }
    }
    return output;
  }

  bool IsValidRpId(const std::string &rp_id)
  {
    // Basic validation: no scheme, no leading dot, no path
    if (rp_id.empty())
      return false;
    if (rp_id[0] == '.')
      return false;
    if (rp_id.find("://") != std::string::npos)
      return false;
    if (rp_id.find('/') != std::string::npos)
      return false;
    return true;
  }

  HWND GetWindowHandle(void *registrar)
  {
    auto *plugin_registrar = static_cast<flutter::PluginRegistrarWindows *>(registrar);
    if (plugin_registrar && plugin_registrar->GetView())
    {
      return plugin_registrar->GetView()->GetNativeWindow();
    }
    return nullptr;
  }

} // namespace passkeys_windows
