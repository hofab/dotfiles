function cph
    if [ (ls -Art *.hex | tail -n 1) ]
        string join " " "co lo" (string join "/" (echo $PWD) (ls -Art *.hex | tail -n 1)) | xclip
    end
end
