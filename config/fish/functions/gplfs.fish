function gplfs
    git -c filter.lfs.smudge= -c filter.lfs.required=false pull
    git lfs pull
end
