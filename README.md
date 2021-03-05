# STM32-base project

_Welcome to the STM32-base project main repository!_ Here you will find the code and scripts that make up the STM32-base project. Visit [stm32-base.org](https://stm32-base.org/) for more information and documentation on the STM32-base project.

**WARNING: This project is work in progress! Anything can (and probably will) change! Do not use the code found in this project for any critical system(s). The use of the code and documentation is at your own risk!**

## About

The purpose of the STM32-base project is to provide you with a simple and easy to use base project for working with [STM32 microcontrollers](https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html). More information on why this project came into being can be found on the [about page](https://stm32-base.org/general/about).

## Getting started

Check out the [getting started with STM32 microcontrollers guide](https://stm32-base.org/guides/getting-started). This guide is intended for beginners who want to get started with STM32 microcontrollers but don't know _how_ or _where_ to get started.

You can get started with the STM32-base project by reading the [setup guide](https://stm32-base.org/guides/setup). A brief version of this guide is included in this README.

### Quick start

 0. **Create a workspace directory**<br>_Create a directory named `STM32-base`. Create four directories in that folder. Name them `libraries`, `projects`, `templates`, and `tools`._
 1. **Install required software**<br>_Install [`Git`](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and make. Download the [GNU ARM Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads). Extract the downloaded archive to the `tools` directory. Install the [open-source ST-Link Tools](https://github.com/texane/stlink#installation)._
 2. **Clone this and the STM32-base-STM32Cube repositories**<br>_Clone both this and the [STM32-base-STM32Cube](https://github.com/STM32-base/STM32-base-STM32Cube) repositories in the `STM32-base` directory._
 3. **Clone the template repositories**<br>_Clone one or more of the template repositories.<br>[`git clone git@github.com:STM32-base/STM32-base-F0-template.git`](https://github.com/STM32-base/STM32-base-F0-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F1-template.git`](https://github.com/STM32-base/STM32-base-F1-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F2-template.git`](https://github.com/STM32-base/STM32-base-F2-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F3-template.git`](https://github.com/STM32-base/STM32-base-F3-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F4-template.git`](https://github.com/STM32-base/STM32-base-F4-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F7-template.git`](https://github.com/STM32-base/STM32-base-F7-template)_
 4. **Test the setup**<br>_In one of the templates, create two symbolic links to the STM32-base and the STM32-base-STM32Cube repositories. The run `make`. You have successfully set up the STM32-base project on your machine if compilation succeeds._

## Boards

The STM32-base documentation contains a lot of information on many different STM32 development boards. A lot of the Chinese STM32 development boards that are available are listed on the [board page](https://stm32-base.org/boards).

## Contributing

Refer to the [`CONTRIBUTING.md`](https://github.com/STM32-base/STM32-base/blob/master/CONTRIBUTING.md) file to learn more about contributing to the STM32-base project.
