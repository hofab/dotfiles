# A simple way to interact with GPIO's on Linux

In modern Linux system we are basically relying on `gpiod..c` and its derivatives. From that, Linux usually provides a couple of
utility tools that we can use to get started with gpio's.

The tools are:
```
gpioinfo
gpiomon
gpiofind
```

## Monitor a spedific GPIO
```
gpioinfo
..
<gpio_name>
..
gpiomon `gpiofind <gpio_name>`
```
