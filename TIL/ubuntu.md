# Ubuntu

## External monitor stops working after apt-get update/upgrade
In my case, the most likely cause is that the nvidea drivers where uninstalled and/or are incompatible with the displaylink drivers that
are installed. Therefore, update nvidea drivers and then update the displaylink drivers like so.

```
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
```

Follow the article [here](https://support.displaylink.com/knowledgebase/articles/684649)
