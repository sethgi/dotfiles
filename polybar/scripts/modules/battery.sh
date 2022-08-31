#!/bin/bash

#Based on: https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/battery-combined-shell/battery-combined-shell.sh

PATH_AC="/sys/class/power_supply/AC"
PATH_BAT="/sys/class/power_supply/BAT0"

# Check if plugged in
ac=0
if [ -f "$PATH_AC/online" ]; then
  ac=$(cat "$PATH_AC/online")
fi


# Get current charge state
current_level=0
if [ -f "$PATH_BAT/charge_now" ]; then
  current_level=$(cat "$PATH_BAT/charge_now")
fi

# Get max charge state
max_level=0
if [ -f "$PATH_BAT/charge_full" ]; then
  max_level=$(cat "$PATH_BAT/charge_full")
fi

battery_percent=$(("$current_level * 100 / $max_level"))

# Set up all the icons
# This relies on using the FontAwesome font, which I think was installed via 
# the AUR nerd-fonts-complete package

icon_empty_discharge=
icon_ten_discharge=
icon_twenty_discharge=
icon_thirty_discharge=
icon_fourty_discharge=
icon_fifty_discharge=
icon_sixty_discharge=
icon_seventy_discharge=
icon_eighty_discharge=
icon_ninety_discharge=
icon_full_discharge=

icon_empty_charge=
icon_ten_charge=
icon_twenty_charge=
icon_thirty_charge=
icon_fourty_charge=
icon_fifty_charge=
icon_sixty_charge=
icon_seventy_charge=
icon_eighty_charge=
icon_ninety_charge=
icon_full_charge=

good_color=$(polybar -q -d good)
warning_color=$(polybar -q -d warning)
alert_color=$(polybar -q -d alert)

icon_str="icon_"

color=$alert_color

if [ "$battery_percent" -lt 5 ]; then
	icon_str="${icon_str}empty_"
elif [ "$battery_percent" -lt 15 ]; then
	icon_str="${icon_str}ten_"
elif [ "$battery_percent" -lt 25 ]; then
	color=$warning_color
	icon_str="${icon_str}twenty_"
elif [ "$battery_percent" -lt 35 ]; then
	color=$warning_color
	icon_str="${icon_str}thirty_"
elif [ "$battery_percent" -lt 45 ]; then
	color=$warning_color
	icon_str="${icon_str}fourty_"
elif [ "$battery_percent" -lt 55 ]; then
	color=$good_color
	icon_str="${icon_str}fifty_"
elif [ "$battery_percent" -lt 65 ]; then
	color=$good_color
	icon_str="${icon_str}sixty_"
elif [ "$battery_percent" -lt 75 ]; then
	color=$good_color
	icon_str="${icon_str}seventy_"
elif [ "$battery_percent" -lt 85 ]; then
	color=$good_color
	icon_str="${icon_str}eighty_"
elif [ "$battery_percent" -lt 95 ]; then
	color=$good_color
	icon_str="${icon_str}ninety_"
else
	color=$good_color
	icon_str="${icon_str}full_"
fi


if [ "$ac" -eq 1 ]; then
	icon_str="${icon_str}charge"
	if [ "$color" = "$alert_color" ]; then
		color=$warning_color
	fi
else
	icon_str="${icon_str}discharge"
fi

echo "%{F$color}${!icon_str}%{F-} $battery_percent%"
