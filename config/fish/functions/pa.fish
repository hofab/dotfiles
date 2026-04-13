function pa --description 'Start pulseaudio if not started'
    rm -rf /tmp/pulse* ~/.pulse* ~/.config/pulse
    pulseaudio -k
    pulseaudio --start
end
