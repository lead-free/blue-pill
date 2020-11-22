# file: yaccs-user-config.cmake

# If the compiler is not in the PATH we need to tell yaccs where to find it.
set(yaccs_compiler_paths /Applications/ARM/bin/)

# Load the configuration.
include(cmake/yaccs/cortex-m_gcc-arm_m3_cxx14.cmake)
