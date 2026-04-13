function sshl --description "Execute remote command over ssh, while logging output to local machine and updating X"
    if [ (count $argv) -gt 1 ]
        set command_name $argv[2]
        set log_directory $USER_LOG_DIR
        set log_directory "$HOME/sfl-bkp/logs"
        set subdirectory (date "+%Y%m%d")
        set log_file_name (date "+%H%M")"_"$command_name".log"
        set log_file_path "$log_directory/$subdirectory/$log_file_name"

        # check ssh connection before anything
        if ssh -oHostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=accept-new -o ConnectTimeout=5 $argv[1] 'exit 0'

        # Create the log directory and subdirectory if they don't exist
            if not test -d $log_directory/$subdirectory
                mkdir -p $log_directory/$subdirectory
            end

            # Log the command and timestamp to the file
            echo (date "+%Y-%m-%d %H:%M:%S")" - Command: $command_name" >> $log_file_path
            echo "Command logged to: $log_file_path"

            ssh -oHostKeyAlgorithms=+ssh-rsa $argv[1] \'$command_name\' | tee -a $log_file_path & tail -f $log_file_path
        else
            echo "Couldn't establish connection"

        end
        # echo $argv[2] | entr scp -oHostKeyAlgorithms=+ssh-rsa $argv[2] $argv[1]:/tmp/$argv[2]
    else
        echo "sshl <user@server> <command>"
    end
end
