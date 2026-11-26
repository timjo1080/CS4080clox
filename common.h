#ifndef clox_common_h
#define clox_common_h

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

 #define DEBUG_TRACE_EXECUTION

// Enable with -DDEBUG_STRESS_GC and/or -DDEBUG_LOG_GC.
#define UINT8_COUNT (UINT8_MAX + 1)
 #define DEBUG_PRINT_CODE
#endif
