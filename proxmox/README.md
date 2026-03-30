# Proxmox notes

## Show all running lxc's and there IP
```
lxc-ls --fancy
NAME STATE   AUTOSTART GROUPS IPV4         IPV6 UNPRIVILEGED
100  RUNNING 0         -      192.168.x.xxx -    true
```

## Delete lxc
```
lxc-destroy -n 104 -f
```
