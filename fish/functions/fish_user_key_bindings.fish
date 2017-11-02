function fish_user_key_bindings
    fzf_key_bindings
# open fzf file in nvim
    bind -e \cf
    bind \cf "nvim (cfzf)"
    bind \cg "git checkout (getLocalBranch)"
end
