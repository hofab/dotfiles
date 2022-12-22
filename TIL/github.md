# git asking for USERNAME and PASSWORD when pushing

Reference: [Stackoverflow](https://stackoverflow.com/questions/6565357/git-push-requires-username-and-password)

A common cause is cloning using the default (HTTPS) instead of SSH. You can correct this by going to your repository, clicking "Clone or download", then clicking the "Use SSH" button above the URL field and updating the URL of your origin remote like this:

```
git remote set-url origin git@github.com:username/repo.git
```

You can check if you have added the remote as HTTPS or SSH using:

```
git remote -v
```

This is documented at GitHub: [Switching remote URLs from HTTPS to SSH](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh).



