" General settings
source $HOME/.config/nvim/set.vim

" Plugins
source $HOME/.config/nvim/plug.vim

" LSP and autocompletion (completion-nvim)
luafile $HOME/.config/nvim/compe.lua
luafile $HOME/.config/nvim/lsp.lua
command! Diagnostic lua vim.lsp.diagnostic.set_loclist() " diagnostic menu
let g:completion_enable_snippet = 'UltiSnips'

" Key mappings
source $HOME/.config/nvim/keys.vim

" Colorscheme
source $HOME/.config/nvim/color.vim

" Trim trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup TRIM
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" File specific settings
augroup fileaugroup
    autocmd!
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults :silent !xrdb % >/dev/null
    autocmd BufWritePost ~/.config/zsh/.zshrc	    :silent !source % >/dev/null
    autocmd BufWritePost ~/.config/nvim/init.vim    :source %
    autocmd BufRead	 ~/.config/waybar/config    set filetype=jsonc
    autocmd BufRead	 ~/.config/sway/*           set filetype=config
augroup end

