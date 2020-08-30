" Neovim config


" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Roy-Orbison/nord-vim'				" nord color scheme
Plug 'vim-airline/vim-airline'			" sexy status line
Plug 'vim-airline/vim-airline-themes'	" make the status line even sexier
Plug 'lervag/vimtex'					" plugin for LaTeX files

call plug#end()


" Theme
colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

" Settings
set encoding=utf-8						" 
set syntax=on							" syntax coloring should always be on
set number								" line numbers on
set tabstop=4 							" adjust tab space
set clipboard+=unnamedplus				" access system clipboard register with "+" 

let g:tex_flavor = 'latex'
