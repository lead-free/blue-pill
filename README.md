# blue-pill
A universal [blue pill](https://hackaday.com/2017/03/30/the-2-32-bit-arduino-with-debugging/) (aka [stm32f103c8t6](https://www.st.com/en/microcontrollers-microprocessors/stm32f103c8.html)) initialization template with USB CDC driver.

Creation of this template is described in my article on [Embedded Environment](stansotn.com/embedded_environment).

## Build
Get  ARM embedded toolchain from [here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) or `sudo apt install gcc-arm-none-eabi` on Ubuntu.

Get cmake `brew install cmake` on MacOS or `sudo apt install cmake` on Ubuntu.

Clone this repository
```shell
git clone --recursive https://github.com/stansotn/blue-pill.git
cd blue-pill
```

Specify arm-none-eabi toolchain path [here](https://github.com/stansotn/windrider/blob/b504cc1aba64b46fe6b5661b652663123e7398de/yaccs-user-config.cmake#L4).
```cmake
# In file yaccs-user-config.cmake
set(yaccs_compiler_paths /Applications/ARM/bin/)
```

Build.
```
mkdir build
cd build
cmake ..
make
```