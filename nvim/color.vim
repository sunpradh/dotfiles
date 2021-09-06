""" Colorscheme
set background=dark

" Gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

hi Normal	ctermbg=NONE
hi LineNr	ctermbg=NONE
hi SignColumn   ctermbg=NONE
hi SpellBad     ctermbg=NONE cterm=undercurl

" Only activate the cursorline on the active buffer
augroup Cursors
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup end
