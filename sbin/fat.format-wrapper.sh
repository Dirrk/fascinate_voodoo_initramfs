#!/bin/sh

# 
# wrapper around fat.format to make it work on hacked partitions
#

PATH=/bin:$PATH

# first : formatting with basic settings we know will always work
if echo $* | fgrep "/dev/block/mmcblk0p1" ; then
	echo "Voodoo lagfix: using custom formating for mmcblk0p1"
	/sbin/fat.format.real "/dev/block/mmcblk0p1"
fi

# second : honor real formatting settings if they really work
/sbin/fat.format.real $*
