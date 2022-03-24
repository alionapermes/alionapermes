call plug#begin()

"gui
Plug 'vim-airline/vim-airline' " status bar

"navigation
Plug 'preservim/tagbar'             " tags
Plug 'kyazdani42/nvim-tree.lua'     " files tree
Plug 'kyazdani42/nvim-web-devicons' " icons

"code
Plug 'neoclide/coc.nvim', {'branch': 'release'} " lang server
Plug 'jiangmiao/auto-pairs'                     " brackets
Plug 'kien/ctrlp.vim'                           " file searching
Plug 'tpope/vim-commentary'                     " comments
Plug 'peterhoeg/vim-qml'

Plug 'cdelledonne/vim-cmake'
let g:cmake_build_dir_location = './build'
let g:cmake_default_config     = ''

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight  = 1

Plug 'alepez/vim-gtest'
let g:gtest#gtest_command = './build/bin/test'


" syntax highlight
Plug 'ionide/ionide-vim'

"git
Plug 'airblade/vim-gitgutter' " shows diffs

"colorschemes
Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()

lua require'nvim-tree'.setup {}
lua require'nvim-tree'.toggle(false, false)

colorscheme deep-space

syntax on
set number
set nohlsearch
set colorcolumn=80
set shell=/usr/bin/zsh
set shellcmdflag=-ic

"tab
set expandtab   
set tabstop=4
set shiftwidth=4

"colors
set background=dark
set termguicolors

nmap <F8> :TagbarToggle<CR>



"functions
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction

