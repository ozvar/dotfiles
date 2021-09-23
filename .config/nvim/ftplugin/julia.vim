" Julia specific configuration

" Completion
let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_cmd_mapping = ['<C-J>']

" Formatting
nnoremap <leader>jf :<C-u>call JuliaFormatter#Format(0)<CR>
vnoremap <leader>jf :<C-u>call JuliaFormatter#Format(1)<CR>

" Slime default configuration
let g:slime_default_config = {"socket_name": "default", "target_pane": "julia:1.1"}
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>s <Plug>SlimeSendCell
