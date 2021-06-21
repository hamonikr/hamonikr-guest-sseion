#!/bin/bash

GRP="sgbgroup"

# /var/tmp/guest-data 폴더의 모든 데이터 삭제
# 만약 guest 계정의 데이터를 남기고 싶으면 아래 줄을 주석 처리
rm -rf /var/tmp/guest-data/*

# Create folder
mkdir -p /var/tmp/guest-data/$USER
chown -R $USER.$GRP /var/tmp/guest-data/$USER
chmod 2775 /var/tmp/guest-data/$USER

# Create shortcut
# if Desktop folder name is diffrent for i18n chnage as below
# $HOME/$(gettext -d xdg-user-dirs Desktop)/guest-data_shortcut.desktop

echo "[Desktop Entry]
Name=Persistent guest data
Name[ko]=작업공간
Type=Link
URL=/var/tmp/guest-data/$USER
Icon=folder" > $HOME/Desktop/guest-data_shortcut.desktop