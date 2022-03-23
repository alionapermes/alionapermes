#!/bin/bash

NVIM_PATH="~/.config/nvim"

if [[ $1 = "--help" ]]; then
    echo "options:"
    echo "    +vimplug    - install vim-plug"
    exit
fi

if [[ ! -d ${NVIM_PATH} ]]; then
    mkdir -p ${NVIM_PATH}
fi

if [[ $1 = "+vimplug" ]]; then
    sh -c 'curl -fLo \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

cp init.vim ${NVIM_PATH}/init.vim
cp coc-settings.json ${NVIM_PATH}/coc-settings.json

