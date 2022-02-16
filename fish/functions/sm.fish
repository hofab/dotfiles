function sm --description 'Opens serial maint connection automatically'
    set path_ $HOME"/maint/maint"

    if test -f $path_
        if test -e "/dev/ttyUSB0"
            ~/maint/maint -l /dev/ttyUSB0 -t 5
        else if test -e "/dev/ttyUSB1"
            ~/maint/maint -l /dev/ttyUSB1 -t 5
        else
            echo "No /dev/ttyUSB0/1"
        end
    end
end
