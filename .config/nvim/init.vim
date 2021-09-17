" Neovim config


" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'			" nord color scheme
Plug 'vim-airline/vim-airline'			" sexy status line
Plug 'vim-airline/vim-airline-themes'	" make the status line even sexier

Plug 'lervag/vimtex'					" plugin for LaTeX files

Plug 'preservim/nerdtree'				" file system explorer inside vim
Plug 'ryanoasis/vim-devicons'			" glyphs for nerdtree
Plug 'Townk/vim-autoclose'				" autoclose brackets

Plug 'neoclide/coc.nvim', {'branch': 'release'}    

Plug 'jpalardy/vim-slime'				" send text from editor to REPL
Plug 'JuliaEditorSupport/julia-vim'		" julia support for vim
Plug 'kdheepak/JuliaFormatter.vim'		" formatter for julia code

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
set lbr									" disable line breaks in the middle of words
set clipboard+=unnamedplus				" access system clipboard register with "+" 
set guicursor=a:blinkon100				" cursor blink

let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:slime_target = 'tmux'
let g:webdevicons_enable_nerdtree = 1

" Mappings
let mapleader = ';'

:nnoremap <leader>n :NERDTreeFocus<CR>
:nnoremap <C-n> :NERDTree<CR>
