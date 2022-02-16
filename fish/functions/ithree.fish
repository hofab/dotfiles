function ithree
    set DP1 (xrandr | rg -i DP1-1 | string match -e "connected")
    set DP2 (xrandr | rg -i DP1-2 | string match -e "connected")
    if test -n $DP1
        if test -n $DP2
            xrandr --output DP1-1 --mode 1920x1080
            xrandr --output DP1-2 --mode 1920x1080
            xrandr --output DP1-1 --mode 1920x1200 --scale 1x1 --pos 0x0 --output DP1-2 --mode 1920x1200 --scale 1x1 --pos 1920x0 --primary --output eDP1 --mode 1920x1080 --pos 3840x0
        else
            xrandr --output eDP1 --mode 1920x1080 --primary --output DP1-1 --off --output DP1-2 --off
            xrandr --output eDP1 --brightness 0.7
        end
    else
       xrandr --output eDP1 --mode 1920x1080 --primary --output DP1-1 --off --output DP1-2 --off
       xrandr --output eDP1 --brightness 0.7
    end
end
