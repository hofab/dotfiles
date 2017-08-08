function cph
    if [ (ls -Art *.hex) ]
        string join "/" (echo $PWD) (ls -Art *.hex | tail -n 1);
    end
end
