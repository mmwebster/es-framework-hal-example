TARGET = es_instance

INCLUDE_DIRS = -I. -Ies-hal/include

ALL_OBJS = ES_Main.o SimpleEventChecker.o SimpleService.o ES_HAL.o ES_HAL_ADC.o \
					 ES_HAL_KeyInput.o ES_HAL_PWM.o ES_HAL_Serial.o ES_HAL_Servo.o \
					 ES_HAL_System.o ES_HAL_Timers.o x86_NIX_ADC.o x86_NIX_KeyInput.o \
					 x86_NIX_PWM.o x86_NIX_Serial.o x86_NIX_Servo.o x86_NIX_System.o \
					 x86_NIX_Timers.o ES_Framework.o ES_CheckEvents.o ES_KeyboardInput.o \
					 ES_PostList.o ES_Queue.o

SRC_BASE = es-hal/src

$(TARGET) : $(ALL_OBJS)
	gcc $(ALL_OBJS) -o $(TARGET)


# MAIN PROJECT CODE
ES_Main.o: ES_Main.c
	gcc -c $^ $(INCLUDE_DIRS)

SimpleEventChecker.o: SimpleEventChecker.c
	gcc -c $^ $(INCLUDE_DIRS)

SimpleService.o: SimpleService.c
	gcc -c $^ $(INCLUDE_DIRS)


# ES FRAMEWORK
ES_Framework.o: $(SRC_BASE)/ES_Framework.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_CheckEvents.o: $(SRC_BASE)/ES_CheckEvents.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_KeyboardInput.o: $(SRC_BASE)/ES_KeyboardInput.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_PostList.o: $(SRC_BASE)/ES_PostList.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_Queue.o: $(SRC_BASE)/ES_Queue.c
	gcc -c $^ $(INCLUDE_DIRS)


# MAIN HAL
ES_HAL.o: $(SRC_BASE)/ES_HAL.c
	gcc -c $^ $(INCLUDE_DIRS)


# INTERFACE OBJS
ES_HAL_ADC.o: $(SRC_BASE)/ES_HAL_ADC.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_HAL_KeyInput.o: $(SRC_BASE)/ES_HAL_KeyInput.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_HAL_PWM.o: $(SRC_BASE)/ES_HAL_PWM.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_HAL_Serial.o: $(SRC_BASE)/ES_HAL_Serial.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_HAL_Servo.o: $(SRC_BASE)/ES_HAL_Servo.c
	gcc -c $^ $(INCLUDE_DIRS)

ES_HAL_System.o: $(SRC_BASE)/ES_HAL_System.c
	gcc -c $< $(INCLUDE_DIRS)

ES_HAL_Timers.o: $(SRC_BASE)/ES_HAL_Timers.c
	gcc -c $^ $(INCLUDE_DIRS)


# INTERFACE DRIVER OBJS
x86_NIX_ADC.o: $(SRC_BASE)/x86_NIX_ADC.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_KeyInput.o: $(SRC_BASE)/x86_NIX_KeyInput.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_PWM.o: $(SRC_BASE)/x86_NIX_PWM.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_Serial.o: $(SRC_BASE)/x86_NIX_Serial.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_Servo.o: $(SRC_BASE)/x86_NIX_Servo.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_System.o: $(SRC_BASE)/x86_NIX_System.c
	gcc -c $^ $(INCLUDE_DIRS)

x86_NIX_Timers.o: $(SRC_BASE)/x86_NIX_Timers.c
	gcc -c $^ $(INCLUDE_DIRS)


clean:
	rm -f *.o *.a $(TARGET)
