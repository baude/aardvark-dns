#!/bin/bash

# This script configures the CI runtime environment.  It's intended
# to be used by Cirrus-CI, not humans.

set -e

source $(dirname $0)/lib.sh

# Only do this once
if [[ -r "/etc/ci_environment" ]]; then
    msg "It appears ${BASH_SOURCE[0]} already ran, exiting."
    exit 0
fi
trap "complete_setup" EXIT

msg "************************************************************"
msg "Setting up runtime environment"
msg "************************************************************"
show_env_vars

req_env_vars NETAVARK_URL

set -x  # show what's happening
curl --fail --location -o /tmp/netavark.zip "$NETAVARK_URL"
mkdir -p /usr/libexec/podman
cd /usr/libexec/podman
#unzip -q /tmp/netavark.zip
#chmod a+x /usr/libexec/podman/netavark
