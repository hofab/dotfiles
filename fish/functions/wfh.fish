function wfh
    xrandr --output DP-1-1 --mode 1920x1080
    xrandr --output DP-1-2 --mode 1920x1080
    xrandr --output DP-1-1 --mode 1920x1200 --scale 1x1 --pos 0x0 --output DP-1-2 --mode 1920x1200 --scale 1x1 --pos 1920x0 --primary --output eDP-1 --mode 1920x1080 --pos 3840x0
end
