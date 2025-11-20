#ifndef FLUTTER_PLUGIN_PASSKEYS_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_PASSKEYS_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter_plugin_registrar.h>

#include <memory>

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FLUTTER_PLUGIN_EXPORT __declspec(dllimport)
#endif

#if defined(__cplusplus)
extern "C"
{
#endif

  FLUTTER_PLUGIN_EXPORT void PasskeysWindowsPluginRegisterWithRegistrar(
      FlutterDesktopPluginRegistrarRef registrar);

#if defined(__cplusplus)
} // extern "C"
#endif

namespace passkeys_windows
{

  class PasskeysApiImpl;

  class PasskeysWindowsPlugin : public flutter::Plugin
  {
  public:
    static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

    PasskeysWindowsPlugin(flutter::PluginRegistrarWindows *registrar);

    virtual ~PasskeysWindowsPlugin();

    // Disallow copy and assign.
    PasskeysWindowsPlugin(const PasskeysWindowsPlugin &) = delete;
    PasskeysWindowsPlugin &operator=(const PasskeysWindowsPlugin &) = delete;

  private:
    flutter::PluginRegistrarWindows *registrar_;
    std::unique_ptr<PasskeysApiImpl> api_;
  };

} // namespace passkeys_windows

#endif // FLUTTER_PLUGIN_PASSKEYS_WINDOWS_PLUGIN_H_
