""" Colorscheme
set background=dark

" Use base-16 with 256 colors
"let base16colorspace=256  " Access colors present in 256 colorspace

" Use gruvbox
colorscheme gruvbox
hi Normal	ctermbg=NONE
hi LineNr	ctermbg=NONE
hi SignColumn   ctermbg=NONE
hi SpellBad     ctermbg=NONE cterm=undercurl

" Gruvbox settings
let g:gruvbox_italic = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
