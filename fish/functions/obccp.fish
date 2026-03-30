function obccp --description 'Copy ADCC/HKC to my temp directory'

    # source work related variables that are hidden
    source ~/.config/fish/functions/central-config.fish

    if test -d "$PRIV_SMB_PATH"
        echo "SMB share is connected."
        cp "$LOCAL_ADCC_PATH"/*.srec "$PRIV_SMB_PATH"/OBC
        cp "$LOCAL_HKC_PATH"/*.srec "$PRIV_SMB_PATH"/OBC
        # Do stuff here
    else
        echo "SMB share is not connected."
        # Optionally try to mount it
        # gio mount smb://intrepid/public
    end
end
