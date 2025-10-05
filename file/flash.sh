#!/tmp/sh
/tmp/busybox sh -c 'cd /tmp/ && ./dd if=./mtd4.bin of=/dev/mtdblock4 conv=fsync && ./reboot'
