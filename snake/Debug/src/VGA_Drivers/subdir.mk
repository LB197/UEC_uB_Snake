################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/VGA_Drivers/Mouse.cpp \
../src/VGA_Drivers/Rectangle.cpp \
../src/VGA_Drivers/TextRectangle.cpp \
../src/VGA_Drivers/VgaText.cpp 

OBJS += \
./src/VGA_Drivers/Mouse.o \
./src/VGA_Drivers/Rectangle.o \
./src/VGA_Drivers/TextRectangle.o \
./src/VGA_Drivers/VgaText.o 

CPP_DEPS += \
./src/VGA_Drivers/Mouse.d \
./src/VGA_Drivers/Rectangle.d \
./src/VGA_Drivers/TextRectangle.d \
./src/VGA_Drivers/VgaText.d 


# Each subdirectory must supply rules for building sources it contributes
src/VGA_Drivers/%.o: ../src/VGA_Drivers/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -Os -g3 -c -fmessage-length=0 -MT"$@" -I../../snake_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


