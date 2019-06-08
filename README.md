# STM32-base project

_Welcome to the STM32-base project main repository!_ The purpose of the STM32-base project is to provide a simple and easy to understand starting point for programming STM32 microcontrollers. See the [STM32-base project Github pages](https://stm32-base.org) for more information on this project and how to get started.

**WARNING: This project is work in progress! Anything can (and probably will) change! Do not use the code found in this project for any critical system(s). The use of the code and documentation is at your own risk!**

## Getting started

If you want to get started with the STM32-base project, start by reading the [setup guide](https://stm32-base.org/guides/setup)! For a more brief guide, refer to the quick start below.

### Quick start

 0. **Create a workspace folder** <br> _Create a folder named `STM32-base`. Then, create three sub-folders: `libraries`, `projects`, `templates`, `tools`_
 1. **Install required software** <br> _Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), make (part of build essentials on Debian/Ubuntu), the [GNU ARM Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads) (put these in the tools folder you just created), and the [open-source ST-Link](https://github.com/texane/stlink#installation)._
 2. **Clone this repository** <br> _Clone this repository in the `STM32-base` folder using Git: `git clone git@github.com:STM32-base/STM32-base.git`_
 3. **Clone a template repository** <br> _Clone one, some or all the template repositories using Git: <br> [`git clone git@github.com:STM32-base/STM32-base-F0-template.git`](https://github.com/STM32-base/STM32-base-F0-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F1-template.git`](https://github.com/STM32-base/STM32-base-F1-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F2-template.git`](https://github.com/STM32-base/STM32-base-F2-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F3-template.git`](https://github.com/STM32-base/STM32-base-F3-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F4-template.git`](https://github.com/STM32-base/STM32-base-F4-template)<br>[`git clone git@github.com:STM32-base/STM32-base-F7-template.git`](https://github.com/STM32-base/STM32-base-F7-template)_
 4. **Test your setup** <br> _Move into one of the template folders. Create a symbolic link to the STM32-base project folder: `ln -s ../../STM32-base` and to the STM32-base-STM32Cube folder: `ln -s ../../STM32-base-STM32Cube`. Then run `make`. If compilation completes without errors you have successfully installed the STM32-base project._

## Boards

If you are looking for an overview of the many different available STM32 development boards, take a look at the [Boards page](https://stm32-base.org/boards).

## Contributing

If you want to contribute to this project, please see [CONTRIBUTING.md](https://github.com/STM32-base/STM32-base/blob/master/CONTRIBUTING.md) for more information on contributing to this project.

## About this project & me

The purpose of this project is to provide a simple and easy to understand base project for programming STM32 microcontrollers using an open-source toolchain. Most other projects and tutorials assume the make files, linker scripts, startup code, and CMSIS are already there and consider them as black boxes. Because of that, most of these projects and tutorials do not include any explanation on what these files are, what these files do, and how the toolchain works.

That was the main reason I started this project, as I _do_ want to understand how the toolchain works. As I had no prior experience with bare-metal programming (ARM) microcontrollers I took a deep dive into the world of programming ARM-based microcontrollers. As I was learning about the ARM toolchain and STM32 devices I needed some place to document my findings. This project is the result of me documenting the things I learnt along the way. And still, this project only scratches the surface of programming ARM microcontrollers. There is much, much more to learn and discover. So if you are interested in programming STM32 microcontrollers, keep an eye on this project!

I hope this project is helpful to those who are interested in programming STM32 microcontrollers and to those who want to know more about the open-source ARM toolchain and STM32 microcontrollers. To learn more about the things I do, visit my website at [thomas-gravekamp.nl](https://thomas-gravekamp.nl). I am in no way affiliated with [STMicroelectronics](https://www.st.com).

 \- _Thomas Gravekamp_
