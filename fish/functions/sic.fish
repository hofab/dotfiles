function sic --description 'Search only in source files.'
    rg $argv --cc .
end
