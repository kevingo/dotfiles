#!/bin/sh

if test ! $(which nvm); then
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.6/install.sh | bash
fi

nvm install stable
nvm alias default stable
