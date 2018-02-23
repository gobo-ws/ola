/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * HueDevice.h
 * Interface for the Huedevice
 * Copyright (C) 2017 Peter Newman, forked by Johan Nilsson for testing with Philips Hue
 */

#ifndef PLUGINS_HUE_HUEDEVICE_H_
#define PLUGINS_HUE_HUEDEVICE_H_

#include <string>
#include <vector>

#include "ola/network/IPV4Address.h"
#include "olad/Device.h"

namespace ola {
namespace plugin {
namespace hue {

class HueDevice: public ola::Device {
 public:
    HueDevice(AbstractPlugin *owner,
                   class Preferences *preferences,
                   class PluginAdaptor *plugin_adaptor,
                   const ola::network::IPV4Address &controller);

    std::string DeviceId() const;

 protected:
    bool StartHook();
    void PrePortStop();
    void PostPortStop();

 private:
    class HueNode *m_node;
    class Preferences *m_preferences;
    class PluginAdaptor *m_plugin_adaptor;
    const ola::network::IPV4Address m_controller;

    void SetDefaults();
    std::string IPPortKey() const;
    std::string PanelsKey() const;

    static const uint16_t DEFAULT_STREAMING_PORT = 60221;
};
}  // namespace hue
}  // namespace plugin
}  // namespace ola
#endif  // PLUGINS_HUE_HUEDEVICE_H_
