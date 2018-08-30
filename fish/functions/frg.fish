function frg --description 'Fuzzy-find cfgdb entrys from part-number and open if only one is found'
    if [ (count (rg $argv | rg ".*.[h]: " | string match --regex ".*.h")) -gt 1 ]
       nvim (rg $argv | rg ".*.[h]" | string match --regex ".*.h" | cfzf);
    else
       nvim (rg $argv | rg ".*.[h]" | string match --regex ".*.h");
    end
end
