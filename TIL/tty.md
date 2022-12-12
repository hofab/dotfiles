# tty (teletypewriter)

If you are working with a lot of external hardware that connects through the serial port/tty, it is useful to have the following
commands. Usually these commands are needed with you have no access to a package manager, which mostly happens when you are working
with embedded systems/linux.

## Set serial port settings without external binary

Usually, we have to set the terminal settings according to to our connected device, and without access to a dedicated tty reader
like `minicom/picocom` - [stty](https://www.man7.org/linux/man-pages/man1/stty.1.html) is a good option without writting your own code. `stty` offers most options that we would expect
from simple code that would use `termios`.

To see all settings simply:
```
stty -F <device> -a
```
To set/reset an option use the `-`, like so:
```
stty -F <device> noflsh // set
stty -F <device> -noflsh // reset
```

## Write to the serial port
Once we have setup the `port` correctly, we want to start communicating with the device therefore we have to send messages to the
device. We can use a combination of echo and pipe to do so.
```
echo -ne '<txt>' > /dev/ttyXX
echo -ne '=config,1\r\n' > /dev/ttyS3
```
The closing sequence `\r\n` would be dictated by your device and its settings.

## Want to print without a terminal program
Most of the time, when we are sending request to a devie we want to observe the response as well. To do so, we can do the following.
```
/dev/ttyXX | hexdump -C
cat < /dev/ttyXX
```
Each of the options is usueful in different circumstances.
You should choose the cat option if you like to see a stream of data printed in `ASCII`. On the other hand, if we want to see the
data being reseived in `hexadecimal`, use the `hexdump -C` option.

