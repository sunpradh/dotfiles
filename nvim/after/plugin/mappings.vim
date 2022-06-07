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

" remap Ctrl-^ (alternate files)
nnoremap <Backspace> <C-^>

" disable annoying keymaps
noremap q: <Nop>
noremap q? <Nop>
noremap Q  <Nop>

" exit terminal mode
tnoremap <A-q> <C-\><C-n>


""" TELESCOPE
nnoremap <A-f>      <cmd>lua require('telescope.builtin').find_files({ follow = true })<CR>
nnoremap <A-b>      <cmd>Telescope buffers<CR>
nnoremap <leader>g  <cmd>Telescope live_grep<CR>
nnoremap <leader>ht <cmd>Telescope help_tags<CR>
nnoremap <leader>dg <cmd>Telescope lsp_document_diagnostics<CR>
nnoremap <leader>ds <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>ch <cmd>Telescope command_history<CR>


""" Misc
" quickly save
noremap <C-s> :w<CR>

" cancel search results
noremap <silent> <C-c> :nohlsearch<CR>

" correct spelling mistakes on the fly
inoremap <C-o> <c-g>u<Esc>[s1z=`]a<c-g>u

" Copy/paste from clipboard
nnoremap <C-p> "+P
inoremap <C-v> <C-r>+
vnoremap <C-y> "+y

" Better indenting
vnoremap < <gv
vnoremap > >gv

" replace a word globally on the line
noremap <leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Reload snippets
fun! ReloadSnippets()
    execute "luafile" stdpath('config') . "/after/plugin/luasnip.lua"
    lua require('luasnip.loaders.from_vscode').load({paths={'./snippets'}})
endfun

nnoremap <leader>rs :call ReloadSnippets()<CR>


""" Thanks ThePrimeagen
" keeping it centered
nnoremap n nzz
nnoremap N Nzz
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
" works better with wrapped lines
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
