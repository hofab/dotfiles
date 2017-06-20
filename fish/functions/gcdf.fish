function gcdf
	set current_dir $PWD
cd ~/dotfiles;
git add --all;
git commit -m "Dotfiles update!"
git push --force-with-lease;
git status;
cd $current_dir;
end
