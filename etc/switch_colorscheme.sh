#!/bin/bash

if [ -f ~/.dark ]; then
    sed -i -E 's/theme = catppuccin-frappe/theme = catppuccin-latte/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.dark
    touch ~/.light
else
    sed -i -E 's/theme = catppuccin-latte/theme = catppuccin-frappe/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.light
    touch ~/.dark
fi
