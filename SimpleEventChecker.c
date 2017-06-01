/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "SimpleEventChecker.h"
#include "SimpleService.h"
#include "ES_Events.h"
#include "ES_Framework.h"
#include <time.h>
#include <stdint.h>
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */

uint8_t SimpleEventChecker(void) {
    static clock_t start_cycles = 0;
    static uint32_t prev_elapsed_time = 0;
    // declare and initialize start cycles on first call
    if (start_cycles == 0) {
      start_cycles = clock();
    }

    // declare event and default to not posting an event
    uint32_t elapsed_time = 0;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;

    // calculate elapsed time
    elapsed_time = (uint32_t)(((double) (clock() - start_cycles) * 1000) / CLOCKS_PER_SEC);

    // Post an event every 100 milliseconds
    if (elapsed_time != prev_elapsed_time && elapsed_time % 100 == 0) {
      returnVal = TRUE;
      thisEvent.EventType = MY_TIMER_EVENT;
      thisEvent.EventParam = elapsed_time;
      prev_elapsed_time = elapsed_time;
      PostSimpleService(thisEvent);
    }

    return (returnVal);
}
