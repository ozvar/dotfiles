" Neovim config


" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'					" nord color scheme
Plug 'vim-airline/vim-airline'					" beautify status line
Plug 'vim-airline/vim-airline-themes'			" beautify the status line even more

Plug 'lervag/vimtex'							" plugin for LaTeX files

Plug 'preservim/nerdtree'						" file system explorer inside vim
Plug 'ryanoasis/vim-devicons'					" glyphs for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	" add syntax and colors to nerdtree
Plug 'ggandor/leap.nvim'                        " 2-char search pattern leap to screen positions

Plug 'jalvesaq/Nvim-R'                          " support for editing R code
Plug 'jpalardy/vim-slime'						" send text from editor to REPL
Plug 'nvim-lua/plenary.nvim'					" dependency for lua-based plugins
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.4' }
Plug 'JuliaEditorSupport/julia-vim'				" julia support for vim
Plug 'kdheepak/JuliaFormatter.vim'				" formatter for julia code

Plug 'neoclide/coc.nvim', {'branch': 'release'}    

call plug#end()


" Theme
colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

" Settings
set encoding=utf-8						" 
set syntax=on							" syntax coloring should always be on
set re=0
set number								" line numbers on
set tabstop=4 							" adjust tab space
set shiftwidth=4						" adjust indentation space
set lbr									" disable line breaks in the middle of words
set clipboard+=unnamedplus				" access system clipboard register with '+'"
set guicursor=a:blinkon100				" cursor blink

let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:slime_target = 'tmux'
let g:webdevicons_enable_nerdtree = 1
let NERDTreeQuitOnOpen=1

lua require('leap').add_default_mappings() 

" vimtex compiler options
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Mappings
let mapleader = ';'
let maplocalleader = ','

:nnoremap <leader>n :NERDTreeFocus<CR>
:nnoremap <C-n> :NERDTree<CR>

" bindings for telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
