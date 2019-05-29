#!/bin/sh

WATERMARK=watermark.png
PIC=some.jpg

composite -dissolve 40% -gravity southeast $WATERMARK "$PIC" "$PIC";
