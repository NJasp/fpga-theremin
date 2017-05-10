/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'Nios2' in SOPC Builder design 'nios_system'
 * SOPC Builder design path: D:/intelFPGA_lite/16.1/University_Program/Computer_Systems/DE2-115/DE2-115_Media_Computer/verilog/nios_system.sopcinfo
 *
 * Generated: Mon May 08 15:16:32 CEST 2017
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * AV_Config configuration
 *
 */

#define ALT_MODULE_CLASS_AV_Config altera_up_avalon_audio_and_video_config
#define AV_CONFIG_BASE 0x10003000
#define AV_CONFIG_IRQ -1
#define AV_CONFIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AV_CONFIG_NAME "/dev/AV_Config"
#define AV_CONFIG_SPAN 16
#define AV_CONFIG_TYPE "altera_up_avalon_audio_and_video_config"


/*
 * Audio_Subsystem_Audio configuration
 *
 */

#define ALT_MODULE_CLASS_Audio_Subsystem_Audio altera_up_avalon_audio
#define AUDIO_SUBSYSTEM_AUDIO_BASE 0x10003040
#define AUDIO_SUBSYSTEM_AUDIO_IRQ 6
#define AUDIO_SUBSYSTEM_AUDIO_IRQ_INTERRUPT_CONTROLLER_ID 0
#define AUDIO_SUBSYSTEM_AUDIO_NAME "/dev/Audio_Subsystem_Audio"
#define AUDIO_SUBSYSTEM_AUDIO_SPAN 16
#define AUDIO_SUBSYSTEM_AUDIO_TYPE "altera_up_avalon_audio"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x0a000020
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1d
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 1
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_DIVISION_ERROR_EXCEPTION
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INST_ADDR_WIDTH 0x1c
#define ALT_CPU_NAME "Nios2"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x0a000020
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1d
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 1
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_DIVISION_ERROR_EXCEPTION
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INST_ADDR_WIDTH 0x1c
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Char_LCD_16x2 configuration
 *
 */

#define ALT_MODULE_CLASS_Char_LCD_16x2 altera_up_avalon_character_lcd
#define CHAR_LCD_16X2_BASE 0x10003050
#define CHAR_LCD_16X2_IRQ -1
#define CHAR_LCD_16X2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CHAR_LCD_16X2_NAME "/dev/Char_LCD_16x2"
#define CHAR_LCD_16X2_SPAN 2
#define CHAR_LCD_16X2_TYPE "altera_up_avalon_character_lcd"


/*
 * Custom instruction macros
 *
 */

#define ALT_CI_NIOS2_FLOATING_POINT(n,A,B) __builtin_custom_inii(ALT_CI_NIOS2_FLOATING_POINT_N+(n&ALT_CI_NIOS2_FLOATING_POINT_N_MASK),(A),(B))
#define ALT_CI_NIOS2_FLOATING_POINT_N 0xfc
#define ALT_CI_NIOS2_FLOATING_POINT_N_MASK ((1<<2)-1)


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2
#define __ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT
#define __ALTERA_UP_AVALON_AUDIO
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG
#define __ALTERA_UP_AVALON_CHARACTER_LCD
#define __ALTERA_UP_AVALON_IRDA
#define __ALTERA_UP_AVALON_PARALLEL_PORT
#define __ALTERA_UP_AVALON_PS2
#define __ALTERA_UP_AVALON_RS232
#define __ALTERA_UP_AVALON_SRAM
#define __ALTERA_UP_AVALON_USB
#define __ALTERA_UP_AVALON_VIDEO_DMA_CONTROLLER
#define __ALTERA_UP_AVALON_VIDEO_PIXEL_BUFFER_DMA
#define __ALTERA_UP_FLASH_MEMORY_IP_CORE_AVALON_INTERFACE
#define __ALTERA_UP_SD_CARD_AVALON_INTERFACE


/*
 * Expansion_JP5 configuration
 *
 */

#define ALT_MODULE_CLASS_Expansion_JP5 altera_up_avalon_parallel_port
#define EXPANSION_JP5_BASE 0x10000060
#define EXPANSION_JP5_IRQ 11
#define EXPANSION_JP5_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EXPANSION_JP5_NAME "/dev/Expansion_JP5"
#define EXPANSION_JP5_SPAN 16
#define EXPANSION_JP5_TYPE "altera_up_avalon_parallel_port"


/*
 * Flash_flash_data configuration
 *
 */

#define ALT_MODULE_CLASS_Flash_flash_data Altera_UP_Flash_Memory_IP_Core_Avalon_Interface
#define FLASH_FLASH_DATA_BASE 0xc000000
#define FLASH_FLASH_DATA_IRQ -1
#define FLASH_FLASH_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLASH_FLASH_DATA_NAME "/dev/Flash_flash_data"
#define FLASH_FLASH_DATA_SPAN 8388608
#define FLASH_FLASH_DATA_TYPE "Altera_UP_Flash_Memory_IP_Core_Avalon_Interface"


/*
 * Flash_flash_erase_control configuration
 *
 */

#define ALT_MODULE_CLASS_Flash_flash_erase_control Altera_UP_Flash_Memory_IP_Core_Avalon_Interface
#define FLASH_FLASH_ERASE_CONTROL_BASE 0xbff0000
#define FLASH_FLASH_ERASE_CONTROL_IRQ -1
#define FLASH_FLASH_ERASE_CONTROL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLASH_FLASH_ERASE_CONTROL_NAME "/dev/Flash_flash_erase_control"
#define FLASH_FLASH_ERASE_CONTROL_SPAN 4
#define FLASH_FLASH_ERASE_CONTROL_TYPE "Altera_UP_Flash_Memory_IP_Core_Avalon_Interface"


/*
 * Green_LEDs configuration
 *
 */

#define ALT_MODULE_CLASS_Green_LEDs altera_up_avalon_parallel_port
#define GREEN_LEDS_BASE 0x10000010
#define GREEN_LEDS_IRQ -1
#define GREEN_LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GREEN_LEDS_NAME "/dev/Green_LEDs"
#define GREEN_LEDS_SPAN 16
#define GREEN_LEDS_TYPE "altera_up_avalon_parallel_port"


/*
 * HEX3_HEX0 configuration
 *
 */

#define ALT_MODULE_CLASS_HEX3_HEX0 altera_up_avalon_parallel_port
#define HEX3_HEX0_BASE 0x10000020
#define HEX3_HEX0_IRQ -1
#define HEX3_HEX0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define HEX3_HEX0_NAME "/dev/HEX3_HEX0"
#define HEX3_HEX0_SPAN 16
#define HEX3_HEX0_TYPE "altera_up_avalon_parallel_port"


/*
 * HEX7_HEX4 configuration
 *
 */

#define ALT_MODULE_CLASS_HEX7_HEX4 altera_up_avalon_parallel_port
#define HEX7_HEX4_BASE 0x10000030
#define HEX7_HEX4_IRQ -1
#define HEX7_HEX4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define HEX7_HEX4_NAME "/dev/HEX7_HEX4"
#define HEX7_HEX4_SPAN 16
#define HEX7_HEX4_TYPE "altera_up_avalon_parallel_port"


/*
 * Interval_Timer configuration
 *
 */

#define ALT_MODULE_CLASS_Interval_Timer altera_avalon_timer
#define INTERVAL_TIMER_ALWAYS_RUN 0
#define INTERVAL_TIMER_BASE 0x10002000
#define INTERVAL_TIMER_COUNTER_SIZE 32
#define INTERVAL_TIMER_FIXED_PERIOD 0
#define INTERVAL_TIMER_FREQ 50000000
#define INTERVAL_TIMER_IRQ 0
#define INTERVAL_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define INTERVAL_TIMER_LOAD_VALUE 6249999
#define INTERVAL_TIMER_MULT 0.001
#define INTERVAL_TIMER_NAME "/dev/Interval_Timer"
#define INTERVAL_TIMER_PERIOD 125.0
#define INTERVAL_TIMER_PERIOD_UNITS "ms"
#define INTERVAL_TIMER_RESET_OUTPUT 0
#define INTERVAL_TIMER_SNAPSHOT 1
#define INTERVAL_TIMER_SPAN 32
#define INTERVAL_TIMER_TICKS_PER_SEC 8
#define INTERVAL_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define INTERVAL_TIMER_TYPE "altera_avalon_timer"


/*
 * IrDA configuration
 *
 */

#define ALT_MODULE_CLASS_IrDA altera_up_avalon_irda
#define IRDA_BASE 0x10001020
#define IRDA_IRQ 9
#define IRDA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define IRDA_NAME "/dev/IrDA"
#define IRDA_SPAN 8
#define IRDA_TYPE "altera_up_avalon_irda"


/*
 * JTAG_UART configuration
 *
 */

#define ALT_MODULE_CLASS_JTAG_UART altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x10001000
#define JTAG_UART_IRQ 8
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/JTAG_UART"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * PS2_Port configuration
 *
 */

#define ALT_MODULE_CLASS_PS2_Port altera_up_avalon_ps2
#define PS2_PORT_BASE 0x10000100
#define PS2_PORT_IRQ 7
#define PS2_PORT_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PS2_PORT_NAME "/dev/PS2_Port"
#define PS2_PORT_SPAN 8
#define PS2_PORT_TYPE "altera_up_avalon_ps2"


/*
 * PS2_Port_Dual configuration
 *
 */

#define ALT_MODULE_CLASS_PS2_Port_Dual altera_up_avalon_ps2
#define PS2_PORT_DUAL_BASE 0x10000108
#define PS2_PORT_DUAL_IRQ 17
#define PS2_PORT_DUAL_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PS2_PORT_DUAL_NAME "/dev/PS2_Port_Dual"
#define PS2_PORT_DUAL_SPAN 8
#define PS2_PORT_DUAL_TYPE "altera_up_avalon_ps2"


/*
 * Pushbuttons configuration
 *
 */

#define ALT_MODULE_CLASS_Pushbuttons altera_up_avalon_parallel_port
#define PUSHBUTTONS_BASE 0x10000050
#define PUSHBUTTONS_IRQ 1
#define PUSHBUTTONS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PUSHBUTTONS_NAME "/dev/Pushbuttons"
#define PUSHBUTTONS_SPAN 16
#define PUSHBUTTONS_TYPE "altera_up_avalon_parallel_port"


/*
 * Red_LEDs configuration
 *
 */

#define ALT_MODULE_CLASS_Red_LEDs altera_up_avalon_parallel_port
#define RED_LEDS_BASE 0x10000000
#define RED_LEDS_IRQ -1
#define RED_LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RED_LEDS_NAME "/dev/Red_LEDs"
#define RED_LEDS_SPAN 16
#define RED_LEDS_TYPE "altera_up_avalon_parallel_port"


/*
 * SDRAM configuration
 *
 */

#define ALT_MODULE_CLASS_SDRAM altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x0
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/SDRAM"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x19
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 10
#define SDRAM_SDRAM_DATA_WIDTH 32
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 13
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 1
#define SDRAM_SPAN 134217728
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * SD_Card configuration
 *
 */

#define ALT_MODULE_CLASS_SD_Card Altera_UP_SD_Card_Avalon_Interface
#define SD_CARD_BASE 0xb000000
#define SD_CARD_IRQ -1
#define SD_CARD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_CARD_NAME "/dev/SD_Card"
#define SD_CARD_SPAN 1024
#define SD_CARD_TYPE "Altera_UP_SD_Card_Avalon_Interface"


/*
 * SRAM configuration
 *
 */

#define ALT_MODULE_CLASS_SRAM altera_up_avalon_sram
#define SRAM_BASE 0x8000000
#define SRAM_IRQ -1
#define SRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SRAM_NAME "/dev/SRAM"
#define SRAM_SPAN 2097152
#define SRAM_TYPE "altera_up_avalon_sram"


/*
 * Serial_Port configuration
 *
 */

#define ALT_MODULE_CLASS_Serial_Port altera_up_avalon_rs232
#define SERIAL_PORT_BASE 0x10001010
#define SERIAL_PORT_IRQ 10
#define SERIAL_PORT_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SERIAL_PORT_NAME "/dev/Serial_Port"
#define SERIAL_PORT_SPAN 8
#define SERIAL_PORT_TYPE "altera_up_avalon_rs232"


/*
 * Slider_Switches configuration
 *
 */

#define ALT_MODULE_CLASS_Slider_Switches altera_up_avalon_parallel_port
#define SLIDER_SWITCHES_BASE 0x10000040
#define SLIDER_SWITCHES_IRQ -1
#define SLIDER_SWITCHES_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SLIDER_SWITCHES_NAME "/dev/Slider_Switches"
#define SLIDER_SWITCHES_SPAN 16
#define SLIDER_SWITCHES_TYPE "altera_up_avalon_parallel_port"


/*
 * SysID configuration
 *
 */

#define ALT_MODULE_CLASS_SysID altera_avalon_sysid_qsys
#define SYSID_BASE 0x10002020
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/SysID"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1482343707
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/JTAG_UART"
#define ALT_STDERR_BASE 0x10001000
#define ALT_STDERR_DEV JTAG_UART
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/JTAG_UART"
#define ALT_STDIN_BASE 0x10001000
#define ALT_STDIN_DEV JTAG_UART
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/JTAG_UART"
#define ALT_STDOUT_BASE 0x10001000
#define ALT_STDOUT_DEV JTAG_UART
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_system"


/*
 * USB configuration
 *
 */

#define ALT_MODULE_CLASS_USB altera_up_avalon_usb
#define USB_BASE 0x10000110
#define USB_IRQ 2
#define USB_IRQ_INTERRUPT_CONTROLLER_ID 0
#define USB_NAME "/dev/USB"
#define USB_SPAN 16
#define USB_TYPE "altera_up_avalon_usb"


/*
 * VGA_Subsystem_Char_Buf_Subsystem_Char_Buf_DMA configuration
 *
 */

#define ALT_MODULE_CLASS_VGA_Subsystem_Char_Buf_Subsystem_Char_Buf_DMA altera_up_avalon_video_dma_controller
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_BASE 0x10003030
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_IRQ -1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_NAME "/dev/VGA_Subsystem_Char_Buf_Subsystem_Char_Buf_DMA"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_SPAN 16
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_CHAR_BUF_DMA_TYPE "altera_up_avalon_video_dma_controller"


/*
 * VGA_Subsystem_Char_Buf_Subsystem_Onchip_SRAM configuration
 *
 */

#define ALT_MODULE_CLASS_VGA_Subsystem_Char_Buf_Subsystem_Onchip_SRAM altera_avalon_onchip_memory2
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_BASE 0x9000000
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_CONTENTS_INFO ""
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_DUAL_PORT 1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_INIT_CONTENTS_FILE "nios_system_VGA_Subsystem_Char_Buf_Subsystem_Onchip_SRAM"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_INIT_MEM_CONTENT 1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_INSTANCE_ID "NONE"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_IRQ -1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_NAME "/dev/VGA_Subsystem_Char_Buf_Subsystem_Onchip_SRAM"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_RAM_BLOCK_TYPE "AUTO"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_SINGLE_CLOCK_OP 1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_SIZE_MULTIPLE 1
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_SIZE_VALUE 8192
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_SPAN 8192
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_TYPE "altera_avalon_onchip_memory2"
#define VGA_SUBSYSTEM_CHAR_BUF_SUBSYSTEM_ONCHIP_SRAM_WRITABLE 1


/*
 * VGA_Subsystem_VGA_Pixel_DMA configuration
 *
 */

#define ALT_MODULE_CLASS_VGA_Subsystem_VGA_Pixel_DMA altera_up_avalon_video_pixel_buffer_dma
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_BASE 0x10003020
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_IRQ -1
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_NAME "/dev/VGA_Subsystem_VGA_Pixel_DMA"
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_SPAN 16
#define VGA_SUBSYSTEM_VGA_PIXEL_DMA_TYPE "altera_up_avalon_video_pixel_buffer_dma"


/*
 * Video_In_Subsystem_Edge_Detection_Subsystem_Edge_Detection_Router_Controller configuration
 *
 */

#define ALT_MODULE_CLASS_Video_In_Subsystem_Edge_Detection_Subsystem_Edge_Detection_Router_Controller altera_avalon_pio
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_BASE 0x10003070
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_BIT_CLEARING_EDGE_REGISTER 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_CAPTURE 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_DATA_WIDTH 1
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_DO_TEST_BENCH_WIRING 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_DRIVEN_SIM_VALUE 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_EDGE_TYPE "NONE"
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_FREQ 50000000
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_HAS_IN 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_HAS_OUT 1
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_HAS_TRI 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_IRQ -1
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_IRQ_TYPE "NONE"
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_NAME "/dev/Video_In_Subsystem_Edge_Detection_Subsystem_Edge_Detection_Router_Controller"
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_RESET_VALUE 0
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_SPAN 16
#define VIDEO_IN_SUBSYSTEM_EDGE_DETECTION_SUBSYSTEM_EDGE_DETECTION_ROUTER_CONTROLLER_TYPE "altera_avalon_pio"


/*
 * Video_In_Subsystem_Video_In_DMA configuration
 *
 */

#define ALT_MODULE_CLASS_Video_In_Subsystem_Video_In_DMA altera_up_avalon_video_dma_controller
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_BASE 0x10003060
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_IRQ -1
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_NAME "/dev/Video_In_Subsystem_Video_In_DMA"
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_SPAN 16
#define VIDEO_IN_SUBSYSTEM_VIDEO_IN_DMA_TYPE "altera_up_avalon_video_dma_controller"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK INTERVAL_TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * ucosii configuration
 *
 */

#define OS_ARG_CHK_EN 1
#define OS_CPU_HOOKS_EN 1
#define OS_DEBUG_EN 1
#define OS_EVENT_NAME_SIZE 32
#define OS_FLAGS_NBITS 16
#define OS_FLAG_ACCEPT_EN 1
#define OS_FLAG_DEL_EN 1
#define OS_FLAG_EN 1
#define OS_FLAG_NAME_SIZE 32
#define OS_FLAG_QUERY_EN 1
#define OS_FLAG_WAIT_CLR_EN 1
#define OS_LOWEST_PRIO 20
#define OS_MAX_EVENTS 60
#define OS_MAX_FLAGS 20
#define OS_MAX_MEM_PART 60
#define OS_MAX_QS 20
#define OS_MAX_TASKS 10
#define OS_MBOX_ACCEPT_EN 1
#define OS_MBOX_DEL_EN 1
#define OS_MBOX_EN 1
#define OS_MBOX_POST_EN 1
#define OS_MBOX_POST_OPT_EN 1
#define OS_MBOX_QUERY_EN 1
#define OS_MEM_EN 1
#define OS_MEM_NAME_SIZE 32
#define OS_MEM_QUERY_EN 1
#define OS_MUTEX_ACCEPT_EN 1
#define OS_MUTEX_DEL_EN 1
#define OS_MUTEX_EN 1
#define OS_MUTEX_QUERY_EN 1
#define OS_Q_ACCEPT_EN 1
#define OS_Q_DEL_EN 1
#define OS_Q_EN 1
#define OS_Q_FLUSH_EN 1
#define OS_Q_POST_EN 1
#define OS_Q_POST_FRONT_EN 1
#define OS_Q_POST_OPT_EN 1
#define OS_Q_QUERY_EN 1
#define OS_SCHED_LOCK_EN 1
#define OS_SEM_ACCEPT_EN 1
#define OS_SEM_DEL_EN 1
#define OS_SEM_EN 1
#define OS_SEM_QUERY_EN 1
#define OS_SEM_SET_EN 1
#define OS_TASK_CHANGE_PRIO_EN 1
#define OS_TASK_CREATE_EN 1
#define OS_TASK_CREATE_EXT_EN 1
#define OS_TASK_DEL_EN 1
#define OS_TASK_IDLE_STK_SIZE 512
#define OS_TASK_NAME_SIZE 32
#define OS_TASK_PROFILE_EN 1
#define OS_TASK_QUERY_EN 1
#define OS_TASK_STAT_EN 1
#define OS_TASK_STAT_STK_CHK_EN 1
#define OS_TASK_STAT_STK_SIZE 512
#define OS_TASK_SUSPEND_EN 1
#define OS_TASK_SW_HOOK_EN 1
#define OS_TASK_TMR_PRIO 0
#define OS_TASK_TMR_STK_SIZE 512
#define OS_THREAD_SAFE_NEWLIB 1
#define OS_TICKS_PER_SEC INTERVAL_TIMER_TICKS_PER_SEC
#define OS_TICK_STEP_EN 1
#define OS_TIME_DLY_HMSM_EN 1
#define OS_TIME_DLY_RESUME_EN 1
#define OS_TIME_GET_SET_EN 1
#define OS_TIME_TICK_HOOK_EN 1
#define OS_TMR_CFG_MAX 16
#define OS_TMR_CFG_NAME_SIZE 16
#define OS_TMR_CFG_TICKS_PER_SEC 10
#define OS_TMR_CFG_WHEEL_SIZE 2
#define OS_TMR_EN 0

#endif /* __SYSTEM_H_ */
