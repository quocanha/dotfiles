set number

let maplocalleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'

Plug 'lervag/vimtex'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

let g:vimtex_view_general_viewer = "zathura"

colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
