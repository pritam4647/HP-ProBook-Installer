#!/bin/sh
# install to ~/autoexec.sh
nvram -d boot-args
# might not be necessary to sleep for a second, you can experiment with/without it...
sleep 1
# blink the screen, fixing the brightness issue...
/usr/bin/blinkscreen