call plug#begin()

"gui
Plug 'vim-airline/vim-airline' " status bar
Plug 'ryanoasis/vim-devicons'  " icons

"navigation
Plug 'preservim/nerdtree' " tree file viewer
let NERDTreeShowHidden=1  " show hidden files

"code
Plug 'neoclide/coc.nvim', {'branch': 'release'} " lang server
Plug 'jiangmiao/auto-pairs'                     " brackets
Plug 'kien/ctrlp.vim'                           " file searching
Plug 'tpope/vim-commentary'                     " comments
Plug 'jackguo380/vim-lsp-cxx-highlight'         " c++ syntax highlight

"git
Plug 'airblade/vim-gitgutter' " shows diffs

"colorschemes
Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()


colorscheme deep-space

syntax on
set number

"tab
set expandtab   
set tabstop=4
set shiftwidth=4

"colors
set background=dark
set termguicolors

nnoremap <C-t> :NERDTreeToggle<CR>



"functions

"deep-space's dependency
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction

