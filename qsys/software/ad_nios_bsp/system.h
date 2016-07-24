/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'qsys_sdram'
 * SOPC Builder design path: D:/fpga/ad_new_ep3c25f324c8n/qsys/qsys_sdram.sopcinfo
 *
 * Generated: Wed Jun 01 13:29:55 CST 2016
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
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00000820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x18
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x00800020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x18
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00000820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x18
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x00800020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x18
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Custom instruction macros
 *
 */

#define ALT_CI_FLOATING_POINT(n,A,B) __builtin_custom_inii(ALT_CI_FLOATING_POINT_N+(n&ALT_CI_FLOATING_POINT_N_MASK),(A),(B))
#define ALT_CI_FLOATING_POINT_1(n,A,B) __builtin_custom_inii(ALT_CI_FLOATING_POINT_1_N+(n&ALT_CI_FLOATING_POINT_1_N_MASK),(A),(B))
#define ALT_CI_FLOATING_POINT_1_N 0xf8
#define ALT_CI_FLOATING_POINT_1_N_MASK ((1<<3)-1)
#define ALT_CI_FLOATING_POINT_N 0xe0
#define ALT_CI_FLOATING_POINT_N_MASK ((1<<4)-1)


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_FIFO
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_QSYS
#define __ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone III"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag"
#define ALT_STDERR_BASE 0x1000
#define ALT_STDERR_DEV jtag
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag"
#define ALT_STDIN_BASE 0x1000
#define ALT_STDIN_DEV jtag
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag"
#define ALT_STDOUT_BASE 0x1000
#define ALT_STDOUT_DEV jtag
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "qsys_sdram"


/*
 * altera_hostfs configuration
 *
 */

#define ALTERA_HOSTFS_NAME "/mnt/host"


/*
 * epcs configuration
 *
 */

#define ALT_MODULE_CLASS_epcs altera_avalon_epcs_flash_controller
#define EPCS_BASE 0x0
#define EPCS_IRQ 0
#define EPCS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_NAME "/dev/epcs"
#define EPCS_REGISTER_OFFSET 1024
#define EPCS_SPAN 2048
#define EPCS_TYPE "altera_avalon_epcs_flash_controller"


/*
 * fifo_data_in_in_csr configuration
 *
 */

#define ALT_MODULE_CLASS_fifo_data_in_in_csr altera_avalon_fifo
#define FIFO_DATA_IN_IN_CSR_AVALONMM_AVALONMM_DATA_WIDTH 32
#define FIFO_DATA_IN_IN_CSR_AVALONMM_AVALONST_DATA_WIDTH 32
#define FIFO_DATA_IN_IN_CSR_BASE 0x1060
#define FIFO_DATA_IN_IN_CSR_BITS_PER_SYMBOL 32
#define FIFO_DATA_IN_IN_CSR_CHANNEL_WIDTH 0
#define FIFO_DATA_IN_IN_CSR_ERROR_WIDTH 0
#define FIFO_DATA_IN_IN_CSR_FIFO_DEPTH 256
#define FIFO_DATA_IN_IN_CSR_IRQ 4
#define FIFO_DATA_IN_IN_CSR_IRQ_INTERRUPT_CONTROLLER_ID 0
#define FIFO_DATA_IN_IN_CSR_NAME "/dev/fifo_data_in_in_csr"
#define FIFO_DATA_IN_IN_CSR_SINGLE_CLOCK_MODE 1
#define FIFO_DATA_IN_IN_CSR_SPAN 32
#define FIFO_DATA_IN_IN_CSR_SYMBOLS_PER_BEAT 1
#define FIFO_DATA_IN_IN_CSR_TYPE "altera_avalon_fifo"
#define FIFO_DATA_IN_IN_CSR_USE_AVALONMM_READ_SLAVE 1
#define FIFO_DATA_IN_IN_CSR_USE_AVALONMM_WRITE_SLAVE 0
#define FIFO_DATA_IN_IN_CSR_USE_AVALONST_SINK 1
#define FIFO_DATA_IN_IN_CSR_USE_AVALONST_SOURCE 0
#define FIFO_DATA_IN_IN_CSR_USE_BACKPRESSURE 0
#define FIFO_DATA_IN_IN_CSR_USE_IRQ 1
#define FIFO_DATA_IN_IN_CSR_USE_PACKET 0
#define FIFO_DATA_IN_IN_CSR_USE_READ_CONTROL 0
#define FIFO_DATA_IN_IN_CSR_USE_REGISTER 0
#define FIFO_DATA_IN_IN_CSR_USE_WRITE_CONTROL 1


/*
 * fifo_data_in_out configuration
 *
 */

#define ALT_MODULE_CLASS_fifo_data_in_out altera_avalon_fifo
#define FIFO_DATA_IN_OUT_AVALONMM_AVALONMM_DATA_WIDTH 32
#define FIFO_DATA_IN_OUT_AVALONMM_AVALONST_DATA_WIDTH 32
#define FIFO_DATA_IN_OUT_BASE 0x1010
#define FIFO_DATA_IN_OUT_BITS_PER_SYMBOL 32
#define FIFO_DATA_IN_OUT_CHANNEL_WIDTH 0
#define FIFO_DATA_IN_OUT_ERROR_WIDTH 0
#define FIFO_DATA_IN_OUT_FIFO_DEPTH 256
#define FIFO_DATA_IN_OUT_IRQ -1
#define FIFO_DATA_IN_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIFO_DATA_IN_OUT_NAME "/dev/fifo_data_in_out"
#define FIFO_DATA_IN_OUT_SINGLE_CLOCK_MODE 1
#define FIFO_DATA_IN_OUT_SPAN 8
#define FIFO_DATA_IN_OUT_SYMBOLS_PER_BEAT 1
#define FIFO_DATA_IN_OUT_TYPE "altera_avalon_fifo"
#define FIFO_DATA_IN_OUT_USE_AVALONMM_READ_SLAVE 1
#define FIFO_DATA_IN_OUT_USE_AVALONMM_WRITE_SLAVE 0
#define FIFO_DATA_IN_OUT_USE_AVALONST_SINK 1
#define FIFO_DATA_IN_OUT_USE_AVALONST_SOURCE 0
#define FIFO_DATA_IN_OUT_USE_BACKPRESSURE 0
#define FIFO_DATA_IN_OUT_USE_IRQ 1
#define FIFO_DATA_IN_OUT_USE_PACKET 0
#define FIFO_DATA_IN_OUT_USE_READ_CONTROL 0
#define FIFO_DATA_IN_OUT_USE_REGISTER 0
#define FIFO_DATA_IN_OUT_USE_WRITE_CONTROL 1


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag configuration
 *
 */

#define ALT_MODULE_CLASS_jtag altera_avalon_jtag_uart
#define JTAG_BASE 0x1000
#define JTAG_IRQ 1
#define JTAG_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_NAME "/dev/jtag"
#define JTAG_READ_DEPTH 64
#define JTAG_READ_THRESHOLD 8
#define JTAG_SPAN 8
#define JTAG_TYPE "altera_avalon_jtag_uart"
#define JTAG_WRITE_DEPTH 64
#define JTAG_WRITE_THRESHOLD 8


/*
 * rs232 configuration
 *
 */

#define ALT_MODULE_CLASS_rs232 altera_avalon_uart
#define RS232_BASE 0x1040
#define RS232_BAUD 115200
#define RS232_DATA_BITS 8
#define RS232_FIXED_BAUD 1
#define RS232_FREQ 50000000
#define RS232_IRQ 3
#define RS232_IRQ_INTERRUPT_CONTROLLER_ID 0
#define RS232_NAME "/dev/rs232"
#define RS232_PARITY 'N'
#define RS232_SIM_CHAR_STREAM ""
#define RS232_SIM_TRUE_BAUD 0
#define RS232_SPAN 32
#define RS232_STOP_BITS 1
#define RS232_SYNC_REG_DEPTH 2
#define RS232_TYPE "altera_avalon_uart"
#define RS232_USE_CTS_RTS 0
#define RS232_USE_EOP_REGISTER 0


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x800000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 6.0
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 26.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x1008
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1464758967
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 1
#define TIMER_BASE 0x1020
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 1
#define TIMER_FREQ 50000000
#define TIMER_IRQ 2
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 999999
#define TIMER_MULT 0.0010
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 20
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 0
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 50.0
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
