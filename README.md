# STM32 Base project

NOTE: This project is work in progress! Anything can (and probably will) change! Do not use the code found in this project for any critical system(s). The use of this code is at your own risk!

The purpose of this repository is to provide a simple and easy to understand starting point for working with STM32 devices using an open-source toolchain. Most other projects consider the makefile, startup code and linker script as being black boxes and do not bother to explain what these files are and how they work.

That is the reason I've attempted to document all the things I learnt while setting up the open source toolchain. I hope this repository is helpful to people interested in programming STM32 devices and to those who want to know how everything works.

## Required software

Before you can start using this repository, you'll need to have some software pre-installed on your system. For now, I'll assume you're using an Unix based system.

* An Unix-based OS. Everything in this repository has been made on a Linux Mint 18.2 based system. The toolchain is available on a large number of platforms, so I assume it should all work on at least any other Linux system and probably on Mac OSX machines too.
* The ARM GNU Toolchain. For Debian / Ubuntu / Mint based systems, install `gcc-arm-none-eabi` using apt-get. This toolchain is also downloadable from [ARM](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads).
* The ARM GNU Debugger. For Debian / Ubuntu / Mint base systems, install `gdb-arm-none-eabi` using apt-get.
* The ARM binutils (linker, assembler). For Debian / Ubuntu / Mint based systems, install `binutils-arm-none-eabi` with apt-get.
* The standard C and C++ libs for ARM microcontrollers. For Debian / Ubuntu / Mint based systems, install `libnewlib-arm-none-eabi` and `libstdc++-arm-none-eabi-newlib` with apt-get
* Build essentials. You need these to use the make files provided by this repo. For Debian / Ubuntu / Mint based systems, install `build-essentials` with apt-get.
* The open source version of the st-link tools. See [their github page](https://github.com/texane/stlink) for installation instructions. This will be used for flashing the micro controller with an st-link (clone or official device).
* The CMSIS found in the STM32 F0 / F1 / F4 Cube packages provided by ST Microelectronics. The CMSIS folder can be anywhere on your system, as long as you link the CMSIS folder itself on the root of this repo, you should be fine. I hope to remove this dependency and just include the required header files in this repository one day (WIP).

## Getting started

Follow these steps to set up this repository and start writing code for your STM32 device!

### Step 1: Installing required software

Refer to the section above for a list of all the required software. Make sure to install all these components on your system.

### Step 2: Clone this repository

Clone this repository to any location of choice:

```
> git clone git@github.com:ThomasGravekamp/STM32-base.git
```

### Step 3: Download the STM32 Cube library

To compile the code, you need the STM32 Cube library for your target device. The only part of this library used by the code in this repository is the clock initialization code and the device specific headers (abstractions over the registers). I'm investigating the posibility to somehow include these in this repository after some refactoring.

These libraries are grouped per fammily (F0, F1, F4):

* [STM32CubeF0 download](http://www.st.com/en/embedded-software/stm32cubef0.html)
* [STM32CubeF1 download](http://www.st.com/en/embedded-software/stm32cubef1.html)
* [STM32CubeF4 download](http://www.st.com/en/embedded-software/stm32cubef4.html)

Extract the downloaded library to any location of choice.

### Copy the CMSIS folder

Copy the CMSIS folder found in the STM32Cube folder to the root of this repository. This should result in the following folder structure:

```
- STM32-base
 - CMSIS
 - linker
 - make
 - startup
 - ...
```

### Download a project template

Download one of the project templates I've made for a simple and minimum project template. This template contians a Makefile and a simple example code which blinks the onboard LED of a development board.

* [STM32-base-F0-template](https://github.com/ThomasGravekamp/STM32-base-F0-template)
* [STM32-base-F1-template](https://github.com/ThomasGravekamp/STM32-base-F1-template)
* [STM32-base-F4-template](https://github.com/ThomasGravekamp/STM32-base-F4-template)

### Create a symbolic link

Create a symbolic link in the project folder to the folder containing the clone this repository:

```
ln -s ~/path/to/STM32-base
```

### Compile and upload

Before compiling the code, take a look at the readme of the chosen template project. It will tell what to change to make the code work on the board you are using or what you should change if you have a board not (yet) supported by the template.

When you are sure the code is correct run:

```
make
make flash
```

The `make` command will compile the code and `make flash` will flash the code to your device using an st-link.

I've added comments to most of the files. To provide a more high-level and comprehensive explanation of these files, I've added READMEs in the `linker` and `startup` folders. I've not yet finished documenting everything yet, and there may be errors and typos in these files.

## Supported devices

This is a table of devices I've tested with the code in this repository. I will add more devices as I acquire more different devices to test with. Please let me know if you can confirm a device not present in the table below works!

| Device        | Support? | Tested? |
| ------------- | :------: | :-----: |
| STM32F030F4P6 | Yes      | Yes     |
| STM32F051C8T6 | Yes      | Yes     |
| STM32F103C8T6 | Yes      | Yes     |
| STM32F103RET6 | Probably | Not yet |
| STM32F103RBT6 | Probably | Not yet |
| STM32F103RCT6 | Probably | Not yet |
| STM32F103VCT6 | Probably | Not yet |
| STM32F103VET6 | Probably | Not yet |
| STM32F103ZET6 | Yes      | Yes     |
| STM32F407VET6 | Yes      | Yes     |
| STM32F407ZGT6 | Probably | Not yet |

## Boards

The boards overview will soon be moved to [my website](https://thomas-gravekamp.nl/).

This is a table of boards, both official and clones. As this is a low-level oriented libaray, boards containing the devices listed above will be supported. This is just a small overview of the boards I currently own and have tested with. Most of the Chinese clones can be bought via AliExpress or Ebay.

| Board | Device | Description |
| --- | --- | --- |
| STM32F030 Demo Board | STM32F030F4P6 | Generic Chinese board.
| [Blue Pill](http://wiki.stm32duino.com/index.php?title=Blue_Pill) | STM32F103C8T6 | Most populair and best known board.
| RobotDyn STM32 Mini | STM32F103C8T6 |  Pin compatible with the Blue Pill.
| [Generic board](http://wiki.stm32duino.com/index.php?title=Vcc-gnd.com_STM32F407VET6_Mini) | STM32F407VET6 | The board has no name printed on it, just two web addresses: http://www.vcc-gnd.com/ and http://vcc-gnd.taobao.com/ (and yes, the first link is dead).

