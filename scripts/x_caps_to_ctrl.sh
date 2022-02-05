#!/bin/bash
xmodmap -e "remove control = Control_R"
xmodmap -e "keycode 0x69 = Caps_Lock"
xmodmap -e "keycode 0x42 = Control_R"
xmodmap -e "add control = Control_R"
