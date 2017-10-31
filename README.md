# Bare metal STM32

NOTE: This project is work in progress! Anything can (and probably will) change!

This repository contains all the files needed to get started with the STM32F103x8 and STM32F030x4 micro controllers. Support for other STM32 devices will be added later.

The purpose of this repository is to provide a simple starting point for working with STM32 devices using an open-source toolchain. Most other projects consider the make file, startup code and linker script as black boxes and therefore explain none of how these work. Because of this, I've documented all the things I learnt along the way to hopefully provide some insight in the process of programming an ARM-based micro controller.

I've added comments to most of the files. To provide a more high-level and comprehensive explanation of these files, I've added READMEs in the `linker` and `startup` folders. I've not yet finished documenting everything yet, and there may be errors and typos in these files.

## Prerequisites

Before you can start using the code in this repository, you'll need to have some packages installed on your system:

* A Unix-based OS. Everything in this repository has been made on a Linux Mint 18.2 based system. It probably should all work on any other Linux distro out there and maybe also on Mac OSX machines, but I cannot promise you anything.
* The ARM GNU Toolchain. For Debian / Ubuntu / Mint based systems, install `gcc-arm-none-eabi` using apt-get. This toolchain is also downloadable from [ARM](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads).
* The ARM GNU Debugger. For Debian / Ubuntu / Mint base systems, install `gdb-arm-none-eabi` using apt-get.
* The ARM binutils (linker, assembler). For Debian / Ubuntu / Mint based systems, install `binutils-arm-none-eabi` with apt-get.
* The standard C and C++ libs for ARM microcontrollers. For Debian / Ubuntu / Mint based systems, install `libnewlib-arm-none-eabi` and `libstdc++-arm-none-eabi-newlib` with apt-get
* Build essentials. You need these to use the make files provided by this repo. For Debian / Ubuntu / Mint based systems, install `build-essentials` with apt-get.
* The open source version of the st-link tools. See [their github page](https://github.com/texane/stlink) for installation instructions. This will be used for flashing the micro controller with an st-link (clone or official device).
* The CMSIS found in the STM32 F0 / F1 Cube packages provided by ST Microelectronics. The CMSIS folder can be anywhere on your system, as long as you link the CMSIS folder itself on the root of this repo, you should be fine.

## Template projects

Template projects can now be found in their own repositories. This repository only contains the needed files to compile and link your code for use with STM32 devices. See the [STM32-base-F0-template](https://github.com/ThomasGravekamp/STM32-base-F0-template) and the [STM32-base-F1-template](https://github.com/ThomasGravekamp/STM32-base-F1-template) repositories. These templates require this repository to be linked or cloned directly into the template folder.

Note: the makefile assumes the `/obj` and `/bin` folders to be present in the template folder. For now, you should create these yourself.
