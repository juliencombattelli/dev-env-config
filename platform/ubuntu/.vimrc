set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

colorscheme codedark

syntax on
set number
set showmatch

" Register Ctrl+A shortcut
map <C-a> <esc>ggVG<CR>
imap <C-a> <esc>ggVG<CR>

" Register Ctrl+N shortcut
nmap <C-n> :NERDTreeToggle<CR>

" Indentation settings
set expandtab
set shiftwidth=4
set softtabstop=4

" Lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
    \   'colorscheme': 'powerline'
    \}
let g:lightline.separator = { 	
    \   'left': '', 'right': ''   
    \}
let g:lightline.subseparator = {
    \   'left': '', 'right': ''   
    \}

