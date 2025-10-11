#!/tmp/sh
/tmp/busybox sh -c 'cd /tmp/ && ./dd if=./mtd4_to_flash.bin of=/dev/mtdblock4 conv=fsync && ./reboot