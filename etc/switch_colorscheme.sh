#!/bin/bash

if [ -f ~/.dark ]; then
    sed -i -E 's/theme = "Catppuccin Frappe"/theme = "Catppuccin Latte"/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.dark
    touch ~/.light
else
    sed -i -E 's/theme = "Catppuccin Latte"/theme = "Catppuccin Frappe"/' "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    rm ~/.light
    touch ~/.dark
fi
