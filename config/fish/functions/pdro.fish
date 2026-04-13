function pdro
    switch $argv[1]
        case "work" or "w"
            if [ (count $argv) -gt 1 ]
                sleep (math $argv[2]\*60);
                zenity --warning --text="Break!" --width=600 --height=400 > /dev/null 2>&1;
            else
                sleep (math 25\*60);
                zenity --warning --text="Break!" --width=600 --height=400 > /dev/null 2>&1;
            end
        case "break" or "b"
            if [ (count $argv) -gt 1 ]
                sleep (math $argv[2]\*60);
                zenity --warning --text="Break!" --width=600 --height=400 > /dev/null 2>&1;
            else
                sleep (math 5\*60);
                zenity --warning --text="Break!" --width=600 --height=400 > /dev/null 2>&1;
            end
        case "" or "-h" or "-help"
            echo pdro
            echo (w)ork - 25 minutes until break
            echo (b)reak - 5 minutes until work
    end
end
