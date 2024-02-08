function nsssh --description 'SSH into the NorSat-flatsat'
    if [ (count $argv) -gt 0 ]
        set POBC_IP "192.168.11.$argv"
    else
        echo "nsssh <ip subaddress> e.g. nsssh 12 - 192.168.11.<12>"
        exit
    end

    set command_output (ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new -o ConnectTimeout=3 root@$POBC_IP 'exit 0' 2>&1)

    if string match --quiet --ignore-case "*Connection timed out*" $command_output
        echo "Connection timed out"
        return -1
    end

    if string match --quiet --ignore-case "*WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED*" $command_output
        ssh-keygen -f $HOME"/.ssh/known_hosts" -R $POBC_IP
        ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new root@$POBC_IP
    else
        ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new root@$POBC_IP
    end
end
