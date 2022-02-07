#!/bin/bash

NVIM_PATH="~/.config/nvim"

if [[ ! -d ${NVIM_PATH} ]]; then
    mkdir -p ${NVIM_PATH}
fi

cp init.vim ${NVIM_PATH}/init.vim
cp compile_options.json ${NVIM_PATH}/compile_options.json

