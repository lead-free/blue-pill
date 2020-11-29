# file: CMakeLists.txt

# This is required with modern version of CMake.
cmake_minimum_required(VERSION 3.10)

# Include yaccs main CMake file.
# This will automatically look and load the user-config file.
# This has to be done before calling the project() command!
include(cmake/yaccs/yaccs.cmake)

# Define the project.
project(blue-pill ASM C CXX)
add_executable(${PROJECT_NAME}.elf)

# HAL libraries require to define terget microcontroller.
# See stm32f1xx.h for more details.
add_definitions(-DSTM32F103xB -DUSE_HAL_DRIVER)

# This is optional but useful to get a sense of what is happening.
# This command will print various information about the build configuration.
yaccs_system_info()

# This is also optional but it helps by neatly organizing the build tree.
yaccs_init_build_tree()

# Add stuff from the sources directory.
add_subdirectory(sources/)
add_subdirectory(libraries/)

# Linker Script
set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/libraries/cmsis_device_f1/Source/Templates/gcc/linker/STM32F101XB_FLASH.ld)
target_link_options(${PROJECT_NAME}.elf PUBLIC "-Wl,-gc-sections,--print-memory-usage,-T${LINKER_SCRIPT}")

# Extract binary blob
set(HEX_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
set(BIN_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.bin)

add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_FILE}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_FILE}
        COMMENT "Extracting ${HEX_FILE}\nExtracting ${BIN_FILE}")