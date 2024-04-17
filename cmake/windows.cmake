set(COMMON_COMPILER_FLAGS "${COMMON_COMPILER_FLAGS} -Wno-deprecated-declarations -fstack-protector-all")
set(ARCH_SUFFIX "")

set(BUILD_SDL     ON)
set(BUILD_SDL_IO  ON)
set(BUILD_OPENGL  ON)
set(BUILD_LOADGL  ON)
set(BUILD_GFX     ON)
set(BUILD_VORBIS  ON)
set(BUILD_WEBM    ON)
set(BUILD_PTHREAD ON)
set(BUILD_STATIC  ON)

add_definitions(-DWIN)

if(NOT CMAKE_PREFIX_PATH)
  set(CMAKE_PREFIX_PATH "c:/mingw")
endif()

if(TARGET_ARCH MATCHES "arm64")
  set(ARCH_SUFFIX "-arm64")
  add_definitions(-DELF)
elseif(TARGET_ARCH MATCHES "64")
  set(ARCH_SUFFIX "-x64")
  add_definitions(-DELF -DAMD64)
elseif(TARGET_ARCH MATCHES "86")
  set(ARCH_SUFFIX "-x86")
  add_definitions(-DELF)
  set(BUILD_MMX ON)
else()
  message(NOTICE "Supported TARGET_ARCH=[X86|AMD64]")
  message(FATAL_ERROR "Unsupported Docker Architecture")
endif()
