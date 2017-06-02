#include "ES_HALConf.h"
#include "ES_HAL.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

int main(void)
{
    ES_Return_t ErrorType;

    ES_HAL_Init();

    printf("Starting ES Framework Template\r\n");
    printf("Using the 2nd Generation Events & Services Framework\r\n");


    // Your hardware initialization function calls go here

    // now initialize the Events and Services Framework and start it running
    ErrorType = ES_Initialize();
    if (ErrorType == Success) {
        printf("Initialization complete..calling ES_Run()\n");
        ErrorType = ES_Run();
    }
    //if we got to here, there was an error
    switch (ErrorType) {
    case FailedPointer:
        printf("Failed on NULL pointer");
        break;
    case FailedInit:
        printf("Failed Initialization");
        break;
    default:
        printf("Other Failure: %d", ErrorType);
        break;
    }
    for (;;)
        ;

};

/*------------------------------- Footnotes -------------------------------*/
/*------------------------------ End of file ------------------------------*/
