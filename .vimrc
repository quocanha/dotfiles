" Download Plug plugin manager if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define the plugins that we use.
" TODO: Add:
" * Snippets
" * Comments
" * Fuzzy File search
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'Quramy/tsuquyomi'
Plug 'kien/ctrlp.vim'
call plug#end()

" Set the local leader.
"let mapleader = "\\"
let maplocalleader = " "

" Rebind window navigation keybinds
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w><C-f> <C-w>vgf


" Override/set default flags
set nocompatible
set number				" Show current line number
set relativenumber			" Show relative line numbers
set hidden
filetype plugin on
syntax on

" Custom key mapping
map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeFind<CR>

" Vimtex flags
let g:vimtex_view_general_viewer = "zathura"

" Gruvbox flags
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark
