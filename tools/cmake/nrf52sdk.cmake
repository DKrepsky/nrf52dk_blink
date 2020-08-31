#
# NRF_NRFX
#
add_library(
  NRF_NRFX
  ${NRF_SDK_PATH}/modules/nrfx/mdk/gcc_startup_nrf52.S
  ${NRF_SDK_PATH}/modules/nrfx/mdk/system_nrf52.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_adc.c
  # ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_clock.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_comp.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_dppi.c
  # ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_gpiote.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_i2s.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_lpcomp.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_nfct.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_nvmc.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_pdm.c
  # ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_power.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_ppi.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_pwm.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_qdec.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_qspi.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_rng.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_rtc.c
  # ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_saadc.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_spi.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_spim.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_spis.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_swi.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_systick.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_temp.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_timer.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_twi.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_twim.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_twis.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_twi_twim.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_uart.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_uarte.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_usbd.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/nrfx_wdt.c
  ${NRF_SDK_PATH}/modules/nrfx/drivers/src/prs/nrfx_prs.c
  ${NRF_SDK_PATH}/modules/nrfx/hal/nrf_ecb.c
  ${NRF_SDK_PATH}/modules/nrfx/hal/nrf_ecb.c
  ${NRF_SDK_PATH}/modules/nrfx/soc/nrfx_atomic.c)

target_include_directories(
  NRF_NRFX
  PUBLIC ${NRF_SDK_PATH}/modules/nrfx
         ${NRF_SDK_PATH}/modules/nrfx/drivers
         ${NRF_SDK_PATH}/modules/nrfx/drivers/include
         ${NRF_SDK_PATH}/modules/nrfx/drivers/src
         ${NRF_SDK_PATH}/modules/nrfx/drivers/src/psr
         ${NRF_SDK_PATH}/modules/nrfx/hal
         ${NRF_SDK_PATH}/modules/nrfx/helpers
         ${NRF_SDK_PATH}/modules/nrfx/mdk
         ${NRF_SDK_PATH}/modules/nrfx/soc
         ${NRF_SDK_PATH}/modules/nrfx/templates
         ${NRF_SDK_PATH}/modules/nrfx/templates/nRF52832
         ${NRF_SDK_PATH}/components/toolchain/cmsis/include)

target_compile_options(
  NRF_NRFX PUBLIC -Wno-expansion-to-defined -Wno-unused-parameter
                  -Wno-unused-function)

#
# NRF_COMMON
#
add_library(
  NRF_COMMON
  ${NRF_SDK_PATH}/components/libraries/util/app_error.c
  ${NRF_SDK_PATH}/components/libraries/util/app_error_handler_gcc.c
  ${NRF_SDK_PATH}/components/libraries/util/app_error_weak.c
  ${NRF_SDK_PATH}/components/libraries/util/app_util_platform.c
  ${NRF_SDK_PATH}/components/libraries/util/nrf_assert.c
  ${NRF_SDK_PATH}/components/libraries/atomic/nrf_atomic.c
  ${NRF_SDK_PATH}/components/libraries/balloc/nrf_balloc.c
  ${NRF_SDK_PATH}/components/libraries/memobj/nrf_memobj.c
  ${NRF_SDK_PATH}/components/libraries/ringbuf/nrf_ringbuf.c
  ${NRF_SDK_PATH}/components/libraries/strerror/nrf_strerror.c
  ${NRF_SDK_PATH}/external/fprintf/nrf_fprintf.c
  ${NRF_SDK_PATH}/external/fprintf/nrf_fprintf_format.c)

target_include_directories(
  NRF_COMMON
  PUBLIC ${CONFIG_PATH}
         ${NRF_SDK_PATH}/components
         ${NRF_SDK_PATH}/components/libraries/strerror
         ${NRF_SDK_PATH}/components/toolchain/cmsis/include
         ${NRF_SDK_PATH}/components/libraries/util
         ${NRF_SDK_PATH}/components/libraries/balloc
         ${NRF_SDK_PATH}/components/libraries/ringbuf
         ${NRF_SDK_PATH}/components/libraries/bsp
         ${NRF_SDK_PATH}/components/libraries/log
         ${NRF_SDK_PATH}/components/libraries/experimental_section_vars
         ${NRF_SDK_PATH}/components/libraries/delay
         ${NRF_SDK_PATH}/components/drivers_nrf/nrf_soc_nosd
         ${NRF_SDK_PATH}/components/libraries/atomic
         ${NRF_SDK_PATH}/components/libraries/memobj
         ${NRF_SDK_PATH}/external/fprintf
         ${NRF_SDK_PATH}/components/libraries/log/src
         ${NRF_SDK_PATH}/integration/nrfx)

target_compile_options(
  NRF_COMMON PUBLIC -Wno-expansion-to-defined -Wno-unused-parameter
                    -Wno-unused-function)

#
# NRF_BOARD
#
add_library(NRF_BOARD ${NRF_SDK_PATH}/components/boards/boards.c)

target_include_directories(NRF_BOARD PUBLIC ${NRF_SDK_PATH}/components/boards
                                            ${NRF_SDK_PATH}/modules/nrfx/hal)

target_compile_options(
  NRF_BOARD PUBLIC -Wno-expansion-to-defined -Wno-unused-parameter
                   -Wno-unused-function)

#
# NRF_ADD_COMPONENT
#
macro(NRF_ADD_COMPONENT TARGET COMPONENT)
  message(STATUS "Adicionando componente: ${COMPONENT}")
  target_link_libraries(${TARGET} PUBLIC ${COMPONENT})
endmacro()

#
# NRF_ADD_DEPENDENCY
#
macro(NRF_ADD_DEPENDENCY COMPA COMPB)
  get_target_property(COMPA_INCLUDES ${COMPA} INCLUDE_DIRECTORIES)
  get_target_property(COMPB_INCLUDES ${COMPB} INCLUDE_DIRECTORIES)

  set(COMPA_FINAL_INCLUDES)
  foreach(dir ${COMPA_INCLUDES} ${COMPB_INCLUDES})
    list(APPEND COMPA_FINAL_INCLUDES ${dir})
  endforeach()

  target_include_directories(${COMPA} PUBLIC ${COMPA_FINAL_INCLUDES})
  target_link_libraries(${COMPA} PUBLIC ${COMPB})
endmacro()

#
# Constroi dependency tree
#
nrf_add_dependency(NRF_COMMON NRF_NRFX)
nrf_add_dependency(NRF_BOARD NRF_COMMON)
