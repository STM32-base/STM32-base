# Make file

The make files are used by a tool called `make`. `make` is used to generate the executables which can be uploaded to your STM32 device. For more information on `make`, visit the [GNU Make website](https://www.gnu.org/software/make/).

The make files in this project control the generation of the executables and to provide a simple wrapper around the [st-flash utility](https://github.com/texane/stlink).

## Settings

You can influence the way the main make file works. All of the possible settable values are listed here.

### DEVICE - _required_

The `DEVICE` variable must be set to determine which files must be included. For a lis of possible values, see the [device name mapping page](Device-name-mapping) of this wiki.

### FLASH - _required_

The `FLASH` variable must be set to define where in memory the binary file should be flashed. Normally, this value will be set to `0x08000000`.

### BASE

_Optional, defaults to: `./stm32-base`._

The `BASE` variable can be set to define a non-standard location for your copy of the STM32-base project folder.

### TOOLCHAIN_PATH

_Optional, defaults to: undefined._

The `TOOLCHAIN_PATH` variable can be set to define a non-standard location for your toolchain. This variable can also be used to keep multiple versions of the toolchain on your system. The default behaviour is to use the globally installed toolchain.

### CFLAGS

_Optional, defaults to: `-specs=nosys.specs -ffreestanding -std=c11 -Wall -Wextra -g -mcpu=cortex-m[0347] -mlittle-endian -mthumb` and some defineds, linker arguments and includes._

The `CFLAGS` variable can be set to add arguments to the `gcc` call. For more information on the default settings of this variable, see the `common.mk` file in this directory.

### BIN_FOLDER

_Optional, defaults to: `./bin`._

The `BIN_FOLDER` variable can be used to specify another folder for the binary.

### OBJ_FOLDER

_Optional, defaults to: `./obj`._

The `OBJ_FOLDER` variable can be used to specify another folder for the object files.

### SRC_FOLDER

_Optional, defaults to: `./src`._

The `SRC_FOLDER` variable can be used to sepcify another folder for the source files.

### ELF_FILE_NAME

_Optional, defaults to: `stm32_executable.elf`._

The `ELF_FILE_NAME` variable can be used to specify another name for the ELF file. Note that this value also includes the file extention.

### BIN_FILE_NAME

_Optional, defaults to: `stm32_bin_image.bin`._

The `BIN_FILE_NAME` variable can be used to specify another name for the binary file. Note that this value also includes the file extention.

### OBJ_FILE_NAME

_Optional, defaults to: `startup_$(MAPPED_DEVICE).o`._

The `OBJ_FILE_NAME` variable can be used to specify another name for the startup object file. Note that this value also includes the file extention.

### USE_CMSIS

_Optional, defaults to: undefined._

The `CMSIS_PATH` variable can be set to use another CMSIS. The files in STM32-base/system will be ignored when setting this variable.

Note: If you want to use an external CMSIS, make sure to add the include folders to the compiler arguments:

```
CFLAGS  = -I/path/to/your/CMSIS/include
CFLAGS += -I/path/to/your/CMSIS/other/include
```

Also, remove the *_init.c file from your source folder if you're using any of the project templates.

### SRC

_Optional, defaults to: `$(SRC_FOLDER)/*.c`_

Other source locations can be added to this variable in addition to the default value.


## Common make file

The common make file contains most of the logic executed by the `make` command. This file should be pretty self-expanatory. See the [GNU Make manual](https://www.gnu.org/software/make/manual/make.html) for more information on `make` in general.


## Device-specific make files

The device-specific make files set the `SERIES_CPU`, `SERIES_FOLDER`, `SERIES_SYSTEM_SETUP`, and `MAPPED_DEVICE` variables. These specific make files are included by the main (`common.mk`) make file.

### SERIES_CPU

This variable contains a string like `cortex-m0` and is used to be passed to the compiler to set the right architecture.

### SERIES_FOLDER

This variable contains the folder name for this series of devices. It contains a string like `STM32F0xx` and is used to include the right startup, linker and system files.

### MAPPED_DEVICE

This variable contains the name of the mapped device name. This name is used to include the right startup, linker and system files. For a complete overview of the device name mapping, see its [wiki page](https://github.com/STM32-base/STM32-base/wiki/Device-name-mapping).

