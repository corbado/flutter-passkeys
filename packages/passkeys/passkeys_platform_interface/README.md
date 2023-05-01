# passkeys_platform_interface

A common platform interface for the `passkeys` plugin.

This interface allows platform-specific implementations of the `passkeys` plugin, as well as the plugin itself, to ensure they are supporting the same interface.

# Usage

To implement a new platform-specific implementation of `passkeys`, extend `PasskeysPlatform` with an implementation that performs the platform-specific behavior.