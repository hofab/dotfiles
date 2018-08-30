function bcmp --description 'Compare files from different builds with the same part#'
    set directory '/mnt/pyrite/sw-builds/'
    if count $argv > /dev/null
        if [ (count $argv) -gt 2 ]
            if [ (count $argv) -gt 3 ]
                set build1 $directory$argv[1]$argv[2]"/"$argv[4]
                set build2 $directory$argv[1]$argv[3]"/"$argv[4]
                diffuse $build1 $build2
            else
                if [ (count $argv) -gt 2 ]
                    set build1 $directory$argv[1]$argv[2]"/*.vdd"
                    set build2 $directory$argv[1]$argv[3]"/*.vdd"
                    diffuse $build1 $build2
                end
            end
        else
            echo "Use part# version1 version2 filename"
        end
    else
        echo "Use part# version1 version2 filename"
    end
end
