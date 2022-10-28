#!/bin/bash

if [ -f ~/.dark ]; then
    ln -Fs ~/.config/kitty/theme_light.conf ~/.config/kitty/theme.conf && kill -SIGUSR1 $(ps -e | grep kitty | head -1 | xargs | cut -d' ' -f1)
    rm ~/.dark
    touch ~/.light
else
    ln -Fs ~/.config/kitty/theme_dark.conf ~/.config/kitty/theme.conf && kill -SIGUSR1 $(ps -e | grep kitty | head -1 | xargs | cut -d' ' -f1)
    rm ~/.light
    touch ~/.dark
fi
