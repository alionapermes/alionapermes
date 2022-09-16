call plug#begin()

"ui
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


"cpp
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight  = 1

"qt (cpp)
Plug 'peterhoeg/vim-qml'
Plug 'edlanglois/vim-qrc'

"gtest (cpp)
Plug 'alepez/vim-gtest'
let g:gtest#gtest_command = './build/bin/test'

"cmake (cpp)
Plug 'cdelledonne/vim-cmake'
let g:cmake_build_dir_location = './build'
let g:cmake_default_config     = ''

"rust
Plug 'rust-lang/rust.vim'

"golang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
let g:go_def_mapping_enabled = 0

"fsharp
Plug 'ionide/ionide-vim'

"git
Plug 'airblade/vim-gitgutter' " shows diffs

"eh?
Plug 'Shougo/vimproc.vim', {'do': 'make'}


"colorschemes
Plug 'tyrannicaltoucan/vim-deep-space'
let g:deepspace_italics=1
let g:airline_theme='deep_space'

call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

lua require'nvim-tree'.setup {}
" lua require'nvim-tree'.toggle(false, false)

"common
syntax on
set number
set relativenumber
set nohlsearch
set colorcolumn=80
set shell=/usr/bin/zsh
set shellcmdflag=-ic

"tab
set expandtab   
set tabstop=4
set shiftwidth=4

"colors
colorscheme deep-space
set background=dark
set termguicolors

"shorcuts
nnoremap <C-t> :NvimTreeOpen<CR>
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

fu! SaveSess()
    execute 'call mkdir(%:p:h/.vim)'
    execute 'mksession! %:p:h/.vim/session.vim'
endfunction

fu! RestoreSess()
execute 'so %:p:h/.vim/session.vim'
if bufexists(1)
    for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
            exec 'sbuffer ' . l
        endif
    endfor
endif
endfunction

" autocmd BufLeave * call SaveSess()
" autocmd BufEnter * call RestoreSess()

