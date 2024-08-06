# Ubuntu

## External monitor stops working after apt-get update/upgrade
In my case, the most likely cause is that the nvidea drivers where uninstalled and/or are incompatible with the displaylink drivers that
are installed. Therefore, update nvidea drivers and then update the displaylink drivers like so.

```
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
```

Follow the article [here](https://support.displaylink.com/knowledgebase/articles/684649)

## Set mouse sensitivity from cli
see: https://askubuntu.com/questions/205676/how-to-change-mouse-speed-sensitivity
```
xinput --list --short
xinput --list-props "<NAME OF DEVICE>"
xinput --set-props "<NAME OF DEVICE>" "<PROPERTIES LABEL/ID>" VALUE
```

e.g.
```
xinput --set-float-prop "Logitech M510" 361 1.0
```
