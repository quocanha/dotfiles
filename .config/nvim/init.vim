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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround'

" Plug 'leafgarland/typescript-vim'	" Enables typescript syntax highlighting.
" Plug 'yuezk/vim-js'			" Enables javascript syntax highlighting.
Plug 'maxmellon/vim-jsx-pretty'		" Enables .jsx (react) syntax highlighting, also for .tsx
" Plug 'peitalin/vim-jsx-typescript'	" Enables .jsx and .tsx syntax highlighting
Plug 'takac/vim-hardtime'		" Vim Hardtime - used to improve vim habits
call plug#end()


let g:hardtime_default_on = 1
" let g:hardtime_showmsg = 1
" let g:hardtime_showerr = 1
" Set the local leader.
"let mapleader = "\\"
let maplocalleader = " "

" Rebind window navigation keybinds
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Override/set default flags
set nocompatible
set number			    	" Show current line number
set relativenumber			" Show relative line numbers
filetype plugin on
set tabstop=4				" Show existing tab with 4 spaces width
set shiftwidth=4			" When indenting with '>', use 4 spaces width
set softtabstop=4			" 
set expandtab				" On pressing tab, insert 4 spaces
syntax on

" Custom key mapping
map <C-n> :NERDTreeToggle<CR>

" Vimtex flags
let g:vimtex_view_general_viewer = "zathura"

" Gruvbox flags
" let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set bg=dark
" set bg=light

" Autocommands
"autocmd vimenter * NERDTree 		" Open NERDTree automatically with vim
autocmd StdinReadPre * let s:std_in=1	" Open NERDTree automatically if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" Configure YouCompleteMe to autocomplete
" if !exists("g:ycm_semantic_triggers")
"   let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
