#!/usr/bin/env bash

CITY="Villeparisis"
KEY=$(< "/etc/security/weather_api_key")

curl -sf "http://api.openweathermap.org/data/2.5/weather?appid=${KEY}&q=${CITY}&units=metric"
echo
