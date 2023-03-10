#!/usr/bin/env bash
set -euo pipefail
set -x

log_key_path=${1:-/root/.ssh/log.pub}
server_key_path=${2:-/root/.ssh/server.pub}

mkdir -p ~/.ssh
# Add github to known hosts
ssh-keyscan github.com >>~/.ssh/known_hosts

# Add "fake" SSH hosts per each private repo
cat <<EOT >>~/.ssh/config
  Host log.github.com
    HostName github.com
    IdentityFile ${log_key_path}
    IdentitiesOnly yes
  Host server.github.com
    HostName github.com
    IdentityFile ${server_key_path}
    IdentitiesOnly yes
EOT

# Configure git to use "fake" SSH hosts
git config \
	--global url."git@log.github.com:codilime/goprivate-blog-log".insteadOf \
	"https://github.com/codilime/goprivate-blog-log"
git config \
	--global url."git@server.github.com:codilime/goprivate-blog-server".insteadOf \
	"https://github.com/codilime/goprivate-blog-server"

export GOPRIVATE=github.com/codilime
