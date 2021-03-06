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
Plug 'Valloric/YouCompleteMe'

Plug 'leafgarland/typescript-vim'	" Enables typescript syntax highlighting.
Plug 'yuezk/vim-js'			" Enables javascript syntax highlighting.
" Plug 'maxmellon/vim-jsx-pretty'		" Enables .jsx (react) syntax highlighting, also for .tsx
Plug 'peitalin/vim-jsx-typescript'	" Enables .jsx and .tsx syntax highlighting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()

" Set the local leader.
"let mapleader = "\\"
let maplocalleader = " "

" Rebind window navigation keybinds
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Override/set default flags
set nocompatible
set number				" Show current line number
set relativenumber			" Show relative line numbers
filetype plugin on
syntax on

" Custom key mapping
map <C-n> :NERDTreeToggle<CR>

" Vimtex flags
let g:vimtex_view_general_viewer = "zathura"

" Gruvbox flags
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark

" Autocommands
"autocmd vimenter * NERDTree 		" Open NERDTree automatically with vim
autocmd StdinReadPre * let s:std_in=1	" Open NERDTree automatically if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" Configure YouCompleteMe to autocomplete
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
