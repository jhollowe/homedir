#!/usr/bin/env sh
# shellcheck shell=dash


nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

# "read" the news so it doesn't keep showing up
home-manager news > /dev/null
