function frg --description 'Fuzzy-find cfgdb entrys from part-number and open if only one is found'
    z $CFGDB_DIR
    if [ (count (rg $argv | rg ".*.[h]: " | string match --regex ".*.h" | uniq)) -gt 1 ]
       nvim (rg $argv | rg ".*.[h]" | string match --regex ".*.h" | uniq | cfzf);
    else
       nvim (rg $argv | rg ".*.[h]" | string match --regex ".*.h" | uniq);
    end
end
