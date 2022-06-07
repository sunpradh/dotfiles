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

