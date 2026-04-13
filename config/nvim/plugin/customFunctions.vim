function! ToogleColumnWidth()
    if winwidth('.') >= 120
        vertical resize 106
    else
        vertical resize 132
    endif
endfunction
