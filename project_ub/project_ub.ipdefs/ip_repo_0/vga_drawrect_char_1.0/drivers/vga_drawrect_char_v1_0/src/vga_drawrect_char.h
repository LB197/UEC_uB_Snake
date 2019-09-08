
#ifndef VGA_DRAWRECT_CHAR_H
#define VGA_DRAWRECT_CHAR_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG0_OFFSET 0
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG1_OFFSET 4
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG2_OFFSET 8
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG3_OFFSET 12
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG4_OFFSET 16
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG5_OFFSET 20
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG6_OFFSET 24
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG7_OFFSET 28
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG8_OFFSET 32
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG9_OFFSET 36
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG10_OFFSET 40
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG11_OFFSET 44
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG12_OFFSET 48
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG13_OFFSET 52
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG14_OFFSET 56
#define VGA_DRAWRECT_CHAR_S_AXI_CHAR_CTRL_SLV_REG15_OFFSET 60


/**************************** Type Definitions *****************************/
/**
 *
 * Write/Read 32 bit value to/from VGA_DRAWRECT_CHAR user logic memory (BRAM).
 *
 * @param   Address is the memory address of the VGA_DRAWRECT_CHAR device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void VGA_DRAWRECT_CHAR_mWriteMemory(u32 Address, u32 Data)
 * 	u32 VGA_DRAWRECT_CHAR_mReadMemory(u32 Address)
 *
 */
#define VGA_DRAWRECT_CHAR_mWriteMemory(Address, Data) \
    Xil_Out32(Address, (u32)(Data))
#define VGA_DRAWRECT_CHAR_mReadMemory(Address) \
    Xil_In32(Address)

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the VGA_DRAWRECT_CHARinstance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus VGA_DRAWRECT_CHAR_Mem_SelfTest(void * baseaddr_p);

/**
 *
 * Write a value to a VGA_DRAWRECT_CHAR register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the VGA_DRAWRECT_CHARdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void VGA_DRAWRECT_CHAR_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define VGA_DRAWRECT_CHAR_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a VGA_DRAWRECT_CHAR register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the VGA_DRAWRECT_CHAR device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 VGA_DRAWRECT_CHAR_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define VGA_DRAWRECT_CHAR_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the VGA_DRAWRECT_CHAR instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus VGA_DRAWRECT_CHAR_Reg_SelfTest(void * baseaddr_p);

#endif // VGA_DRAWRECT_CHAR_H
