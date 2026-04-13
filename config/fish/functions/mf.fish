function mf --description 'Open makefile of build with make.py --expand'
    if [ (count $argv) -gt 0 ]
        set filename (make.py $argv --expand | string split " " | string match --regex "Make.*")
        if [ (count $filename) -gt 0 ]
            nvim $filename
        else
            echo "Wrong part number?"
        end
    end
end
