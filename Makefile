TARGET = es_instance

INCLUDE_DIRS = -I. -Ies-framework-hal/include

ALL_OBJS = ES_Main.o SimpleEventChecker.o SimpleService.o ES_HAL.o ES_HAL_ADC.o \
					 ES_HAL_KeyInput.o ES_HAL_PWM.o ES_HAL_Serial.o ES_HAL_Servo.o \
					 ES_HAL_System.o ES_HAL_Timers.o x86_NIX_ADC.o x86_NIX_KeyInput.o \
					 x86_NIX_PWM.o x86_NIX_Serial.o x86_NIX_Servo.o x86_NIX_System.o \
					 x86_NIX_Timers.o ES_Framework.o ES_CheckEvents.o ES_KeyboardInput.o \
					 ES_PostList.o ES_Queue.o

SRC_BASE = es-framework-hal/src
INC_BASE = es-framework-hal/include

$(TARGET) : $(ALL_OBJS)
	gcc $(ALL_OBJS) -o $(TARGET)


# MAIN PROJECT CODE
ES_Main.o: ES_Main.c
	gcc -c $^ $(INCLUDE_DIRS)

SimpleEventChecker.o: SimpleEventChecker.c SimpleEventChecker.h
	gcc -c $< $(INCLUDE_DIRS)

SimpleService.o: SimpleService.c SimpleService.h
	gcc -c $< $(INCLUDE_DIRS)


# ES FRAMEWORK
ES_Framework.o: $(SRC_BASE)/ES_Framework.c $(INC_BASE)/ES_Framework.h
	gcc -c $< $(INCLUDE_DIRS)

ES_CheckEvents.o: $(SRC_BASE)/ES_CheckEvents.c $(INC_BASE)/ES_CheckEvents.h
	gcc -c $< $(INCLUDE_DIRS)

ES_KeyboardInput.o: $(SRC_BASE)/ES_KeyboardInput.c $(INC_BASE)/ES_KeyboardInput.h
	gcc -c $< $(INCLUDE_DIRS)

ES_PostList.o: $(SRC_BASE)/ES_PostList.c $(INC_BASE)/ES_PostList.h
	gcc -c $< $(INCLUDE_DIRS)

ES_Queue.o: $(SRC_BASE)/ES_Queue.c $(INC_BASE)/ES_Queue.h
	gcc -c $< $(INCLUDE_DIRS)


# MAIN HAL
ES_HAL.o: $(SRC_BASE)/ES_HAL.c $(INC_BASE)/ES_HAL.h
	gcc -c $< $(INCLUDE_DIRS)


# INTERFACE OBJS
ES_HAL_ADC.o: $(SRC_BASE)/ES_HAL_ADC.c $(INC_BASE)/ES_HAL_ADC.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_KeyInput.o: $(SRC_BASE)/ES_HAL_KeyInput.c $(INC_BASE)/ES_HAL_KeyInput.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_PWM.o: $(SRC_BASE)/ES_HAL_PWM.c $(INC_BASE)/ES_HAL_PWM.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_Serial.o: $(SRC_BASE)/ES_HAL_Serial.c $(INC_BASE)/ES_HAL_Serial.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_Servo.o: $(SRC_BASE)/ES_HAL_Servo.c $(INC_BASE)/ES_HAL_Servo.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_System.o: $(SRC_BASE)/ES_HAL_System.c $(INC_BASE)/ES_HAL_System.h
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_Timers.o: $(SRC_BASE)/ES_HAL_Timers.c $(INC_BASE)/ES_HAL_Timers.h
	gcc -c $< $(INCLUDE_DIRS)


# INTERFACE DRIVER OBJS
x86_NIX_ADC.o: $(SRC_BASE)/x86_NIX_ADC.c $(INC_BASE)/x86_NIX_ADC.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_KeyInput.o: $(SRC_BASE)/x86_NIX_KeyInput.c $(INC_BASE)/x86_NIX_KeyInput.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_PWM.o: $(SRC_BASE)/x86_NIX_PWM.c $(INC_BASE)/x86_NIX_PWM.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_Serial.o: $(SRC_BASE)/x86_NIX_Serial.c $(INC_BASE)/x86_NIX_Serial.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_Servo.o: $(SRC_BASE)/x86_NIX_Servo.c $(INC_BASE)/x86_NIX_Servo.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_System.o: $(SRC_BASE)/x86_NIX_System.c $(INC_BASE)/x86_NIX_System.h
	gcc -c $< $(INCLUDE_DIRS)

x86_NIX_Timers.o: $(SRC_BASE)/x86_NIX_Timers.c $(INC_BASE)/x86_NIX_Timers.h
	gcc -c $< $(INCLUDE_DIRS)


clean:
	rm -f *.o *.a $(TARGET)
