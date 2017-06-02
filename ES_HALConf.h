/**
 * @file    ES_HALConf.h
 * @brief   Configuration file for the ES Framework Hardware Abstraction Layer (HAL)
 * @details This configuration file allows enabling and disabling of hardware
 *          drivers and miscelanous HAL features. The HAL is designed such
 */

#ifndef ES_HALCONF_H
#define ES_HALCONF_H

#include "ES_Configure.h"

#ifdef USE_ES_HAL

// This enables the debug mode logs
#if !defined(USE_ES_HAL_DEBUG_MODE)
#define USE_ES_HAL_DEBUG_MODE       YES
#endif

// This sets the system architecture to use. Options include PIC32 and x86_NIX
// TODO: Pick this up with an environment variable to isolate it from the
//       codebase
#if !defined(ES_HAL_SYS)
#define PIC32 1
#define x86_NIX 2
#define ES_HAL_SYS x86_NIX // default of PIC32
#endif

// This enables the Serial module
#if !defined(USE_ES_HAL_SERIAL)
#define USE_ES_HAL_SERIAL            YES
#endif

// This enables the Keyboard Input
// module. DO NOT DISABLE THIS.
#if !defined(USE_ES_HAL_KEYINPUT)
#define USE_ES_HAL_KEYINPUT          NO
#endif

// This enables the ADC module
#if !defined(USE_ES_HAL_ADC)
#define USE_ES_HAL_ADC               NO
#endif

// This enables the PWM module
#if !defined(USE_ES_HAL_PWM)
#define USE_ES_HAL_PWM               NO
#endif

// This enables the Servo module
#if !defined(USE_ES_HAL_SERVO)
#define USE_ES_HAL_SERVO             NO
#endif

#endif /* USE_ES_HAL */

#endif /* ES_HALCONF_H */
