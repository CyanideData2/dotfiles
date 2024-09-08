#! /usr/bin/bash

# KMONAD
# PLUGGEDKEYCHRON=/dev/input/by-id/usb-Keychron_Keychron_K6-event-kbd
# SPICE=/home/daniel/V/Workspace/my_config/kmonad/keychronColemak.kbd
# PLAIN=/home/daniel/V/Workspace/my_config/kmonad/colemak.kbd
# FOREIGN=/home/daniel/V/Workspace/my_config/kmonad/nordic.kbd
# /home/daniel/.local/bin/kmonad $PLAIN &
# if [ -e "$PLUGGEDKEYCHRON" ]
# then
#     /home/daniel/.local/bin/kmonad $SPICE
# fi
# while inotifywait -e create /dev/input/; do
#         /home/daniel/.local/bin/kmonad $SPICE
#         /home/daniel/.local/bin/kmonad $FOREIGN
# done
#
/home/daniel/.cargo/bin/kanata -c /home/daniel/V/Workspace/my_config/kanata/main.kbd
