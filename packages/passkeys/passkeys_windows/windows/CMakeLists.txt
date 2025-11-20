cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "passkeys_windows")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "passkeys_windows_plugin")

add_library(${PLUGIN_NAME} SHARED
  "passkeys_windows.cpp"
  "passkeys_windows_plugin.cpp"
  "webauthn_helper.cpp"
  "messages.g.cpp"
)

apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_include_directories(${PLUGIN_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(${PLUGIN_NAME} PRIVATE
  flutter
  flutter_wrapper_plugin
  WebAuthN
  crypt32
  bcrypt
)

# WebAuthn API is loaded dynamically from webauthn.dll at runtime
# No static library linking required

# List of absolute paths to libraries that should be bundled with the plugin
set(passkeys_windows_bundled_libraries
  ""
  PARENT_SCOPE
)
