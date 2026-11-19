function pobccp --description "Copies given file to POBC"
    if [ (count $argv) -gt 0 ]
        scp -O -oHostKeyAlgorithms=+ssh-rsa $argv root@10.6.12.12:/tmp/$argv
    else
        echo "ERROR: No argument e.g. pobccp <filename>"
    end
end
