#!/bin/bash

set -xue

# QEMU file path
QEMU=/usr/local/bin/qemu-system-riscv32

# set clang
CC=/usr/local/opt/llvm/bin/clang
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32 -ffreestanding -nostdlib"

# build kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf kernel.c

# run QEMU
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot
