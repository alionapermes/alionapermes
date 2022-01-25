#!/bin/bash

INSTALL="pacman -S"
NVIM_PATH="~/.config/nvim"

sudo ${INSTALL} nvim ccls python3 pip

if [[ ! -d ${NVIM_PATH} ]]; then
    mkdir -p ${NVIM_PATH}
fi

cp init.vim ${NVIM_PATH}/init.vim
