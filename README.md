# STM32 Base project

**WARNING: This project is work in progress! Anything can (and probably will) change! Do not use the code found in this project for any critical system(s). The use of this code is at your own risk!**

The purpose of this project is to provide a simple and easy to understand starting point for working with STM32 devices using an open-source toolchain. Most other project consider the make files, startup code, linker scripts, and CMSIS as being black boxes that are just out there. Because of that, most of them, if any at all, do not bother to explain what these files are and what they do.

That is the reason I started this project. I did not have any prior experience with ARM and more general, bare metal programming a microcontroller. I've attempted to document the things I learnt along the way of setting up the open-source ARM Embedded Toolchain and rewriting the linker scripts and startup code. I hope this project is helpful to those interested in programming STM32 devices and to those who want to know how the tools work.

 \- Thomas Gravekamp

## Scope

As mentioned above, the purpose of this project is to provide a simple and easy to understand starting point for working with STM32 devices. This means that this repository does not contain any code which interacts with a devices peripherals in any way. For this, I am planning to create separate repositories.

## Getting started

See the [Setup wiki page](https://github.com/ThomasGravekamp/STM32-base/wiki/Setup) to set up STM32-base on your machine and start writing code for your STM32 device!

## Supported devices and boards

Currently, all devices found in the STM32F0, STM32F1, STM32F2, STM32F3, STM32F4, and STM32F7 series are supported. Take a look at the [Devices wiki page](https://github.com/ThomasGravekamp/STM32-base/wiki/Devices) for more information. For more information on STM32 development boards, take a look at the [Boards wiki page](https://github.com/ThomasGravekamp/STM32-base/wiki/Boards).

## Template repositories

A template is available for each supported series of devices. These templates can be used as starting point for your STM32 project. Each template can be found in its own repository:

* [STM32-base-F0-template](https://github.com/ThomasGravekamp/STM32-base-F0-template)
* [STM32-base-F1-template](https://github.com/ThomasGravekamp/STM32-base-F1-template)
* [STM32-base-F2-template](https://github.com/ThomasGravekamp/STM32-base-F2-template)
* [STM32-base-F3-template](https://github.com/ThomasGravekamp/STM32-base-F3-template)
* [STM32-base-F4-template](https://github.com/ThomasGravekamp/STM32-base-F4-template)
* [STM32-base-F7-template](https://github.com/ThomasGravekamp/STM32-base-F7-template)

## Contributing

If you want to contribute to this project, please see [CONTRIBUTING.md](https://github.com/ThomasGravekamp/STM32-base/blob/master/CONTRIBUTING.md) for more information on contributing to this project.
