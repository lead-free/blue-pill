# file libraries/CMakelists.txt

# List header locations. 
target_include_directories(${PROJECT_NAME}.elf PUBLIC
                            CMSIS_5/CMSIS/Core/Include
                            cmsis_device_f1/Include
                            stm32f1xx_hal_driver/Inc
                            stm32_mw_usb_device/Core/Inc
                            stm32_mw_usb_device/Class/CDC/Inc)

# Add startup code. For some reason there is no exact file that matches startup_stm32f103x8.s, very confusing, ST!
# A glimpse at the stm cube's generated code reveals startup_stm32f103xb.s file.
target_sources(${PROJECT_NAME}.elf PUBLIC 
                ${CMAKE_CURRENT_SOURCE_DIR}/cmsis_device_f1/Source/Templates/system_stm32f1xx.c
                ${CMAKE_CURRENT_SOURCE_DIR}/cmsis_device_f1/Source/Templates/gcc/startup_stm32f103xb.s)

# Collect HAL Driver source files.
target_sources(${PROJECT_NAME}.elf PUBLIC 
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_cortex.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_gpio.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_rcc.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_rcc_ex.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_pcd.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_hal_pcd_ex.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32f1xx_hal_driver/Src/stm32f1xx_ll_usb.c)

# Collect USB CDC Driver.
target_sources(${PROJECT_NAME}.elf PUBLIC 
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32_mw_usb_device/Core/Src/usbd_ioreq.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32_mw_usb_device/Core/Src/usbd_ctlreq.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32_mw_usb_device/Core/Src/usbd_core.c
                ${CMAKE_CURRENT_SOURCE_DIR}/stm32_mw_usb_device/Class/CDC/Src/usbd_cdc.c)