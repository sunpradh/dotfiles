"""
""" GENERAL SETTINGS
"""

set nocompatible               " be iMproved, required
filetype off                   " required
syntax on                      " enable syntax highlighting
set hidden                     " switch buffers even if are unsaved
set relativenumber             " Show relative line numbers
set number                     " Show line numbers
set showmatch                  " Highlight matching brace
set nohlsearch                 " Highlight all search results
set smartcase                  " Enable smart-case search
set incsearch                  " Searches for strings incrementally
set expandtab                  " Expand tabs
set autoindent                 " Auto-indent new lines
set shiftwidth=4               " Number of auto-indent spaces
set softtabstop=4              " Number of spaces per Tab
set smartindent                " Enable smart-indent
set ruler                      " Show row and column ruler information
set showmatch                  " Highlight matching brace
set linebreak                  " break lines between words
"set cursorline                 " highlight current line
set complete-=i                " don't autocomplete with included files
set backspace=indent,eol,start " Backspace behaviour
set splitbelow                 " new split below
set splitright                 " new vsplit right
set nowrap                     " no wrapping lines
set lazyredraw                 " Fast redraw
set fillchars=vert:│           " solid lines with split windows
set title                      " set the title of the window
set scrolloff=8                " min num of lines above/below the cursorline
" history
set noswapfile
set nobackup
set undodir=~/.cache/nvim/undodir
set undofile
" set the completion menu
set completeopt=menuone,noselect
set signcolumn=yes
set shortmess+=c

" Leader key
let mapleader=' '
