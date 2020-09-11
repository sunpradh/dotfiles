
""" BEGIN VIM-PLUG
"""------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}	  " conquer of completion
Plug 'vimwiki/vimwiki'		  " notetaking 
Plug 'lervag/vimtex'              " latex plugin
Plug 'sirver/ultisnips'           " snippets plugin
Plug 'junegunn/fzf.vim'           " fzf plugin for vim
Plug 'vim-airline/vim-airline'    " statusbar
Plug 'tpope/vim-surround'         " surround
Plug 'honza/vim-snippets'         " set of snippets
Plug 'jiangmiao/auto-pairs'	  " auto pairs parenthesism ecc...
Plug 'farmergreg/vim-lastplace'   " remember last saved plase
Plug 'junegunn/vim-easy-align'    " easy align
Plug 'scrooloose/nerdtree'        " NERDtree
Plug 'arcticicestudio/nord-vim'   " nord colorscheme
Plug 'ryanoasis/vim-devicons'	  " cool icons
Plug 'JuliaEditorSupport/julia-vim' " Julia support for vim
Plug 'kevinoid/vim-jsonc'	  " support for jsonc 
Plug 'jvirtanen/vim-octave'       " octave syntax
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex', 'markdown', 'vimwiki']} " LaTeX conceal
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Markdown preview
Plug 'junegunn/goyo.vim'	  " distraction free writing
Plug 'junegunn/limelight.vim'	  " distraction free writing



call plug#end()
"""------------------------------------------------------------

""" SETTINGS
"""------------------------------------------------------------

""" General settings
set nocompatible               " be iMproved, required
filetype off                   " required
syntax on		       " enable syntax highlighting
set hidden		       " switch buffers even if are unsaved
set relativenumber             " Show relative line numbers
set number                     " Show line numbers
set showmatch                  " Highlight matching brace
set hlsearch                   " Highlight all search results
set smartcase                  " Enable smart-case search
set incsearch                  " Searches for strings incrementally
set autoindent                 " Auto-indent new lines
set shiftwidth=4               " Number of auto-indent spaces
set softtabstop=4              " Number of spaces per Tab
set smartindent                " Enable smart-indent
set ruler                      " Show row and column ruler information
set showmatch                  " Highlight matching brace
set linebreak                  " break lines between words
set cursorline                 " highlight current line
set complete-=i                " don't autocomplete with included files
set backspace=indent,eol,start " Backspace behaviour
set splitbelow		       " new split below
set splitright		       " new vsplit right
set nowrap		       " no wrapping lines

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
noremap <silent> <M-n> :new<CR>
noremap <silent> <M-v> :vnew<CR>
noremap <silent> <M-t> :tabe<CR>
" Switch windows/tabs
noremap <silent> <Tab> <C-w><C-w>
noremap <silent> <M-Tab> :tabn<CR>
" disable annoying keymaps
noremap q: <Nop>
noremap q? <Nop>

""" Colorscheme
set background=dark
" Use Nord as a colorscheme
colorscheme nord
let g:nord_italic = 1
let g:nord_italic_comments = 1

""" Misc
" Fast redraw
set lazyredraw
set ttyfast
set re=1
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
noremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" solid lines with split windows
set fillchars=vert:│

""" File specific settings
augroup fileaugroup
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults :silent !xrdb % >/dev/null
    autocmd BufWritePost ~/.config/zsh/.zshrc	    :silent !source % >/dev/null
    autocmd BufWritePost ~/.config/nvim/init.vim    :source %
    autocmd BufWritePost ~/.config/sway/config	    :silent !swaymsg reload
    autocmd BufWritePost ~/.config/waybar/config    :silent !swaymsg reload
    autocmd BufRead	 ~/.config/waybar/config    set filetype=jsonc
    autocmd BufWritePost ~/.config/waybar/style.css :silent !swaymsg reload
augroup end

"""------------------------------------------------------------


""" PLUGIN SETTINGS
"""------------------------------------------------------------

""" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-C-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

""" LaTeX (vimtex) and markdown
augroup latexmdgroup
    " force filetype (necessary with empy files)
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    " set spelling and wrapping
    autocmd BufRead *.tex,*.md set spell
    autocmd BufRead *.tex,*.md set spelllang=en,it
    autocmd BufRead *.tex,*.md set wrap
    autocmd BufRead *.tex,*.md set conceallevel=2
    autocmd BufRead *.tex,*.md hi Conceal guibg=NONE ctermbg=NONE
    autocmd BufRead *.bib set nospell
    autocmd VimLeave *.tex VimtexClean " auto clean-up
augroup end

let g:tex_flavor = 'latex'
" vimtex and neovim
let g:vimtex_compiler_progname = 'nvr'
" vimtex and zathura
let g:vimtex_view_method = 'zathura'
" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
            \ 'overfull'  : 0,
            \ 'underfull' : 0,
            \ 'packages'  : {
                \ 'default' : 0,
            \ },
            \}
let g:vimtex_imaps_enabled = 0
let g:tex_comment_nospell = 1

""" vimwiki
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [ {
	    \ 'path': '~/Università/Note/',
	    \ 'path_html': '~/Università/Note/html',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ } ]

""" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" FZF
" Window option
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse' 
" Custom mappings
nmap <A-f> :Files<CR>
nmap <A-b> :Buffers<CR>
nmap <A-:> :History:<CR>
nmap <A-/> :BLines<CR>
" Mappings selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" search the word under the cursor with ag
nmap <leader>/ :Ag <c-r><c-w><CR>

""" Markdown specific settings
augroup mdgroup
    autocmd BufRead *.md nmap <leader>mp :MarkdownPreview<CR>
    autocmd BufRead *.md nmap <leader>ms :MarkdownPreviewStop<CR>
    autocmd BufRead *.md CocDisable
    autocmd BufRead *.md nmap <leader>gg :Goyo 80%<CR>:Limelight<CR>
    autocmd BufRead *.md nmap <leader>gG :Goyo!<CR>:Limelight!<CR>
augroup end

""" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""" Airline
let g:airline_detect_whitespace = 0
let g:airline#extensions#whitespace#enabled = 0


""" Conquer of Completion
"""------------------------------------------------------------

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename tool
nmap <silent> <leader>R <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call   CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call   CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
