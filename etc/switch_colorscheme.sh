#!/bin/bash

if [ -f ~/.dark ]; then
    sed -i -E 's/theme = "Catppuccin Frappe"/theme = "Catppuccin Latte"/' "$HOME/.config/ghostty/config"
    rm ~/.dark
    touch ~/.light
else
    sed -i -E 's/theme = "Catppuccin Latte"/theme = "Catppuccin Frappe"/' "$HOME/.config/ghostty/config"
    rm ~/.light
    touch ~/.dark
fi
