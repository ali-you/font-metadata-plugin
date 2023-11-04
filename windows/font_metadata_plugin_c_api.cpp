#include "include/font_metadata/font_metadata_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "font_metadata_plugin.h"

void FontMetadataPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  font_metadata::FontMetadataPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
