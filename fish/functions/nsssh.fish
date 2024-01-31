function nsssh --description 'SSH into the NorSat-flatsat'
    if [ (count $argv) -gt 0 ]
        set POBC_IP "192.168.11.$argv"
    else
        echo "nsssh <ip subaddress> e.g. nsssh 12 - 192.168.11.<12>"
        exit
    end

    if ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new -o ConnectTimeout=5 root@$POBC_IP 'exit 0'
        ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new root@$POBC_IP
    else
        # ssh-keygen -f "/home/fhof/.ssh/known_hosts" -R $POBC_IP
        # ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new root@$POBC_IP
        echo "No connection"
    end
end
