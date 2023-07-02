#!/bin/sh
# shellcheck shell=dash

cd "$(dirname "$0")"

additional_arguments=""

if [ -n "$REMOTE_CONTAINERS" ];then
  additional_arguments="linux --no-confirm --init none"
fi


export NIX_INSTALLER_DIAGNOSTIC_ENDPOINT=""


./nix-installer.sh install $additional_arguments
