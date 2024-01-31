# SSH
## ssh-agent in fish-shell
Use the csh-style option -c to set the variables correctly for fish.
```
eval (ssh-agent -c)
ssh-add <path-to-ssh-key>
```

## Remotely executing scipts
```
USER="<username>"
IP="<ip-address"
SCRIPT="<path-to-script>"

# check if connection can be established
ssh -oHostKeyAlgorithms=+ssh-rsa -o ConnectTimeout=5 "$USER"@"$IP" 'exit 0'

if [ $? == 0 ]; then
    ssh -oHostKeyALgorithms=+ssh-rsa "$USER"@"$IP" 'bash -s' < "$SCRIPT"
else
    echo "No ssh connection available"
fi
```

## Execute command on remote while logging the output on local machine and follow the output
```
ssh -oHostKeyAlgorithms=+ssh-rsa <USER>@<SERVER> 'journalctl -fu <service>' | tee log.log & tail -f log.log
```
