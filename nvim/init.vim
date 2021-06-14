""" GENERAL SETTINGS
source $HOME/.config/nvim/set.vim
""" PLUGINS
source $HOME/.config/nvim/plug.vim

""" LSP and autocompletion
luafile $HOME/.config/nvim/lsp.lua
" open diagnostic menu
command! Diagnostic lua vim.lsp.diagnostic.set_loclist()
let g:completion_enable_snippet = 'UltiSnips'

""" KEY MAPPINGS
source $HOME/.config/nvim/keys.vim

""" File specific settings
augroup fileaugroup
    autocmd!
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults :silent !xrdb % >/dev/null
    autocmd BufWritePost ~/.config/zsh/.zshrc	    :silent !source % >/dev/null
    autocmd BufWritePost ~/.config/nvim/init.vim    :source %
    autocmd BufWritePost ~/.config/sway/config	    :silent !swaymsg reload
    autocmd BufRead	 ~/.config/waybar/config    set filetype=jsonc
augroup end

""" Colorscheme
source $HOME/.config/nvim/color.vim

""" Trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup TRIM
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
