""" ============================================================
""" MAPPINGS
""" ============================================================

" Leader key
let mapleader=' '

""" Buffers and windows
" move between windows
noremap <silent> <A-h> <C-w>h
noremap <silent> <A-j> <C-w>j
noremap <silent> <A-k> <C-w>k
noremap <silent> <A-l> <C-w>l
" Resize windows easily
noremap <silent> <A-Up>    :resize +3<CR>
noremap <silent> <A-Down>  :resize -3<CR>
noremap <silent> <A-Left>  :vertical resize +3<CR>
noremap <silent> <A-Right> :vertical resize -3<CR>
" create new windows and tabs
noremap <silent> <M-n>   :new<CR>
noremap <silent> <M-v>   :vnew<CR>
noremap <silent> <M-t>   :tabe<CR>
noremap <silent> <M-Tab> :tabn<CR>
" disable annoying keymaps
noremap q: <Nop>
noremap q? <Nop>
" exit terminal mode
tnoremap <A-q> <C-\><C-n>

""" FZF key bindings
" Custom mappings
nmap <A-f> :Files<CR>
nmap <A-b> :Buffers<CR>
nmap <A-:> :History:<CR>
nmap <A-/> :BLines<CR>
" search the word under the cursor with ag
nmap <leader>/ :Ag <c-r><c-w><CR>

" """ Coc.nvim key bindings
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" " Rename tool
" nmap <silent> <leader>R <Plug>(coc-rename)
" " Use K to show documentation in preview window.
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

""" Misc
" cancel search results
noremap <silent> <C-c> :nohlsearch<CR>
" correct spelling mistakes on the fly
inoremap <C-o> <c-g>u<Esc>[s1z=`]a<c-g>u
" Paste from clipboard
noremap  <C-p> "+P
vnoremap <C-y> "+y
" Better indenting
vnoremap < <gv
vnoremap > >gv
" replace a word globally on the line
noremap gr :%s/\<<C-r><C-w>\>//g<Left><Left>

