function sn --description 'Switch network adapter on commandline'
    set wire (ip link show | string match -r 'eno.*UP')
    set wireless (ip link show | string match -r 'wlo.*UP')
    if [ (count $wire) -gt 0 ]
        echo "Switching to Wireless"
        sudo ifconfig eno2 down
        sudo ifconfig wlo1 up
    end
    if [ (count $wireless) -gt 0 ]
        echo "Switching to Wired"
        sudo ifconfig wlo1 down
        sudo ifconfig eno2 up
    end
end
