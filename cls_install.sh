#!/bin/bash

architecture=$(uname -m)
url=""
mirror=""

function show_help {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --mirror    default: https://mirror.ghproxy.com"
}

while [[ $# -gt 0 ]]; do
    case $1 in
        --mirror)
            mirror=$2/
            shift 2
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Error: Invalid option '$1'. Use --help for usage information."
            exit 1
            ;;
    esac
    shift
done

case $architecture in
  "x86_64")
    echo "Running script for x86_64 architecture."
    url="https://github.com/taikulawo/pub-release/releases/download/cls-x86-64/cls.tar.gz"
    ;;
  "aarch64")
    echo "Running script for aarch64 architecture."
    url="https://github.com/taikulawo/pub-release/releases/download/cls-arm64/cls.tar.gz"
    ;;
  *)
    echo "Unsupported architecture: $architecture"
    exit 1
    ;;
esac

wget $mirror$url -O /tmp/cls.tar.gz
tar xvzf /tmp/cls.tar.gz -C /usr/local/bin/
