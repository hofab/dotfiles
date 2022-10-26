function pobccp --description "Copies given file to POBC"
    if [ (count $argv) -gt 0 ]
        scp -oHostKeyAlgorithms=+ssh-rsa $argv root@192.168.11.12:/tmp/$argv
    else
        echo "ERROR: No argument e.g. pobccp <filename>"
    end
end
