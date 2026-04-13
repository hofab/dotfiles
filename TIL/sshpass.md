# How to use sshpass with a password file

```
sshpass -f ~/.config/.auth/<password-file> ssh <user>@<IP>
```

## <password-file>

```
$ cat ~/.config/.auth/<password-file>
$ PlainTextPassword
```

Make sure the file is read only.

```
chmod 440 ~/.config/.auth/<password-file>
```

## ssh/config

```
Host <Any-name>
    Hostname <IP>
    User <Username>
```

Then we can use `sshpass` as follows:

```
sshpass -f ~/.config/.auth/<password-file> ssh <Any-name>
