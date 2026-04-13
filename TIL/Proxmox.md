# Proxmox

## change default interface
- Don't change the settings in the proxmox ui, set it in /etc/network/interfaces
- Need to add
```
touch /.pve-ignore.resolv.conf
touch /etc/network/.pve-ignore.interfaces
```
