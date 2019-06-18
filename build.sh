#!/bin/sh

repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git
repo sync
cros_sdk -- ./build_packages --board=${BOARD}
cros_sdk -- ./build_image --board=${BOARD}
cros_sdk -- cros flash --board=${BOARD} file:///chromiumos/chromiumos.iso
