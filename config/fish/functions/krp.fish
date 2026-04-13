function krp --description 'Kill -n 9 a process on the remote host given by work-config'
    # Check if enough arguments are provided
    if test (count $argv) -lt 1
        echo "Usage: krp <service_name>"
        return 1
    end

    source ~/.config/fish/functions/central-config.fish

    # set remote_host $argv[1]
    set service_name $argv[1]

    # Use SSH to execute ps command on the remote machine and find PID
    set pid (eval $SSH_CMD $REMOTE "ps | grep '$service_name' | grep -v grep | awk '{print \$1}'")

    # Check if PID is found
    if test -n "$pid"
        # Kill the process on the remote machine using SSH
        eval $SSH_CMD $REMOTE "kill -9 '$pid'"
        echo "Process '$service_name' killed on $REMOTE (PID: $pid)."
    else
        echo "Process '$service_name' not found on $REMOTE."
    end
end

