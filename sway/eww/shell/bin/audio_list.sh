#!/bin/sh

pactl --format=json list "$1" | jq -c '[.[] | select(.description | contains("HDMI") | not)]' | jq -c 'map({
    index,
    id: .name,
    name: .description,
    port: .active_port,
    ports: .ports | map(select(.availability == "available") | {
	id: .name,
	name: .description
    })
})'
