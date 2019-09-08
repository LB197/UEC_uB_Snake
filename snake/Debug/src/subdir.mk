################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

CPP_SRCS += \
../src/Food.cpp \
../src/Game.cpp \
../src/Menu.cpp \
../src/Snake.cpp \
../src/main.cpp 

OBJS += \
./src/Food.o \
./src/Game.o \
./src/Menu.o \
./src/Snake.o \
./src/main.o 

CPP_DEPS += \
./src/Food.d \
./src/Game.d \
./src/Menu.d \
./src/Snake.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -Os -g3 -c -fmessage-length=0 -MT"$@" -I../../snake_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


