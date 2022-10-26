function nsssh --description 'SSH into the NorSat-flatsat'
    if ssh -oHostKeyAlgorithms=+ssh-rsa -o ConnectTimeout=5 root@192.168.11.12 'exit 0'
        ssh -oHostKeyAlgorithms=+ssh-rsa root@192.168.11.12
    else
        ssh-keygen -f "/home/fhof/.ssh/known_hosts" -R 192.168.11.12
        ssh -oHostKeyAlgorithms=+ssh-rsa root@192.168.11.12
    end
end
