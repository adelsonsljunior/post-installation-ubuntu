#!/bin/bash

INSTALL_APPS_FLATPAK=(
    com.discordapp.Discord
    com.rtosta.zapzap
    com.obsproject.Studio
    md.obsidian.Obsidian
    org.localsend.localsend_app
    org.kde.okular
    org.telegram.desktop
    com.getpostman.Postman
)

for app in ${INSTALL_APPS_FLATPAK[@]}; do
    sudo flatpak install flathub $app -y
done
