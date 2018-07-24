# STM32-base project

**WARNING: This project is work in progress! Anything can (and probably will) change! Do not use the code found in this project for any critical system(s). The use of this code is at your own risk!**

_Welcome to the STM32 Base project!_ The purpose of this project is to provide a simple and easy to use starting point (base) for programming STM32 devices using an open-source toolchain. Most other projects and tutorials assume the make files, startup code, linker scripts, and CMSIS are already there and consider them as black boxes. Because of that, most of these projects and tutorials do not include any explanation on what these files are, what these files do and how the toolchain works.

That is the main reason I started working on this project, as I _do_ want to understand how the toolchain works. I took a deep dive into the world of programming ARM-based microcontrollers and wanted to document my findings somewhere, hence this project. I did not have any prior experience with ARM microcontrollers and more general, bare-metal programming microcontrollers. Currently, I'm still learning new things every day. This means this repository and its associated [wiki pages](https://github.com/STM32-base/STM32-base/wiki) will be updated constantly. I hope this project is helpful to those who are interested in programming STM32 devices and to those who want to know how the toolchain works.

 \- Thomas Gravekamp

## Scope

The purpose of this project is to provide a simple and easy starting point for programming STM32 devices. This means that this repository will not contain any peripheral drivers. For now, you will have to write your own divers. I am planning on creating my own peripheral drivers, but these will live in a separate repository.

## Setup

See the [Setup wiki page](https://github.com/STM32-base/STM32-base/wiki/Setup) to set up the STM32 Base project on your machine and start writing code for your STM32 device!

## Supported devices and boards

Currently, all devices found in the STM32F0, STM32F1, STM32F2, STM32F3, STM32F4, and STM32F7 series are supported, regardless of the development board they're on. Note that the support for STM32F3 and STM32F7 devices is still untested. Take a look at the [Devices wiki page](https://github.com/STM32-base/STM32-base/wiki/Devices) for more information on specific devices. For more information on STM32 development boards, take a look at the [Boards wiki page](https://github.com/STM32-base/STM32-base/wiki/Boards).

## Template repositories

A template is available for each supported series of devices. These templates can be used as starting point for your STM32 project. Each template can be found in its own repository:

* [STM32-base-F0-template](https://github.com/STM32-base/STM32-base-F0-template)
* [STM32-base-F1-template](https://github.com/STM32-base/STM32-base-F1-template)
* [STM32-base-F2-template](https://github.com/STM32-base/STM32-base-F2-template)
* [STM32-base-F3-template](https://github.com/STM32-base/STM32-base-F3-template)
* [STM32-base-F4-template](https://github.com/STM32-base/STM32-base-F4-template)
* [STM32-base-F7-template](https://github.com/STM32-base/STM32-base-F7-template)

## Contributing

If you want to contribute to this project, please see [CONTRIBUTING.md](https://github.com/STM32-base/STM32-base/blob/master/CONTRIBUTING.md) for more information on contributing to this project.
