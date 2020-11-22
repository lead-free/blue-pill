# file: sources/CMakelists.txt
target_include_directories(${PROJECT_NAME}.elf PUBLIC inc/)

# This will add all files in src, use with care
file(GLOB SOURCES src/*.*)
target_sources(${PROJECT_NAME}.elf PUBLIC ${SOURCES})
