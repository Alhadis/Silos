/**************************************************************************//**
 * @file udelay.c
 * @brief Microsecond delay routine.
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2014 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 *
 ******************************************************************************/


      //EZR32WG
/**************************************************************************//**
 * @file em_device.h
 * @brief CMSIS Cortex-M Peripheral Access Layer for Silicon Laboratories
 *        microcontroller devices
 *
 * This is a convenience header file for defining the part number on the
 * build command line, instead of specifying the part specific header file.
 *
 * @verbatim
 * Example: Add "-DEFM32G890F128" to your build options, to define part
 *          Add "#include "em_device.h" to your source files
 *
 *
 * @endverbatim
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/


/**************************************************************************//**
 * @file ezr32wg330f256r60.h
 * @brief CMSIS Cortex-M Peripheral Access Layer Header File
 *        for EZR32WG330F256R60
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/



/**************************************************************************//**
 * @addtogroup Parts
 * @{
 *****************************************************************************/

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60 EZR32WG330F256R60
 * @{
 *****************************************************************************/

/** Interrupt Number Definition */
typedef enum IRQn
{
/******  Cortex-M4 Processor Exceptions Numbers *******************************************/
  NonMaskableInt_IRQn   = -14,              /*!< 2 Cortex-M4 Non Maskable Interrupt       */
  HardFault_IRQn        = -13,              /*!< 3 Cortex-M4 Hard Fault Interrupt         */
  MemoryManagement_IRQn = -12,              /*!< 4 Cortex-M4 Memory Management Interrupt  */
  BusFault_IRQn         = -11,              /*!< 5 Cortex-M4 Bus Fault Interrupt          */
  UsageFault_IRQn       = -10,              /*!< 6 Cortex-M4 Usage Fault Interrupt        */
  SVCall_IRQn           = -5,               /*!< 11 Cortex-M4 SV Call Interrupt           */
  DebugMonitor_IRQn     = -4,               /*!< 12 Cortex-M4 Debug Monitor Interrupt     */
  PendSV_IRQn           = -2,               /*!< 14 Cortex-M4 Pend SV Interrupt           */
  SysTick_IRQn          = -1,               /*!< 15 Cortex-M4 System Tick Interrupt       */

/******  EZR32WG Peripheral Interrupt Numbers *********************************************/
  DMA_IRQn              = 0,  /*!< 16+0 EZR32 DMA Interrupt */
  GPIO_EVEN_IRQn        = 1,  /*!< 16+1 EZR32 GPIO_EVEN Interrupt */
  TIMER0_IRQn           = 2,  /*!< 16+2 EZR32 TIMER0 Interrupt */
  USARTRF0_RX_IRQn      = 3,  /*!< 16+3 EZR32 USARTRF0_RX Interrupt */
  USARTRF0_TX_IRQn      = 4,  /*!< 16+4 EZR32 USARTRF0_TX Interrupt */
  USB_IRQn              = 5,  /*!< 16+5 EZR32 USB Interrupt */
  ACMP0_IRQn            = 6,  /*!< 16+6 EZR32 ACMP0 Interrupt */
  ADC0_IRQn             = 7,  /*!< 16+7 EZR32 ADC0 Interrupt */
  DAC0_IRQn             = 8,  /*!< 16+8 EZR32 DAC0 Interrupt */
  I2C0_IRQn             = 9,  /*!< 16+9 EZR32 I2C0 Interrupt */
  I2C1_IRQn             = 10, /*!< 16+10 EZR32 I2C1 Interrupt */
  GPIO_ODD_IRQn         = 11, /*!< 16+11 EZR32 GPIO_ODD Interrupt */
  TIMER1_IRQn           = 12, /*!< 16+12 EZR32 TIMER1 Interrupt */
  TIMER2_IRQn           = 13, /*!< 16+13 EZR32 TIMER2 Interrupt */
  TIMER3_IRQn           = 14, /*!< 16+14 EZR32 TIMER3 Interrupt */
  USART1_RX_IRQn        = 15, /*!< 16+15 EZR32 USART1_RX Interrupt */
  USART1_TX_IRQn        = 16, /*!< 16+16 EZR32 USART1_TX Interrupt */
  LESENSE_IRQn          = 17, /*!< 16+17 EZR32 LESENSE Interrupt */
  USART2_RX_IRQn        = 18, /*!< 16+18 EZR32 USART2_RX Interrupt */
  USART2_TX_IRQn        = 19, /*!< 16+19 EZR32 USART2_TX Interrupt */
  UART0_RX_IRQn         = 20, /*!< 16+20 EZR32 UART0_RX Interrupt */
  UART0_TX_IRQn         = 21, /*!< 16+21 EZR32 UART0_TX Interrupt */
  UART1_RX_IRQn         = 22, /*!< 16+22 EZR32 UART1_RX Interrupt */
  UART1_TX_IRQn         = 23, /*!< 16+23 EZR32 UART1_TX Interrupt */
  LEUART0_IRQn          = 24, /*!< 16+24 EZR32 LEUART0 Interrupt */
  LEUART1_IRQn          = 25, /*!< 16+25 EZR32 LEUART1 Interrupt */
  LETIMER0_IRQn         = 26, /*!< 16+26 EZR32 LETIMER0 Interrupt */
  PCNT0_IRQn            = 27, /*!< 16+27 EZR32 PCNT0 Interrupt */
  PCNT1_IRQn            = 28, /*!< 16+28 EZR32 PCNT1 Interrupt */
  PCNT2_IRQn            = 29, /*!< 16+29 EZR32 PCNT2 Interrupt */
  RTC_IRQn              = 30, /*!< 16+30 EZR32 RTC Interrupt */
  BURTC_IRQn            = 31, /*!< 16+31 EZR32 BURTC Interrupt */
  CMU_IRQn              = 32, /*!< 16+32 EZR32 CMU Interrupt */
  VCMP_IRQn             = 33, /*!< 16+33 EZR32 VCMP Interrupt */
  MSC_IRQn              = 35, /*!< 16+35 EZR32 MSC Interrupt */
  AES_IRQn              = 36, /*!< 16+36 EZR32 AES Interrupt */
  EMU_IRQn              = 38, /*!< 16+38 EZR32 EMU Interrupt */
  FPUEH_IRQn            = 39, /*!< 16+39 EZR32 FPUEH Interrupt */
} IRQn_Type;

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_Core EZR32WG330F256R60 Core
 * @{
 * @brief Processor and Core Peripheral Section
 *****************************************************************************/

/** @} End of group EZR32WG330F256R60_Core */

/**************************************************************************//**
* @defgroup EZR32WG330F256R60_Part EZR32WG330F256R60 Part
* @{
******************************************************************************/

/** Part family */

/* If part number is not defined as compiler option, define it */

/** Configure part number */

/** Memory Base addresses and limits */

/** Bit banding area */

/** Flash and SRAM limits for EZR32WG330F256R60 */

/** AF channels connect the different on-chip peripherals with the af-mux */
/** Analog AF channels */

/* Part number capabilities */


/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_RF_Interface EZR32WG330F256R60 RF_Interface
 * @brief MCU port/pins used for RF interface.
 * @{
 *****************************************************************************/

/** @} End of group EZR32WG330F256R60_RF_Interface */

/**************************************************************************//**
 * @file     core_cm4.h
 * @brief    CMSIS Cortex-M4 Core Peripheral Access Layer Header File
 * @version  V4.00
 * @date     22. August 2014
 *
 * @note
 *
 ******************************************************************************/
/* Copyright (c) 2009 - 2014 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/


 #pragma system_include  /* treat file as system include file for MISRA check */



/** \page CMSIS_MISRA_Exceptions  MISRA-C:2004 Compliance Exceptions
  CMSIS violates the following MISRA-C:2004 rules:

   \li Required Rule 8.5, object/function definition in header file.<br>
     Function definitions in header files are used to allow 'inlining'.

   \li Required Rule 18.4, declaration of union type or object of union type: '{...}'.<br>
     Unions are used for effective representation of core registers.

   \li Advisory Rule 19.7, Function-like macro defined.<br>
     Function-like macros are used to allow more efficient code.
 */


/*******************************************************************************
 *                 CMSIS definitions
 ******************************************************************************/
/** \ingroup Cortex_M4
  @{
 */

/*  CMSIS CM4 definitions */





/** __FPU_USED indicates whether an FPU is used or not.
    For this, __FPU_PRESENT has to be checked prior to making use of FPU specific registers and functions.
*/


/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */

  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */





/* A definiton for a function of what effects it has.
   NS  = no_state, errno, i.e. it uses no internal or external state. It may
         write to errno though
   NE  = no_state, i.e. it uses no internal or external state, not even
         writing to errno. 
   NRx = no_read(x), i.e. it doesn't read through pointer parameter x.
   NWx = no_write(x), i.e. it doesn't write through pointer parameter x.
   Rx  = returns x, i.e. the function will return parameter x.
   
   All the functions with effects also has "always_returns", 
   i.e. the function will always return.
*/






/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */


  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */





                /* Convenience macros */



/* Used to refer to '__aeabi' symbols in the library. */ 

                /* Versions */



/*
 * Support for some C99 or other symbols
 *
 * This setting makes available some macros, functions, etc that are
 * beneficial.
 *
 * Default is to include them.
 *
 * Disabling this in C++ mode will not compile (some C++ functions uses C99
 * functionality).
 */

  /* Default turned on when compiling C++, EC++, or C99. */



                /* Configuration */
/***************************************************
 *
 * DLib_Defaults.h is the library configuration manager.
 *
 * Copyright 2003-2010 IAR Systems AB.  
 *
 * This configuration header file performs the following tasks:
 *
 * 1. Includes the configuration header file, defined by _DLIB_CONFIG_FILE,
 *    that sets up a particular runtime environment.
 *
 * 2. Includes the product configuration header file, DLib_Product.h, that
 *    specifies default values for the product and makes sure that the
 *    configuration is valid.
 *
 * 3. Sets up default values for all remaining configuration symbols.
 *
 * This configuration header file, the one defined by _DLIB_CONFIG_FILE, and
 * DLib_Product.h configures how the runtime environment should behave. This
 * includes all system headers and the library itself, i.e. all system headers
 * includes this configuration header file, and the library has been built
 * using this configuration header file.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/


  #pragma system_include

/* Include the main configuration header file. */
/* Customer-specific DLib configuration. */
/* Copyright (C) 2003 IAR Systems.  All rights reserved. */


  #pragma system_include

/* No changes to the defaults. */

  /* _DLIB_CONFIG_FILE_STRING is the quoted variant of above */

/* Include the product specific header file. */

   #pragma system_include


/*********************************************************************
*
*       Configuration
*
*********************************************************************/

/* Wide character and multi byte character support in library.
 * This is not allowed to vary over configurations, since math-library
 * is built with wide character support.
 */

/* ARM uses the large implementation of DLib */

/* This ensures that the standard header file "string.h" includes
 * the Arm-specific file "DLib_Product_string.h". */

/* This ensures that the standard header file "fenv.h" includes
 * the Arm-specific file "DLib_Product_fenv.h". */

/* Max buffer used for swap in qsort */

/* Enable system locking  */

/* Enable AEABI support */

/* Enable rtmodel for setjump buffer size */

/* Enable parsing of hex floats */

/* Special placement for locale structures when building ropi libraries */

/* CPP-library uses software floatingpoint interface */

/* Use speedy implementation of floats (simple quad). */

/* Configure generic ELF init routines. */






/*
 * The remainder of the file sets up defaults for a number of
 * configuration symbols, each corresponds to a feature in the
 * libary.
 *
 * The value of the symbols should either be 1, if the feature should
 * be supported, or 0 if it shouldn't. (Except where otherwise
 * noted.)
 */


/*
 * Small or Large target
 *
 * This define determines whether the target is large or small. It must be 
 * setup in the DLib_Product header or in the compiler itself.
 *
 * For a small target some functionality in the library will not deliver 
 * the best available results. For instance the _accurate variants will not use
 * the extra precision packet for large arguments.
 * 
 */



/*
 * File handling
 *
 * Determines whether FILE descriptors and related functions exists or not.
 * When this feature is selected, i.e. set to 1, then FILE descriptors and
 * related functions (e.g. fprintf, fopen) exist. All files, even stdin,
 * stdout, and stderr will then be handled with a file system mechanism that
 * buffers files before accessing the lowlevel I/O interface (__open, __read,
 * __write, etc).
 *
 * If not selected, i.e. set to 0, then FILE descriptors and related functions
 * (e.g. fprintf, fopen) does not exist. All functions that normally uses
 * stderr will use stdout instead. Functions that uses stdout and stdin (like
 * printf and scanf) will access the lowlevel I/O interface directly (__open,
 * __read, __write, etc), i.e. there will not be any buffering.
 *
 * The default is not to have support for FILE descriptors.
 */


/*
 * Use static buffers for stdout
 *
 * This setting controls whether the stream stdout uses a static 80 bytes
 * buffer or uses a one byte buffer allocated in the file descriptor. This
 * setting is only applicable if the FILE descriptors are enabled above.
 *
 * Default is to use a static 80 byte buffer.
 */


/*
 * Support of locale interface
 *
 * "Locale" is the system in C that support language- and
 * contry-specific settings for a number of areas, including currency
 * symbols, date and time, and multibyte encodings.
 *
 * This setting determines whether the locale interface exist or not.
 * When this feature is selected, i.e. set to 1, the locale interface exist
 * (setlocale, etc). A number of preselected locales can be activated during
 * runtime. The preselected locales and encodings is choosen by defining any
 * number of _LOCALE_USE_xxx and _ENCODING_USE_xxx symbols. The application
 * will start with the "C" locale choosen. (Single byte encoding is always
 * supported in this mode.)
 *
 *
 * If not selected, i.e. set to 0, the locale interface (setlocale, etc) does
 * not exist. One preselected locale and one preselected encoding is then used
 * directly. That locale can not be changed during runtime. The preselected
 * locale and encoding is choosen by defining at most one of _LOCALE_USE_xxx
 * and at most one of _ENCODING_USE_xxx. The default is to use the "C" locale
 * and the single byte encoding, respectively.
 *
 * The default is not to have support for the locale interface with the "C"
 * locale and the single byte encoding.
 *
 * Supported locales
 * -----------------
 * _LOCALE_USE_C                  C standard locale (the default)
 * _LOCALE_USE_POSIX ISO-8859-1   Posix locale
 * _LOCALE_USE_CS_CZ ISO-8859-2   Czech language locale for Czech Republic
 * _LOCALE_USE_DA_DK ISO-8859-1   Danish language locale for Denmark
 * _LOCALE_USE_DA_EU ISO-8859-15  Danish language locale for Europe
 * _LOCALE_USE_DE_AT ISO-8859-1   German language locale for Austria
 * _LOCALE_USE_DE_BE ISO-8859-1   German language locale for Belgium
 * _LOCALE_USE_DE_CH ISO-8859-1   German language locale for Switzerland
 * _LOCALE_USE_DE_DE ISO-8859-1   German language locale for Germany
 * _LOCALE_USE_DE_EU ISO-8859-15  German language locale for Europe
 * _LOCALE_USE_DE_LU ISO-8859-1   German language locale for Luxemburg
 * _LOCALE_USE_EL_EU ISO-8859-7x  Greek language locale for Europe
 *                                (Euro symbol added)
 * _LOCALE_USE_EL_GR ISO-8859-7   Greek language locale for Greece
 * _LOCALE_USE_EN_AU ISO-8859-1   English language locale for Australia
 * _LOCALE_USE_EN_CA ISO-8859-1   English language locale for Canada
 * _LOCALE_USE_EN_DK ISO_8859-1   English language locale for Denmark
 * _LOCALE_USE_EN_EU ISO-8859-15  English language locale for Europe
 * _LOCALE_USE_EN_GB ISO-8859-1   English language locale for United Kingdom
 * _LOCALE_USE_EN_IE ISO-8859-1   English language locale for Ireland
 * _LOCALE_USE_EN_NZ ISO-8859-1   English language locale for New Zealand
 * _LOCALE_USE_EN_US ISO-8859-1   English language locale for USA
 * _LOCALE_USE_ES_AR ISO-8859-1   Spanish language locale for Argentina
 * _LOCALE_USE_ES_BO ISO-8859-1   Spanish language locale for Bolivia
 * _LOCALE_USE_ES_CL ISO-8859-1   Spanish language locale for Chile
 * _LOCALE_USE_ES_CO ISO-8859-1   Spanish language locale for Colombia
 * _LOCALE_USE_ES_DO ISO-8859-1   Spanish language locale for Dominican Republic
 * _LOCALE_USE_ES_EC ISO-8859-1   Spanish language locale for Equador
 * _LOCALE_USE_ES_ES ISO-8859-1   Spanish language locale for Spain
 * _LOCALE_USE_ES_EU ISO-8859-15  Spanish language locale for Europe
 * _LOCALE_USE_ES_GT ISO-8859-1   Spanish language locale for Guatemala
 * _LOCALE_USE_ES_HN ISO-8859-1   Spanish language locale for Honduras
 * _LOCALE_USE_ES_MX ISO-8859-1   Spanish language locale for Mexico
 * _LOCALE_USE_ES_PA ISO-8859-1   Spanish language locale for Panama
 * _LOCALE_USE_ES_PE ISO-8859-1   Spanish language locale for Peru
 * _LOCALE_USE_ES_PY ISO-8859-1   Spanish language locale for Paraguay
 * _LOCALE_USE_ES_SV ISO-8859-1   Spanish language locale for Salvador
 * _LOCALE_USE_ES_US ISO-8859-1   Spanish language locale for USA
 * _LOCALE_USE_ES_UY ISO-8859-1   Spanish language locale for Uruguay
 * _LOCALE_USE_ES_VE ISO-8859-1   Spanish language locale for Venezuela
 * _LOCALE_USE_ET_EE ISO-8859-1   Estonian language for Estonia
 * _LOCALE_USE_EU_ES ISO-8859-1   Basque language locale for Spain
 * _LOCALE_USE_FI_EU ISO-8859-15  Finnish language locale for Europe
 * _LOCALE_USE_FI_FI ISO-8859-1   Finnish language locale for Finland
 * _LOCALE_USE_FO_FO ISO-8859-1   Faroese language locale for Faroe Islands
 * _LOCALE_USE_FR_BE ISO-8859-1   French language locale for Belgium
 * _LOCALE_USE_FR_CA ISO-8859-1   French language locale for Canada
 * _LOCALE_USE_FR_CH ISO-8859-1   French language locale for Switzerland
 * _LOCALE_USE_FR_EU ISO-8859-15  French language locale for Europe
 * _LOCALE_USE_FR_FR ISO-8859-1   French language locale for France
 * _LOCALE_USE_FR_LU ISO-8859-1   French language locale for Luxemburg
 * _LOCALE_USE_GA_EU ISO-8859-15  Irish language locale for Europe
 * _LOCALE_USE_GA_IE ISO-8859-1   Irish language locale for Ireland
 * _LOCALE_USE_GL_ES ISO-8859-1   Galician language locale for Spain
 * _LOCALE_USE_HR_HR ISO-8859-2   Croatian language locale for Croatia
 * _LOCALE_USE_HU_HU ISO-8859-2   Hungarian language locale for Hungary
 * _LOCALE_USE_ID_ID ISO-8859-1   Indonesian language locale for Indonesia
 * _LOCALE_USE_IS_EU ISO-8859-15  Icelandic language locale for Europe
 * _LOCALE_USE_IS_IS ISO-8859-1   Icelandic language locale for Iceland
 * _LOCALE_USE_IT_EU ISO-8859-15  Italian language locale for Europe
 * _LOCALE_USE_IT_IT ISO-8859-1   Italian language locale for Italy
 * _LOCALE_USE_IW_IL ISO-8859-8   Hebrew language locale for Israel
 * _LOCALE_USE_KL_GL ISO-8859-1   Greenlandic language locale for Greenland
 * _LOCALE_USE_LT_LT   BALTIC     Lithuanian languagelocale for Lithuania
 * _LOCALE_USE_LV_LV   BALTIC     Latvian languagelocale for Latvia
 * _LOCALE_USE_NL_BE ISO-8859-1   Dutch language locale for Belgium
 * _LOCALE_USE_NL_EU ISO-8859-15  Dutch language locale for Europe
 * _LOCALE_USE_NL_NL ISO-8859-9   Dutch language locale for Netherlands
 * _LOCALE_USE_NO_EU ISO-8859-15  Norwegian language locale for Europe
 * _LOCALE_USE_NO_NO ISO-8859-1   Norwegian language locale for Norway
 * _LOCALE_USE_PL_PL ISO-8859-2   Polish language locale for Poland
 * _LOCALE_USE_PT_BR ISO-8859-1   Portugese language locale for Brazil
 * _LOCALE_USE_PT_EU ISO-8859-15  Portugese language locale for Europe
 * _LOCALE_USE_PT_PT ISO-8859-1   Portugese language locale for Portugal
 * _LOCALE_USE_RO_RO ISO-8859-2   Romanian language locale for Romania
 * _LOCALE_USE_RU_RU ISO-8859-5   Russian language locale for Russia
 * _LOCALE_USE_SL_SI ISO-8859-2   Slovenian language locale for Slovenia
 * _LOCALE_USE_SV_EU ISO-8859-15  Swedish language locale for Europe
 * _LOCALE_USE_SV_FI ISO-8859-1   Swedish language locale for Finland
 * _LOCALE_USE_SV_SE ISO-8859-1   Swedish language locale for Sweden
 * _LOCALE_USE_TR_TR ISO-8859-9   Turkish language locale for Turkey
 *
 *  Supported encodings
 *  -------------------
 * n/a                            Single byte (used if no other is defined).
 * _ENCODING_USE_UTF8             UTF8 encoding.
 */


/* We need to have the "C" locale if we have full locale support. */


/*
 * Support of multibytes in printf- and scanf-like functions
 *
 * This is the default value for _DLIB_PRINTF_MULTIBYTE and
 * _DLIB_SCANF_MULTIBYTE. See them for a description.
 *
 * Default is to not have support for multibytes in printf- and scanf-like
 * functions.
 */



/*
 * Throw handling in the EC++ library
 *
 * This setting determines what happens when the EC++ part of the library
 * fails (where a normal C++ library 'throws').
 *
 * The following alternatives exists (setting of the symbol):
 * 0                - The application does nothing, i.e. continues with the
 *                    next statement.
 * 1                - The application terminates by calling the 'abort'
 *                    function directly.
 * <anything else>  - An object of class "exception" is created.  This
 *                    object contains a string describing the problem.
 *                    This string is later emitted on "stderr" before
 *                    the application terminates by calling the 'abort'
 *                    function directly.
 *
 * Default is to do nothing.
 */



/*
 * Hexadecimal floating-point numbers in strtod
 *
 * If selected, i.e. set to 1, strtod supports C99 hexadecimal floating-point
 * numbers. This also enables hexadecimal floating-points in internal functions
 * used for converting strings and wide strings to float, double, and long
 * double.
 *
 * If not selected, i.e. set to 0, C99 hexadecimal floating-point numbers
 * aren't supported.
 *
 * Default is not to support hexadecimal floating-point numbers.
 */



/*
 * Printf configuration symbols.
 *
 * All the configuration symbols described further on controls the behaviour
 * of printf, sprintf, and the other printf variants.
 *
 * The library proves four formatters for printf: 'tiny', 'small',
 * 'large', and 'default'.  The setup in this file controls all except
 * 'tiny'.  Note that both small' and 'large' explicitly removes
 * some features.
 */

/*
 * Handle multibytes in printf
 *
 * This setting controls whether multibytes and wchar_ts are supported in
 * printf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */


/*
 * Long long formatting in printf
 *
 * This setting controls long long support (%lld) in printf. Set to 1 to
 * support it, otherwise set to 0.

 * Note, if long long should not be supported and 'intmax_t' is larger than
 * an ordinary 'long', then %jd and %jn will not be supported.
 *
 * Default is to support long long formatting.
 */




/*
 * Floating-point formatting in printf
 *
 * This setting controls whether printf supports floating-point formatting.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting.
 */


/*
 * Hexadecimal floating-point formatting in printf
 *
 * This setting controls whether the %a format, i.e. the output of
 * floating-point numbers in the C99 hexadecimal format. Set to 1 to support
 * it, otherwise set to 0.
 *
 * Default is to support %a in printf.
 */


/*
 * Output count formatting in printf
 *
 * This setting controls whether the output count specifier (%n) is supported
 * or not in printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support %n in printf.
 */


/*
 * Support of qualifiers in printf
 *
 * This setting controls whether qualifiers that enlarges the input value
 * [hlLjtz] is supported in printf or not. Set to 1 to support them, otherwise
 * set to 0. See also _DLIB_PRINTF_INT_TYPE_IS_INT and
 * _DLIB_PRINTF_INT_TYPE_IS_LONG.
 *
 * Default is to support [hlLjtz] qualifiers in printf.
 */


/*
 * Support of flags in printf
 *
 * This setting controls whether flags (-+ #0) is supported in printf or not.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support flags in printf.
 */


/*
 * Support widths and precisions in printf
 *
 * This setting controls whether widths and precisions are supported in printf.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support widths and precisions in printf.
 */


/*
 * Support of unsigned integer formatting in printf
 *
 * This setting controls whether unsigned integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in printf.
 */


/*
 * Support of signed integer formatting in printf
 *
 * This setting controls whether signed integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support signed integer formatting in printf.
 */


/*
 * Support of formatting anything larger than int in printf
 *
 * This setting controls if 'int' should be used internally in printf, rather
 * than the largest existing integer type. If 'int' is used, any integer or
 * pointer type formatting use 'int' as internal type even though the
 * formatted type is larger. Set to 1 to use 'int' as internal type, otherwise
 * set to 0.
 *
 * See also next configuration.
 *
 * Default is to internally use largest existing internally type.
 */


/*
 * Support of formatting anything larger than long in printf
 *
 * This setting controls if 'long' should be used internally in printf, rather
 * than the largest existing integer type. If 'long' is used, any integer or
 * pointer type formatting use 'long' as internal type even though the
 * formatted type is larger. Set to 1 to use 'long' as internal type,
 * otherwise set to 0.
 *
 * See also previous configuration.
 *
 * Default is to internally use largest existing internally type.
 */



/*
 * Emit a char a time in printf
 *
 * This setting controls internal output handling. If selected, i.e. set to 1,
 * then printf emits one character at a time, which requires less code but
 * can be slightly slower for some types of output.
 *
 * If not selected, i.e. set to 0, then printf buffers some outputs.
 *
 * Note that it is recommended to either use full file support (see
 * _DLIB_FILE_DESCRIPTOR) or -- for debug output -- use the linker
 * option "-e__write_buffered=__write" to enable buffered I/O rather
 * than deselecting this feature.
 */



/*
 * Scanf configuration symbols.
 *
 * All the configuration symbols described here controls the
 * behaviour of scanf, sscanf, and the other scanf variants.
 *
 * The library proves three formatters for scanf: 'small', 'large',
 * and 'default'.  The setup in this file controls all, however both
 * 'small' and 'large' explicitly removes some features.
 */

/*
 * Handle multibytes in scanf
 *
 * This setting controls whether multibytes and wchar_t:s are supported in
 * scanf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default.
 */


/*
 * Long long formatting in scanf
 *
 * This setting controls whether scanf supports long long support (%lld). It
 * also controls, if 'intmax_t' is larger than an ordinary 'long', i.e. how
 * the %jd and %jn specifiers behaves. Set to 1 to support them, otherwise set
 * to 0.
 *
 * Default is to support long long formatting in scanf.
 */



/*
 * Support widths in scanf
 *
 * This controls whether scanf supports widths. Set to 1 to support them,
 * otherwise set to 0.
 *
 * Default is to support widths in scanf.
 */


/*
 * Support qualifiers [hjltzL] in scanf
 *
 * This setting controls whether scanf supports qualifiers [hjltzL] or not. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support qualifiers in scanf.
 */


/*
 * Support floating-point formatting in scanf
 *
 * This setting controls whether scanf supports floating-point formatting. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting in scanf.
 */


/*
 * Support output count formatting (%n)
 *
 * This setting controls whether scanf supports output count formatting (%n).
 * Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support output count formatting in scanf.
 */


/*
 * Support scansets ([]) in scanf
 *
 * This setting controls whether scanf supports scansets ([]) or not. Set to 1
 * to support them, otherwise set to 0.
 *
 * Default is to support scansets in scanf.
 */


/*
 * Support signed integer formatting in scanf
 *
 * This setting controls whether scanf supports signed integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support signed integer formatting in scanf.
 */


/*
 * Support unsigned integer formatting in scanf
 *
 * This setting controls whether scanf supports unsigned integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in scanf.
 */


/*
 * Support assignment suppressing [*] in scanf
 *
 * This setting controls whether scanf supports assignment suppressing [*] or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support assignment suppressing in scanf.
 */


/*
 * Handle multibytes in asctime and strftime.
 *
 * This setting controls whether multibytes and wchar_ts are
 * supported.Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */


/*
 * True if "qsort" should be implemented using bubble sort.
 *
 * Bubble sort is less efficient than quick sort but requires less RAM
 * and ROM resources.
 */


/*
 * Set Buffert size used in qsort
 */


/*
 * The default "rand" function uses an array of 32 long:s of memory to
 * store the current state.
 *
 * The simple "rand" function uses only a single long. However, the
 * quality of the generated psuedo-random numbers are not as good as
 * the default implementation.
 */


/*
 * Wide character and multi byte character support in library.
 */


/*
 * Set attributes on the function used by the C-SPY debug interface to set a
 * breakpoint in.
 */


/*
 * Support threading in the library
 *
 * 0    No thread support
 * 1    Thread support with a, b, and d.
 * 2    Thread support with a, b, and e.
 * 3    Thread support with all thread-local storage in a dynamically allocated
 *        memory area and a, and b.
 *      a. Lock on heap accesses
 *      b. Optional lock on file accesses (see _DLIB_FILE_OP_LOCKS below)
 *      d. Use an external thread-local storage interface for all the
 *         libraries static and global variables.
 *      e. Static and global variables aren't safe for access from several
 *         threads.
 *
 * Note that if locks are used the following symbols must be defined:
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * They will be used to initialize the needed locks only once. TYPE is the
 * type for the static control variable, MACRO is the expression that will be
 * evaluated at each usage of a lock, and INIT is the initializer for the
 * control variable.
 *
 * Note that if thread model 3 is used the symbol _DLIB_TLS_POINTER must be
 * defined. It is a thread local pointer to a dynamic memory area that
 * contains all used TLS variables for the library. Optionally the following
 * symbols can be defined as well (default is to use the default const data
 * and data memories):
 *
 *   _DLIB_TLS_INITIALIZER_MEMORY The memory to place the initializers for the
 *                                TLS memory area
 *   _DLIB_TLS_MEMORY             The memory to use for the TLS memory area. A
 *                                pointer to this memory must be castable to a
 *                                default pointer and back.
 *   _DLIB_TLS_REQUIRE_INIT       Set to 1 to require __cstart_init_tls
 *                                when needed to initialize the TLS data
 *                                segment for the main thread.
 *   _DLIB_TLS_SEGMENT_DATA       The name of the TLS RAM data segment
 *   _DLIB_TLS_SEGMENT_INIT       The name of the used to initialize the
 *                                TLS data segment.
 *
 * See DLib_Threads.h for a description of what interfaces needs to be
 * defined for thread support.
 */


/*
 * Used by products where one runtime library can be used by applications
 * with different data models, in order to reduce the total number of
 * libraries required. Typically, this is used when the pointer types does
 * not change over the data models used, but the placement of data variables
 * or/and constant variables do.
 *
 * If defined, this symbol is typically defined to the memory attribute that
 * is used by the runtime library. The actual define must use a
 * _Pragma("type_attribute = xxx") construct. In the header files, it is used
 * on all statically linked data objects seen by the application.
 */



/*
 * Turn on support for the Target-specific ABI. The ABI is based on the
 * ARM AEABI. A target, except ARM, may deviate from it.
 */


  /* Possible AEABI deviations */

  /*
   * The "difunc" table contains information about C++ objects that
   * should be dynamically initialized, where each entry in the table
   * represents an initialization function that should be called. When
   * the symbol _DLIB_AEABI_DIFUNC_CONTAINS_OFFSETS is true, each
   * entry in the table is encoded as an offset from the entry
   * location. When false, the entries contain the actual addresses to
   * call.
   */


/*
 * Turn on usage of a pragma to tell the linker the number of elements used
 * in a setjmp jmp_buf.
 */


/*
 * If true, the product supplies a "DLib_Product_string.h" file that
 * is included from "string.h".
 */


/*
 * Determine whether the math fma routines are fast or not.
 */

/*
 * Rtti support.
 */


/*
 * Use the "pointers to short" or "pointers to long" implementation of 
 * the basic floating point routines (like Dnorm, Dtest, Dscale, and Dunscale).
 */

/*
 * Use 64-bit long long as intermediary type in Dtest, and fabs.
 * Default is to do this if long long is 64-bits.
 */

/*
 * Favor speed versus some size enlargements in floating point functions.
 */

/*
 * Include dlmalloc as an alternative heap manager in product.
 *
 * Typically, an application will use a "malloc" heap manager that is
 * relatively small but not that efficient. An application can
 * optionally use the "dlmalloc" package, which provides a more
 * effective "malloc" heap manager, if it is included in the product
 * and supported by the settings.
 *
 * See the product documentation on how to use it, and whether or not
 * it is included in the product.
 */
  /* size_t/ptrdiff_t must be a 4 bytes unsigned integer. */


/*
 * Allow the 64-bit time_t interface?
 *
 * Default is yes if long long is 64 bits.
 */
  #pragma language = save 
  #pragma language = extended
  #pragma language = restore


/*
 * Is time_t 64 or 32 bits?
 *
 * Default is 32 bits.
 */

/*
 * Do we include math functions that demands lots of constant bytes?
 * (like erf, erfc, expm1, fma, lgamma, tgamma, and *_accurate)
 *
 */

/*
 * Set this to __weak, if supported.
 *
 */


/*
 * Deleted options
 *
 */








                /* Floating-point */

/*
 * Whenever a floating-point type is equal to another, we try to fold those
 * two types into one. This means that if float == double then we fold float to
 * use double internally. Example sinf(float) will use _Sin(double, uint).
 *
 * _X_FNAME is a redirector for internal support routines. The X can be
 *          D (double), F (float), or L (long double). It redirects by using
 *          another prefix. Example calls to Dtest will be __iar_Dtest,
 *          __iar_FDtest, or __iarLDtest.
 * _X_FUN   is a redirector for functions visible to the customer. As above, the
 *          X can be D, F, or L. It redirects by using another suffix. Example
 *          calls to sin will be sin, sinf, or sinl.
 * _X_TYPE  The type that one type is folded to.
 * _X_PTRCAST is a redirector for a cast operation involving a pointer.
 * _X_CAST  is a redirector for a cast involving the float type.
 *
 * _FLOAT_IS_DOUBLE signals that all internal float routines aren't needed.
 * _LONG_DOUBLE_IS_DOUBLE signals that all internal long double routines
 *                        aren't needed.
 */


                /* NAMING PROPERTIES */

/* Has support for fixed point types */

/* Has support for secure functions (printf_s, scanf_s, etc) */
/* Will not compile if enabled */

/* Has support for complex C types */

/* If is Embedded C++ language */

/* If is true C++ language */

/* True C++ language setup */



                /* NAMESPACE CONTROL */






/* xencoding_limits.h internal header file */
/* Copyright 2003-2010 IAR Systems AB.  */


  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */




/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */


/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

                                /* Multibyte encoding length. */





                                /* Utility macro */








                /* FLOATING-POINT PROPERTIES */

                /* float properties */

                /* double properties */

                /* long double properties */
                /* (must be same as double) */



                /* INTEGER PROPERTIES */
                                /* MB_LEN_MAX */


  #pragma language=save
  #pragma language=extended
  typedef long long _Longlong;
  typedef unsigned long long _ULonglong;
  #pragma language=restore

  typedef unsigned short int _Wchart;
  typedef unsigned short int _Wintt;



                /* POINTER PROPERTIES */

typedef signed int  _Ptrdifft;
typedef unsigned int     _Sizet;

/* IAR doesn't support restrict  */

                /* stdarg PROPERTIES */


/* This struct definition must not be inside namespace std, or
   overloading will be wrong in full C++ */
  typedef struct __va_list
  {
    char  *_Ap;
  } __va_list;

  typedef __va_list __Va_list;


__intrinsic __nounwind void __iar_Atexit(void (*)(void));


  typedef struct
  {       /* state of a multibyte translation */
    unsigned int _Wchar;
    unsigned int _State;
  } _Mbstatet;





typedef struct
{       /* file position */
  _Longlong _Off;    /* can be system dependent */
  _Mbstatet _Wstate;
} _Fpost;




                /* THREAD AND LOCALE CONTROL */

/***************************************************
 *
 * DLib_Threads.h is the library threads manager.
 *
 * Copyright 2004-2010 IAR Systems AB.  
 *
 * This configuration header file sets up how the thread support in the library
 * should work.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/


  #pragma system_include

/*
 * DLib can support a multithreaded environment. The preprocessor symbol 
 * _DLIB_THREAD_SUPPORT governs the support. It can be 0 (no support), 
 * 1 (currently not supported), 2 (locks only), and 3 (simulated TLS and locks).
 */

/*
 * This header sets the following symbols that governs the rest of the
 * library:
 * ------------------------------------------
 * _DLIB_MULTI_THREAD     0 No thread support
 *                        1 Multithread support
 * _DLIB_GLOBAL_VARIABLES 0 Use external TLS interface for the libraries global
 *                          and static variables
 *                        1 Use a lock for accesses to the locale and no 
 *                          security for accesses to other global and static
 *                          variables in the library
 * _DLIB_FILE_OP_LOCKS    0 No file-atomic locks
 *                        1 File-atomic locks

 * _DLIB_COMPILER_TLS     0 No Thread-Local-Storage support in the compiler
 *                        1 Thread-Local-Storage support in the compiler
 * _DLIB_TLS_QUAL         The TLS qualifier, define only if _COMPILER_TLS == 1
 *
 * _DLIB_THREAD_MACRO_SETUP_DONE Whether to use the standard definitions of
 *                               TLS macros defined in xtls.h or the definitions
 *                               are provided here.
 *                        0 Use default macros
 *                        1 Macros defined for xtls.h
 *
 * _DLIB_THREAD_LOCK_ONCE_TYPE
 *                        type for control variable in once-initialization of 
 *                        locks
 * _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *                        expression that will be evaluated at each lock access
 *                        to determine if an initialization must be done
 * _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *                        initial value for the control variable
 *
 ****************************************************************************
 * Description
 * -----------
 *
 * If locks are to be used (_DLIB_MULTI_THREAD != 0), the following options
 * has to be used in ilink: 
 *   --redirect __iar_Locksyslock=__iar_Locksyslock_mtx
 *   --redirect __iar_Unlocksyslock=__iar_Unlocksyslock_mtx
 *   --redirect __iar_Lockfilelock=__iar_Lockfilelock_mtx
 *   --redirect __iar_Unlockfilelock=__iar_Unlockfilelock_mtx
 *   --keep     __iar_Locksyslock_mtx
 * and, if C++ is used, also:
 *   --redirect __iar_Initdynamicfilelock=__iar_Initdynamicfilelock_mtx
 *   --redirect __iar_Dstdynamicfilelock=__iar_Dstdynamicfilelock_mtx
 *   --redirect __iar_Lockdynamicfilelock=__iar_Lockdynamicfilelock_mtx
 *   --redirect __iar_Unlockdynamicfilelock=__iar_Unlockdynamicfilelock_mtx
 * Xlink uses similar options (-e and -g). The following lock interface must
 * also be implemented: 
 *   typedef void *__iar_Rmtx;                   // Lock info object
 *
 *   void __iar_system_Mtxinit(__iar_Rmtx *);    // Initialize a system lock
 *   void __iar_system_Mtxdst(__iar_Rmtx *);     // Destroy a system lock
 *   void __iar_system_Mtxlock(__iar_Rmtx *);    // Lock a system lock
 *   void __iar_system_Mtxunlock(__iar_Rmtx *);  // Unlock a system lock
 * The interface handles locks for the heap, the locale, the file system
 * structure, the initialization of statics in functions, etc. 
 *
 * The following lock interface is optional to be implemented:
 *   void __iar_file_Mtxinit(__iar_Rmtx *);    // Initialize a file lock
 *   void __iar_file_Mtxdst(__iar_Rmtx *);     // Destroy a file lock
 *   void __iar_file_Mtxlock(__iar_Rmtx *);    // Lock a file lock
 *   void __iar_file_Mtxunlock(__iar_Rmtx *);  // Unlock a file lock
 * The interface handles locks for each file stream.
 * 
 * These three once-initialization symbols must also be defined, if the 
 * default initialization later on in this file doesn't work (done in 
 * DLib_product.h):
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * If an external TLS interface is used, the following must
 * be defined:
 *   typedef int __iar_Tlskey_t;
 *   typedef void (*__iar_Tlsdtor_t)(void *);
 *   int __iar_Tlsalloc(__iar_Tlskey_t *, __iar_Tlsdtor_t); 
 *                                                    // Allocate a TLS element
 *   int __iar_Tlsfree(__iar_Tlskey_t);               // Free a TLS element
 *   int __iar_Tlsset(__iar_Tlskey_t, void *);        // Set a TLS element
 *   void *__iar_Tlsget(__iar_Tlskey_t);              // Get a TLS element
 *
 */

/* We don't have a compiler that supports tls declarations */


  /* Thread support, library supports threaded variables in a user specified
     memory area, locks on heap and on FILE */

  /* See Documentation/ThreadsInternal.html for a description. */


  





  #pragma language=save 
  #pragma language=extended
  __intrinsic __nounwind void __iar_dlib_perthread_initialize(void  *);
  __intrinsic __nounwind void  *__iar_dlib_perthread_allocate(void);
  __intrinsic __nounwind void __iar_dlib_perthread_destroy(void);
  __intrinsic __nounwind void __iar_dlib_perthread_deallocate(void  *);



  #pragma segment = "__DLIB_PERTHREAD" 
  #pragma segment = "__DLIB_PERTHREAD_init" 









  /* The thread-local variable access function */
  void  *__iar_dlib_perthread_access(void  *);
  #pragma language=restore








    /* Make sure that each destructor is inserted into _Deallocate_TLS */
  



  /* Internal function declarations. */

  


  
  typedef void *__iar_Rmtx;
  
  
  __intrinsic __nounwind void __iar_system_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxunlock(__iar_Rmtx *m);

  __intrinsic __nounwind void __iar_file_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxunlock(__iar_Rmtx *m);

  /* Function to destroy the locks. Should be called after atexit and 
     _Close_all. */
  __intrinsic __nounwind void __iar_clearlocks(void);



  



  


  typedef unsigned _Once_t;

  








                /* THREAD-LOCAL STORAGE */


                /* MULTITHREAD PROPERTIES */
  
  
  /* The lock interface for DLib to use. */ 
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock(unsigned int);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock(unsigned int);

  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Initdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Dstdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Lockdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlockdynamicfilelock(__iar_Rmtx *);
  
  

                /* LOCK MACROS */


                /* MISCELLANEOUS MACROS AND FUNCTIONS*/




/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */


/* Fixed size types. These are all optional. */
  typedef signed char   int8_t;
  typedef unsigned char uint8_t;

  typedef signed short int   int16_t;
  typedef unsigned short int uint16_t;

  typedef signed int   int32_t;
  typedef unsigned int uint32_t;

  #pragma language=save
  #pragma language=extended
  typedef signed long long int   int64_t;
  typedef unsigned long long int uint64_t;
  #pragma language=restore

/* Types capable of holding at least a certain number of bits.
   These are not optional for the sizes 8, 16, 32, 64. */
typedef signed char   int_least8_t;
typedef unsigned char uint_least8_t;

typedef signed short int   int_least16_t;
typedef unsigned short int uint_least16_t;

typedef signed int   int_least32_t;
typedef unsigned int uint_least32_t;

/* This isn't really optional, but make it so for now. */
  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_least64_t;
  #pragma language=restore
  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_least64_t;
  #pragma language=restore

/* The fastest type holding at least a certain number of bits.
   These are not optional for the size 8, 16, 32, 64.
   For now, the 64 bit size is optional in IAR compilers. */
typedef signed int   int_fast8_t;
typedef unsigned int uint_fast8_t;

typedef signed int   int_fast16_t;
typedef unsigned int uint_fast16_t;

typedef signed int   int_fast32_t;
typedef unsigned int uint_fast32_t;

  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_fast64_t;
  #pragma language=restore
  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_fast64_t;
  #pragma language=restore

/* The integer type capable of holding the largest number of bits. */
#pragma language=save
#pragma language=extended
typedef signed long long int   intmax_t;
typedef unsigned long long int uintmax_t;
#pragma language=restore

/* An integer type large enough to be able to hold a pointer.
   This is optional, but always supported in IAR compilers. */
typedef signed long int   intptr_t;
typedef unsigned long int uintptr_t;

/* An integer capable of holding a pointer to a specific memory type. */
typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;

/* Minimum and maximum limits. */

























/* Macros expanding to integer constants. */











/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
/**************************************************************************//**
 * @file     core_cmInstr.h
 * @brief    CMSIS Cortex-M Core Instruction Access Header File
 * @version  V4.00
 * @date     28. August 2014
 *
 * @note
 *
 ******************************************************************************/
/* Copyright (c) 2009 - 2014 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/




/* ##########################  Core Instruction Access  ######################### */
/** \defgroup CMSIS_Core_InstructionInterface CMSIS Core Instruction Interface
  Access to dedicated instructions
  @{
*/

/* IAR iccarm specific functions */
/**************************************************
 *
 * This file shall be included in appropriate CMSIS header
 * files, to provide required functions and intrinsics when
 * building with the IAR C/C++ Compiler for ARM (iccarm).
 *
 * Copyright 2011 IAR Systems. All rights reserved.
 *
 * $Revision: 78346 $
 *
 **************************************************/



#pragma system_include

/**************************************************
 *
 * This file declares the ARM intrinsic inline functions.
 *
 * Copyright 1999-2006 IAR Systems. All rights reserved.
 *
 * $Revision: 99951 $
 *
 **************************************************/


/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __AEABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */





  #pragma system_include

/*
 * Check that the correct C compiler is used.
 */


/* Define function effects for intrinsics */


#pragma language=save
#pragma language=extended

__intrinsic __nounwind void    __no_operation(void);

__intrinsic __nounwind void    __disable_interrupt(void);
__intrinsic __nounwind void    __enable_interrupt(void);

typedef unsigned long __istate_t;

__intrinsic __nounwind __istate_t __get_interrupt_state(void);
__intrinsic __nounwind void __set_interrupt_state(__istate_t);


/* System control access for Cortex-M cores */
__intrinsic __nounwind unsigned long __get_PSR( void );
__intrinsic __nounwind unsigned long __get_IPSR( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_MSP( void );
__intrinsic __nounwind void          __set_MSP( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_PSP( void );
__intrinsic __nounwind void          __set_PSP( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_PRIMASK( void );
__intrinsic __nounwind void          __set_PRIMASK( unsigned long );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_CONTROL( void );
__intrinsic __nounwind void          __set_CONTROL( unsigned long );


/* These are only available for v7M */
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_FAULTMASK( void );
__intrinsic __nounwind void          __set_FAULTMASK(unsigned long);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __get_BASEPRI( void );
__intrinsic __nounwind void          __set_BASEPRI( unsigned long );


__intrinsic __nounwind void __disable_fiq(void);
__intrinsic __nounwind void __enable_fiq(void);


/* ARM-mode intrinsics */

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __SWP( unsigned long, volatile unsigned long * );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __SWPB( unsigned char, volatile unsigned char * );

typedef unsigned long __ul;


/*  Co-processor access */
__intrinsic __nounwind void          __MCR( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind void          __MCR2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );

/* Load coprocessor register. */
__intrinsic __nounwind void __LDC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);

/* Store coprocessor register. */
__intrinsic __nounwind void __STC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);

/* Load coprocessor register (noindexed version with coprocessor option). */
__intrinsic __nounwind void __LDC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                                unsigned __constrange(0,255) option);

/* Store coprocessor register (version with coprocessor option). */
__intrinsic __nounwind void __STC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                                unsigned __constrange(0,255) option);

/* Status register access, v7M: */
__intrinsic __nounwind unsigned long __get_APSR( void );
__intrinsic __nounwind void          __set_APSR( unsigned long );

/* Floating-point status and control register access */
__intrinsic __nounwind unsigned long __get_FPSCR( void );
__intrinsic __nounwind void __set_FPSCR( unsigned long );

/* Architecture v5T, CLZ is also available in Thumb mode for Thumb2 cores */
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __CLZ( unsigned long );

/* Architecture v5TE */

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int         __QCFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __reset_QC_flag( void );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed long __SMUL( signed short, signed short );

/* Architecture v6, REV and REVSH are also available in thumb mode */
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __REV( unsigned long );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed long __REVSH( short );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __REV16( unsigned long );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long __RBIT( unsigned long );

_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned char  __LDREXB( volatile unsigned char const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned short __LDREXH( volatile unsigned short const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned long  __LDREX ( volatile unsigned long const * );
_Pragma("function_effects = no_state, no_write(1), always_returns") __intrinsic __nounwind unsigned long long __LDREXD( volatile unsigned long long const * );

_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXB( unsigned char, volatile unsigned char * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXH( unsigned short, volatile unsigned short * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREX ( unsigned long, volatile unsigned long * );
_Pragma("function_effects = no_state, no_read(2), always_returns") __intrinsic __nounwind unsigned long  __STREXD( unsigned long long, volatile unsigned long long * );

__intrinsic __nounwind void __CLREX( void );

__intrinsic __nounwind void __SEV( void );
__intrinsic __nounwind void __WFE( void );
__intrinsic __nounwind void __WFI( void );
__intrinsic __nounwind void __YIELD( void );

__intrinsic __nounwind void __PLI( volatile void const * );
__intrinsic __nounwind void __PLD( volatile void const * );
__intrinsic __nounwind void __PLDW( volatile void const * );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind   signed long __SSAT     (unsigned long val,
                                      unsigned int __constrange( 1, 32 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned long __USAT     (unsigned long val,
                                      unsigned int __constrange( 0, 31 ) sat );



/* Architecture v7 instructions */
__intrinsic __nounwind void __DMB(void);
__intrinsic __nounwind void __DSB(void);
__intrinsic __nounwind void __ISB(void);

/* Architecture v8-M instructions */
__intrinsic __nounwind unsigned long __TT(unsigned long);
__intrinsic __nounwind unsigned long __TTT(unsigned long);
__intrinsic __nounwind unsigned long __TTA(unsigned long);
__intrinsic __nounwind unsigned long __TTAT(unsigned long);


__intrinsic __nounwind unsigned long __get_LR(void);
__intrinsic __nounwind void __set_LR(unsigned long);

__intrinsic __nounwind unsigned long __get_SP(void);
__intrinsic __nounwind void __set_SP(unsigned long);

#pragma language=restore





#pragma diag_suppress=Pe940
#pragma diag_suppress=Pe177






static uint32_t __get_xPSR(void)
{
  return __get_PSR();   /* __get_PSR() intrinsic introduced in iccarm 6.20 */
}












static inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;
  __asm("RRX %0, %1" : "=r"(result) : "r" (value) );
  return(result);
}

static inline uint8_t __LDRBT(volatile uint8_t *addr)
{
  uint32_t result;
  __asm("LDRBT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return ((uint8_t) result);
}

static inline uint16_t __LDRHT(volatile uint16_t *addr)
{
  uint32_t result;
  __asm("LDRHT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return ((uint16_t) result);
}

static inline uint32_t __LDRT(volatile uint32_t *addr)
{
  uint32_t result;
  __asm("LDRT %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
  return(result);
}

static inline void __STRBT(uint8_t value, volatile uint8_t *addr)
{
  __asm("STRBT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory" );
}

static inline void __STRHT(uint16_t value, volatile uint16_t *addr)
{
  __asm("STRHT %1, [%0]" : : "r" (addr), "r" ((uint32_t)value) : "memory" );
}

static inline void __STRT(uint32_t value, volatile uint32_t *addr)
{
  __asm("STRT %1, [%0]" : : "r" (addr), "r" (value) : "memory" );
}



static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  return (op1 >> op2) | (op1 << ((sizeof(op1)*8)-op2));
}

#pragma diag_default=Pe940
#pragma diag_default=Pe177




/*@}*/ /* end of group CMSIS_Core_InstructionInterface */

/**************************************************************************//**
 * @file     core_cmFunc.h
 * @brief    CMSIS Cortex-M Core Function Access Header File
 * @version  V4.00
 * @date     28. August 2014
 *
 * @note
 *
 ******************************************************************************/
/* Copyright (c) 2009 - 2014 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/




/* ###########################  Core Function Access  ########################### */
/** \ingroup  CMSIS_Core_FunctionInterface
    \defgroup CMSIS_Core_RegAccFunctions CMSIS Core Register Access Functions
  @{
 */

/* IAR iccarm specific functions */



/*@} end of CMSIS_Core_RegAccFunctions */

/**************************************************************************//**
 * @file     core_cmSimd.h
 * @brief    CMSIS Cortex-M SIMD Header File
 * @version  V4.00
 * @date     22. August 2014
 *
 * @note
 *
 ******************************************************************************/
/* Copyright (c) 2009 - 2014 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/


 #pragma system_include  /* treat file as system include file for MISRA check */




/*******************************************************************************
 *                Hardware Abstraction Layer
 ******************************************************************************/


/* ###################  Compiler specific Intrinsics  ########################### */
/** \defgroup CMSIS_SIMD_intrinsics CMSIS SIMD Intrinsics
  Access to dedicated SIMD instructions
  @{
*/

/* IAR iccarm specific functions */



/*@} end of group CMSIS_SIMD_intrinsics */









/* check device defines and use defaults */

/* IO definitions (access restrictions to peripheral registers) */
/**
    \defgroup CMSIS_glob_defs CMSIS Global Defines

    <strong>IO Type Qualifiers</strong> are used
    \li to specify the access to peripheral variables.
    \li for automatic generation of peripheral register debug information.
*/

/*@} end of group Cortex_M4 */



/*******************************************************************************
 *                 Register Abstraction
  Core Register contain:
  - Core Register
  - Core NVIC Register
  - Core SCB Register
  - Core SysTick Register
  - Core Debug Register
  - Core MPU Register
  - Core FPU Register
 ******************************************************************************/
/** \defgroup CMSIS_core_register Defines and Type Definitions
    \brief Type definitions and defines for Cortex-M processor based devices.
*/

/** \ingroup    CMSIS_core_register
    \defgroup   CMSIS_CORE  Status and Control Registers
    \brief  Core Register type definitions.
  @{
 */

/** \brief  Union type to access the Application Program Status Register (APSR).
 */
typedef union
{
  struct
  {
    uint32_t _reserved0:16;              /*!< bit:  0..15  Reserved                           */
    uint32_t GE:4;                       /*!< bit: 16..19  Greater than or Equal flags        */
    uint32_t _reserved1:7;               /*!< bit: 20..26  Reserved                           */
    uint32_t Q:1;                        /*!< bit:     27  Saturation condition flag          */
    uint32_t V:1;                        /*!< bit:     28  Overflow condition code flag       */
    uint32_t C:1;                        /*!< bit:     29  Carry condition code flag          */
    uint32_t Z:1;                        /*!< bit:     30  Zero condition code flag           */
    uint32_t N:1;                        /*!< bit:     31  Negative condition code flag       */
  } b;                                   /*!< Structure used for bit  access                  */
  uint32_t w;                            /*!< Type      used for word access                  */
} APSR_Type;


/** \brief  Union type to access the Interrupt Program Status Register (IPSR).
 */
typedef union
{
  struct
  {
    uint32_t ISR:9;                      /*!< bit:  0.. 8  Exception number                   */
    uint32_t _reserved0:23;              /*!< bit:  9..31  Reserved                           */
  } b;                                   /*!< Structure used for bit  access                  */
  uint32_t w;                            /*!< Type      used for word access                  */
} IPSR_Type;


/** \brief  Union type to access the Special-Purpose Program Status Registers (xPSR).
 */
typedef union
{
  struct
  {
    uint32_t ISR:9;                      /*!< bit:  0.. 8  Exception number                   */
    uint32_t _reserved0:7;               /*!< bit:  9..15  Reserved                           */
    uint32_t GE:4;                       /*!< bit: 16..19  Greater than or Equal flags        */
    uint32_t _reserved1:4;               /*!< bit: 20..23  Reserved                           */
    uint32_t T:1;                        /*!< bit:     24  Thumb bit        (read 0)          */
    uint32_t IT:2;                       /*!< bit: 25..26  saved IT state   (read 0)          */
    uint32_t Q:1;                        /*!< bit:     27  Saturation condition flag          */
    uint32_t V:1;                        /*!< bit:     28  Overflow condition code flag       */
    uint32_t C:1;                        /*!< bit:     29  Carry condition code flag          */
    uint32_t Z:1;                        /*!< bit:     30  Zero condition code flag           */
    uint32_t N:1;                        /*!< bit:     31  Negative condition code flag       */
  } b;                                   /*!< Structure used for bit  access                  */
  uint32_t w;                            /*!< Type      used for word access                  */
} xPSR_Type;


/** \brief  Union type to access the Control Registers (CONTROL).
 */
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                    /*!< bit:      0  Execution privilege in Thread mode */
    uint32_t SPSEL:1;                    /*!< bit:      1  Stack to be used                   */
    uint32_t FPCA:1;                     /*!< bit:      2  FP extension active flag           */
    uint32_t _reserved0:29;              /*!< bit:  3..31  Reserved                           */
  } b;                                   /*!< Structure used for bit  access                  */
  uint32_t w;                            /*!< Type      used for word access                  */
} CONTROL_Type;

/*@} end of group CMSIS_CORE */


/** \ingroup    CMSIS_core_register
    \defgroup   CMSIS_NVIC  Nested Vectored Interrupt Controller (NVIC)
    \brief      Type definitions for the NVIC Registers
  @{
 */

/** \brief  Structure type to access the Nested Vectored Interrupt Controller (NVIC).
 */
typedef struct
{
  volatile uint32_t ISER[8];                 /*!< Offset: 0x000 (R/W)  Interrupt Set Enable Register           */
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                 /*!< Offset: 0x080 (R/W)  Interrupt Clear Enable Register         */
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                 /*!< Offset: 0x100 (R/W)  Interrupt Set Pending Register          */
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                 /*!< Offset: 0x180 (R/W)  Interrupt Clear Pending Register        */
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                 /*!< Offset: 0x200 (R/W)  Interrupt Active bit Register           */
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                 /*!< Offset: 0x300 (R/W)  Interrupt Priority Register (8Bit wide) */
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                    /*!< Offset: 0xE00 ( /W)  Software Trigger Interrupt Register     */
}  NVIC_Type;

/* Software Triggered Interrupt Register Definitions */

/*@} end of group CMSIS_NVIC */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_SCB     System Control Block (SCB)
    \brief      Type definitions for the System Control Block Registers
  @{
 */

/** \brief  Structure type to access the System Control Block (SCB).
 */
typedef struct
{
  volatile const  uint32_t CPUID;                   /*!< Offset: 0x000 (R/ )  CPUID Base Register                                   */
  volatile uint32_t ICSR;                    /*!< Offset: 0x004 (R/W)  Interrupt Control and State Register                  */
  volatile uint32_t VTOR;                    /*!< Offset: 0x008 (R/W)  Vector Table Offset Register                          */
  volatile uint32_t AIRCR;                   /*!< Offset: 0x00C (R/W)  Application Interrupt and Reset Control Register      */
  volatile uint32_t SCR;                     /*!< Offset: 0x010 (R/W)  System Control Register                               */
  volatile uint32_t CCR;                     /*!< Offset: 0x014 (R/W)  Configuration Control Register                        */
  volatile uint8_t  SHP[12];                 /*!< Offset: 0x018 (R/W)  System Handlers Priority Registers (4-7, 8-11, 12-15) */
  volatile uint32_t SHCSR;                   /*!< Offset: 0x024 (R/W)  System Handler Control and State Register             */
  volatile uint32_t CFSR;                    /*!< Offset: 0x028 (R/W)  Configurable Fault Status Register                    */
  volatile uint32_t HFSR;                    /*!< Offset: 0x02C (R/W)  HardFault Status Register                             */
  volatile uint32_t DFSR;                    /*!< Offset: 0x030 (R/W)  Debug Fault Status Register                           */
  volatile uint32_t MMFAR;                   /*!< Offset: 0x034 (R/W)  MemManage Fault Address Register                      */
  volatile uint32_t BFAR;                    /*!< Offset: 0x038 (R/W)  BusFault Address Register                             */
  volatile uint32_t AFSR;                    /*!< Offset: 0x03C (R/W)  Auxiliary Fault Status Register                       */
  volatile const  uint32_t PFR[2];                  /*!< Offset: 0x040 (R/ )  Processor Feature Register                            */
  volatile const  uint32_t DFR;                     /*!< Offset: 0x048 (R/ )  Debug Feature Register                                */
  volatile const  uint32_t ADR;                     /*!< Offset: 0x04C (R/ )  Auxiliary Feature Register                            */
  volatile const  uint32_t MMFR[4];                 /*!< Offset: 0x050 (R/ )  Memory Model Feature Register                         */
  volatile const  uint32_t ISAR[5];                 /*!< Offset: 0x060 (R/ )  Instruction Set Attributes Register                   */
       uint32_t RESERVED0[5];
  volatile uint32_t CPACR;                   /*!< Offset: 0x088 (R/W)  Coprocessor Access Control Register                   */
} SCB_Type;

/* SCB CPUID Register Definitions */





/* SCB Interrupt Control State Register Definitions */










/* SCB Vector Table Offset Register Definitions */

/* SCB Application Interrupt and Reset Control Register Definitions */







/* SCB System Control Register Definitions */



/* SCB Configuration Control Register Definitions */






/* SCB System Handler Control and State Register Definitions */














/* SCB Configurable Fault Status Registers Definitions */



/* SCB Hard Fault Status Registers Definitions */



/* SCB Debug Fault Status Register Definitions */





/*@} end of group CMSIS_SCB */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_SCnSCB System Controls not in SCB (SCnSCB)
    \brief      Type definitions for the System Control and ID Register not in the SCB
  @{
 */

/** \brief  Structure type to access the System Control and ID Register not in the SCB.
 */
typedef struct
{
       uint32_t RESERVED0[1];
  volatile const  uint32_t ICTR;                    /*!< Offset: 0x004 (R/ )  Interrupt Controller Type Register      */
  volatile uint32_t ACTLR;                   /*!< Offset: 0x008 (R/W)  Auxiliary Control Register              */
} SCnSCB_Type;

/* Interrupt Controller Type Register Definitions */

/* Auxiliary Control Register Definitions */





/*@} end of group CMSIS_SCnotSCB */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_SysTick     System Tick Timer (SysTick)
    \brief      Type definitions for the System Timer Registers.
  @{
 */

/** \brief  Structure type to access the System Timer (SysTick).
 */
typedef struct
{
  volatile uint32_t CTRL;                    /*!< Offset: 0x000 (R/W)  SysTick Control and Status Register */
  volatile uint32_t LOAD;                    /*!< Offset: 0x004 (R/W)  SysTick Reload Value Register       */
  volatile uint32_t VAL;                     /*!< Offset: 0x008 (R/W)  SysTick Current Value Register      */
  volatile const  uint32_t CALIB;                   /*!< Offset: 0x00C (R/ )  SysTick Calibration Register        */
} SysTick_Type;

/* SysTick Control / Status Register Definitions */




/* SysTick Reload Register Definitions */

/* SysTick Current Register Definitions */

/* SysTick Calibration Register Definitions */



/*@} end of group CMSIS_SysTick */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_ITM     Instrumentation Trace Macrocell (ITM)
    \brief      Type definitions for the Instrumentation Trace Macrocell (ITM)
  @{
 */

/** \brief  Structure type to access the Instrumentation Trace Macrocell Register (ITM).
 */
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                  /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 8-bit                   */
    volatile  uint16_t   u16;                 /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 16-bit                  */
    volatile  uint32_t   u32;                 /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 32-bit                  */
  }  PORT [32];                          /*!< Offset: 0x000 ( /W)  ITM Stimulus Port Registers               */
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                     /*!< Offset: 0xE00 (R/W)  ITM Trace Enable Register                 */
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                     /*!< Offset: 0xE40 (R/W)  ITM Trace Privilege Register              */
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                     /*!< Offset: 0xE80 (R/W)  ITM Trace Control Register                */
       uint32_t RESERVED3[29];
  volatile  uint32_t IWR;                     /*!< Offset: 0xEF8 ( /W)  ITM Integration Write Register            */
  volatile const  uint32_t IRR;                     /*!< Offset: 0xEFC (R/ )  ITM Integration Read Register             */
  volatile uint32_t IMCR;                    /*!< Offset: 0xF00 (R/W)  ITM Integration Mode Control Register     */
       uint32_t RESERVED4[43];
  volatile  uint32_t LAR;                     /*!< Offset: 0xFB0 ( /W)  ITM Lock Access Register                  */
  volatile const  uint32_t LSR;                     /*!< Offset: 0xFB4 (R/ )  ITM Lock Status Register                  */
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                    /*!< Offset: 0xFD0 (R/ )  ITM Peripheral Identification Register #4 */
  volatile const  uint32_t PID5;                    /*!< Offset: 0xFD4 (R/ )  ITM Peripheral Identification Register #5 */
  volatile const  uint32_t PID6;                    /*!< Offset: 0xFD8 (R/ )  ITM Peripheral Identification Register #6 */
  volatile const  uint32_t PID7;                    /*!< Offset: 0xFDC (R/ )  ITM Peripheral Identification Register #7 */
  volatile const  uint32_t PID0;                    /*!< Offset: 0xFE0 (R/ )  ITM Peripheral Identification Register #0 */
  volatile const  uint32_t PID1;                    /*!< Offset: 0xFE4 (R/ )  ITM Peripheral Identification Register #1 */
  volatile const  uint32_t PID2;                    /*!< Offset: 0xFE8 (R/ )  ITM Peripheral Identification Register #2 */
  volatile const  uint32_t PID3;                    /*!< Offset: 0xFEC (R/ )  ITM Peripheral Identification Register #3 */
  volatile const  uint32_t CID0;                    /*!< Offset: 0xFF0 (R/ )  ITM Component  Identification Register #0 */
  volatile const  uint32_t CID1;                    /*!< Offset: 0xFF4 (R/ )  ITM Component  Identification Register #1 */
  volatile const  uint32_t CID2;                    /*!< Offset: 0xFF8 (R/ )  ITM Component  Identification Register #2 */
  volatile const  uint32_t CID3;                    /*!< Offset: 0xFFC (R/ )  ITM Component  Identification Register #3 */
} ITM_Type;

/* ITM Trace Privilege Register Definitions */

/* ITM Trace Control Register Definitions */









/* ITM Integration Write Register Definitions */

/* ITM Integration Read Register Definitions */

/* ITM Integration Mode Control Register Definitions */

/* ITM Lock Status Register Definitions */



/*@}*/ /* end of group CMSIS_ITM */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_DWT     Data Watchpoint and Trace (DWT)
    \brief      Type definitions for the Data Watchpoint and Trace (DWT)
  @{
 */

/** \brief  Structure type to access the Data Watchpoint and Trace Register (DWT).
 */
typedef struct
{
  volatile uint32_t CTRL;                    /*!< Offset: 0x000 (R/W)  Control Register                          */
  volatile uint32_t CYCCNT;                  /*!< Offset: 0x004 (R/W)  Cycle Count Register                      */
  volatile uint32_t CPICNT;                  /*!< Offset: 0x008 (R/W)  CPI Count Register                        */
  volatile uint32_t EXCCNT;                  /*!< Offset: 0x00C (R/W)  Exception Overhead Count Register         */
  volatile uint32_t SLEEPCNT;                /*!< Offset: 0x010 (R/W)  Sleep Count Register                      */
  volatile uint32_t LSUCNT;                  /*!< Offset: 0x014 (R/W)  LSU Count Register                        */
  volatile uint32_t FOLDCNT;                 /*!< Offset: 0x018 (R/W)  Folded-instruction Count Register         */
  volatile const  uint32_t PCSR;                    /*!< Offset: 0x01C (R/ )  Program Counter Sample Register           */
  volatile uint32_t COMP0;                   /*!< Offset: 0x020 (R/W)  Comparator Register 0                     */
  volatile uint32_t MASK0;                   /*!< Offset: 0x024 (R/W)  Mask Register 0                           */
  volatile uint32_t FUNCTION0;               /*!< Offset: 0x028 (R/W)  Function Register 0                       */
       uint32_t RESERVED0[1];
  volatile uint32_t COMP1;                   /*!< Offset: 0x030 (R/W)  Comparator Register 1                     */
  volatile uint32_t MASK1;                   /*!< Offset: 0x034 (R/W)  Mask Register 1                           */
  volatile uint32_t FUNCTION1;               /*!< Offset: 0x038 (R/W)  Function Register 1                       */
       uint32_t RESERVED1[1];
  volatile uint32_t COMP2;                   /*!< Offset: 0x040 (R/W)  Comparator Register 2                     */
  volatile uint32_t MASK2;                   /*!< Offset: 0x044 (R/W)  Mask Register 2                           */
  volatile uint32_t FUNCTION2;               /*!< Offset: 0x048 (R/W)  Function Register 2                       */
       uint32_t RESERVED2[1];
  volatile uint32_t COMP3;                   /*!< Offset: 0x050 (R/W)  Comparator Register 3                     */
  volatile uint32_t MASK3;                   /*!< Offset: 0x054 (R/W)  Mask Register 3                           */
  volatile uint32_t FUNCTION3;               /*!< Offset: 0x058 (R/W)  Function Register 3                       */
} DWT_Type;

/* DWT Control Register Definitions */


















/* DWT CPI Count Register Definitions */

/* DWT Exception Overhead Count Register Definitions */

/* DWT Sleep Count Register Definitions */

/* DWT LSU Count Register Definitions */

/* DWT Folded-instruction Count Register Definitions */

/* DWT Comparator Mask Register Definitions */

/* DWT Comparator Function Register Definitions */









/*@}*/ /* end of group CMSIS_DWT */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_TPI     Trace Port Interface (TPI)
    \brief      Type definitions for the Trace Port Interface (TPI)
  @{
 */

/** \brief  Structure type to access the Trace Port Interface Register (TPI).
 */
typedef struct
{
  volatile uint32_t SSPSR;                   /*!< Offset: 0x000 (R/ )  Supported Parallel Port Size Register     */
  volatile uint32_t CSPSR;                   /*!< Offset: 0x004 (R/W)  Current Parallel Port Size Register */
       uint32_t RESERVED0[2];
  volatile uint32_t ACPR;                    /*!< Offset: 0x010 (R/W)  Asynchronous Clock Prescaler Register */
       uint32_t RESERVED1[55];
  volatile uint32_t SPPR;                    /*!< Offset: 0x0F0 (R/W)  Selected Pin Protocol Register */
       uint32_t RESERVED2[131];
  volatile const  uint32_t FFSR;                    /*!< Offset: 0x300 (R/ )  Formatter and Flush Status Register */
  volatile uint32_t FFCR;                    /*!< Offset: 0x304 (R/W)  Formatter and Flush Control Register */
  volatile const  uint32_t FSCR;                    /*!< Offset: 0x308 (R/ )  Formatter Synchronization Counter Register */
       uint32_t RESERVED3[759];
  volatile const  uint32_t TRIGGER;                 /*!< Offset: 0xEE8 (R/ )  TRIGGER */
  volatile const  uint32_t FIFO0;                   /*!< Offset: 0xEEC (R/ )  Integration ETM Data */
  volatile const  uint32_t ITATBCTR2;               /*!< Offset: 0xEF0 (R/ )  ITATBCTR2 */
       uint32_t RESERVED4[1];
  volatile const  uint32_t ITATBCTR0;               /*!< Offset: 0xEF8 (R/ )  ITATBCTR0 */
  volatile const  uint32_t FIFO1;                   /*!< Offset: 0xEFC (R/ )  Integration ITM Data */
  volatile uint32_t ITCTRL;                  /*!< Offset: 0xF00 (R/W)  Integration Mode Control */
       uint32_t RESERVED5[39];
  volatile uint32_t CLAIMSET;                /*!< Offset: 0xFA0 (R/W)  Claim tag set */
  volatile uint32_t CLAIMCLR;                /*!< Offset: 0xFA4 (R/W)  Claim tag clear */
       uint32_t RESERVED7[8];
  volatile const  uint32_t DEVID;                   /*!< Offset: 0xFC8 (R/ )  TPIU_DEVID */
  volatile const  uint32_t DEVTYPE;                 /*!< Offset: 0xFCC (R/ )  TPIU_DEVTYPE */
} TPI_Type;

/* TPI Asynchronous Clock Prescaler Register Definitions */

/* TPI Selected Pin Protocol Register Definitions */

/* TPI Formatter and Flush Status Register Definitions */




/* TPI Formatter and Flush Control Register Definitions */


/* TPI TRIGGER Register Definitions */

/* TPI Integration ETM Data Register Definitions (FIFO0) */







/* TPI ITATBCTR2 Register Definitions */

/* TPI Integration ITM Data Register Definitions (FIFO1) */







/* TPI ITATBCTR0 Register Definitions */

/* TPI Integration Mode Control Register Definitions */

/* TPI DEVID Register Definitions */






/* TPI DEVTYPE Register Definitions */


/*@}*/ /* end of group CMSIS_TPI */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_MPU     Memory Protection Unit (MPU)
    \brief      Type definitions for the Memory Protection Unit (MPU)
  @{
 */

/** \brief  Structure type to access the Memory Protection Unit (MPU).
 */
typedef struct
{
  volatile const  uint32_t TYPE;                    /*!< Offset: 0x000 (R/ )  MPU Type Register                              */
  volatile uint32_t CTRL;                    /*!< Offset: 0x004 (R/W)  MPU Control Register                           */
  volatile uint32_t RNR;                     /*!< Offset: 0x008 (R/W)  MPU Region RNRber Register                     */
  volatile uint32_t RBAR;                    /*!< Offset: 0x00C (R/W)  MPU Region Base Address Register               */
  volatile uint32_t RASR;                    /*!< Offset: 0x010 (R/W)  MPU Region Attribute and Size Register         */
  volatile uint32_t RBAR_A1;                 /*!< Offset: 0x014 (R/W)  MPU Alias 1 Region Base Address Register       */
  volatile uint32_t RASR_A1;                 /*!< Offset: 0x018 (R/W)  MPU Alias 1 Region Attribute and Size Register */
  volatile uint32_t RBAR_A2;                 /*!< Offset: 0x01C (R/W)  MPU Alias 2 Region Base Address Register       */
  volatile uint32_t RASR_A2;                 /*!< Offset: 0x020 (R/W)  MPU Alias 2 Region Attribute and Size Register */
  volatile uint32_t RBAR_A3;                 /*!< Offset: 0x024 (R/W)  MPU Alias 3 Region Base Address Register       */
  volatile uint32_t RASR_A3;                 /*!< Offset: 0x028 (R/W)  MPU Alias 3 Region Attribute and Size Register */
} MPU_Type;

/* MPU Type Register */



/* MPU Control Register */



/* MPU Region Number Register */

/* MPU Region Base Address Register */



/* MPU Region Attribute and Size Register */










/*@} end of group CMSIS_MPU */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_FPU     Floating Point Unit (FPU)
    \brief      Type definitions for the Floating Point Unit (FPU)
  @{
 */

/** \brief  Structure type to access the Floating Point Unit (FPU).
 */
typedef struct
{
       uint32_t RESERVED0[1];
  volatile uint32_t FPCCR;                   /*!< Offset: 0x004 (R/W)  Floating-Point Context Control Register               */
  volatile uint32_t FPCAR;                   /*!< Offset: 0x008 (R/W)  Floating-Point Context Address Register               */
  volatile uint32_t FPDSCR;                  /*!< Offset: 0x00C (R/W)  Floating-Point Default Status Control Register        */
  volatile const  uint32_t MVFR0;                   /*!< Offset: 0x010 (R/ )  Media and FP Feature Register 0                       */
  volatile const  uint32_t MVFR1;                   /*!< Offset: 0x014 (R/ )  Media and FP Feature Register 1                       */
} FPU_Type;

/* Floating-Point Context Control Register */









/* Floating-Point Context Address Register */

/* Floating-Point Default Status Control Register */




/* Media and FP Feature Register 0 */








/* Media and FP Feature Register 1 */




/*@} end of group CMSIS_FPU */


/** \ingroup  CMSIS_core_register
    \defgroup CMSIS_CoreDebug       Core Debug Registers (CoreDebug)
    \brief      Type definitions for the Core Debug Registers
  @{
 */

/** \brief  Structure type to access the Core Debug Register (CoreDebug).
 */
typedef struct
{
  volatile uint32_t DHCSR;                   /*!< Offset: 0x000 (R/W)  Debug Halting Control and Status Register    */
  volatile  uint32_t DCRSR;                   /*!< Offset: 0x004 ( /W)  Debug Core Register Selector Register        */
  volatile uint32_t DCRDR;                   /*!< Offset: 0x008 (R/W)  Debug Core Register Data Register            */
  volatile uint32_t DEMCR;                   /*!< Offset: 0x00C (R/W)  Debug Exception and Monitor Control Register */
} CoreDebug_Type;

/* Debug Halting Control and Status Register */












/* Debug Core Register Selector Register */


/* Debug Exception and Monitor Control Register */













/*@} end of group CMSIS_CoreDebug */


/** \ingroup    CMSIS_core_register
    \defgroup   CMSIS_core_base     Core Definitions
    \brief      Definitions for base addresses, unions, and structures.
  @{
 */

/* Memory mapping of Cortex-M4 Hardware */




/*@} */



/*******************************************************************************
 *                Hardware Abstraction Layer
  Core Function Interface contains:
  - Core NVIC Functions
  - Core SysTick Functions
  - Core Debug Functions
  - Core Register Access Functions
 ******************************************************************************/
/** \defgroup CMSIS_Core_FunctionInterface Functions and Instructions Reference
*/



/* ##########################   NVIC functions  #################################### */
/** \ingroup  CMSIS_Core_FunctionInterface
    \defgroup CMSIS_Core_NVICFunctions NVIC Functions
    \brief      Functions that manage interrupts and exceptions via the NVIC.
    @{
 */

/** \brief  Set Priority Grouping

  The function sets the priority grouping field using the required unlock sequence.
  The parameter PriorityGroup is assigned to the field SCB->AIRCR [10:8] PRIGROUP field.
  Only values from 0..7 are used.
  In case of a conflict between priority grouping and available
  priority bits (__NVIC_PRIO_BITS), the smallest possible priority group is set.

    \param [in]      PriorityGroup  Priority grouping field.
 */
static inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);               /* only values 0..7 are used          */

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                   /* read old register configuration    */
  reg_value &= ~((0xFFFFUL << 16) | (7UL << 8));             /* clear bits to change               */
  reg_value  =  (reg_value                                 |
                ((uint32_t)0x5FA << 16) |
                (PriorityGroupTmp << 8));                                     /* Insert write key and priorty group */
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}


/** \brief  Get Priority Grouping

  The function reads the priority grouping field from the NVIC Interrupt Controller.

    \return                Priority grouping field (SCB->AIRCR [10:8] PRIGROUP field).
 */
static inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) >> 8);   /* read priority grouping field */
}


/** \brief  Enable External Interrupt

    The function enables a device-specific interrupt in the NVIC interrupt controller.

    \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
static inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
/*  NVIC->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  enable interrupt */
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F)); /* enable interrupt */
}


/** \brief  Disable External Interrupt

    The function disables a device-specific interrupt in the NVIC interrupt controller.

    \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
static inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* disable interrupt */
}


/** \brief  Get Pending Interrupt

    The function reads the pending register in the NVIC and returns the pending bit
    for the specified interrupt.

    \param [in]      IRQn  Interrupt number.

    \return             0  Interrupt status is not pending.
    \return             1  Interrupt status is pending.
 */
static inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if pending else 0 */
}


/** \brief  Set Pending Interrupt

    The function sets the pending bit of an external interrupt.

    \param [in]      IRQn  Interrupt number. Value cannot be negative.
 */
static inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* set interrupt pending */
}


/** \brief  Clear Pending Interrupt

    The function clears the pending bit of an external interrupt.

    \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
static inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* Clear pending interrupt */
}


/** \brief  Get Active Interrupt

    The function reads the active register in NVIC and returns the active bit.

    \param [in]      IRQn  Interrupt number.

    \return             0  Interrupt status is not active.
    \return             1  Interrupt status is active.
 */
static inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if active else 0 */
}


/** \brief  Set Interrupt Priority

    The function sets the priority of an interrupt.

    \note The priority cannot be set for every core interrupt.

    \param [in]      IRQn  Interrupt number.
    \param [in]  priority  Priority to set.
 */
static inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 3)) & 0xff); } /* set Priority for Cortex-M  System Interrupts */
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)] = ((priority << (8 - 3)) & 0xff);    }        /* set Priority for device specific Interrupts  */
}


/** \brief  Get Interrupt Priority

    The function reads the priority of an interrupt. The interrupt
    number can be positive to specify an external (device specific)
    interrupt, or negative to specify an internal (core) interrupt.


    \param [in]   IRQn  Interrupt number.
    \return             Interrupt Priority. Value is aligned automatically to the implemented
                        priority bits of the microcontroller.
 */
static inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 3)));  } /* get priority for Cortex-M  system interrupts */
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)]           >> (8 - 3)));  } /* get priority for device specific interrupts  */
}


/** \brief  Encode Priority

    The function encodes the priority for an interrupt with the given priority group,
    preemptive priority value, and subpriority value.
    In case of a conflict between priority grouping and available
    priority bits (__NVIC_PRIO_BITS), the smallest possible priority group is set.

    \param [in]     PriorityGroup  Used priority group.
    \param [in]   PreemptPriority  Preemptive priority value (starting from 0).
    \param [in]       SubPriority  Subpriority value (starting from 0).
    \return                        Encoded priority. Value can be used in the function \ref NVIC_SetPriority().
 */
static inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 3) ? 3 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 3) < 7) ? 0 : PriorityGroupTmp - 7 + 3;

  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}


/** \brief  Decode Priority

    The function decodes an interrupt priority value with a given priority group to
    preemptive priority value and subpriority value.
    In case of a conflict between priority grouping and available
    priority bits (__NVIC_PRIO_BITS) the smallest possible priority group is set.

    \param [in]         Priority   Priority value, which can be retrieved with the function \ref NVIC_GetPriority().
    \param [in]     PriorityGroup  Used priority group.
    \param [out] pPreemptPriority  Preemptive priority value (starting from 0).
    \param [out]     pSubPriority  Subpriority value (starting from 0).
 */
static inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 3) ? 3 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 3) < 7) ? 0 : PriorityGroupTmp - 7 + 3;

  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}


/** \brief  System Reset

    The function initiates a system reset request to reset the MCU.
 */
static inline void NVIC_SystemReset(void)
{
  __DSB();                                                     /* Ensure all outstanding memory accesses included
                                                                  buffered write are completed before reset */
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) |
                 (1UL << 2));                   /* Keep priority group unchanged */
  __DSB();                                                     /* Ensure completion of memory access */
  while(1);                                                    /* wait until reset */
}

/*@} end of CMSIS_Core_NVICFunctions */



/* ##################################    SysTick function  ############################################ */
/** \ingroup  CMSIS_Core_FunctionInterface
    \defgroup CMSIS_Core_SysTickFunctions SysTick Functions
    \brief      Functions that configure the System.
  @{
 */


/** \brief  System Tick Configuration

    The function initializes the System Timer and its interrupt, and starts the System Tick Timer.
    Counter is in free running mode to generate periodic interrupts.

    \param [in]  ticks  Number of ticks between two interrupts.

    \return          0  Function succeeded.
    \return          1  Function failed.

    \note     When the variable <b>__Vendor_SysTickConfig</b> is set to 1, then the
    function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
    must contain a vendor-specific implementation of this function.

 */
static inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1) > (0xFFFFFFUL << 0))  return (1);      /* Reload value impossible */

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = ticks - 1;                                  /* set reload register */
  NVIC_SetPriority (SysTick_IRQn, (1<<3) - 1);  /* set Priority for Systick Interrupt */
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                          /* Load the SysTick Counter Value */
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                    /* Enable SysTick IRQ and SysTick Timer */
  return (0);                                                  /* Function successful */
}


/*@} end of CMSIS_Core_SysTickFunctions */



/* ##################################### Debug In/Output function ########################################### */
/** \ingroup  CMSIS_Core_FunctionInterface
    \defgroup CMSIS_core_DebugFunctions ITM Functions
    \brief   Functions that access the ITM debug interface.
  @{
 */

extern volatile int32_t ITM_RxBuffer;                    /*!< External variable to receive characters.                         */


/** \brief  ITM Send Character

    The function transmits a character via the ITM channel 0, and
    \li Just returns when no debugger is connected that has booked the output.
    \li Is blocking when a debugger is connected, but the previous character sent has not been transmitted.

    \param [in]     ch  Character to transmit.

    \returns            Character to transmit.
 */
static inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL << 0))                  &&      /* ITM enabled */
      (((ITM_Type *) (0xE0000000UL) )->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000UL) )->PORT[0].u8 = (uint8_t) ch;
  }
  return (ch);
}


/** \brief  ITM Receive Character

    The function inputs a character via the external variable \ref ITM_RxBuffer.

    \return             Received character.
    \return         -1  No character pending.
 */
static inline int32_t ITM_ReceiveChar (void) {
  int32_t ch = -1;                           /* no character available */

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;       /* ready for next character */
  }

  return (ch);
}


/** \brief  ITM Check Character

    The function checks whether a character is pending for reading in the variable \ref ITM_RxBuffer.

    \return          0  No character available.
    \return          1  Character available.
 */
static inline int32_t ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                 /* no character available */
  } else {
    return (1);                                 /*    character available */
  }
}

/*@} end of CMSIS_core_DebugFunctions */






/***************************************************************************//**
 * @file system_ezr32wg.h
 * @brief CMSIS Cortex-M4 System Layer for EZR32WG devices.
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/



/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */


/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

/*******************************************************************************
 **************************   GLOBAL VARIABLES   *******************************
 ******************************************************************************/

extern uint32_t SystemCoreClock;    /**< System Clock Frequency (Core Clock) */

/*******************************************************************************
 *****************************   PROTOTYPES   **********************************
 ******************************************************************************/

/* Interrupt routines - prototypes */
void Reset_Handler(void);
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);
void DMA_IRQHandler(void);
void GPIO_EVEN_IRQHandler(void);
void TIMER0_IRQHandler(void);
void USARTRF_RX_IRQHandler(void);
void USARTRF_TX_IRQHandler(void);
void USB_IRQHandler(void);
void ACMP0_IRQHandler(void);
void ADC0_IRQHandler(void);
void DAC0_IRQHandler(void);
void I2C0_IRQHandler(void);
void I2C1_IRQHandler(void);
void GPIO_ODD_IRQHandler(void);
void TIMER1_IRQHandler(void);
void TIMER2_IRQHandler(void);
void TIMER3_IRQHandler(void);
void USART1_RX_IRQHandler(void);
void USART1_TX_IRQHandler(void);
void LESENSE_IRQHandler(void);
void USART2_RX_IRQHandler(void);
void USART2_TX_IRQHandler(void);
void UART0_RX_IRQHandler(void);
void UART0_TX_IRQHandler(void);
void UART1_RX_IRQHandler(void);
void UART1_TX_IRQHandler(void);
void LEUART0_IRQHandler(void);
void LEUART1_IRQHandler(void);
void LETIMER0_IRQHandler(void);
void PCNT0_IRQHandler(void);
void PCNT1_IRQHandler(void);
void PCNT2_IRQHandler(void);
void RTC_IRQHandler(void);
void BURTC_IRQHandler(void);
void CMU_IRQHandler(void);
void VCMP_IRQHandler(void);
void LCD_IRQHandler(void);
void MSC_IRQHandler(void);
void AES_IRQHandler(void);
void EMU_IRQHandler(void);
void FPUEH_IRQHandler(void);

uint32_t SystemCoreClockGet(void);
uint32_t SystemMaxCoreClockGet(void);

/**************************************************************************//**
 * @brief
 *   Update CMSIS SystemCoreClock variable.
 *
 * @details
 *   CMSIS defines a global variable SystemCoreClock that shall hold the
 *   core frequency in Hz. If the core frequency is dynamically changed, the
 *   variable must be kept updated in order to be CMSIS compliant.
 *
 *   Notice that if only changing core clock frequency through the emlib CMU
 *   API, this variable will be kept updated. This function is only provided
 *   for CMSIS compliance and if a user modifies the the core clock outside
 *   the CMU API.
 *****************************************************************************/
static inline void SystemCoreClockUpdate(void)
{
  SystemCoreClockGet();
}

void SystemInit(void);
uint32_t SystemHFClockGet(void);
uint32_t SystemHFXOClockGet(void);
void SystemHFXOClockSet(uint32_t freq);
uint32_t SystemLFRCOClockGet(void);
uint32_t SystemULFRCOClockGet(void);
uint32_t SystemLFXOClockGet(void);
void SystemLFXOClockSet(uint32_t freq);


/** @} End of group EZR32WG330F256R60_Part */

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_Peripheral_TypeDefs EZR32WG330F256R60 Peripheral TypeDefs
 * @{
 * @brief Device Specific Peripheral Register Structures
 *****************************************************************************/

/**************************************************************************//**
 * @file ezr32wg_dma_ch.h
 * @brief EZR32WG_DMA_CH register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief DMA_CH EZR32WG DMA CH
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL; /**< Channel Control Register  */
} DMA_CH_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_dma.h
 * @brief EZR32WG_DMA register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_DMA
 * @{
 * @brief EZR32WG_DMA Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile const uint32_t   STATUS;         /**< DMA Status Registers  */
  volatile uint32_t   CONFIG;         /**< DMA Configuration Register  */
  volatile uint32_t  CTRLBASE;       /**< Channel Control Data Base Pointer Register  */
  volatile const uint32_t   ALTCTRLBASE;    /**< Channel Alternate Control Data Base Pointer Register  */
  volatile const uint32_t   CHWAITSTATUS;   /**< Channel Wait on Request Status Register  */
  volatile uint32_t   CHSWREQ;        /**< Channel Software Request Register  */
  volatile uint32_t  CHUSEBURSTS;    /**< Channel Useburst Set Register  */
  volatile uint32_t   CHUSEBURSTC;    /**< Channel Useburst Clear Register  */
  volatile uint32_t  CHREQMASKS;     /**< Channel Request Mask Set Register  */
  volatile uint32_t   CHREQMASKC;     /**< Channel Request Mask Clear Register  */
  volatile uint32_t  CHENS;          /**< Channel Enable Set Register  */
  volatile uint32_t   CHENC;          /**< Channel Enable Clear Register  */
  volatile uint32_t  CHALTS;         /**< Channel Alternate Set Register  */
  volatile uint32_t   CHALTC;         /**< Channel Alternate Clear Register  */
  volatile uint32_t  CHPRIS;         /**< Channel Priority Set Register  */
  volatile uint32_t   CHPRIC;         /**< Channel Priority Clear Register  */
  uint32_t       RESERVED0[3];   /**< Reserved for future use **/
  volatile uint32_t  ERRORC;         /**< Bus Error Clear Register  */

  uint32_t       RESERVED1[880]; /**< Reserved for future use **/
  volatile const uint32_t   CHREQSTATUS;    /**< Channel Request Status  */
  uint32_t       RESERVED2[1];   /**< Reserved for future use **/
  volatile const uint32_t   CHSREQSTATUS;   /**< Channel Single Request Status  */

  uint32_t       RESERVED3[121]; /**< Reserved for future use **/
  volatile const uint32_t   IF;             /**< Interrupt Flag Register  */
  volatile uint32_t  IFS;            /**< Interrupt Flag Set Register  */
  volatile uint32_t  IFC;            /**< Interrupt Flag Clear Register  */
  volatile uint32_t  IEN;            /**< Interrupt Enable register  */
  volatile uint32_t  CTRL;           /**< DMA Control Register  */
  volatile uint32_t  RDS;            /**< DMA Retain Descriptor State  */

  uint32_t       RESERVED4[2];   /**< Reserved for future use **/
  volatile uint32_t  LOOP0;          /**< Channel 0 Loop Register  */
  volatile uint32_t  LOOP1;          /**< Channel 1 Loop Register  */
  uint32_t       RESERVED5[14];  /**< Reserved for future use **/
  volatile uint32_t  RECT0;          /**< Channel 0 Rectangle Register  */

  uint32_t       RESERVED6[39];  /**< Reserved registers */
  DMA_CH_TypeDef CH[12];         /**< Channel registers */
} DMA_TypeDef;                   /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_DMA_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for DMA STATUS */

/* Bit fields for DMA CONFIG */

/* Bit fields for DMA CTRLBASE */

/* Bit fields for DMA ALTCTRLBASE */

/* Bit fields for DMA CHWAITSTATUS */

/* Bit fields for DMA CHSWREQ */

/* Bit fields for DMA CHUSEBURSTS */

/* Bit fields for DMA CHUSEBURSTC */

/* Bit fields for DMA CHREQMASKS */

/* Bit fields for DMA CHREQMASKC */

/* Bit fields for DMA CHENS */

/* Bit fields for DMA CHENC */

/* Bit fields for DMA CHALTS */

/* Bit fields for DMA CHALTC */

/* Bit fields for DMA CHPRIS */

/* Bit fields for DMA CHPRIC */

/* Bit fields for DMA ERRORC */

/* Bit fields for DMA CHREQSTATUS */

/* Bit fields for DMA CHSREQSTATUS */

/* Bit fields for DMA IF */

/* Bit fields for DMA IFS */

/* Bit fields for DMA IFC */

/* Bit fields for DMA IEN */

/* Bit fields for DMA CTRL */

/* Bit fields for DMA RDS */

/* Bit fields for DMA LOOP0 */

/* Bit fields for DMA LOOP1 */

/* Bit fields for DMA RECT0 */

/* Bit fields for DMA CH_CTRL */

/** @} End of group EZR32WG_DMA */


/**************************************************************************//**
 * @file ezr32wg_aes.h
 * @brief EZR32WG_AES register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_AES
 * @{
 * @brief EZR32WG_AES Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Control Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t DATA;         /**< DATA Register  */
  volatile uint32_t XORDATA;      /**< XORDATA Register  */
  uint32_t      RESERVED0[3]; /**< Reserved for future use **/
  volatile uint32_t KEYLA;        /**< KEY Low Register  */
  volatile uint32_t KEYLB;        /**< KEY Low Register  */
  volatile uint32_t KEYLC;        /**< KEY Low Register  */
  volatile uint32_t KEYLD;        /**< KEY Low Register  */
  volatile uint32_t KEYHA;        /**< KEY High Register  */
  volatile uint32_t KEYHB;        /**< KEY High Register  */
  volatile uint32_t KEYHC;        /**< KEY High Register  */
  volatile uint32_t KEYHD;        /**< KEY High Register  */
} AES_TypeDef;                /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_AES_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for AES CTRL */

/* Bit fields for AES CMD */

/* Bit fields for AES STATUS */

/* Bit fields for AES IEN */

/* Bit fields for AES IF */

/* Bit fields for AES IFS */

/* Bit fields for AES IFC */

/* Bit fields for AES DATA */

/* Bit fields for AES XORDATA */

/* Bit fields for AES KEYLA */

/* Bit fields for AES KEYLB */

/* Bit fields for AES KEYLC */

/* Bit fields for AES KEYLD */

/* Bit fields for AES KEYHA */

/* Bit fields for AES KEYHB */

/* Bit fields for AES KEYHC */

/* Bit fields for AES KEYHD */

/** @} End of group EZR32WG_AES */


/**************************************************************************//**
 * @file ezr32wg_usb_hc.h
 * @brief EZR32WG_USB_HC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief USB_HC EZR32WG USB HC
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CHAR;         /**< Host Channel x Characteristics Register  */
  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t INT;          /**< Host Channel x Interrupt Register  */
  volatile uint32_t INTMSK;       /**< Host Channel x Interrupt Mask Register  */
  volatile uint32_t TSIZ;         /**< Host Channel x Transfer Size Register  */
  volatile uint32_t DMAADDR;      /**< Host Channel x DMA Address Register  */
  uint32_t      RESERVED1[2]; /**< Reserved future */
} USB_HC_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_usb_diep.h
 * @brief EZR32WG_USB_DIEP register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief USB_DIEP EZR32WG USB DIEP
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTL;          /**< Device IN Endpoint x+1 Control Register  */
  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t INT;          /**< Device IN Endpoint x+1 Interrupt Register  */
  uint32_t      RESERVED1[1]; /**< Reserved for future use **/
  volatile uint32_t TSIZ;         /**< Device IN Endpoint x+1 Transfer Size Register  */
  volatile uint32_t DMAADDR;      /**< Device IN Endpoint x+1 DMA Address Register  */
  volatile const uint32_t  TXFSTS;       /**< Device IN Endpoint x+1 Transmit FIFO Status Register  */
  uint32_t      RESERVED2[1]; /**< Reserved future */
} USB_DIEP_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_usb_doep.h
 * @brief EZR32WG_USB_DOEP register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief USB_DOEP EZR32WG USB DOEP
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTL;          /**< Device OUT Endpoint x+1 Control Register  */
  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t INT;          /**< Device OUT Endpoint x+1 Interrupt Register  */
  uint32_t      RESERVED1[1]; /**< Reserved for future use **/
  volatile uint32_t TSIZ;         /**< Device OUT Endpoint x+1 Transfer Size Register  */
  volatile uint32_t DMAADDR;      /**< Device OUT Endpoint x+1 DMA Address Register  */
  uint32_t      RESERVED2[2]; /**< Reserved future */
} USB_DOEP_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_usb.h
 * @brief EZR32WG_USB register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_USB
 * @{
 * @brief EZR32WG_USB Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t    CTRL;              /**< System Control Register  */
  volatile const uint32_t     STATUS;            /**< System Status Register  */
  volatile const uint32_t     IF;                /**< Interrupt Flag Register  */
  volatile uint32_t    IFS;               /**< Interrupt Flag Set Register  */
  volatile uint32_t    IFC;               /**< Interrupt Flag Clear Register  */
  volatile uint32_t    IEN;               /**< Interrupt Enable Register  */
  volatile uint32_t    ROUTE;             /**< I/O Routing Register  */

  uint32_t         RESERVED0[61433];  /**< Reserved for future use **/
  volatile uint32_t    GOTGCTL;           /**< OTG Control and Status Register  */
  volatile uint32_t    GOTGINT;           /**< OTG Interrupt Register  */
  volatile uint32_t    GAHBCFG;           /**< AHB Configuration Register  */
  volatile uint32_t    GUSBCFG;           /**< USB Configuration Register  */
  volatile uint32_t    GRSTCTL;           /**< Reset Register  */
  volatile uint32_t    GINTSTS;           /**< Interrupt Register  */
  volatile uint32_t    GINTMSK;           /**< Interrupt Mask Register  */
  volatile const uint32_t     GRXSTSR;           /**< Receive Status Debug Read Register  */
  volatile const uint32_t     GRXSTSP;           /**< Receive Status Read and Pop Register  */
  volatile uint32_t    GRXFSIZ;           /**< Receive FIFO Size Register  */
  volatile uint32_t    GNPTXFSIZ;         /**< Non-periodic Transmit FIFO Size Register  */
  volatile const uint32_t     GNPTXSTS;          /**< Non-periodic Transmit FIFO/Queue Status Register  */
  uint32_t         RESERVED1[11];     /**< Reserved for future use **/
  volatile uint32_t    GDFIFOCFG;         /**< Global DFIFO Configuration Register  */

  uint32_t         RESERVED2[40];     /**< Reserved for future use **/
  volatile uint32_t    HPTXFSIZ;          /**< Host Periodic Transmit FIFO Size Register  */
  volatile uint32_t    DIEPTXF1;          /**< Device IN Endpoint Transmit FIFO 1 Size Register  */
  volatile uint32_t    DIEPTXF2;          /**< Device IN Endpoint Transmit FIFO 2 Size Register  */
  volatile uint32_t    DIEPTXF3;          /**< Device IN Endpoint Transmit FIFO 3 Size Register  */
  volatile uint32_t    DIEPTXF4;          /**< Device IN Endpoint Transmit FIFO 4 Size Register  */
  volatile uint32_t    DIEPTXF5;          /**< Device IN Endpoint Transmit FIFO 5 Size Register  */
  volatile uint32_t    DIEPTXF6;          /**< Device IN Endpoint Transmit FIFO 6 Size Register  */

  uint32_t         RESERVED3[185];    /**< Reserved for future use **/
  volatile uint32_t    HCFG;              /**< Host Configuration Register  */
  volatile uint32_t    HFIR;              /**< Host Frame Interval Register  */
  volatile const uint32_t     HFNUM;             /**< Host Frame Number/Frame Time Remaining Register  */
  uint32_t         RESERVED4[1];      /**< Reserved for future use **/
  volatile const uint32_t     HPTXSTS;           /**< Host Periodic Transmit FIFO/Queue Status Register  */
  volatile const uint32_t     HAINT;             /**< Host All Channels Interrupt Register  */
  volatile uint32_t    HAINTMSK;          /**< Host All Channels Interrupt Mask Register  */
  uint32_t         RESERVED5[9];      /**< Reserved for future use **/
  volatile uint32_t    HPRT;              /**< Host Port Control and Status Register  */

  uint32_t         RESERVED6[47];     /**< Reserved registers */
  USB_HC_TypeDef   HC[14];            /**< Host Channel Registers */

  uint32_t         RESERVED7[80];     /**< Reserved for future use **/
  volatile uint32_t    DCFG;              /**< Device Configuration Register  */
  volatile uint32_t    DCTL;              /**< Device Control Register  */
  volatile const uint32_t     DSTS;              /**< Device Status Register  */
  uint32_t         RESERVED8[1];      /**< Reserved for future use **/
  volatile uint32_t    DIEPMSK;           /**< Device IN Endpoint Common Interrupt Mask Register  */
  volatile uint32_t    DOEPMSK;           /**< Device OUT Endpoint Common Interrupt Mask Register  */
  volatile const uint32_t     DAINT;             /**< Device All Endpoints Interrupt Register  */
  volatile uint32_t    DAINTMSK;          /**< Device All Endpoints Interrupt Mask Register  */
  uint32_t         RESERVED9[2];      /**< Reserved for future use **/
  volatile uint32_t    DVBUSDIS;          /**< Device VBUS Discharge Time Register  */
  volatile uint32_t    DVBUSPULSE;        /**< Device VBUS Pulsing Time Register  */

  uint32_t         RESERVED10[1];     /**< Reserved for future use **/
  volatile uint32_t    DIEPEMPMSK;        /**< Device IN Endpoint FIFO Empty Interrupt Mask Register  */

  uint32_t         RESERVED11[50];    /**< Reserved for future use **/
  volatile uint32_t    DIEP0CTL;          /**< Device IN Endpoint 0 Control Register  */
  uint32_t         RESERVED12[1];     /**< Reserved for future use **/
  volatile uint32_t    DIEP0INT;          /**< Device IN Endpoint 0 Interrupt Register  */
  uint32_t         RESERVED13[1];     /**< Reserved for future use **/
  volatile uint32_t    DIEP0TSIZ;         /**< Device IN Endpoint 0 Transfer Size Register  */
  volatile uint32_t    DIEP0DMAADDR;      /**< Device IN Endpoint 0 DMA Address Register  */
  volatile const uint32_t     DIEP0TXFSTS;       /**< Device IN Endpoint 0 Transmit FIFO Status Register  */

  uint32_t         RESERVED14[1];     /**< Reserved registers */
  USB_DIEP_TypeDef DIEP[6];           /**< Device IN Endpoint x+1 Registers */

  uint32_t         RESERVED15[72];    /**< Reserved for future use **/
  volatile uint32_t    DOEP0CTL;          /**< Device OUT Endpoint 0 Control Register  */
  uint32_t         RESERVED16[1];     /**< Reserved for future use **/
  volatile uint32_t    DOEP0INT;          /**< Device OUT Endpoint 0 Interrupt Register  */
  uint32_t         RESERVED17[1];     /**< Reserved for future use **/
  volatile uint32_t    DOEP0TSIZ;         /**< Device OUT Endpoint 0 Transfer Size Register  */
  volatile uint32_t    DOEP0DMAADDR;      /**< Device OUT Endpoint 0 DMA Address Register  */

  uint32_t         RESERVED18[2];     /**< Reserved registers */
  USB_DOEP_TypeDef DOEP[6];           /**< Device OUT Endpoint x+1 Registers */

  uint32_t         RESERVED19[136];   /**< Reserved for future use **/
  volatile uint32_t    PCGCCTL;           /**< Power and Clock Gating Control Register  */

  uint32_t         RESERVED20[127];   /**< Reserved registers */
  volatile uint32_t    FIFO0D[512];       /**< Device EP 0/Host Channel 0 FIFO  */

  uint32_t         RESERVED21[512];   /**< Reserved registers */
  volatile uint32_t    FIFO1D[512];       /**< Device EP 1/Host Channel 1 FIFO  */

  uint32_t         RESERVED22[512];   /**< Reserved registers */
  volatile uint32_t    FIFO2D[512];       /**< Device EP 2/Host Channel 2 FIFO  */

  uint32_t         RESERVED23[512];   /**< Reserved registers */
  volatile uint32_t    FIFO3D[512];       /**< Device EP 3/Host Channel 3 FIFO  */

  uint32_t         RESERVED24[512];   /**< Reserved registers */
  volatile uint32_t    FIFO4D[512];       /**< Device EP 4/Host Channel 4 FIFO  */

  uint32_t         RESERVED25[512];   /**< Reserved registers */
  volatile uint32_t    FIFO5D[512];       /**< Device EP 5/Host Channel 5 FIFO  */

  uint32_t         RESERVED26[512];   /**< Reserved registers */
  volatile uint32_t    FIFO6D[512];       /**< Device EP 6/Host Channel 6 FIFO  */

  uint32_t         RESERVED27[512];   /**< Reserved registers */
  volatile uint32_t    FIFO7D[512];       /**< Host Channel 7 FIFO  */

  uint32_t         RESERVED28[512];   /**< Reserved registers */
  volatile uint32_t    FIFO8D[512];       /**< Host Channel 8 FIFO  */

  uint32_t         RESERVED29[512];   /**< Reserved registers */
  volatile uint32_t    FIFO9D[512];       /**< Host Channel 9 FIFO  */

  uint32_t         RESERVED30[512];   /**< Reserved registers */
  volatile uint32_t    FIFO10D[512];      /**< Host Channel 10 FIFO  */

  uint32_t         RESERVED31[512];   /**< Reserved registers */
  volatile uint32_t    FIFO11D[512];      /**< Host Channel 11 FIFO  */

  uint32_t         RESERVED32[512];   /**< Reserved registers */
  volatile uint32_t    FIFO12D[512];      /**< Host Channel 12 FIFO  */

  uint32_t         RESERVED33[512];   /**< Reserved registers */
  volatile uint32_t    FIFO13D[512];      /**< Host Channel 13 FIFO  */

  uint32_t         RESERVED34[17920]; /**< Reserved registers */
  volatile uint32_t    FIFORAM[512];      /**< Direct Access to Data FIFO RAM for Debugging (2 KB)  */
} USB_TypeDef;                        /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_USB_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for USB CTRL */

/* Bit fields for USB STATUS */

/* Bit fields for USB IF */

/* Bit fields for USB IFS */

/* Bit fields for USB IFC */

/* Bit fields for USB IEN */

/* Bit fields for USB ROUTE */

/* Bit fields for USB GOTGCTL */

/* Bit fields for USB GOTGINT */

/* Bit fields for USB GAHBCFG */

/* Bit fields for USB GUSBCFG */

/* Bit fields for USB GRSTCTL */

/* Bit fields for USB GINTSTS */

/* Bit fields for USB GINTMSK */

/* Bit fields for USB GRXSTSR */

/* Bit fields for USB GRXSTSP */

/* Bit fields for USB GRXFSIZ */

/* Bit fields for USB GNPTXFSIZ */

/* Bit fields for USB GNPTXSTS */

/* Bit fields for USB GDFIFOCFG */

/* Bit fields for USB HPTXFSIZ */

/* Bit fields for USB DIEPTXF1 */

/* Bit fields for USB DIEPTXF2 */

/* Bit fields for USB DIEPTXF3 */

/* Bit fields for USB DIEPTXF4 */

/* Bit fields for USB DIEPTXF5 */

/* Bit fields for USB DIEPTXF6 */

/* Bit fields for USB HCFG */

/* Bit fields for USB HFIR */

/* Bit fields for USB HFNUM */

/* Bit fields for USB HPTXSTS */

/* Bit fields for USB HAINT */

/* Bit fields for USB HAINTMSK */

/* Bit fields for USB HPRT */

/* Bit fields for USB HC_CHAR */

/* Bit fields for USB HC_INT */

/* Bit fields for USB HC_INTMSK */

/* Bit fields for USB HC_TSIZ */

/* Bit fields for USB HC_DMAADDR */

/* Bit fields for USB DCFG */

/* Bit fields for USB DCTL */

/* Bit fields for USB DSTS */

/* Bit fields for USB DIEPMSK */

/* Bit fields for USB DOEPMSK */

/* Bit fields for USB DAINT */

/* Bit fields for USB DAINTMSK */

/* Bit fields for USB DVBUSDIS */

/* Bit fields for USB DVBUSPULSE */

/* Bit fields for USB DIEPEMPMSK */

/* Bit fields for USB DIEP0CTL */

/* Bit fields for USB DIEP0INT */

/* Bit fields for USB DIEP0TSIZ */

/* Bit fields for USB DIEP0DMAADDR */

/* Bit fields for USB DIEP0TXFSTS */

/* Bit fields for USB DIEP_CTL */

/* Bit fields for USB DIEP_INT */

/* Bit fields for USB DIEP_TSIZ */

/* Bit fields for USB DIEP_DMAADDR */

/* Bit fields for USB DIEP_TXFSTS */

/* Bit fields for USB DOEP0CTL */

/* Bit fields for USB DOEP0INT */

/* Bit fields for USB DOEP0TSIZ */

/* Bit fields for USB DOEP0DMAADDR */

/* Bit fields for USB DOEP_CTL */

/* Bit fields for USB DOEP_INT */

/* Bit fields for USB DOEP_TSIZ */

/* Bit fields for USB DOEP_DMAADDR */

/* Bit fields for USB PCGCCTL */

/* Bit fields for USB FIFO0D */

/* Bit fields for USB FIFO1D */

/* Bit fields for USB FIFO2D */

/* Bit fields for USB FIFO3D */

/* Bit fields for USB FIFO4D */

/* Bit fields for USB FIFO5D */

/* Bit fields for USB FIFO6D */

/* Bit fields for USB FIFO7D */

/* Bit fields for USB FIFO8D */

/* Bit fields for USB FIFO9D */

/* Bit fields for USB FIFO10D */

/* Bit fields for USB FIFO11D */

/* Bit fields for USB FIFO12D */

/* Bit fields for USB FIFO13D */

/* Bit fields for USB FIFORAM */

/** @} End of group EZR32WG_USB */


/**************************************************************************//**
 * @file ezr32wg_msc.h
 * @brief EZR32WG_MSC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_MSC
 * @{
 * @brief EZR32WG_MSC Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Memory System Control Register  */
  volatile uint32_t READCTRL;     /**< Read Control Register  */
  volatile uint32_t WRITECTRL;    /**< Write Control Register  */
  volatile uint32_t WRITECMD;     /**< Write Command Register  */
  volatile uint32_t ADDRB;        /**< Page Erase/Write Address Buffer  */

  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t WDATA;        /**< Write Data Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */

  uint32_t      RESERVED1[3]; /**< Reserved for future use **/
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile uint32_t LOCK;         /**< Configuration Lock Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile const uint32_t  CACHEHITS;    /**< Cache Hits Performance Counter  */
  volatile const uint32_t  CACHEMISSES;  /**< Cache Misses Performance Counter  */
  uint32_t      RESERVED2[1]; /**< Reserved for future use **/
  volatile uint32_t TIMEBASE;     /**< Flash Write and Erase Timebase  */
  volatile uint32_t MASSLOCK;     /**< Mass Erase Lock Register  */
} MSC_TypeDef;                /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_MSC_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for MSC CTRL */

/* Bit fields for MSC READCTRL */

/* Bit fields for MSC WRITECTRL */

/* Bit fields for MSC WRITECMD */

/* Bit fields for MSC ADDRB */

/* Bit fields for MSC WDATA */

/* Bit fields for MSC STATUS */

/* Bit fields for MSC IF */

/* Bit fields for MSC IFS */

/* Bit fields for MSC IFC */

/* Bit fields for MSC IEN */

/* Bit fields for MSC LOCK */

/* Bit fields for MSC CMD */

/* Bit fields for MSC CACHEHITS */

/* Bit fields for MSC CACHEMISSES */

/* Bit fields for MSC TIMEBASE */

/* Bit fields for MSC MASSLOCK */

/** @} End of group EZR32WG_MSC */


/**************************************************************************//**
 * @file ezr32wg_emu.h
 * @brief EZR32WG_EMU register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_EMU
 * @{
 * @brief EZR32WG_EMU Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;          /**< Control Register  */

  uint32_t      RESERVED0[1];  /**< Reserved for future use **/
  volatile uint32_t LOCK;          /**< Configuration Lock Register  */

  uint32_t      RESERVED1[6];  /**< Reserved for future use **/
  volatile uint32_t AUXCTRL;       /**< Auxiliary Control Register  */

  uint32_t      RESERVED2[1];  /**< Reserved for future use **/
  volatile uint32_t EM4CONF;       /**< Energy mode 4 configuration register  */
  volatile uint32_t BUCTRL;        /**< Backup Power configuration register  */
  volatile uint32_t PWRCONF;       /**< Power connection configuration register  */
  volatile uint32_t BUINACT;       /**< Backup mode inactive configuration register  */
  volatile uint32_t BUACT;         /**< Backup mode active configuration register  */
  volatile const uint32_t  STATUS;        /**< Status register  */
  volatile uint32_t ROUTE;         /**< I/O Routing Register  */
  volatile const uint32_t  IF;            /**< Interrupt Flag Register  */
  volatile uint32_t IFS;           /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;           /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;           /**< Interrupt Enable Register  */
  volatile uint32_t BUBODBUVINCAL; /**< BU_VIN Backup BOD calibration  */
  volatile uint32_t BUBODUNREGCAL; /**< Unregulated power Backup BOD calibration  */
} EMU_TypeDef;                 /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_EMU_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for EMU CTRL */

/* Bit fields for EMU LOCK */

/* Bit fields for EMU AUXCTRL */

/* Bit fields for EMU EM4CONF */

/* Bit fields for EMU BUCTRL */

/* Bit fields for EMU PWRCONF */

/* Bit fields for EMU BUINACT */

/* Bit fields for EMU BUACT */

/* Bit fields for EMU STATUS */

/* Bit fields for EMU ROUTE */

/* Bit fields for EMU IF */

/* Bit fields for EMU IFS */

/* Bit fields for EMU IFC */

/* Bit fields for EMU IEN */

/* Bit fields for EMU BUBODBUVINCAL */

/* Bit fields for EMU BUBODUNREGCAL */

/** @} End of group EZR32WG_EMU */


/**************************************************************************//**
 * @file ezr32wg_rmu.h
 * @brief EZR32WG_RMU register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_RMU
 * @{
 * @brief EZR32WG_RMU Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Control Register  */
  volatile const uint32_t  RSTCAUSE; /**< Reset Cause Register  */
  volatile uint32_t  CMD;      /**< Command Register  */
} RMU_TypeDef;            /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_RMU_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for RMU CTRL */

/* Bit fields for RMU RSTCAUSE */

/* Bit fields for RMU CMD */

/** @} End of group EZR32WG_RMU */


/**************************************************************************//**
 * @file ezr32wg_cmu.h
 * @brief EZR32WG_CMU register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_CMU
 * @{
 * @brief EZR32WG_CMU Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< CMU Control Register  */
  volatile uint32_t HFCORECLKDIV; /**< High Frequency Core Clock Division Register  */
  volatile uint32_t HFPERCLKDIV;  /**< High Frequency Peripheral Clock Division Register  */
  volatile uint32_t HFRCOCTRL;    /**< HFRCO Control Register  */
  volatile uint32_t LFRCOCTRL;    /**< LFRCO Control Register  */
  volatile uint32_t AUXHFRCOCTRL; /**< AUXHFRCO Control Register  */
  volatile uint32_t CALCTRL;      /**< Calibration Control Register  */
  volatile uint32_t CALCNT;       /**< Calibration Counter Register  */
  volatile uint32_t OSCENCMD;     /**< Oscillator Enable/Disable Command Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile uint32_t LFCLKSEL;     /**< Low Frequency Clock Select Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile uint32_t HFCORECLKEN0; /**< High Frequency Core Clock Enable Register 0  */
  volatile uint32_t HFPERCLKEN0;  /**< High Frequency Peripheral Clock Enable Register 0  */
  uint32_t      RESERVED0[2]; /**< Reserved for future use **/
  volatile const uint32_t  SYNCBUSY;     /**< Synchronization Busy Register  */
  volatile uint32_t FREEZE;       /**< Freeze Register  */
  volatile uint32_t LFACLKEN0;    /**< Low Frequency A Clock Enable Register 0  (Async Reg)  */
  uint32_t      RESERVED1[1]; /**< Reserved for future use **/
  volatile uint32_t LFBCLKEN0;    /**< Low Frequency B Clock Enable Register 0 (Async Reg)  */

  uint32_t      RESERVED2[1]; /**< Reserved for future use **/
  volatile uint32_t LFAPRESC0;    /**< Low Frequency A Prescaler Register 0 (Async Reg)  */
  uint32_t      RESERVED3[1]; /**< Reserved for future use **/
  volatile uint32_t LFBPRESC0;    /**< Low Frequency B Prescaler Register 0  (Async Reg)  */
  uint32_t      RESERVED4[1]; /**< Reserved for future use **/
  volatile uint32_t PCNTCTRL;     /**< PCNT Control Register  */

  uint32_t      RESERVED5[1]; /**< Reserved for future use **/
  volatile uint32_t ROUTE;        /**< I/O Routing Register  */
  volatile uint32_t LOCK;         /**< Configuration Lock Register  */
} CMU_TypeDef;                /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_CMU_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for CMU CTRL */

/* Bit fields for CMU HFCORECLKDIV */

/* Bit fields for CMU HFPERCLKDIV */

/* Bit fields for CMU HFRCOCTRL */

/* Bit fields for CMU LFRCOCTRL */

/* Bit fields for CMU AUXHFRCOCTRL */

/* Bit fields for CMU CALCTRL */

/* Bit fields for CMU CALCNT */

/* Bit fields for CMU OSCENCMD */

/* Bit fields for CMU CMD */

/* Bit fields for CMU LFCLKSEL */

/* Bit fields for CMU STATUS */

/* Bit fields for CMU IF */

/* Bit fields for CMU IFS */

/* Bit fields for CMU IFC */

/* Bit fields for CMU IEN */

/* Bit fields for CMU HFCORECLKEN0 */

/* Bit fields for CMU HFPERCLKEN0 */

/* Bit fields for CMU SYNCBUSY */

/* Bit fields for CMU FREEZE */

/* Bit fields for CMU LFACLKEN0 */

/* Bit fields for CMU LFBCLKEN0 */

/* Bit fields for CMU LFAPRESC0 */

/* Bit fields for CMU LFBPRESC0 */

/* Bit fields for CMU PCNTCTRL */

/* Bit fields for CMU ROUTE */

/* Bit fields for CMU LOCK */

/** @} End of group EZR32WG_CMU */


/**************************************************************************//**
 * @file ezr32wg_lesense_st.h
 * @brief EZR32WG_LESENSE_ST register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief LESENSE_ST EZR32WG LESENSE ST
 *****************************************************************************/
typedef struct
{
  volatile uint32_t TCONFA; /**< State transition configuration A  */
  volatile uint32_t TCONFB; /**< State transition configuration B  */
} LESENSE_ST_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_lesense_buf.h
 * @brief EZR32WG_LESENSE_BUF register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief LESENSE_BUF EZR32WG LESENSE BUF
 *****************************************************************************/
typedef struct
{
  volatile uint32_t DATA; /**< Scan results  */
} LESENSE_BUF_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_lesense_ch.h
 * @brief EZR32WG_LESENSE_CH register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief LESENSE_CH EZR32WG LESENSE CH
 *****************************************************************************/
typedef struct
{
  volatile uint32_t TIMING;       /**< Scan configuration  */
  volatile uint32_t INTERACT;     /**< Scan configuration  */
  volatile uint32_t EVAL;         /**< Scan configuration  */
  uint32_t      RESERVED0[1]; /**< Reserved future */
} LESENSE_CH_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_lesense.h
 * @brief EZR32WG_LESENSE register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_LESENSE
 * @{
 * @brief EZR32WG_LESENSE Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t       CTRL;           /**< Control Register  */
  volatile uint32_t       TIMCTRL;        /**< Timing Control Register  */
  volatile uint32_t       PERCTRL;        /**< Peripheral Control Register  */
  volatile uint32_t       DECCTRL;        /**< Decoder control Register  */
  volatile uint32_t       BIASCTRL;       /**< Bias Control Register  */
  volatile uint32_t       CMD;            /**< Command Register  */
  volatile uint32_t       CHEN;           /**< Channel enable Register  */
  volatile const uint32_t        SCANRES;        /**< Scan result register  */
  volatile const uint32_t        STATUS;         /**< Status Register  */
  volatile const uint32_t        PTR;            /**< Result buffer pointers  */
  volatile const uint32_t        BUFDATA;        /**< Result buffer data register  */
  volatile const uint32_t        CURCH;          /**< Current channel index  */
  volatile uint32_t       DECSTATE;       /**< Current decoder state  */
  volatile uint32_t       SENSORSTATE;    /**< Decoder input register  */
  volatile uint32_t       IDLECONF;       /**< GPIO Idle phase configuration  */
  volatile uint32_t       ALTEXCONF;      /**< Alternative excite pin configuration  */
  volatile const uint32_t        IF;             /**< Interrupt Flag Register  */
  volatile uint32_t       IFC;            /**< Interrupt Flag Clear Register  */
  volatile uint32_t       IFS;            /**< Interrupt Flag Set Register  */
  volatile uint32_t       IEN;            /**< Interrupt Enable Register  */
  volatile const uint32_t        SYNCBUSY;       /**< Synchronization Busy Register  */
  volatile uint32_t       ROUTE;          /**< I/O Routing Register  */
  volatile uint32_t       POWERDOWN;      /**< LESENSE RAM power-down register  */

  uint32_t            RESERVED0[105]; /**< Reserved registers */
  LESENSE_ST_TypeDef  ST[16];         /**< Decoding states */

  LESENSE_BUF_TypeDef BUF[16];        /**< Scanresult */

  LESENSE_CH_TypeDef  CH[16];         /**< Scanconfig */
} LESENSE_TypeDef;                    /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_LESENSE_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for LESENSE CTRL */

/* Bit fields for LESENSE TIMCTRL */

/* Bit fields for LESENSE PERCTRL */

/* Bit fields for LESENSE DECCTRL */

/* Bit fields for LESENSE BIASCTRL */

/* Bit fields for LESENSE CMD */

/* Bit fields for LESENSE CHEN */

/* Bit fields for LESENSE SCANRES */

/* Bit fields for LESENSE STATUS */

/* Bit fields for LESENSE PTR */

/* Bit fields for LESENSE BUFDATA */

/* Bit fields for LESENSE CURCH */

/* Bit fields for LESENSE DECSTATE */

/* Bit fields for LESENSE SENSORSTATE */

/* Bit fields for LESENSE IDLECONF */

/* Bit fields for LESENSE ALTEXCONF */

/* Bit fields for LESENSE IF */

/* Bit fields for LESENSE IFC */

/* Bit fields for LESENSE IFS */

/* Bit fields for LESENSE IEN */

/* Bit fields for LESENSE SYNCBUSY */

/* Bit fields for LESENSE ROUTE */

/* Bit fields for LESENSE POWERDOWN */

/* Bit fields for LESENSE ST_TCONFA */

/* Bit fields for LESENSE ST_TCONFB */

/* Bit fields for LESENSE BUF_DATA */

/* Bit fields for LESENSE CH_TIMING */

/* Bit fields for LESENSE CH_INTERACT */

/* Bit fields for LESENSE CH_EVAL */

/** @} End of group EZR32WG_LESENSE */


/**************************************************************************//**
 * @file ezr32wg_fpueh.h
 * @brief EZR32WG_FPUEH register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_FPUEH
 * @{
 * @brief EZR32WG_FPUEH Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile const uint32_t  IF;  /**< Interrupt Flag Register  */
  volatile uint32_t IFS; /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC; /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN; /**< Interrupt Enable Register  */
} FPUEH_TypeDef;     /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_FPUEH_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for FPUEH IF */

/* Bit fields for FPUEH IFS */

/* Bit fields for FPUEH IFC */

/* Bit fields for FPUEH IEN */

/** @} End of group EZR32WG_FPUEH */


/**************************************************************************//**
 * @file ezr32wg_usart.h
 * @brief EZR32WG_USART register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_USART
 * @{
 * @brief EZR32WG_USART Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;       /**< Control Register  */
  volatile uint32_t FRAME;      /**< USART Frame Format Register  */
  volatile uint32_t TRIGCTRL;   /**< USART Trigger Control register  */
  volatile uint32_t CMD;        /**< Command Register  */
  volatile const uint32_t  STATUS;     /**< USART Status Register  */
  volatile uint32_t CLKDIV;     /**< Clock Control Register  */
  volatile const uint32_t  RXDATAX;    /**< RX Buffer Data Extended Register  */
  volatile const uint32_t  RXDATA;     /**< RX Buffer Data Register  */
  volatile const uint32_t  RXDOUBLEX;  /**< RX Buffer Double Data Extended Register  */
  volatile const uint32_t  RXDOUBLE;   /**< RX FIFO Double Data Register  */
  volatile const uint32_t  RXDATAXP;   /**< RX Buffer Data Extended Peek Register  */
  volatile const uint32_t  RXDOUBLEXP; /**< RX Buffer Double Data Extended Peek Register  */
  volatile uint32_t TXDATAX;    /**< TX Buffer Data Extended Register  */
  volatile uint32_t TXDATA;     /**< TX Buffer Data Register  */
  volatile uint32_t TXDOUBLEX;  /**< TX Buffer Double Data Extended Register  */
  volatile uint32_t TXDOUBLE;   /**< TX Buffer Double Data Register  */
  volatile const uint32_t  IF;         /**< Interrupt Flag Register  */
  volatile uint32_t IFS;        /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;        /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;        /**< Interrupt Enable Register  */
  volatile uint32_t IRCTRL;     /**< IrDA Control Register  */
  volatile uint32_t ROUTE;      /**< I/O Routing Register  */
  volatile uint32_t INPUT;      /**< USART Input Register  */
  volatile uint32_t I2SCTRL;    /**< I2S Control Register  */
} USART_TypeDef;            /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_USART_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for USART CTRL */

/* Bit fields for USART FRAME */

/* Bit fields for USART TRIGCTRL */

/* Bit fields for USART CMD */

/* Bit fields for USART STATUS */

/* Bit fields for USART CLKDIV */

/* Bit fields for USART RXDATAX */

/* Bit fields for USART RXDATA */

/* Bit fields for USART RXDOUBLEX */

/* Bit fields for USART RXDOUBLE */

/* Bit fields for USART RXDATAXP */

/* Bit fields for USART RXDOUBLEXP */

/* Bit fields for USART TXDATAX */

/* Bit fields for USART TXDATA */

/* Bit fields for USART TXDOUBLEX */

/* Bit fields for USART TXDOUBLE */

/* Bit fields for USART IF */

/* Bit fields for USART IFS */

/* Bit fields for USART IFC */

/* Bit fields for USART IEN */

/* Bit fields for USART IRCTRL */

/* Bit fields for USART ROUTE */

/* Bit fields for USART INPUT */

/* Bit fields for USART I2SCTRL */

/** @} End of group EZR32WG_USART */


/**************************************************************************//**
 * @file ezr32wg_timer_cc.h
 * @brief EZR32WG_TIMER_CC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief TIMER_CC EZR32WG TIMER CC
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL; /**< CC Channel Control Register  */
  volatile uint32_t CCV;  /**< CC Channel Value Register  */
  volatile const uint32_t  CCVP; /**< CC Channel Value Peek Register  */
  volatile uint32_t CCVB; /**< CC Channel Buffer Register  */
} TIMER_CC_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_timer.h
 * @brief EZR32WG_TIMER register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_TIMER
 * @{
 * @brief EZR32WG_TIMER Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t    CTRL;         /**< Control Register  */
  volatile uint32_t    CMD;          /**< Command Register  */
  volatile const uint32_t     STATUS;       /**< Status Register  */
  volatile uint32_t    IEN;          /**< Interrupt Enable Register  */
  volatile const uint32_t     IF;           /**< Interrupt Flag Register  */
  volatile uint32_t    IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t    IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t    TOP;          /**< Counter Top Value Register  */
  volatile uint32_t    TOPB;         /**< Counter Top Value Buffer Register  */
  volatile uint32_t    CNT;          /**< Counter Value Register  */
  volatile uint32_t    ROUTE;        /**< I/O Routing Register  */

  uint32_t         RESERVED0[1]; /**< Reserved registers */
  TIMER_CC_TypeDef CC[3];        /**< Compare/Capture Channel */

  uint32_t         RESERVED1[4]; /**< Reserved for future use **/
  volatile uint32_t    DTCTRL;       /**< DTI Control Register  */
  volatile uint32_t    DTTIME;       /**< DTI Time Control Register  */
  volatile uint32_t    DTFC;         /**< DTI Fault Configuration Register  */
  volatile uint32_t    DTOGEN;       /**< DTI Output Generation Enable Register  */
  volatile const uint32_t     DTFAULT;      /**< DTI Fault Register  */
  volatile uint32_t     DTFAULTC;     /**< DTI Fault Clear Register  */
  volatile uint32_t    DTLOCK;       /**< DTI Configuration Lock Register  */
} TIMER_TypeDef;                 /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_TIMER_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for TIMER CTRL */

/* Bit fields for TIMER CMD */

/* Bit fields for TIMER STATUS */

/* Bit fields for TIMER IEN */

/* Bit fields for TIMER IF */

/* Bit fields for TIMER IFS */

/* Bit fields for TIMER IFC */

/* Bit fields for TIMER TOP */

/* Bit fields for TIMER TOPB */

/* Bit fields for TIMER CNT */

/* Bit fields for TIMER ROUTE */

/* Bit fields for TIMER CC_CTRL */

/* Bit fields for TIMER CC_CCV */

/* Bit fields for TIMER CC_CCVP */

/* Bit fields for TIMER CC_CCVB */

/* Bit fields for TIMER DTCTRL */

/* Bit fields for TIMER DTTIME */

/* Bit fields for TIMER DTFC */

/* Bit fields for TIMER DTOGEN */

/* Bit fields for TIMER DTFAULT */

/* Bit fields for TIMER DTFAULTC */

/* Bit fields for TIMER DTLOCK */

/** @} End of group EZR32WG_TIMER */


/**************************************************************************//**
 * @file ezr32wg_acmp.h
 * @brief EZR32WG_ACMP register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_ACMP
 * @{
 * @brief EZR32WG_ACMP Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Control Register  */
  volatile uint32_t INPUTSEL; /**< Input Selection Register  */
  volatile const uint32_t  STATUS;   /**< Status Register  */
  volatile uint32_t IEN;      /**< Interrupt Enable Register  */
  volatile const uint32_t  IF;       /**< Interrupt Flag Register  */
  volatile uint32_t IFS;      /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;      /**< Interrupt Flag Clear Register  */
  volatile uint32_t ROUTE;    /**< I/O Routing Register  */
} ACMP_TypeDef;           /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_ACMP_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for ACMP CTRL */

/* Bit fields for ACMP INPUTSEL */

/* Bit fields for ACMP STATUS */

/* Bit fields for ACMP IEN */

/* Bit fields for ACMP IF */

/* Bit fields for ACMP IFS */

/* Bit fields for ACMP IFC */

/* Bit fields for ACMP ROUTE */

/** @} End of group EZR32WG_ACMP */


/**************************************************************************//**
 * @file ezr32wg_leuart.h
 * @brief EZR32WG_LEUART register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_LEUART
 * @{
 * @brief EZR32WG_LEUART Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;          /**< Control Register  */
  volatile uint32_t CMD;           /**< Command Register  */
  volatile const uint32_t  STATUS;        /**< Status Register  */
  volatile uint32_t CLKDIV;        /**< Clock Control Register  */
  volatile uint32_t STARTFRAME;    /**< Start Frame Register  */
  volatile uint32_t SIGFRAME;      /**< Signal Frame Register  */
  volatile const uint32_t  RXDATAX;       /**< Receive Buffer Data Extended Register  */
  volatile const uint32_t  RXDATA;        /**< Receive Buffer Data Register  */
  volatile const uint32_t  RXDATAXP;      /**< Receive Buffer Data Extended Peek Register  */
  volatile uint32_t TXDATAX;       /**< Transmit Buffer Data Extended Register  */
  volatile uint32_t TXDATA;        /**< Transmit Buffer Data Register  */
  volatile const uint32_t  IF;            /**< Interrupt Flag Register  */
  volatile uint32_t IFS;           /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;           /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;           /**< Interrupt Enable Register  */
  volatile uint32_t PULSECTRL;     /**< Pulse Control Register  */

  volatile uint32_t FREEZE;        /**< Freeze Register  */
  volatile const uint32_t  SYNCBUSY;      /**< Synchronization Busy Register  */

  uint32_t      RESERVED0[3];  /**< Reserved for future use **/
  volatile uint32_t ROUTE;         /**< I/O Routing Register  */
  uint32_t      RESERVED1[21]; /**< Reserved for future use **/
  volatile uint32_t INPUT;         /**< LEUART Input Register  */
} LEUART_TypeDef;              /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_LEUART_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for LEUART CTRL */

/* Bit fields for LEUART CMD */

/* Bit fields for LEUART STATUS */

/* Bit fields for LEUART CLKDIV */

/* Bit fields for LEUART STARTFRAME */

/* Bit fields for LEUART SIGFRAME */

/* Bit fields for LEUART RXDATAX */

/* Bit fields for LEUART RXDATA */

/* Bit fields for LEUART RXDATAXP */

/* Bit fields for LEUART TXDATAX */

/* Bit fields for LEUART TXDATA */

/* Bit fields for LEUART IF */

/* Bit fields for LEUART IFS */

/* Bit fields for LEUART IFC */

/* Bit fields for LEUART IEN */

/* Bit fields for LEUART PULSECTRL */

/* Bit fields for LEUART FREEZE */

/* Bit fields for LEUART SYNCBUSY */

/* Bit fields for LEUART ROUTE */

/* Bit fields for LEUART INPUT */

/** @} End of group EZR32WG_LEUART */


/**************************************************************************//**
 * @file ezr32wg_rtc.h
 * @brief EZR32WG_RTC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_RTC
 * @{
 * @brief EZR32WG_RTC Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Control Register  */
  volatile uint32_t CNT;      /**< Counter Value Register  */
  volatile uint32_t COMP0;    /**< Compare Value Register 0  */
  volatile uint32_t COMP1;    /**< Compare Value Register 1  */
  volatile const uint32_t  IF;       /**< Interrupt Flag Register  */
  volatile uint32_t IFS;      /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;      /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;      /**< Interrupt Enable Register  */

  volatile uint32_t FREEZE;   /**< Freeze Register  */
  volatile const uint32_t  SYNCBUSY; /**< Synchronization Busy Register  */
} RTC_TypeDef;            /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_RTC_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for RTC CTRL */

/* Bit fields for RTC CNT */

/* Bit fields for RTC COMP0 */

/* Bit fields for RTC COMP1 */

/* Bit fields for RTC IF */

/* Bit fields for RTC IFS */

/* Bit fields for RTC IFC */

/* Bit fields for RTC IEN */

/* Bit fields for RTC FREEZE */

/* Bit fields for RTC SYNCBUSY */

/** @} End of group EZR32WG_RTC */


/**************************************************************************//**
 * @file ezr32wg_letimer.h
 * @brief EZR32WG_LETIMER register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_LETIMER
 * @{
 * @brief EZR32WG_LETIMER Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Control Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile uint32_t CNT;          /**< Counter Value Register  */
  volatile uint32_t COMP0;        /**< Compare Value Register 0  */
  volatile uint32_t COMP1;        /**< Compare Value Register 1  */
  volatile uint32_t REP0;         /**< Repeat Counter Register 0  */
  volatile uint32_t REP1;         /**< Repeat Counter Register 1  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */

  volatile uint32_t FREEZE;       /**< Freeze Register  */
  volatile const uint32_t  SYNCBUSY;     /**< Synchronization Busy Register  */

  uint32_t      RESERVED0[2]; /**< Reserved for future use **/
  volatile uint32_t ROUTE;        /**< I/O Routing Register  */
} LETIMER_TypeDef;            /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_LETIMER_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for LETIMER CTRL */

/* Bit fields for LETIMER CMD */

/* Bit fields for LETIMER STATUS */

/* Bit fields for LETIMER CNT */

/* Bit fields for LETIMER COMP0 */

/* Bit fields for LETIMER COMP1 */

/* Bit fields for LETIMER REP0 */

/* Bit fields for LETIMER REP1 */

/* Bit fields for LETIMER IF */

/* Bit fields for LETIMER IFS */

/* Bit fields for LETIMER IFC */

/* Bit fields for LETIMER IEN */

/* Bit fields for LETIMER FREEZE */

/* Bit fields for LETIMER SYNCBUSY */

/* Bit fields for LETIMER ROUTE */

/** @} End of group EZR32WG_LETIMER */


/**************************************************************************//**
 * @file ezr32wg_pcnt.h
 * @brief EZR32WG_PCNT register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_PCNT
 * @{
 * @brief EZR32WG_PCNT Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Control Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile const uint32_t  CNT;          /**< Counter Value Register  */
  volatile const uint32_t  TOP;          /**< Top Value Register  */
  volatile uint32_t TOPB;         /**< Top Value Buffer Register  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile uint32_t ROUTE;        /**< I/O Routing Register  */

  volatile uint32_t FREEZE;       /**< Freeze Register  */
  volatile const uint32_t  SYNCBUSY;     /**< Synchronization Busy Register  */

  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t AUXCNT;       /**< Auxiliary Counter Value Register  */
  volatile uint32_t INPUT;        /**< PCNT Input Register  */
} PCNT_TypeDef;               /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_PCNT_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for PCNT CTRL */

/* Bit fields for PCNT CMD */

/* Bit fields for PCNT STATUS */

/* Bit fields for PCNT CNT */

/* Bit fields for PCNT TOP */

/* Bit fields for PCNT TOPB */

/* Bit fields for PCNT IF */

/* Bit fields for PCNT IFS */

/* Bit fields for PCNT IFC */

/* Bit fields for PCNT IEN */

/* Bit fields for PCNT ROUTE */

/* Bit fields for PCNT FREEZE */

/* Bit fields for PCNT SYNCBUSY */

/* Bit fields for PCNT AUXCNT */

/* Bit fields for PCNT INPUT */

/** @} End of group EZR32WG_PCNT */


/**************************************************************************//**
 * @file ezr32wg_i2c.h
 * @brief EZR32WG_I2C register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_I2C
 * @{
 * @brief EZR32WG_I2C Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;      /**< Control Register  */
  volatile uint32_t CMD;       /**< Command Register  */
  volatile const uint32_t  STATE;     /**< State Register  */
  volatile const uint32_t  STATUS;    /**< Status Register  */
  volatile uint32_t CLKDIV;    /**< Clock Division Register  */
  volatile uint32_t SADDR;     /**< Slave Address Register  */
  volatile uint32_t SADDRMASK; /**< Slave Address Mask Register  */
  volatile const uint32_t  RXDATA;    /**< Receive Buffer Data Register  */
  volatile const uint32_t  RXDATAP;   /**< Receive Buffer Data Peek Register  */
  volatile uint32_t TXDATA;    /**< Transmit Buffer Data Register  */
  volatile const uint32_t  IF;        /**< Interrupt Flag Register  */
  volatile uint32_t IFS;       /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;       /**< Interrupt Flag Clear Register  */
  volatile uint32_t IEN;       /**< Interrupt Enable Register  */
  volatile uint32_t ROUTE;     /**< I/O Routing Register  */
} I2C_TypeDef;             /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_I2C_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for I2C CTRL */

/* Bit fields for I2C CMD */

/* Bit fields for I2C STATE */

/* Bit fields for I2C STATUS */

/* Bit fields for I2C CLKDIV */

/* Bit fields for I2C SADDR */

/* Bit fields for I2C SADDRMASK */

/* Bit fields for I2C RXDATA */

/* Bit fields for I2C RXDATAP */

/* Bit fields for I2C TXDATA */

/* Bit fields for I2C IF */

/* Bit fields for I2C IFS */

/* Bit fields for I2C IFC */

/* Bit fields for I2C IEN */

/* Bit fields for I2C ROUTE */

/** @} End of group EZR32WG_I2C */


/**************************************************************************//**
 * @file ezr32wg_gpio_p.h
 * @brief EZR32WG_GPIO_P register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief GPIO_P EZR32WG GPIO P
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Port Control Register  */
  volatile uint32_t MODEL;    /**< Port Pin Mode Low Register  */
  volatile uint32_t MODEH;    /**< Port Pin Mode High Register  */
  volatile uint32_t DOUT;     /**< Port Data Out Register  */
  volatile uint32_t  DOUTSET;  /**< Port Data Out Set Register  */
  volatile uint32_t  DOUTCLR;  /**< Port Data Out Clear Register  */
  volatile uint32_t  DOUTTGL;  /**< Port Data Out Toggle Register  */
  volatile const uint32_t  DIN;      /**< Port Data In Register  */
  volatile uint32_t PINLOCKN; /**< Port Unlocked Pins Register  */
} GPIO_P_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_gpio.h
 * @brief EZR32WG_GPIO register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_GPIO
 * @{
 * @brief EZR32WG_GPIO Register Declaration
 *****************************************************************************/
typedef struct
{
  GPIO_P_TypeDef P[6];          /**< Port configuration bits */

  uint32_t       RESERVED0[10]; /**< Reserved for future use **/
  volatile uint32_t  EXTIPSELL;     /**< External Interrupt Port Select Low Register  */
  volatile uint32_t  EXTIPSELH;     /**< External Interrupt Port Select High Register  */
  volatile uint32_t  EXTIRISE;      /**< External Interrupt Rising Edge Trigger Register  */
  volatile uint32_t  EXTIFALL;      /**< External Interrupt Falling Edge Trigger Register  */
  volatile uint32_t  IEN;           /**< Interrupt Enable Register  */
  volatile const uint32_t   IF;            /**< Interrupt Flag Register  */
  volatile uint32_t  IFS;           /**< Interrupt Flag Set Register  */
  volatile uint32_t  IFC;           /**< Interrupt Flag Clear Register  */

  volatile uint32_t  ROUTE;         /**< I/O Routing Register  */
  volatile uint32_t  INSENSE;       /**< Input Sense Register  */
  volatile uint32_t  LOCK;          /**< Configuration Lock Register  */
  volatile uint32_t  CTRL;          /**< GPIO Control Register  */
  volatile uint32_t  CMD;           /**< GPIO Command Register  */
  volatile uint32_t  EM4WUEN;       /**< EM4 Wake-up Enable Register  */
  volatile uint32_t  EM4WUPOL;      /**< EM4 Wake-up Polarity Register  */
  volatile const uint32_t   EM4WUCAUSE;    /**< EM4 Wake-up Cause Register  */
} GPIO_TypeDef;                 /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_GPIO_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for GPIO P_CTRL */

/* Bit fields for GPIO P_MODEL */

/* Bit fields for GPIO P_MODEH */

/* Bit fields for GPIO P_DOUT */

/* Bit fields for GPIO P_DOUTSET */

/* Bit fields for GPIO P_DOUTCLR */

/* Bit fields for GPIO P_DOUTTGL */

/* Bit fields for GPIO P_DIN */

/* Bit fields for GPIO P_PINLOCKN */

/* Bit fields for GPIO EXTIPSELL */

/* Bit fields for GPIO EXTIPSELH */

/* Bit fields for GPIO EXTIRISE */

/* Bit fields for GPIO EXTIFALL */

/* Bit fields for GPIO IEN */

/* Bit fields for GPIO IF */

/* Bit fields for GPIO IFS */

/* Bit fields for GPIO IFC */

/* Bit fields for GPIO ROUTE */

/* Bit fields for GPIO INSENSE */

/* Bit fields for GPIO LOCK */

/* Bit fields for GPIO CTRL */

/* Bit fields for GPIO CMD */

/* Bit fields for GPIO EM4WUEN */

/* Bit fields for GPIO EM4WUPOL */

/* Bit fields for GPIO EM4WUCAUSE */

/** @} End of group EZR32WG_GPIO */


/**************************************************************************//**
 * @file ezr32wg_vcmp.h
 * @brief EZR32WG_VCMP register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_VCMP
 * @{
 * @brief EZR32WG_VCMP Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Control Register  */
  volatile uint32_t INPUTSEL; /**< Input Selection Register  */
  volatile const uint32_t  STATUS;   /**< Status Register  */
  volatile uint32_t IEN;      /**< Interrupt Enable Register  */
  volatile const uint32_t  IF;       /**< Interrupt Flag Register  */
  volatile uint32_t IFS;      /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;      /**< Interrupt Flag Clear Register  */
} VCMP_TypeDef;           /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_VCMP_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for VCMP CTRL */

/* Bit fields for VCMP INPUTSEL */

/* Bit fields for VCMP STATUS */

/* Bit fields for VCMP IEN */

/* Bit fields for VCMP IF */

/* Bit fields for VCMP IFS */

/* Bit fields for VCMP IFC */

/** @} End of group EZR32WG_VCMP */


/**************************************************************************//**
 * @file ezr32wg_prs_ch.h
 * @brief EZR32WG_PRS_CH register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief PRS_CH EZR32WG PRS CH
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL; /**< Channel Control Register  */
} PRS_CH_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_prs.h
 * @brief EZR32WG_PRS register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_PRS
 * @{
 * @brief EZR32WG_PRS Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t  SWPULSE;      /**< Software Pulse Register  */
  volatile uint32_t  SWLEVEL;      /**< Software Level Register  */
  volatile uint32_t  ROUTE;        /**< I/O Routing Register  */

  uint32_t       RESERVED0[1]; /**< Reserved registers */
  PRS_CH_TypeDef CH[12];       /**< Channel registers */
} PRS_TypeDef;                 /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_PRS_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for PRS SWPULSE */

/* Bit fields for PRS SWLEVEL */

/* Bit fields for PRS ROUTE */

/* Bit fields for PRS CH_CTRL */

/** @} End of group EZR32WG_PRS */


/**************************************************************************//**
 * @file ezr32wg_adc.h
 * @brief EZR32WG_ADC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_ADC
 * @{
 * @brief EZR32WG_ADC Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Control Register  */
  volatile uint32_t CMD;          /**< Command Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile uint32_t SINGLECTRL;   /**< Single Sample Control Register  */
  volatile uint32_t SCANCTRL;     /**< Scan Control Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile const uint32_t  SINGLEDATA;   /**< Single Conversion Result Data  */
  volatile const uint32_t  SCANDATA;     /**< Scan Conversion Result Data  */
  volatile const uint32_t  SINGLEDATAP;  /**< Single Conversion Result Data Peek Register  */
  volatile const uint32_t  SCANDATAP;    /**< Scan Sequence Result Data Peek Register  */
  volatile uint32_t CAL;          /**< Calibration Register  */

  uint32_t      RESERVED0[1]; /**< Reserved for future use **/
  volatile uint32_t BIASPROG;     /**< Bias Programming Register  */
} ADC_TypeDef;                /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_ADC_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for ADC CTRL */

/* Bit fields for ADC CMD */

/* Bit fields for ADC STATUS */

/* Bit fields for ADC SINGLECTRL */

/* Bit fields for ADC SCANCTRL */

/* Bit fields for ADC IEN */

/* Bit fields for ADC IF */

/* Bit fields for ADC IFS */

/* Bit fields for ADC IFC */

/* Bit fields for ADC SINGLEDATA */

/* Bit fields for ADC SCANDATA */

/* Bit fields for ADC SINGLEDATAP */

/* Bit fields for ADC SCANDATAP */

/* Bit fields for ADC CAL */

/* Bit fields for ADC BIASPROG */

/** @} End of group EZR32WG_ADC */


/**************************************************************************//**
 * @file ezr32wg_dac.h
 * @brief EZR32WG_DAC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_DAC
 * @{
 * @brief EZR32WG_DAC Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;         /**< Control Register  */
  volatile const uint32_t  STATUS;       /**< Status Register  */
  volatile uint32_t CH0CTRL;      /**< Channel 0 Control Register  */
  volatile uint32_t CH1CTRL;      /**< Channel 1 Control Register  */
  volatile uint32_t IEN;          /**< Interrupt Enable Register  */
  volatile const uint32_t  IF;           /**< Interrupt Flag Register  */
  volatile uint32_t IFS;          /**< Interrupt Flag Set Register  */
  volatile uint32_t IFC;          /**< Interrupt Flag Clear Register  */
  volatile uint32_t CH0DATA;      /**< Channel 0 Data Register  */
  volatile uint32_t CH1DATA;      /**< Channel 1 Data Register  */
  volatile uint32_t COMBDATA;     /**< Combined Data Register  */
  volatile uint32_t CAL;          /**< Calibration Register  */
  volatile uint32_t BIASPROG;     /**< Bias Programming Register  */
  uint32_t      RESERVED0[8]; /**< Reserved for future use **/
  volatile uint32_t OPACTRL;      /**< Operational Amplifier Control Register  */
  volatile uint32_t OPAOFFSET;    /**< Operational Amplifier Offset Register  */
  volatile uint32_t OPA0MUX;      /**< Operational Amplifier Mux Configuration Register  */
  volatile uint32_t OPA1MUX;      /**< Operational Amplifier Mux Configuration Register  */
  volatile uint32_t OPA2MUX;      /**< Operational Amplifier Mux Configuration Register  */
} DAC_TypeDef;                /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_DAC_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for DAC CTRL */

/* Bit fields for DAC STATUS */

/* Bit fields for DAC CH0CTRL */

/* Bit fields for DAC CH1CTRL */

/* Bit fields for DAC IEN */

/* Bit fields for DAC IF */

/* Bit fields for DAC IFS */

/* Bit fields for DAC IFC */

/* Bit fields for DAC CH0DATA */

/* Bit fields for DAC CH1DATA */

/* Bit fields for DAC COMBDATA */

/* Bit fields for DAC CAL */

/* Bit fields for DAC BIASPROG */

/* Bit fields for DAC OPACTRL */

/* Bit fields for DAC OPAOFFSET */

/* Bit fields for DAC OPA0MUX */

/* Bit fields for DAC OPA1MUX */

/* Bit fields for DAC OPA2MUX */

/** @} End of group EZR32WG_DAC */


/**************************************************************************//**
 * @file ezr32wg_burtc_ret.h
 * @brief EZR32WG_BURTC_RET register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @brief BURTC_RET EZR32WG BURTC RET
 *****************************************************************************/
typedef struct
{
  volatile uint32_t REG; /**< Retention Register  */
} BURTC_RET_TypeDef;

/**************************************************************************//**
 * @file ezr32wg_burtc.h
 * @brief EZR32WG_BURTC register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_BURTC
 * @{
 * @brief EZR32WG_BURTC Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t     CTRL;          /**< Control Register  */
  volatile uint32_t     LPMODE;        /**< Low power mode configuration  */
  volatile const uint32_t      CNT;           /**< Counter Value Register  */
  volatile uint32_t     COMP0;         /**< Counter Compare Value  */
  volatile const uint32_t      TIMESTAMP;     /**< Backup mode timestamp  */
  volatile uint32_t     LFXOFDET;      /**< LFXO   */
  volatile const uint32_t      STATUS;        /**< Status Register  */
  volatile uint32_t     CMD;           /**< Command Register  */
  volatile uint32_t     POWERDOWN;     /**< Retention RAM power-down Register  */
  volatile uint32_t     LOCK;          /**< Configuration Lock Register  */
  volatile const uint32_t      IF;            /**< Interrupt Flag Register  */
  volatile uint32_t     IFS;           /**< Interrupt Flag Set Register  */
  volatile uint32_t     IFC;           /**< Interrupt Flag Clear Register  */
  volatile uint32_t     IEN;           /**< Interrupt Enable Register  */

  volatile uint32_t     FREEZE;        /**< Freeze Register  */
  volatile const uint32_t      SYNCBUSY;      /**< Synchronization Busy Register  */

  uint32_t          RESERVED0[48]; /**< Reserved registers */
  BURTC_RET_TypeDef RET[128];      /**< RetentionReg */
} BURTC_TypeDef;                   /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_BURTC_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for BURTC CTRL */

/* Bit fields for BURTC LPMODE */

/* Bit fields for BURTC CNT */

/* Bit fields for BURTC COMP0 */

/* Bit fields for BURTC TIMESTAMP */

/* Bit fields for BURTC LFXOFDET */

/* Bit fields for BURTC STATUS */

/* Bit fields for BURTC CMD */

/* Bit fields for BURTC POWERDOWN */

/* Bit fields for BURTC LOCK */

/* Bit fields for BURTC IF */

/* Bit fields for BURTC IFS */

/* Bit fields for BURTC IFC */

/* Bit fields for BURTC IEN */

/* Bit fields for BURTC FREEZE */

/* Bit fields for BURTC SYNCBUSY */

/* Bit fields for BURTC RET_REG */

/** @} End of group EZR32WG_BURTC */


/**************************************************************************//**
 * @file ezr32wg_wdog.h
 * @brief EZR32WG_WDOG register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_WDOG
 * @{
 * @brief EZR32WG_WDOG Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t CTRL;     /**< Control Register  */
  volatile uint32_t CMD;      /**< Command Register  */

  volatile const uint32_t  SYNCBUSY; /**< Synchronization Busy Register  */
} WDOG_TypeDef;           /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_WDOG_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for WDOG CTRL */

/* Bit fields for WDOG CMD */

/* Bit fields for WDOG SYNCBUSY */

/** @} End of group EZR32WG_WDOG */


/**************************************************************************//**
 * @file ezr32wg_etm.h
 * @brief EZR32WG_ETM register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_ETM
 * @{
 * @brief EZR32WG_ETM Register Declaration
 *****************************************************************************/
typedef struct
{
  volatile uint32_t ETMCR;           /**< Main Control Register  */
  volatile const uint32_t  ETMCCR;          /**< Configuration Code Register  */
  volatile uint32_t ETMTRIGGER;      /**< ETM Trigger Event Register  */
  uint32_t      RESERVED0[1];    /**< Reserved for future use **/
  volatile uint32_t ETMSR;           /**< ETM Status Register  */
  volatile const uint32_t  ETMSCR;          /**< ETM System Configuration Register  */
  uint32_t      RESERVED1[2];    /**< Reserved for future use **/
  volatile uint32_t ETMTEEVR;        /**< ETM TraceEnable Event Register  */
  volatile uint32_t ETMTECR1;        /**< ETM Trace control Register  */
  uint32_t      RESERVED2[1];    /**< Reserved for future use **/
  volatile uint32_t ETMFFLR;         /**< ETM Fifo Full Level Register  */
  uint32_t      RESERVED3[68];   /**< Reserved for future use **/
  volatile uint32_t ETMCNTRLDVR1;    /**< Counter Reload Value  */
  uint32_t      RESERVED4[39];   /**< Reserved for future use **/
  volatile uint32_t ETMSYNCFR;       /**< Synchronisation Frequency Register  */
  volatile const uint32_t  ETMIDR;          /**< ID Register  */
  volatile const uint32_t  ETMCCER;         /**< Configuration Code Extension Register  */
  uint32_t      RESERVED5[1];    /**< Reserved for future use **/
  volatile uint32_t ETMTESSEICR;     /**< TraceEnable Start/Stop EmbeddedICE Control Register  */
  uint32_t      RESERVED6[1];    /**< Reserved for future use **/
  volatile uint32_t ETMTSEVR;        /**< Timestamp Event Register  */
  uint32_t      RESERVED7[1];    /**< Reserved for future use **/
  volatile uint32_t ETMTRACEIDR;     /**< CoreSight Trace ID Register  */
  uint32_t      RESERVED8[1];    /**< Reserved for future use **/
  volatile const uint32_t  ETMIDR2;         /**< ETM ID Register 2  */
  uint32_t      RESERVED9[66];   /**< Reserved for future use **/
  volatile const uint32_t  ETMPDSR;         /**< Device Power-down Status Register  */
  uint32_t      RESERVED10[754]; /**< Reserved for future use **/
  volatile uint32_t ETMISCIN;        /**< Integration Test Miscellaneous Inputs Register  */
  uint32_t      RESERVED11[1];   /**< Reserved for future use **/
  volatile uint32_t  ITTRIGOUT;       /**< Integration Test Trigger Out Register  */
  uint32_t      RESERVED12[1];   /**< Reserved for future use **/
  volatile const uint32_t  ETMITATBCTR2;    /**< ETM Integration Test ATB Control 2 Register  */
  uint32_t      RESERVED13[1];   /**< Reserved for future use **/
  volatile uint32_t  ETMITATBCTR0;    /**< ETM Integration Test ATB Control 0 Register  */
  uint32_t      RESERVED14[1];   /**< Reserved for future use **/
  volatile uint32_t ETMITCTRL;       /**< ETM Integration Control Register  */
  uint32_t      RESERVED15[39];  /**< Reserved for future use **/
  volatile uint32_t ETMCLAIMSET;     /**< ETM Claim Tag Set Register  */
  volatile uint32_t ETMCLAIMCLR;     /**< ETM Claim Tag Clear Register  */
  uint32_t      RESERVED16[2];   /**< Reserved for future use **/
  volatile uint32_t ETMLAR;          /**< ETM Lock Access Register  */
  volatile const uint32_t  ETMLSR;          /**< Lock Status Register  */
  volatile const uint32_t  ETMAUTHSTATUS;   /**< ETM Authentication Status Register  */
  uint32_t      RESERVED17[4];   /**< Reserved for future use **/
  volatile const uint32_t  ETMDEVTYPE;      /**< CoreSight Device Type Register  */
  volatile const uint32_t  ETMPIDR4;        /**< Peripheral ID4 Register  */
  volatile uint32_t  ETMPIDR5;        /**< Peripheral ID5 Register  */
  volatile uint32_t  ETMPIDR6;        /**< Peripheral ID6 Register  */
  volatile uint32_t  ETMPIDR7;        /**< Peripheral ID7 Register  */
  volatile const uint32_t  ETMPIDR0;        /**< Peripheral ID0 Register  */
  volatile const uint32_t  ETMPIDR1;        /**< Peripheral ID1 Register  */
  volatile const uint32_t  ETMPIDR2;        /**< Peripheral ID2 Register  */
  volatile const uint32_t  ETMPIDR3;        /**< Peripheral ID3 Register  */
  volatile const uint32_t  ETMCIDR0;        /**< Component ID0 Register  */
  volatile const uint32_t  ETMCIDR1;        /**< Component ID1 Register  */
  volatile const uint32_t  ETMCIDR2;        /**< Component ID2 Register  */
  volatile const uint32_t  ETMCIDR3;        /**< Component ID3 Register  */
} ETM_TypeDef;                   /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_ETM_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for ETM ETMCR */

/* Bit fields for ETM ETMCCR */

/* Bit fields for ETM ETMTRIGGER */

/* Bit fields for ETM ETMSR */

/* Bit fields for ETM ETMSCR */

/* Bit fields for ETM ETMTEEVR */

/* Bit fields for ETM ETMTECR1 */

/* Bit fields for ETM ETMFFLR */

/* Bit fields for ETM ETMCNTRLDVR1 */

/* Bit fields for ETM ETMSYNCFR */

/* Bit fields for ETM ETMIDR */

/* Bit fields for ETM ETMCCER */

/* Bit fields for ETM ETMTESSEICR */

/* Bit fields for ETM ETMTSEVR */

/* Bit fields for ETM ETMTRACEIDR */

/* Bit fields for ETM ETMIDR2 */

/* Bit fields for ETM ETMPDSR */

/* Bit fields for ETM ETMISCIN */

/* Bit fields for ETM ITTRIGOUT */

/* Bit fields for ETM ETMITATBCTR2 */

/* Bit fields for ETM ETMITATBCTR0 */

/* Bit fields for ETM ETMITCTRL */

/* Bit fields for ETM ETMCLAIMSET */

/* Bit fields for ETM ETMCLAIMCLR */

/* Bit fields for ETM ETMLAR */

/* Bit fields for ETM ETMLSR */

/* Bit fields for ETM ETMAUTHSTATUS */

/* Bit fields for ETM ETMDEVTYPE */

/* Bit fields for ETM ETMPIDR4 */

/* Bit fields for ETM ETMPIDR5 */

/* Bit fields for ETM ETMPIDR6 */

/* Bit fields for ETM ETMPIDR7 */

/* Bit fields for ETM ETMPIDR0 */

/* Bit fields for ETM ETMPIDR1 */

/* Bit fields for ETM ETMPIDR2 */

/* Bit fields for ETM ETMPIDR3 */

/* Bit fields for ETM ETMCIDR0 */

/* Bit fields for ETM ETMCIDR1 */

/* Bit fields for ETM ETMCIDR2 */

/* Bit fields for ETM ETMCIDR3 */

/** @} End of group EZR32WG_ETM */


/**************************************************************************//**
 * @file ezr32wg_dma_descriptor.h
 * @brief EZR32WG_DMA_DESCRIPTOR register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_DMA_DESCRIPTOR
 * @{
 *****************************************************************************/
typedef struct
{
  /* Note! Use of double __IO (volatile) qualifier to ensure that both */
  /* pointer and referenced memory are declared volatile. */
  volatile void * volatile SRCEND;     /**< DMA source address end */
  volatile void * volatile DSTEND;     /**< DMA destination address end */
  volatile uint32_t    CTRL;       /**< DMA control register */
  volatile uint32_t    USER;       /**< DMA padding register, available for user */
} DMA_DESCRIPTOR_TypeDef;      /** @} */

/**************************************************************************//**
 * @file ezr32wg_devinfo.h
 * @brief EZR32WG_DEVINFO register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_DEVINFO
 * @{
 *****************************************************************************/
typedef struct
{
  volatile const uint32_t RADIO0;       /**< Radio information 0 */
  volatile const uint32_t RADIO1;       /**< Radio information 1 */
  volatile const uint32_t CAL;          /**< Calibration temperature and checksum */
  volatile const uint32_t ADC0CAL0;     /**< ADC0 Calibration register 0 */
  volatile const uint32_t ADC0CAL1;     /**< ADC0 Calibration register 1 */
  volatile const uint32_t ADC0CAL2;     /**< ADC0 Calibration register 2 */
  uint32_t     RESERVED0[2]; /**< Reserved */
  volatile const uint32_t DAC0CAL0;     /**< DAC calibrartion register 0 */
  volatile const uint32_t DAC0CAL1;     /**< DAC calibrartion register 1 */
  volatile const uint32_t DAC0CAL2;     /**< DAC calibrartion register 2 */
  volatile const uint32_t AUXHFRCOCAL0; /**< AUXHFRCO calibration register 0 */
  volatile const uint32_t AUXHFRCOCAL1; /**< AUXHFRCO calibration register 1 */
  volatile const uint32_t HFRCOCAL0;    /**< HFRCO calibration register 0 */
  volatile const uint32_t HFRCOCAL1;    /**< HFRCO calibration register 1 */
  volatile const uint32_t MEMINFO;      /**< Memory information */
  uint32_t     RESERVED2;    /**< Reserved */
  volatile const uint32_t RADIO2;       /**< Radio information 2 */
  volatile const uint32_t UNIQUEL;      /**< Low 32 bits of device unique number */
  volatile const uint32_t UNIQUEH;      /**< High 32 bits of device unique number */
  volatile const uint32_t MSIZE;        /**< Flash and SRAM Memory size in KiloBytes */
  volatile const uint32_t PART;         /**< Part description */
} DEVINFO_TypeDef;           /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_DEVINFO_BitFields
 * @{
 *****************************************************************************/
/* Bit fields for EZR32WG_DEVINFO */
/* Legacy family #defines */
/* New style family #defines */

/** @} End of group EZR32WG_DEVINFO */


/**************************************************************************//**
 * @file ezr32wg_romtable.h
 * @brief EZR32WG_ROMTABLE register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_ROMTABLE
 * @{
 * @brief Chip Information, Revision numbers
 *****************************************************************************/
typedef struct
{
  volatile const uint32_t PID4; /**< JEP_106_BANK */
  volatile const uint32_t PID5; /**< Unused */
  volatile const uint32_t PID6; /**< Unused */
  volatile const uint32_t PID7; /**< Unused */
  volatile const uint32_t PID0; /**< Chip family LSB, chip major revision */
  volatile const uint32_t PID1; /**< JEP_106_NO, Chip family MSB */
  volatile const uint32_t PID2; /**< Chip minor rev MSB, JEP_106_PRESENT, JEP_106_NO */
  volatile const uint32_t PID3; /**< Chip minor rev LSB */
  volatile const uint32_t CID0; /**< Unused */
} ROMTABLE_TypeDef;  /** @} */

/**************************************************************************//**
 * @defgroup EZR32WG_ROMTABLE_BitFields
 * @{
 *****************************************************************************/
/* Bit fields for EZR32WG_ROMTABLE */

/** @} End of group EZR32WG_ROMTABLE */


/**************************************************************************//**
 * @file ezr32wg_calibrate.h
 * @brief EZR32WG_CALIBRATE register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_CALIBRATE
 * @{
 *****************************************************************************/

typedef struct
{
  volatile const uint32_t ADDRESS; /**< Address of calibration register */
  volatile const uint32_t VALUE;   /**< Default value for calibration register */
} CALIBRATE_TypeDef;    /** @} */


/** @} End of group EZR32WG330F256R60_Peripheral_TypeDefs */

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_Peripheral_Base EZR32WG330F256R60 Peripheral Memory Map
 * @{
 *****************************************************************************/


/** @} End of group EZR32WG330F256R60_Peripheral_Base */

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_Peripheral_Declaration  EZR32WG330F256R60 Peripheral Declarations
 * @{
 *****************************************************************************/


/** @} End of group EZR32WG330F256R60_Peripheral_Declaration */

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_BitFields EZR32WG330F256R60 Bit Fields
 * @{
 *****************************************************************************/

/**************************************************************************//**
 * @file ezr32wg_prs_signals.h
 * @brief EZR32WG_PRS_SIGNALS register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @addtogroup EZR32WG_PRS_Signals
 * @{
 * @brief PRS Signal names
 *****************************************************************************/

/** @} End of group EZR32WG_PRS */


/**************************************************************************//**
 * @file ezr32wg_dmareq.h
 * @brief EZR32WG_DMAREQ register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/

/**************************************************************************//**
 * @defgroup EZR32WG_DMAREQ_BitFields
 * @{
 *****************************************************************************/

/** @} End of group EZR32WG_DMAREQ */


/**************************************************************************//**
 * @file ezr32wg_dmactrl.h
 * @brief EZR32WG_DMACTRL register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/

/**************************************************************************//**
 * @defgroup EZR32WG_DMACTRL_BitFields
 * @{
 *****************************************************************************/

/** @} End of group EZR32WG_DMA */


/**************************************************************************//**
 * @file ezr32wg_usartrf.h
 * @brief EZR32WG_USARTRF register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/

/**************************************************************************//**
 * @defgroup EZR32WG_USARTRF_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for USARTRF CTRL */

/* Bit fields for USARTRF FRAME */

/* Bit fields for USARTRF TRIGCTRL */

/* Bit fields for USARTRF CMD */

/* Bit fields for USARTRF STATUS */

/* Bit fields for USARTRF CLKDIV */

/* Bit fields for USARTRF RXDATAX */

/* Bit fields for USARTRF RXDATA */

/* Bit fields for USARTRF RXDOUBLEX */

/* Bit fields for USARTRF RXDOUBLE */

/* Bit fields for USARTRF RXDATAXP */

/* Bit fields for USARTRF RXDOUBLEXP */

/* Bit fields for USARTRF TXDATAX */

/* Bit fields for USARTRF TXDATA */

/* Bit fields for USARTRF TXDOUBLEX */

/* Bit fields for USARTRF TXDOUBLE */

/* Bit fields for USARTRF IF */

/* Bit fields for USARTRF IFS */

/* Bit fields for USARTRF IFC */

/* Bit fields for USARTRF IEN */

/* Bit fields for USARTRF IRCTRL */

/* Bit fields for USARTRF ROUTE */

/* Bit fields for USARTRF INPUT */

/* Bit fields for USARTRF I2SCTRL */

/** @} End of group EZR32WG_USARTRF */


/**************************************************************************//**
 * @file ezr32wg_uart.h
 * @brief EZR32WG_UART register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/

/**************************************************************************//**
 * @defgroup EZR32WG_UART_BitFields
 * @{
 *****************************************************************************/

/* Bit fields for UART CTRL */

/* Bit fields for UART FRAME */

/* Bit fields for UART TRIGCTRL */

/* Bit fields for UART CMD */

/* Bit fields for UART STATUS */

/* Bit fields for UART CLKDIV */

/* Bit fields for UART RXDATAX */

/* Bit fields for UART RXDATA */

/* Bit fields for UART RXDOUBLEX */

/* Bit fields for UART RXDOUBLE */

/* Bit fields for UART RXDATAXP */

/* Bit fields for UART RXDOUBLEXP */

/* Bit fields for UART TXDATAX */

/* Bit fields for UART TXDATA */

/* Bit fields for UART TXDOUBLEX */

/* Bit fields for UART TXDOUBLE */

/* Bit fields for UART IF */

/* Bit fields for UART IFS */

/* Bit fields for UART IFC */

/* Bit fields for UART IEN */

/* Bit fields for UART IRCTRL */

/* Bit fields for UART ROUTE */

/* Bit fields for UART INPUT */

/* Bit fields for UART I2SCTRL */

/** @} End of group EZR32WG_UART */



/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_UNLOCK EZR32WG330F256R60 Unlock Codes
 * @{
 *****************************************************************************/

/** @} End of group EZR32WG330F256R60_UNLOCK */

/** @} End of group EZR32WG330F256R60_BitFields */

/**************************************************************************//**
 * @defgroup EZR32WG330F256R60_Alternate_Function EZR32WG330F256R60 Alternate Function
 * @{
 *****************************************************************************/

/**************************************************************************//**
 * @file ezr32wg_af_ports.h
 * @brief EZR32WG_AF_PORTS register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_AF_Ports
 * @{
 *****************************************************************************/

/** AF port number for location number i */

/** @} End of group EZR32WG_AF_Ports */


/**************************************************************************//**
 * @file ezr32wg_af_pins.h
 * @brief EZR32WG_AF_PINS register and bit field definitions
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
 ******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.@n
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.@n
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories, Inc.
 * has no obligation to support this Software. Silicon Laboratories, Inc. is
 * providing the Software "AS IS", with no express or implied warranties of any
 * kind, including, but not limited to, any implied warranties of
 * merchantability or fitness for any particular purpose or warranties against
 * infringement of any proprietary rights of a third party.
 *
 * Silicon Laboratories, Inc. will not be liable for any consequential,
 * incidental, or special damages, or any other relief, or for any claim by
 * any third party, arising from your use of this Software.
 *
 *****************************************************************************/
/**************************************************************************//**
 * @defgroup EZR32WG_AF_Pins
 * @{
 *****************************************************************************/

/** AF pin number for location number i */

/** @} End of group EZR32WG_AF_Pins */



/** @} End of group EZR32WG330F256R60_Alternate_Function */

/**************************************************************************//**
 *  @brief Set the value of a bit field within a register.
 *
 *  @param REG
 *       The register to update
 *  @param MASK
 *       The mask for the bit field to update
 *  @param VALUE
 *       The value to write to the bit field
 *  @param OFFSET
 *       The number of bits that the field is offset within the register.
 *       0 (zero) means LSB.
 *****************************************************************************/

/** @} End of group EZR32WG330F256R60 */

/** @} End of group Parts */


/***************************************************************************//**
 * @file em_cmu.h
 * @brief Clock management unit (CMU) API
 * @version 4.0.0
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Labs has no
 * obligation to support this Software. Silicon Labs is providing the
 * Software "AS IS", with no express or implied warranties of any kind,
 * including, but not limited to, any implied warranties of merchantability
 * or fitness for any particular purpose or warranties against infringement
 * of any proprietary rights of a third party.
 *
 * Silicon Labs will not be liable for any consequential, incidental, or
 * special damages, or any other relief, or for any claim by any third party,
 * arising from your use of this Software.
 *
 ******************************************************************************/

      //EZR32WG

/* stdbool.h header */
/* Copyright 2003-2010 IAR Systems AB.  */

/* NOTE: IAR Extensions must be enabled in order to use the bool type! */


  #pragma system_include







/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */
/***************************************************************************//**
 * @file em_assert.h
 * @brief Emlib peripheral API "assert" implementation.
 * @version 4.0.0
 *
 * @details
 * By default, emlib library assert usage is not included in order to reduce
 * footprint and processing overhead. Further, emlib assert usage is decoupled
 * from ISO C assert handling (NDEBUG usage), to allow a user to use ISO C
 * assert without including emlib assert statements.
 *
 * Below are available defines for controlling emlib assert inclusion. The defines
 * are typically defined for a project to be used by the preprocessor.
 *
 * @li If DEBUG_EFM is defined, the internal emlib library assert handling will
 * be used, which may be a quite rudimentary implementation.
 *
 * @li If DEBUG_EFM_USER is defined instead, the user must provide their own
 * assert handling routine (assertEFM()).
 *
 * As indicated above, if none of the above defines are used, emlib assert
 * statements are not compiled.
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Labs has no
 * obligation to support this Software. Silicon Labs is providing the
 * Software "AS IS", with no express or implied warranties of any kind,
 * including, but not limited to, any implied warranties of merchantability
 * or fitness for any particular purpose or warranties against infringement
 * of any proprietary rights of a third party.
 *
 * Silicon Labs will not be liable for any consequential, incidental, or
 * special damages, or any other relief, or for any claim by any third party,
 * arising from your use of this Software.
 *
 ******************************************************************************/



/** @cond DO_NOT_INCLUDE_WITH_DOXYGEN */




/** @endcond */


/***************************************************************************//**
 * @file em_bus.h
 * @brief RAM and peripheral bit-field set and clear API
 * @version 3.20.2
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Labs has no
 * obligation to support this Software. Silicon Labs is providing the
 * Software "AS IS", with no express or implied warranties of any kind,
 * including, but not limited to, any implied warranties of merchantability
 * or fitness for any particular purpose or warranties against infringement
 * of any proprietary rights of a third party.
 *
 * Silicon Labs will not be liable for any consequential, incidental, or
 * special damages, or any other relief, or for any claim by any third party,
 * arising from your use of this Software.
 *
 ******************************************************************************/


      //EZR32WG


/***************************************************************************//**
 * @addtogroup EM_Library
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @addtogroup BUS
 * @brief BUS RAM and register bit/field read/write API
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @brief
 *   Perform a single-bit write operation on a 32-bit word in RAM
 *
 * @details
 *   This function uses Cortex-M bit-banding hardware to perform an atomic
 *   read-modify-write operation on a single bit write on a 32-bit word in RAM.
 *   Please refer to the reference manual for further details about bit-banding.
 *
 * @note
 *   This function is atomic on Cortex-M cores with bit-banding support. Bit-
 *   banding is a multicycle read-modify-write bus operation. RAM bit-banding is
 *   performed using the memory alias region at BITBAND_RAM_BASE.
 *
 * @param[in] addr Address of 32-bit word in RAM
 *
 * @param[in] bit Bit position to write, 0-31
 *
 * @param[in] val Value to set bit to, 0 or 1
 ******************************************************************************/
static inline void BUS_RamBitWrite(volatile uint32_t* const addr,
                                     unsigned int bit,
                                     unsigned int val)
{
  uint32_t aliasAddr =
    ((uint32_t) 0x22000000UL) + (((uint32_t)addr - (0x20000000UL)) * 32) + (bit * 4);

  *(volatile uint32_t *)aliasAddr = (uint32_t)val;
}


/***************************************************************************//**
 * @brief
 *   Perform a single-bit read operation on a 32-bit word in RAM
 *
 * @details
 *   This function uses Cortex-M bit-banding hardware to perform an atomic
 *   read operation on a single register bit. Please refer to the
 *   reference manual for further details about bit-banding.
 *
 * @note
 *   This function is atomic on Cortex-M cores with bit-banding support.
 *   RAM bit-banding is performed using the memory alias region
 *   at BITBAND_RAM_BASE.
 *
 * @param[in] addr RAM address
 *
 * @param[in] bit Bit position to read, 0-31
 *
 * @return
 *     The requested bit shifted to bit position 0 in the return value
 ******************************************************************************/
static inline unsigned int BUS_RamBitRead(volatile const uint32_t* const addr,
                                            unsigned int bit)
{
  uint32_t aliasAddr =
    ((uint32_t) 0x22000000UL) + (((uint32_t)addr - (0x20000000UL)) * 32) + (bit * 4);

  return *(volatile uint32_t *)aliasAddr;
}


/***************************************************************************//**
 * @brief
 *   Perform a single-bit write operation on a peripheral register
 *
 * @details
 *   This function uses Cortex-M bit-banding hardware to perform an atomic
 *   read-modify-write operation on a single register bit. Please refer to the
 *   reference manual for further details about bit-banding.
 *
 * @note
 *   This function is atomic on Cortex-M cores with bit-banding support. Bit-
 *   banding is a multicycle read-modify-write bus operation. Peripheral register
 *   bit-banding is performed using the memory alias region at BITBAND_PER_BASE.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] bit Bit position to write, 0-31
 *
 * @param[in] val Value to set bit to, 0 or 1
 ******************************************************************************/
static inline void BUS_RegBitWrite(volatile uint32_t* const addr,
                                     unsigned int bit,
                                     unsigned int val)
{
  uint32_t aliasAddr =
    ((uint32_t) 0x42000000UL) + (((uint32_t)addr - ((uint32_t) 0x40000000UL)) * 32) + (bit * 4);

  *(volatile uint32_t *)aliasAddr = (uint32_t)val;
}


/***************************************************************************//**
 * @brief
 *   Perform a single-bit read operation on a peripheral register
 *
 * @details
 *   This function uses Cortex-M bit-banding hardware to perform an atomic
 *   read operation on a single register bit. Please refer to the
 *   reference manual for further details about bit-banding.
 *
 * @note
 *   This function is atomic on Cortex-M cores with bit-banding support.
 *   Peripheral register bit-banding is performed using the memory alias
 *   region at BITBAND_PER_BASE.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] bit Bit position to read, 0-31
 *
 * @return
 *     The requested bit shifted to bit position 0 in the return value
 ******************************************************************************/
static inline unsigned int BUS_RegBitRead(volatile const uint32_t* const addr,
                                            unsigned int bit)
{
  uint32_t aliasAddr =
    ((uint32_t) 0x42000000UL) + (((uint32_t)addr - ((uint32_t) 0x40000000UL)) * 32) + (bit * 4);

  return *(volatile uint32_t *)aliasAddr;
}


/***************************************************************************//**
 * @brief
 *   Perform a masked set operation on peripheral register address.
 *
 * @details
 *   Peripheral register masked set provides a single-cycle and atomic set
 *   operation of a bit-mask in a peripheral register. All 1's in the mask are
 *   set to 1 in the register. All 0's in the mask are not changed in the
 *   register.
 *   RAMs and special peripherals are not supported. Please refer to the
 *   reference manual for further details about peripheral register field set.
 *
 * @note
 *   This function is single-cycle and atomic on cores with peripheral bit set
 *   and clear support. It uses the memory alias region at PER_BITSET_MEM_BASE.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] mask Mask to set
 ******************************************************************************/
static inline void BUS_RegMaskedSet(volatile uint32_t* const addr,
                                      const uint32_t mask)
{
  *addr |= mask;
}


/***************************************************************************//**
 * @brief
 *   Perform a masked clear operation on peripheral register address.
 *
 * @details
 *   Peripheral register masked clear provides a single-cycle and atomic clear
 *   operation of a bit-mask in a peripheral register. All 1's in the mask are
 *   set to 0 in the register.
 *   All 0's in the mask are not changed in the register.
 *   RAMs and special peripherals are not supported. Please refer to the
 *   reference manual for further details about peripheral register field clear.
 *
 * @note
 *   This function is single-cycle and atomic on cores with peripheral bit set
 *   and clear support. It uses the memory alias region at PER_BITCLR_MEM_BASE.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] mask Mask to clear
 ******************************************************************************/
static inline void BUS_RegMaskedClear(volatile uint32_t* const addr,
                                        const uint32_t mask)
{
  *addr &= ~mask;
}


/***************************************************************************//**
 * @brief
 *   Perform peripheral register masked clear and value write.
 *
 * @details
 *   This function first clears the mask in the peripheral register, then
 *   writes the value. Typically the mask is a bit-field in the register, and
 *   the value val is within the mask.
 *
 * @note
 *   This operation is not atomic. Note that the mask is first set to 0 before
 *   the val is set.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] mask Peripheral register mask
 *
 * @param[in] val Peripheral register value. The value must be shifted to the
                  correct bit position in the register.
 ******************************************************************************/
static inline void BUS_RegMaskedWrite(volatile uint32_t* const addr,
                                        const uint32_t mask,
                                        uint32_t val)
{
  *addr = (*addr & ~mask) | val;
}


/***************************************************************************//**
 * @brief
 *   Perform a peripheral register masked read
 *
 * @details
 *   Read an unshifted and masked value from a peripheral register.
 *
 * @note
 *   This operation is not hardware accelerated.
 *
 * @param[in] addr Peripheral register address
 *
 * @param[in] mask Peripheral register mask
 *
 * @return
 *   Unshifted and masked register value
 ******************************************************************************/
static inline uint32_t BUS_RegMaskedRead(volatile const uint32_t* const addr,
                                           const uint32_t mask)
{
  return *addr & mask;
}


/** @} (end addtogroup BUS) */
/** @} (end addtogroup EM_Library) */




/***************************************************************************//**
 * @addtogroup EM_Library
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @addtogroup CMU
 * @{
 ******************************************************************************/

/** @cond DO_NOT_INCLUDE_WITH_DOXYGEN */

/* Select register id's, for internal use. */


/* Divisor/prescaler register id's, for internal use. */


/* Enable register id's, for internal use. */


/* Enable register bit positions, for internal use. */

/* Clock branch bitfield positions, for internal use. */


/** @endcond */

/*******************************************************************************
 ********************************   ENUMS   ************************************
 ******************************************************************************/

/** Clock divisors. These values are valid for prescalers. */

/** Clock divider configuration */
typedef uint32_t CMU_ClkDiv_TypeDef;


/** High frequency system RCO bands */
typedef enum
{
  cmuHFRCOBand_1MHz  = 0x00000000UL,      /**< 1MHz HFRCO band  */
  cmuHFRCOBand_7MHz  = 0x00000001UL,      /**< 7MHz HFRCO band  */
  cmuHFRCOBand_11MHz = 0x00000002UL,     /**< 11MHz HFRCO band */
  cmuHFRCOBand_14MHz = 0x00000003UL,     /**< 14MHz HFRCO band */
  cmuHFRCOBand_21MHz = 0x00000004UL,     /**< 21MHz HFRCO band */
  cmuHFRCOBand_28MHz = 0x00000005UL,     /**< 28MHz HFRCO band */
} CMU_HFRCOBand_TypeDef;

/** AUX High frequency RCO bands */
typedef enum
{
  cmuAUXHFRCOBand_1MHz  = 0x00000003UL,  /**< 1MHz RC band  */
  cmuAUXHFRCOBand_7MHz  = 0x00000002UL,  /**< 7MHz RC band  */
  cmuAUXHFRCOBand_11MHz = 0x00000001UL, /**< 11MHz RC band */
  cmuAUXHFRCOBand_14MHz = 0x00000000UL, /**< 14MHz RC band */
  cmuAUXHFRCOBand_21MHz = 0x00000007UL, /**< 21MHz RC band */
  cmuAUXHFRCOBand_28MHz = 0x00000006UL, /**< 28MHz RC band */
} CMU_AUXHFRCOBand_TypeDef;





/** Clock points in CMU. Please refer to CMU overview in reference manual. */
typedef enum
{
  /*******************/
  /* HF clock branch */
  /*******************/

  /** High frequency clock */
  cmuClock_HF = (1 << 4)
                | (1 << 0)
                | (0 << 8)
                | (0 << 12)
                | (0 << 17),

  /** Debug clock */
  cmuClock_DBG = (0 << 4)
                 | (6 << 0)
                 | (0 << 8)
                 | (0 << 12)
                 | (6 << 17),

  /** AUX clock */
  cmuClock_AUX = (0 << 4)
                 | (0 << 0)
                 | (0 << 8)
                 | (0 << 12)
                 | (7 << 17),



  /**********************************/
  /* HF peripheral clock sub-branch */
  /**********************************/

  /** High frequency peripheral clock */
  cmuClock_HFPER = (4 << 4)
                   | (0 << 0)
                   | (1 << 8)
                   | (8 << 12)
                   | (2 << 17),


  /** Universal sync/async receiver/transmitter 0 clock. */
  cmuClock_USARTRF0 = (0 << 4)
                      | (0 << 0)
                      | (2 << 8)
                      | (0 << 12)
                      | (2 << 17),

  /** Universal sync/async receiver/transmitter 1 clock. */
  cmuClock_USART1 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (1 << 12)
                    | (2 << 17),

  /** Universal sync/async receiver/transmitter 2 clock. */
  cmuClock_USART2 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (2 << 12)
                    | (2 << 17),





  /** Universal async receiver/transmitter 0 clock. */
  cmuClock_UART0 = (0 << 4)
                   | (0 << 0)
                   | (2 << 8)
                   | (3 << 12)
                   | (2 << 17),

  /** Universal async receiver/transmitter 1 clock. */
  cmuClock_UART1 = (0 << 4)
                   | (0 << 0)
                   | (2 << 8)
                   | (4 << 12)
                   | (2 << 17),

  /** Timer 0 clock. */
  cmuClock_TIMER0 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (5 << 12)
                    | (2 << 17),

  /** Timer 1 clock. */
  cmuClock_TIMER1 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (6 << 12)
                    | (2 << 17),

  /** Timer 2 clock. */
  cmuClock_TIMER2 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (7 << 12)
                    | (2 << 17),

  /** Timer 3 clock. */
  cmuClock_TIMER3 = (0 << 4)
                    | (0 << 0)
                    | (2 << 8)
                    | (8 << 12)
                    | (2 << 17),


  /** Analog comparator 0 clock. */
  cmuClock_ACMP0 = (0 << 4)
                   | (0 << 0)
                   | (2 << 8)
                   | (9 << 12)
                   | (2 << 17),

  /** Analog comparator 1 clock. */
  cmuClock_ACMP1 = (0 << 4)
                   | (0 << 0)
                   | (2 << 8)
                   | (10 << 12)
                   | (2 << 17),

  /** Peripheral reflex system clock. */
  cmuClock_PRS = (0 << 4)
                 | (0 << 0)
                 | (2 << 8)
                 | (15 << 12)
                 | (2 << 17),

  /** Digital to analog converter 0 clock. */
  cmuClock_DAC0 = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (17 << 12)
                  | (2 << 17),


  /** General purpose input/output clock. */
  cmuClock_GPIO = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (13 << 12)
                  | (2 << 17),

  /** Voltage comparator clock. */
  cmuClock_VCMP = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (14 << 12)
                  | (2 << 17),

  /** Analog to digital converter 0 clock. */
  cmuClock_ADC0 = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (16 << 12)
                  | (2 << 17),

  /** I2C 0 clock. */
  cmuClock_I2C0 = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (11 << 12)
                  | (2 << 17),

  /** I2C 1 clock. */
  cmuClock_I2C1 = (0 << 4)
                  | (0 << 0)
                  | (2 << 8)
                  | (12 << 12)
                  | (2 << 17),


  /**********************/
  /* HF core sub-branch */
  /**********************/

  /** Core clock */
  cmuClock_CORE = (5 << 4)
                  | (0 << 0)
                  | (0 << 8)
                  | (0 << 12)
                  | (1 << 17),

  /** Advanced encryption standard accelerator clock. */
  cmuClock_AES = (0 << 4)
                 | (0 << 0)
                 | (3 << 8)
                 | (1 << 12)
                 | (1 << 17),

  /** Direct memory access controller clock. */
  cmuClock_DMA = (0 << 4)
                 | (0 << 0)
                 | (3 << 8)
                 | (0 << 12)
                 | (1 << 17),

/** Low energy clocking module clock. */
  cmuClock_CORELE = (0 << 4)
                    | (0 << 0)
                    | (3 << 8)
                    | (4 << 12)
                    | (1 << 17),


  /** USB Core clock. */
  cmuClock_USBC = (0 << 4)
                  | (7 << 0)
                  | (3 << 8)
                  | (2 << 12)
                  | (16 << 17),


  /** USB clock. */
  cmuClock_USB = (0 << 4)
                 | (0 << 0)
                 | (3 << 8)
                 | (3 << 12)
                 | (1 << 17),


  /***************/
  /* LF A branch */
  /***************/

  /** Low frequency A clock */
  cmuClock_LFA = (0 << 4)
                 | (2 << 0)
                 | (0 << 8)
                 | (0 << 12)
                 | (12 << 17),

  /** Real time counter clock. */
  cmuClock_RTC = (7 << 4)
                 | (0 << 0)
                 | (6 << 8)
                 | (1 << 12)
                 | (8 << 17),

  /** Low energy timer 0 clock. */
  cmuClock_LETIMER0 = (7 << 4)
                      | (0 << 0)
                      | (6 << 8)
                      | (2 << 12)
                      | (9 << 17),


  /** Pulse counter 0 clock. */
  cmuClock_PCNT0 = (0 << 4)
                   | (0 << 0)
                   | (10 << 8)
                   | (0 << 12)
                   | (12 << 17),

  /** Pulse counter 1 clock. */
  cmuClock_PCNT1 = (0 << 4)
                   | (0 << 0)
                   | (10 << 8)
                   | (2 << 12)
                   | (12 << 17),

  /** Pulse counter 2 clock. */
  cmuClock_PCNT2 = (0 << 4)
                   | (0 << 0)
                   | (10 << 8)
                   | (4 << 12)
                   | (12 << 17),
  /** LESENSE clock. */
  cmuClock_LESENSE = (7 << 4)
                     | (0 << 0)
                     | (6 << 8)
                     | (0 << 12)
                     | (20 << 17),

  /***************/
  /* LF B branch */
  /***************/

  /** Low frequency B clock */
  cmuClock_LFB = (0 << 4)
                 | (3 << 0)
                 | (0 << 8)
                 | (0 << 12)
                 | (13 << 17),

  /** Low energy universal asynchronous receiver/transmitter 0 clock. */
  cmuClock_LEUART0 = (8 << 4)
                     | (0 << 0)
                     | (7 << 8)
                     | (0 << 12)
                     | (10 << 17),

  /** Low energy universal asynchronous receiver/transmitter 1 clock. */
  cmuClock_LEUART1 = (8 << 4)
                     | (0 << 0)
                     | (7 << 8)
                     | (1 << 12)
                     | (11 << 17),



} CMU_Clock_TypeDef;


/** Oscillator types. */
typedef enum
{
  cmuOsc_LFXO,     /**< Low frequency crystal oscillator. */
  cmuOsc_LFRCO,    /**< Low frequency RC oscillator. */
  cmuOsc_HFXO,     /**< High frequency crystal oscillator. */
  cmuOsc_HFRCO,    /**< High frequency RC oscillator. */
  cmuOsc_AUXHFRCO, /**< Auxiliary high frequency RC oscillator. */
  cmuOsc_ULFRCO    /**< Ultra low frequency RC oscillator. */
} CMU_Osc_TypeDef;


/** Selectable clock sources. */
typedef enum
{
  cmuSelect_Error,      /**< Usage error. */
  cmuSelect_Disabled,   /**< Clock selector disabled. */
  cmuSelect_LFXO,       /**< Low frequency crystal oscillator. */
  cmuSelect_LFRCO,      /**< Low frequency RC oscillator. */
  cmuSelect_HFXO,       /**< High frequency crystal oscillator. */
  cmuSelect_HFRCO,      /**< High frequency RC oscillator. */
  cmuSelect_CORELEDIV2, /**< Core low energy clock divided by 2. */
  cmuSelect_AUXHFRCO,   /**< Auxilliary clock source can be used for debug clock */
  cmuSelect_HFCLK,      /**< Divided HFCLK on Giant for debug clock, undivided on Tiny Gecko and for USBC (not used on Gecko) */
  cmuSelect_ULFRCO,     /**< Ultra low frequency RC oscillator. */
} CMU_Select_TypeDef;


/*******************************************************************************
 *******************************   STRUCTS   ***********************************
 ******************************************************************************/




/*******************************************************************************
 *****************************   PROTOTYPES   **********************************
 ******************************************************************************/

CMU_AUXHFRCOBand_TypeDef  CMU_AUXHFRCOBandGet(void);
void                      CMU_AUXHFRCOBandSet(CMU_AUXHFRCOBand_TypeDef band);


uint32_t              CMU_Calibrate(uint32_t HFCycles, CMU_Osc_TypeDef reference);

void                  CMU_CalibrateConfig(uint32_t downCycles, CMU_Osc_TypeDef downSel,
                                          CMU_Osc_TypeDef upSel);

uint32_t              CMU_CalibrateCountGet(void);
void                  CMU_ClockEnable(CMU_Clock_TypeDef clock, _Bool enable);
CMU_ClkDiv_TypeDef    CMU_ClockDivGet(CMU_Clock_TypeDef clock);
void                  CMU_ClockDivSet(CMU_Clock_TypeDef clock, CMU_ClkDiv_TypeDef div);
uint32_t              CMU_ClockFreqGet(CMU_Clock_TypeDef clock);


void                  CMU_ClockSelectSet(CMU_Clock_TypeDef clock, CMU_Select_TypeDef ref);
CMU_Select_TypeDef    CMU_ClockSelectGet(CMU_Clock_TypeDef clock);
void                  CMU_FreezeEnable(_Bool enable);

CMU_HFRCOBand_TypeDef CMU_HFRCOBandGet(void);
void                  CMU_HFRCOBandSet(CMU_HFRCOBand_TypeDef band);


uint32_t              CMU_HFRCOStartupDelayGet(void);
void                  CMU_HFRCOStartupDelaySet(uint32_t delay);




uint32_t              CMU_LCDClkFDIVGet(void);
void                  CMU_LCDClkFDIVSet(uint32_t div);


void                  CMU_OscillatorEnable(CMU_Osc_TypeDef osc, _Bool enable, _Bool wait);
uint32_t              CMU_OscillatorTuningGet(CMU_Osc_TypeDef osc);
void                  CMU_OscillatorTuningSet(CMU_Osc_TypeDef osc, uint32_t val);
_Bool                  CMU_PCNTClockExternalGet(unsigned int instance);
void                  CMU_PCNTClockExternalSet(unsigned int instance, _Bool external);



/***************************************************************************//**
 * @brief
 *   Configures continuous calibration mode
 * @param[in] enable
 *   If true, enables continuous calibration, if false disables continuous
 *   calibrartion
 ******************************************************************************/
static inline void CMU_CalibrateCont(_Bool enable)
{
  BUS_RegBitWrite(&(((CMU_TypeDef *) (0x400C8000UL))->CALCTRL), 6, enable);
}


/***************************************************************************//**
 * @brief
 *   Starts calibration
 * @note
 *   This call is usually invoked after CMU_CalibrateConfig() and possibly
 *   CMU_CalibrateCont()
 ******************************************************************************/
static inline void CMU_CalibrateStart(void)
{
  ((CMU_TypeDef *) (0x400C8000UL))->CMD = (0x1UL << 3);
}


/***************************************************************************//**
 * @brief
 *   Stop the calibration counters
 ******************************************************************************/
static inline void CMU_CalibrateStop(void)
{
  ((CMU_TypeDef *) (0x400C8000UL))->CMD = (0x1UL << 4);
}


/***************************************************************************//**
 * @brief
 *   Convert dividend to logarithmic value. Only works for even
 *   numbers equal to 2^n.
 *
 * @param[in] div
 *   Unscaled dividend.
 *
 * @return
 *   Logarithm of 2, as used by fixed prescalers.
 ******************************************************************************/
static inline uint32_t CMU_DivToLog2(CMU_ClkDiv_TypeDef div)
{
  uint32_t log2;

  /* Fixed 2^n prescalers take argument of 32768 or less. */
  ((void)((div > 0U) && (div <= 32768U)));

  /* Count leading zeroes and "reverse" result */
  log2 = (31U - __CLZ(div));

  return log2;
}


/***************************************************************************//**
 * @brief
 *   Clear one or more pending CMU interrupts.
 *
 * @param[in] flags
 *   CMU interrupt sources to clear.
 ******************************************************************************/
static inline void CMU_IntClear(uint32_t flags)
{
  ((CMU_TypeDef *) (0x400C8000UL))->IFC = flags;
}


/***************************************************************************//**
 * @brief
 *   Disable one or more CMU interrupts.
 *
 * @param[in] flags
 *   CMU interrupt sources to disable.
 ******************************************************************************/
static inline void CMU_IntDisable(uint32_t flags)
{
  ((CMU_TypeDef *) (0x400C8000UL))->IEN &= ~flags;
}


/***************************************************************************//**
 * @brief
 *   Enable one or more CMU interrupts.
 *
 * @note
 *   Depending on the use, a pending interrupt may already be set prior to
 *   enabling the interrupt. Consider using CMU_IntClear() prior to enabling
 *   if such a pending interrupt should be ignored.
 *
 * @param[in] flags
 *   CMU interrupt sources to enable.
 ******************************************************************************/
static inline void CMU_IntEnable(uint32_t flags)
{
  ((CMU_TypeDef *) (0x400C8000UL))->IEN |= flags;
}


/***************************************************************************//**
 * @brief
 *   Get pending CMU interrupts.
 *
 * @return
 *   CMU interrupt sources pending.
 ******************************************************************************/
static inline uint32_t CMU_IntGet(void)
{
  return ((CMU_TypeDef *) (0x400C8000UL))->IF;
}


/***************************************************************************//**
 * @brief
 *   Get enabled and pending CMU interrupt flags.
 *
 * @details
 *   Useful for handling more interrupt sources in the same interrupt handler.
 *
 * @note
 *   The event bits are not cleared by the use of this function.
 *
 * @return
 *   Pending and enabled CMU interrupt sources
 *   The return value is the bitwise AND of
 *   - the enabled interrupt sources in CMU_IEN and
 *   - the pending interrupt flags CMU_IF
 ******************************************************************************/
static inline uint32_t CMU_IntGetEnabled(void)
{
  uint32_t ien;

  ien = ((CMU_TypeDef *) (0x400C8000UL))->IEN;
  return ((CMU_TypeDef *) (0x400C8000UL))->IF & ien;
}


/**************************************************************************//**
 * @brief
 *   Set one or more pending CMU interrupts.
 *
 * @param[in] flags
 *   CMU interrupt sources to set to pending.
 *****************************************************************************/
static inline void CMU_IntSet(uint32_t flags)
{
  ((CMU_TypeDef *) (0x400C8000UL))->IFS = flags;
}


/***************************************************************************//**
 * @brief
 *   Lock the CMU in order to protect some of its registers against unintended
 *   modification.
 *
 * @details
 *   Please refer to the reference manual for CMU registers that will be
 *   locked.
 *
 * @note
 *   If locking the CMU registers, they must be unlocked prior to using any
 *   CMU API functions modifying CMU registers protected by the lock.
 ******************************************************************************/
static inline void CMU_Lock(void)
{
  ((CMU_TypeDef *) (0x400C8000UL))->LOCK = (0x00000000UL << 0);
}


/***************************************************************************//**
 * @brief
 *   Convert logarithm of 2 prescaler to division factor.
 *
 * @param[in] log2
 *   Logarithm of 2, as used by fixed prescalers.
 *
 * @return
 *   Dividend.
 ******************************************************************************/
static inline uint32_t CMU_Log2ToDiv(uint32_t log2)
{
  return 1 << log2;
}




/***************************************************************************//**
 * @brief
 *   Unlock the CMU so that writing to locked registers again is possible.
 ******************************************************************************/
static inline void CMU_Unlock(void)
{
  ((CMU_TypeDef *) (0x400C8000UL))->LOCK = (0x0000580EUL << 0);
}

/** @} (end addtogroup CMU) */
/** @} (end addtogroup EM_Library) */


/***************************************************************************//**
 * @file em_int.h
 * @brief Interrupt enable/disable unit API
 * @version 4.0.0
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Labs has no
 * obligation to support this Software. Silicon Labs is providing the
 * Software "AS IS", with no express or implied warranties of any kind,
 * including, but not limited to, any implied warranties of merchantability
 * or fitness for any particular purpose or warranties against infringement
 * of any proprietary rights of a third party.
 *
 * Silicon Labs will not be liable for any consequential, incidental, or
 * special damages, or any other relief, or for any claim by any third party,
 * arising from your use of this Software.
 *
 ******************************************************************************/


      //EZR32WG

extern uint32_t INT_LockCnt;


/** @cond DO_NOT_INCLUDE_WITH_DOXYGEN */
/** @endcond */

/***************************************************************************//**
 * @addtogroup EM_Library
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @addtogroup INT
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @brief
 *   Disable interrupts.
 *
 * @details
 *   Disable interrupts and increment lock level counter.
 *
 * @return
 *   The resulting interrupt nesting level.
 *
 ******************************************************************************/
static inline uint32_t INT_Disable(void)
{
  __disable_interrupt();
  if (INT_LockCnt < 0xffffffffU)
  {
    INT_LockCnt++;
  }

  return INT_LockCnt;
}

/***************************************************************************//**
 * @brief
 *   Enable interrupts.
 *
 * @return
 *   The resulting interrupt nesting level.
 *
 * @details
 *   Decrement interrupt lock level counter and enable interrupts if counter
 *   reached zero.
 *
 ******************************************************************************/
static inline uint32_t INT_Enable(void)
{
  uint32_t retVal;

  if (INT_LockCnt > 0)
  {
    INT_LockCnt--;
    retVal = INT_LockCnt;
    if (retVal == 0)
    {
      __enable_interrupt();
    }
    return retVal;
  }
  else
  {
    return 0;
  }
}

/** @} (end addtogroup INT) */
/** @} (end addtogroup EM_Library) */


/***************************************************************************//**
 * @file em_rtc.h
 * @brief Real Time Counter (RTC) peripheral API
 * @version 4.0.0
 *******************************************************************************
 * @section License
 * <b>(C) Copyright 2015 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Labs has no
 * obligation to support this Software. Silicon Labs is providing the
 * Software "AS IS", with no express or implied warranties of any kind,
 * including, but not limited to, any implied warranties of merchantability
 * or fitness for any particular purpose or warranties against infringement
 * of any proprietary rights of a third party.
 *
 * Silicon Labs will not be liable for any consequential, incidental, or
 * special damages, or any other relief, or for any claim by any third party,
 * arising from your use of this Software.
 *
 ******************************************************************************/


      //EZR32WG



/***************************************************************************//**
 * @addtogroup EM_Library
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @addtogroup RTC
 * @{
 ******************************************************************************/

/*******************************************************************************
 *******************************   STRUCTS   ***********************************
 ******************************************************************************/

/** RTC initialization structure. */
typedef struct
{
  _Bool enable;   /**< Start counting when init completed. */
  _Bool debugRun; /**< Counter shall keep running during debug halt. */
  _Bool comp0Top; /**< Use compare register 0 as max count value. */
} RTC_Init_TypeDef;

/** Suggested default config for RTC init structure. */


/*******************************************************************************
 *****************************   PROTOTYPES   **********************************
 ******************************************************************************/

uint32_t RTC_CompareGet(unsigned int comp);
void RTC_CompareSet(unsigned int comp, uint32_t value);

/***************************************************************************//**
 * @brief
 *   Get RTC counter value.
 *
 * @return
 *   Current RTC counter value.
 ******************************************************************************/
static inline uint32_t RTC_CounterGet(void)
{
  return ((RTC_TypeDef *) (0x40080000UL))->CNT;
}

void RTC_CounterReset(void);
void RTC_Enable(_Bool enable);
void RTC_FreezeEnable(_Bool enable);
void RTC_Init(const RTC_Init_TypeDef *init);

/***************************************************************************//**
 * @brief
 *   Clear one or more pending RTC interrupts.
 *
 * @param[in] flags
 *   RTC interrupt sources to clear. Use a set of interrupt flags OR-ed
 *   together to clear multiple interrupt sources for the RTC module
 *   (RTC_IFS_nnn).
 ******************************************************************************/
static inline void RTC_IntClear(uint32_t flags)
{
  ((RTC_TypeDef *) (0x40080000UL))->IFC = flags;
}


/***************************************************************************//**
 * @brief
 *   Disable one or more RTC interrupts.
 *
 * @param[in] flags
 *   RTC interrupt sources to disable. Use a set of interrupt flags OR-ed
 *   together to disable multiple interrupt sources for the RTC module
 *   (RTC_IFS_nnn).
 ******************************************************************************/
static inline void RTC_IntDisable(uint32_t flags)
{
  ((RTC_TypeDef *) (0x40080000UL))->IEN &= ~flags;
}


/***************************************************************************//**
 * @brief
 *   Enable one or more RTC interrupts.
 *
 * @note
 *   Depending on the use, a pending interrupt may already be set prior to
 *   enabling the interrupt. Consider using RTC_IntClear() prior to enabling
 *   if such a pending interrupt should be ignored.
 *
 * @param[in] flags
 *   RTC interrupt sources to enable. Use a set of interrupt flags OR-ed
 *   together to set multiple interrupt sources for the RTC module
 *   (RTC_IFS_nnn).
 ******************************************************************************/
static inline void RTC_IntEnable(uint32_t flags)
{
  ((RTC_TypeDef *) (0x40080000UL))->IEN |= flags;
}


/***************************************************************************//**
 * @brief
 *   Get pending RTC interrupt flags.
 *
 * @note
 *   The event bits are not cleared by the use of this function.
 *
 * @return
 *   Pending RTC interrupt sources. Returns a set of interrupt flags OR-ed
 *   together for multiple interrupt sources in the RTC module (RTC_IFS_nnn).
 ******************************************************************************/
static inline uint32_t RTC_IntGet(void)
{
  return ((RTC_TypeDef *) (0x40080000UL))->IF;
}


/***************************************************************************//**
 * @brief
 *   Set one or more pending RTC interrupts from SW.
 *
 * @param[in] flags
 *   RTC interrupt sources to set to pending. Use a set of interrupt flags
 *   OR-ed together to set multiple interrupt sources for the RTC module
 *   (RTC_IFS_nnn).
 ******************************************************************************/
static inline void RTC_IntSet(uint32_t flags)
{
  ((RTC_TypeDef *) (0x40080000UL))->IFS = flags;
}

void RTC_Reset(void);

/** @} (end addtogroup RTC) */
/** @} (end addtogroup EM_Library) */



/**************************************************************************//**
 * @file udelay.h
 * @brief Microsecond delay routine.
 * @version 4.0.0
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2014 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 *
 ******************************************************************************/



/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */


/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

/***************************************************************************//**
 * @addtogroup Drivers
 * @{
 ******************************************************************************/

/***************************************************************************//**
 * @addtogroup Udelay
 * @{
 ******************************************************************************/


void UDELAY_Calibrate(void);
void UDELAY_Delay(uint32_t usecs);


/** @} (end group Udelay) */
/** @} (end group Drivers) */


/**************************************************************************//**
 * @addtogroup Udelay
 * @{ Implements active wait microsecond delay.
 *
 *  The delay is implemented as a loop coded in assembly. The delay loop must
 *  be calibrated by calling @ref UDELAY_Calibrate() once. The calibration
 *  algorithm is taken from linux 2.4 sources (bogomips).
 *
 *  The delay is fairly accurate, the assembly coding will not be optimized
 *  by the compiler. The delay function should not be used for longer delays
 *  than 1000 us. Calling the delay function with > 1000 will give unpredictable
 *  results.
 *  Recalibrate the loop when HFCORECLK is changed.
 *
 *  The calibration uses the RTC clocked by LFRCO to measure time. Better
 *  accuracy can be achieved by adding \#define UDELAY_LFXO (i.e. add
 *  -DUDELAY_LFXO on the commandline). The LFXO oscillator is then used for
 *  delay loop calibration.
 *
 *  The calibration function will restore RTC upon exit.
 ** @} ***********************************************************************/

/** @cond DO_NOT_INCLUDE_WITH_DOXYGEN */

/* this should be approx 2 Bo*oMips to start (note initial shift), and will
 *    still work even if initially too large, it will just take slightly longer */
volatile unsigned long loops_per_jiffy = (1<<12);

/* This is the number of bits of precision for the loops_per_jiffy.  Each
 *    bit takes on average 1.5/HZ seconds.  This (like the original) is a little
 *       better than 1% */

static void calibrate_delay(void);
static inline uint32_t clock(void);
static void _delay( uint32_t delay);

/** @endcond */

/***************************************************************************//**
 * @brief
 *   Calibrates the microsecond delay loop.
 ******************************************************************************/
void UDELAY_Calibrate(void)
{
  CMU_Select_TypeDef lfaClkSel;
  CMU_ClkDiv_TypeDef rtcClkDiv;
  _Bool rtcRestore       = 0;
  _Bool leClkTurnoff     = 0;
  _Bool rtcClkTurnoff    = 0;
  _Bool lfaClkSrcRestore = 0;
  _Bool lfaClkTurnoff    = 0;
  RTC_Init_TypeDef init = { 1, 0, 1 };
  uint32_t rtcCtrl=0, rtcComp0=0, rtcComp1=0, rtcIen=0;

  /* Ensure LE modules are accessible */
  if ( !( ((CMU_TypeDef *) (0x400C8000UL))->HFCORECLKEN0 & (0x1UL << 4)) )
  {
    CMU_ClockEnable(cmuClock_CORELE, 1);
    leClkTurnoff = 1;
  }

  lfaClkSel = CMU_ClockSelectGet(cmuClock_LFA);

    if ( lfaClkSel != cmuSelect_LFRCO )
    {
      lfaClkSrcRestore = 1;
    }
    if ( !(((CMU_TypeDef *) (0x400C8000UL))->STATUS & (0x1UL << 6)) )
    {
      lfaClkTurnoff = 1;
    }
    /* Enable LFACLK in CMU (will also enable oscillator if not enabled) */
    CMU_ClockSelectSet(cmuClock_LFA, cmuSelect_LFRCO);

  /* Set up a reasonable prescaler. */
  rtcClkDiv = CMU_ClockDivGet(cmuClock_RTC);
  CMU_ClockDivSet(cmuClock_RTC, 256);
  if ( !(((CMU_TypeDef *) (0x400C8000UL))->LFACLKEN0 & (0x1UL << 1)) )
  {
    /* Enable clock to RTC module */
    CMU_ClockEnable(cmuClock_RTC, 1);
    rtcClkTurnoff = 1;
  }


  INT_Disable();

  if ( ((RTC_TypeDef *) (0x40080000UL))->CTRL & (0x1UL << 0) )
  {
    /* Stash away current RTC settings. */
    rtcCtrl   = ((RTC_TypeDef *) (0x40080000UL))->CTRL;
    rtcComp0  = ((RTC_TypeDef *) (0x40080000UL))->COMP0;
    rtcComp1  = ((RTC_TypeDef *) (0x40080000UL))->COMP1;
    rtcIen    = ((RTC_TypeDef *) (0x40080000UL))->IEN;

    ((RTC_TypeDef *) (0x40080000UL))->CTRL = 0x00000000UL;
    ((RTC_TypeDef *) (0x40080000UL))->IEN  = 0;
    ((RTC_TypeDef *) (0x40080000UL))->IFC  = 0x00000007UL;

    NVIC_ClearPendingIRQ( RTC_IRQn );

    rtcRestore = 1;
  }
  init.comp0Top = 0;  /* Count to max before wrapping */

  RTC_Init(&init);        /* Start RTC counter. */


  calibrate_delay();      /* Calibrate the micro second delay loop. */

  INT_Enable();

  /* Restore all RTC related settings to how they were previously set. */
  if ( rtcRestore )
  {
    CMU_ClockDivSet(cmuClock_RTC, rtcClkDiv);
    RTC_FreezeEnable(1);
    ((RTC_TypeDef *) (0x40080000UL))->COMP0 = rtcComp0;
    ((RTC_TypeDef *) (0x40080000UL))->COMP1 = rtcComp1;
    ((RTC_TypeDef *) (0x40080000UL))->CTRL  = rtcCtrl;
    ((RTC_TypeDef *) (0x40080000UL))->IEN   = rtcIen;
    RTC_FreezeEnable(0);
  }
  else
  {
    RTC_Enable(0);
  }

  if ( rtcClkTurnoff )
  {
    CMU_ClockEnable(cmuClock_RTC, 0);
  }

  if ( lfaClkSrcRestore )
  {
    CMU_ClockSelectSet(cmuClock_LFA, lfaClkSel);
  }

  if ( lfaClkTurnoff )
  {
      CMU_OscillatorEnable(cmuOsc_LFRCO, 0, 0);
  }

  if ( leClkTurnoff )
  {
    CMU_ClockEnable(cmuClock_CORELE, 0);
  }
}


/** @cond DO_NOT_INCLUDE_WITH_DOXYGEN */

static void calibrate_delay(void)
{
  /* From linux 2.4 source. */
  unsigned long loopbit;
  unsigned long ticks;
  int lps_precision = 8;

  loops_per_jiffy = (1<<12);

  while (loops_per_jiffy <<= 1) {
    /* wait for "start of" clock tick */
    ticks = clock();
    while (ticks == clock())
      /* nothing */;
    /* Go .. */
    ticks = clock();
    _delay(loops_per_jiffy);
    ticks = clock() - ticks;
    if (ticks)
      break;
  }

  /* Do a binary approximation to get loops_per_jiffy set to equal one clock
     (up to lps_precision bits) */

  loops_per_jiffy >>= 1;
  loopbit = loops_per_jiffy;
  while ( lps_precision-- && (loopbit >>= 1) ) {
    loops_per_jiffy |= loopbit;
    ticks = clock();
    while (ticks == clock());
    ticks = clock();
    _delay(loops_per_jiffy);
    if (clock() != ticks)   /* longer than 1 tick */
      loops_per_jiffy &= ~loopbit;
  }
}

static inline uint32_t clock(void)
{
  return RTC_CounterGet();
}

static void _delay( uint32_t delay)
{
  __asm volatile (
"_delay_1:                         \n"
"        subs    r0, #1            \n"
"        bhi.n   _delay_1          \n" );
}

void UDELAY_Delay( uint32_t usecs )
{
  __asm volatile (
"        cmp     %0, #0            \n"    /* Return if 0 delay. */
"        beq.n   udelay_2          \n"
"        subs    %0, #1            \n"    /* Correct for off by one error. */
"        movs    r2, #0x88         \n"
"        lsls    r2, r2, #8        \n"
"        adds    r2, #0x00         \n"
"        muls    %0, r2            \n"
"                                  \n"
"        ldr     r2, [%1]          \n"
"        movs    r0, %0, lsr #11   \n"
"        movs    r2, r2, lsr #11   \n"
"                                  \n"
"        muls    r0, r2            \n"
"        movs    r0, r0, lsr #6    \n"
"                                  \n"
"        beq.n   udelay_2          \n"
"                                  \n"
"udelay_1:                         \n"
"        subs    r0, #1            \n"
"        bhi.n   udelay_1          \n"
"udelay_2:                         \n" : : "r" (usecs), "r" (&loops_per_jiffy) : "r0", "r2", "cc");
}



/** @endcond */
