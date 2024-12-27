#!/bin/bash

if [ -f ~/.dark ]; then
    ln -Fs ~/.config/kitty/theme_light.conf ~/.config/kitty/theme.conf && kill -SIGUSR1 $(ps -e | grep kitty | head -1 | xargs | cut -d' ' -f1)
    sed -i -E 's/theme = catppuccin-frappe/theme = catppuccin-latte/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.dark
    touch ~/.light
else
    ln -Fs ~/.config/kitty/theme_dark.conf ~/.config/kitty/theme.conf && kill -SIGUSR1 $(ps -e | grep kitty | head -1 | xargs | cut -d' ' -f1)
    sed -i -E 's/theme = catppuccin-latte/theme = catppuccin-frappe/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.light
    touch ~/.dark
fi
