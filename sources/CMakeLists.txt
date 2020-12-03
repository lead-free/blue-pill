# file: sources/CMakelists.txt

# Add inc/
target_include_directories(${PROJECT_NAME} PUBLIC inc/)

# Add src/
target_sources(${PROJECT_NAME} PUBLIC 
                ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c
                ${CMAKE_CURRENT_SOURCE_DIR}/src/stm32f1xx_it.c
                ${CMAKE_CURRENT_SOURCE_DIR}/src/usb_device.c
                ${CMAKE_CURRENT_SOURCE_DIR}/src/usbd_cdc_if.c
                ${CMAKE_CURRENT_SOURCE_DIR}/src/usbd_conf.c
                ${CMAKE_CURRENT_SOURCE_DIR}/src/usbd_desc.c)