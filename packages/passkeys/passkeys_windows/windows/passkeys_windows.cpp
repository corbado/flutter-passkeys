#include "include/passkeys_windows/passkeys_windows.h"
#include "include/passkeys_windows/passkeys_windows_plugin.h"
#include <flutter/plugin_registrar_windows.h>

void PasskeysWindowsPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar)
{
    passkeys_windows::PasskeysWindowsPlugin::RegisterWithRegistrar(
        flutter::PluginRegistrarManager::GetInstance()
            ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
