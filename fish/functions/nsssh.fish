function nsssh --description 'SSH into the NorSat-flatsat'
    if [ (count $argv) -gt 0 ]
        set POBC_IP "192.168.$argv"
    else
        echo "nsssh <ip subaddress> e.g. nsssh 12 - 192.168.<11.12>"
        exit
    end

    source ~/.config/fish/functions/central-config.fish

    set command $SSH_CMD
    set -a command "-o ConnectTimeout=5 root@$POBC_IP 'exit 0' 2>&1"

    set command_output (eval $command)

    echo $command_output

    if string match --quiet --ignore-case "*Connection timed out*" $command_output
        echo "Connection timed out"
        return -1
    end

    if string match --quiet --ignore-case "*WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED*" $command_output
        ssh-keygen -f $HOME"/.ssh/known_hosts" -R $POBC_IP > /dev/null
        eval $SSH_CMD root@$POBC_IP
    else
        eval $SSH_CMD root@$POBC_IP
    end
end
