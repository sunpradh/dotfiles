""" PLUGINS
source $HOME/.config/nvim/plug.vim

""" GENERAL SETTINGS
set nocompatible               " be iMproved, required
filetype off                   " required
syntax on										   " enable syntax highlighting
set hidden									    " switch buffers even if are unsaved
set relativenumber							" Show relative line numbers
set number                     	" Show line numbers
set showmatch                  	" Highlight matching brace
set hlsearch                   	" Highlight all search results
set smartcase                  	" Enable smart-case search
set incsearch                  	" Searches for strings incrementally
set expandtab										" Expand tabs
set autoindent                 	" Auto-indent new lines
set shiftwidth=4               	" Number of auto-indent spaces
set softtabstop=4              	" Number of spaces per Tab
set smartindent                	" Enable smart-indent
set ruler                      	" Show row and column ruler information
set showmatch                  	" Highlight matching brace
set linebreak                  	" break lines between words
set cursorline                 	" highlight current line
set complete-=i                	" don't autocomplete with included files
set backspace=indent,eol,start 	" Backspace behaviour
set splitbelow									" new split below
set splitright									" new vsplit right
set nowrap											" no wrapping lines
set lazyredraw									" Fast redraw
set fillchars=vert:│						" solid lines with split windows
set title

""" File specific settings
augroup fileaugroup
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults :silent !xrdb % >/dev/null
    autocmd BufWritePost ~/.config/zsh/.zshrc	      :silent !source % >/dev/null
    autocmd BufWritePost ~/.config/nvim/init.vim    :source %
    autocmd BufWritePost ~/.config/sway/config	    :silent !swaymsg reload
    autocmd BufRead			 ~/.config/waybar/config    set filetype=jsonc
augroup end

""" Colorscheme
set background=dark
" Use base-16
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
hi LineNr		  ctermbg=NONE
hi SignColumn ctermbg=NONE
hi SpellBad   ctermbg=NONE cterm=undercurl

""" LSP and autocompletion
luafile $HOME/.config/nvim/lsp.lua
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
let g:completion_enable_snippet = 'UltiSnips'


""" KEY MAPPINGS
source $HOME/.config/nvim/keys.vim
