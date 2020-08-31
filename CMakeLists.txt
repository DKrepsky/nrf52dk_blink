cmake_minimum_required(VERSION 3.18)

set(CMAKE_TOOLCHAIN_FILE tools/cmake/armgcc.cmake)

project(
  Blink
  LANGUAGES C ASM
  VERSION 1.0)

file(TO_CMAKE_PATH $ENV{NRF_SDK} NRF_SDK_PATH)

set(SRC_DIR src)
set(CONFIG_PATH ${SRC_DIR}/config)
set(SRCS ${SRC_DIR}/main.c)
set(INCLUDE_DIRS ${SRC_DIR} ${SRC_DIR}/config)

add_definitions(-DBOARD_PCA10040)
add_definitions(-DBSP_DEFINES_ONLY)
add_definitions(-DCONFIG_GPIO_AS_PINRESET)
add_definitions(-DFLOAT_ABI_HARD)
add_definitions(-DNRF52)
add_definitions(-DNRF52832_XXAA)
add_definitions(-DNRF52_PAN_74)
add_definitions(-D__HEAP_SIZE=8192)
add_definitions(-D__STACK_SIZE=8192)

add_compile_options(-mcpu=cortex-m4)
add_compile_options(-mthumb)
add_compile_options(-mabi=aapcs)
add_compile_options(-mfloat-abi=hard)
add_compile_options(-mfpu=fpv4-sp-d16)
add_compile_options(-fdata-sections)
add_compile_options(-ffunction-sections)
add_compile_options(-fno-strict-aliasing)
add_compile_options(-fno-builtin)
add_compile_options(-fshort-enums)
add_compile_options(-Wall)
add_compile_options(-Wextra)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  message(STATUS "Modo DEBUG")
  add_compile_options(-g3)
  add_compile_options(-Og)
  add_compile_options(-pedantic)
  add_compile_options(-DDEBUG)
else()
  message(STATUS "Modo RELEASE")
  add_compile_options(-O3)
endif()

add_link_options(-L${NRF_SDK_PATH}/modules/nrfx/mdk)
add_link_options(-T${CMAKE_SOURCE_DIR}/src/config/nrf52.ld)
add_link_options(-mcpu=cortex-m4)
add_link_options(-mthumb)
add_link_options(-mabi=aapcs)
add_link_options(-mfloat-abi=hard)
add_link_options(-mfpu=fpv4-sp-d16)
add_link_options(-specs=nano.specs)
add_link_options(-lc)
add_link_options(-lnosys)
add_link_options(-lm)
add_link_options(-Wl,-Map=${PROJECT_NAME}.map,--cref)
add_link_options(-Wl,--gc-sections)

set(EXECUTABLE firmware.elf)
add_executable(${EXECUTABLE})
target_sources(${EXECUTABLE} PUBLIC ${SRCS})
target_include_directories(${EXECUTABLE} PUBLIC ${INCLUDE_DIRS})

# Adiciona SDK
include(tools/cmake/nrf52sdk.cmake)
nrf_add_component(${EXECUTABLE} NRF_BOARD)

# Print no tamanho das seções
add_custom_command(
  TARGET ${EXECUTABLE}
  POST_BUILD
  COMMAND arm-none-eabi-size ${EXECUTABLE})

# Gera arquivos binários
add_custom_command(
  TARGET ${EXECUTABLE}
  POST_BUILD
  COMMAND arm-none-eabi-objcopy -O ihex ${EXECUTABLE} firmware.hex
  COMMAND arm-none-eabi-objcopy -O binary ${EXECUTABLE} firmware.bin)
