cat changed-files.txt | rg -i "\.c" | string match -r "[^\/]*\.c" | string match -r "[a-zA-Z_]*" | xargs -I % rg -i "\b%\b" MakePldMx2XZn_Gen2
