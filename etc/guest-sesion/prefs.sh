#!/bin/sh

GRP="sgbgroup"

# guest session 경고창 제거
touch $HOME/.skip-guest-warning-dialog

# guest session group
adduser $USER $GRP
