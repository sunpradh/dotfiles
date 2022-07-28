#!/bin/sh

swaymsg output eDP-1 pos 1920 0
# swaymsg output "'Philips Consumer Electronics Company PHL 243V7 0x00003364'" pos 0 0
EXT_DISPLAY=$(swaymsg -t get_outputs | jq '.[] | select(.name != "eDP-1").name')
swaymsg output $EXT_DISPLAY pos 0 0
