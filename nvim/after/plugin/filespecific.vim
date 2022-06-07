" File specific settings
augroup fileaugroup
    autocmd!
    autocmd BufRead ~/.config/waybar/config set filetype=jsonc
    autocmd BufRead ~/.config/sway/*        set filetype=config
    autocmd BufRead *.rasi                  set filetype=css
augroup end

