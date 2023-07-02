#!/usr/bin/env sh
# shellcheck shell=dash

self_file=$0
cd "$(dirname "$self_file")" || (echo "Unable to move into setup directory"; exit 1)

# this will use Home Manager to setup the home directory for the user
# it will optionally install nix globally
main() {
    local should_install=1
    local is_root=0

    [ "${EUID:-$(id -u)}" -eq 0 ] && is_root=1


    for arg in "$@"; do
        case "$arg" in
            install)
                should_install=1
                ;;
            --help|help|-h)
                usage
                ;;
        esac
    done


    # Install Nix if requested
    if [ 1 -eq $should_install ]; then
        echo "Attempting full Nix install"

        do_install
    else
        echo "Will download and use portable Nix"
    fi
    # Use installed or portable Nix to run Home Manager
}

is_container() {
    local is_container=0

    # docker will create this file if we are in a container
    [ -f /.dockerenv ] && is_container=1

    # we will be within docker/lxc namespaces if in a container
    [ "$(grep -sq 'docker\|lxc' /proc/1/cgroup)" ] && is_container=1


    RETVAL=$is_container
    return
}

do_install() {
    echo "installer stub"

    is_container
    if [ $RETVAL = 1 ];then
        echo "Running in a container, some cgroup/ns functions might be limited"
    fi
}

usage() {
    echo "Usage: $self_file [install]"
    echo "\tinstall: will install Nix in addition to configuring the home directory"
    exit 1
}

main "$@" || exit 1
