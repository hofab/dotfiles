# Network shares

## SMB shares
For the cli, we can simply execute the following:
`sudo mount -t cifs -o user=<USER> //<IP>/<PATH> <MNT/POINT>`
e.g.
`sudo mount -t cifs -o user=hofab //192.168.255.255/smb_share /media/smb_share`
