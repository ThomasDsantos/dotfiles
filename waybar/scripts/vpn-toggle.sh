#!/bin/bash
# Toggle VPN connection

# Check if VPN is active
VPN_ACTIVE=$(nmcli -t -f TYPE,STATE connection show --active | grep "vpn:activated" | wc -l)

if [ "$VPN_ACTIVE" -gt 0 ]; then
    # VPN is on, disconnect it
    VPN_UUID=$(nmcli -t -f UUID,TYPE connection show --active | grep ":vpn$" | cut -d: -f1 | head -n1)
    if [ -n "$VPN_UUID" ]; then
        nmcli connection down uuid "$VPN_UUID"
        notify-send "VPN" "Disconnected" -i network-tun-disconnected
    fi
else
    # VPN is off, find and connect to first VPN connection
    VPN_UUID=$(nmcli -t -f UUID,TYPE connection show | grep ":vpn$" | cut -d: -f1 | head -n1)
    if [ -n "$VPN_UUID" ]; then
        nmcli connection up uuid "$VPN_UUID"
        notify-send "VPN" "Connected" -i network-tun
    else
        notify-send "VPN" "No VPN connections configured" -i dialog-error
    fi
fi
