function db --description 'Generate compile db from SW partnumber'
    # check if compile_ exists and if it is for the current partnumber
    # if not delete it and run compiles command
    if [ (count $argv) -gt 0 ]
        set isPath (make.py $argv --expand | string match -i '*bin*')
        set output (make.py $argv --expand)
        if [ (count $isPath) -gt 0 ]
            set test (string split " " (make.py $argv --expand))
            compiledb --no-build --overwrite make $test[2] $test[3] $test[4] $test[5] $test[6] $test[7]
        else
            if [ (count $output) -gt 0 ]
                set test (string split " " (make.py $argv --expand))
                compiledb --no-build --overwrite make $test[2] $test[3] $test[5] $test[6] $test[7]
            else
                echo "Wrong part number?"
            end
        end
    end
end
