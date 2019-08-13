#!/bin/sh

WATERMARK=$1	#watermark.png
PIC=$2		#some.jpg

composite -dissolve 40% -gravity southeast $WATERMARK "$PIC" "$PIC";
