#!/bin/sh

cros_sdk -- ./build_packages --board=${BOARD}
cros_sdk -- ./build_image --board=${BOARD}
cros_sdk -- cros flash --board=${BOARD} file:///chromiumos/chromiumos.iso
