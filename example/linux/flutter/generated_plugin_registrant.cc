//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <font_metadata/font_metadata_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) font_metadata_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FontMetadataPlugin");
  font_metadata_plugin_register_with_registrar(font_metadata_registrar);
}
