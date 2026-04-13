function fuld --description "Infinite file upload to server"
    if [ (count $argv) -gt 1 ]
        echo $argv[2] | entr scp -oHostKeyAlgorithms=+ssh-rsa $argv[2] $argv[1]:/tmp/$argv[2]
    else
        echo "fuld <user@server> <filename>"
    end
end
