#!/bin/bash
# Check VPN connection status via NetworkManager

# Get active VPN connections
VPN_ACTIVE=$(nmcli -t -f TYPE,STATE connection show --active | grep "vpn:activated" | wc -l)

if [ "$VPN_ACTIVE" -gt 0 ]; then
    # VPN is connected
    VPN_NAME=$(nmcli -t -f NAME,TYPE connection show --active | grep ":vpn$" | cut -d: -f1 | head -n1)
    echo "{\"text\":\"🔒 VPN\",\"tooltip\":\"VPN Connected: $VPN_NAME\",\"class\":\"vpn-on\",\"alt\":\"on\"}"
else
    # VPN is disconnected
    echo "{\"text\":\"🔓\",\"tooltip\":\"VPN Disconnected\",\"class\":\"vpn-off\",\"alt\":\"off\"}"
fi
