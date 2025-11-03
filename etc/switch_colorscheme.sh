#!/bin/bash

if [ -f ~/.dark ]; then
    sed -i -E 's/theme = "Catppuccin Frappe"/theme = "Catppuccin Latte"/' "$HOME/.config/ghostty/config"
    sed -i -E "s/palette = 'catppuccin_frappe'/palette = 'catppuccin_latte'/" "$HOME/.config/starship.toml"
    rm ~/.dark
    touch ~/.light
else
    sed -i -E 's/theme = "Catppuccin Latte"/theme = "Catppuccin Frappe"/' "$HOME/.config/ghostty/config"
    sed -i -E "s/palette = 'catppuccin_latte'/palette = 'catppuccin_frappe'/" "$HOME/.config/starship.toml"
    rm ~/.light
    touch ~/.dark
fi
