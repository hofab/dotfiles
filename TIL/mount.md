# Mount a network directory that uses active directory

Create mount point on local system `sudo mkdir /mnt/ops`
`sudo mount -ouser=<user>,uid=1000 //<server IP>/<path> /mnt/ops`

or use fstab:
`//192.168.5.8/<path>  /mnt/ops  cifs  credentials=/home/<user>/.smbcredentials/win.credentials,user,iocharset=utf8,sec=ntlmv2,x-systemd.device-timeout=5  0  0`
make sure you have the smbcredentials defined as:

```
user=<user>
password=<>
domain=<domain>
```
