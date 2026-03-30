function robcs --description 'Rebuild both obc\'s/ cleanly'

    # source work related variables that are hidden

    # Or using string split
    build_obc ADCC
    build_obc HKC
end



function build_obc --argument NAME

    source ~/.config/fish/functions/central-config.fish

    # ignore partially implemented system call errors for ntdll
    set -x WINEDBG -ntdll

    switch $NAME
        case ADCC
            set LOCAL_OBC_PATH $LOCAL_ADCC_PATH
        case HKC
            set LOCAL_OBC_PATH $LOCAL_HKC_PATH
        case '*'
            echo "Unknown target: $name"
            return 1
    end

    set PARENT_PATH (string split -r -m1 / "$LOCAL_OBC_PATH")[1]

    if test -d $LOCAL_OBC_PATH
        echo "Rebuilding $NAME"

        # Only remove if files exist
        if count "$LOCAL_OBC_PATH"/* >/dev/null 2>&1
            rm "$LOCAL_OBC_PATH"/*
        end

        echo "$LOCAL_OBC_PATH"

        set build_cmd 'wine /home/fhof/.wine/drive_c/CrossWorks/bin/crossbuild.exe -config "ARM RAM Debug" "$PARENT_PATH/$NAME.hzp" -rebuild'
        set build_output (eval $build_cmd 2>&1)

        if string match -q "*Post-link command*" -- $build_output
            echo "✓ $name build successful"
        else
            echo "✗ $name build failed"
            echo "Build output:"
            echo $build_output
            return 1
        end

        # Check for success indicators
        # if string match -q "*Linking $name.elf*" -- $build_output;
        #     echo "✓ $name build successful"
        #     # Copy files
        # else
        #     echo "✗ $name build failed"
        #     echo "Build output:"
        #     echo $build_output
        #     return 1
        # end
        # Your build commands here
        # cd "$path" && make clean && make

        # Copy .srec files if build succeeds
    else
        echo "$NAME path not found: $LOCAL_OBC_PATH"
    end
end
