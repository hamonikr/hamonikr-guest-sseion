#!/bin/bash

GRP="sgbgroup"

if [ -d "/var/tmp/guest-data" ]; then
    # /var/tmp/guest-data 폴더의 모든 데이터 삭제
    # 만약 guest 계정의 데이터를 남기고 싶으면 아래 줄을 주석 처리
    rm -rf /var/tmp/guest-data/*

    # Create folder
    mkdir -p /var/tmp/guest-data/$USER
    chown -R $USER.$GRP /var/tmp/guest-data/$USER
    chmod 2775 /var/tmp/guest-data/$USER
fi

# Create shortcut
#
# 하모니카 3.0과 4.0의 바탕화면 이름이 다르기 때문에 확인 후 업데이트

CHKVER=$(lsb_release -rs)

if [ "x${CHKVER}" = "xSUN" ]; then
    # HamoniKR 3.0
    echo "[Desktop Entry]
Name=Persistent guest data
Name[ko]=작업공간
Type=Link
URL=/var/tmp/guest-data/$USER
Icon=folder" > $HOME/Desktop/guest-data_shortcut.desktop

elif
    echo "[Desktop Entry]
Name=Persistent guest data
Name[ko]=작업공간
Type=Link
URL=/var/tmp/guest-data/$USER
Icon=folder" > $HOME/$(gettext -d xdg-user-dirs Desktop)/guest-data_shortcut.desktop

fi