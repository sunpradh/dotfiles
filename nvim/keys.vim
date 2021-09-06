"""
""" MAPPINGS
"""


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
noremap <silent> <A-x>   :new<CR>
noremap <silent> <A-v>   :vnew<CR>
noremap <silent> <A-t>   :tabe<CR>
noremap <silent> <A-Tab> :tabn<CR>
" disable annoying keymaps
noremap q: <Nop>
noremap q? <Nop>
noremap Q  <Nop>
" exit terminal mode
tnoremap <A-q> <C-\><C-n>

" """ FZF
" nnoremap <A-f>      :Files<CR>
" nnoremap <A-b>      :Buffers<CR>
" nnoremap <leader>gw :BLines<CR>
" nnoremap <leader>rg :Rg<CR>
" nnoremap <leader>ch :History:<CR>
" nnoremap <leader>ht :Helptags<CR>

""" TELESCOPE
" Find files using Telescope command-line sugar.
nnoremap <A-f>      <cmd>Telescope find_files<cr>
nnoremap <A-b>      <cmd>Telescope buffers<cr>
nnoremap <leader>g  <cmd>Telescope live_grep<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>
nnoremap <leader>dg <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>ds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

""" Misc
" cancel search results
noremap <silent> <C-c> :nohlsearch<CR>
" correct spelling mistakes on the fly
inoremap <C-o> <c-g>u<Esc>[s1z=`]a<c-g>u
" Paste from clipboard
nnoremap  <C-p> "+P
vnoremap <C-y> "+y
" Better indenting
vnoremap < <gv
vnoremap > >gv
" replace a word globally on the line
noremap <leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>

""" Thanks ThePrimeagen
" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" better undo
" <C-g>u in insert mode breaks the undo sequence
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ( (<C-g>u
inoremap [ [<C-g>u
inoremap { {<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" jumplist mutation
" relative jumps with j and k now are part of the jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
