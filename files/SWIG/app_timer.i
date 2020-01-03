#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"










 
#line 1 "..\\config\\sdk_config.h"












 






 






 






 






 












 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 













#line 237 "..\\config\\sdk_config.h"









 







 









 




















#line 373 "..\\config\\sdk_config.h"



 

















 




















#line 559 "..\\config\\sdk_config.h"




#line 634 "..\\config\\sdk_config.h"




#line 688 "..\\config\\sdk_config.h"



 






 







#line 826 "..\\config\\sdk_config.h"




#line 931 "..\\config\\sdk_config.h"




#line 969 "..\\config\\sdk_config.h"




#line 1035 "..\\config\\sdk_config.h"




#line 1095 "..\\config\\sdk_config.h"




#line 1176 "..\\config\\sdk_config.h"










#line 1235 "..\\config\\sdk_config.h"



 






















 





































#line 1311 "..\\config\\sdk_config.h"




#line 1327 "..\\config\\sdk_config.h"







#line 1428 "..\\config\\sdk_config.h"




#line 1516 "..\\config\\sdk_config.h"




#line 1598 "..\\config\\sdk_config.h"









 








 








 






















 
















 






 






 










#line 1730 "..\\config\\sdk_config.h"









 
 







 






 







#line 1782 "..\\config\\sdk_config.h"









 






 












 







#line 1832 "..\\config\\sdk_config.h"



 






 






 






 






































 



















































 







#line 1975 "..\\config\\sdk_config.h"




#line 2036 "..\\config\\sdk_config.h"




#line 2050 "..\\config\\sdk_config.h"



 






 







#line 2129 "..\\config\\sdk_config.h"




#line 2170 "..\\config\\sdk_config.h"




#line 2196 "..\\config\\sdk_config.h"



 













#line 2314 "..\\config\\sdk_config.h"


























 










































 








 










 














#line 13 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"










 


























 

#line 43 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"










 








 




#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 26 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int __ARM_vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int __ARM_vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int __ARM_vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));
   








 

extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 1021 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 27 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 28 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"




























 
 



 




#line 46 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"

     
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"

 








































 





 



 









 

typedef enum {
 
  Reset_IRQn                    = -15,               
  NonMaskableInt_IRQn           = -14,               
  HardFault_IRQn                = -13,               
  MemoryManagement_IRQn         = -12,              
 
  BusFault_IRQn                 = -11,              
 
  UsageFault_IRQn               = -10,               
  SVCall_IRQn                   =  -5,               
  DebugMonitor_IRQn             =  -4,               
  PendSV_IRQn                   =  -2,               
  SysTick_IRQn                  =  -1,               
 
  POWER_CLOCK_IRQn              =   0,               
  RADIO_IRQn                    =   1,               
  UARTE0_UART0_IRQn             =   2,               
  SPIM0_SPIS0_TWIM0_TWIS0_SPI0_TWI0_IRQn=   3,       
  SPIM1_SPIS1_TWIM1_TWIS1_SPI1_TWI1_IRQn=   4,       
  NFCT_IRQn                     =   5,               
  GPIOTE_IRQn                   =   6,               
  SAADC_IRQn                    =   7,               
  TIMER0_IRQn                   =   8,               
  TIMER1_IRQn                   =   9,               
  TIMER2_IRQn                   =  10,               
  RTC0_IRQn                     =  11,               
  TEMP_IRQn                     =  12,               
  RNG_IRQn                      =  13,               
  ECB_IRQn                      =  14,               
  CCM_AAR_IRQn                  =  15,               
  WDT_IRQn                      =  16,               
  RTC1_IRQn                     =  17,               
  QDEC_IRQn                     =  18,               
  COMP_LPCOMP_IRQn              =  19,               
  SWI0_EGU0_IRQn                =  20,               
  SWI1_EGU1_IRQn                =  21,               
  SWI2_EGU2_IRQn                =  22,               
  SWI3_EGU3_IRQn                =  23,               
  SWI4_EGU4_IRQn                =  24,               
  SWI5_EGU5_IRQn                =  25,               
  TIMER3_IRQn                   =  26,               
  TIMER4_IRQn                   =  27,               
  PWM0_IRQn                     =  28,               
  PDM_IRQn                      =  29,               
  MWU_IRQn                      =  32,               
  PWM1_IRQn                     =  33,               
  PWM2_IRQn                     =  34,               
  SPIM2_SPIS2_SPI2_IRQn         =  35,               
  RTC2_IRQn                     =  36,               
  I2S_IRQn                      =  37,               
  FPU_IRQn                      =  38                
} IRQn_Type;




 


 
 
 

 





   

#line 1 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"
 




 

























 











#line 45 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

















 




 



 

 













#line 120 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"



 
#line 135 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

#line 209 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

#line 1 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmInstr.h"
 




 

























 












 



 

 
#line 1 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\cmsis_armcc.h"
 




 

























 










 



 

 
 





 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}






 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}






 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}






 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}






 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}






 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}






 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}






 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}






 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}






 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}






 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 







 







 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}






 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xFFU);
}







 
static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  register uint32_t __regBasePriMax      __asm("basepri_max");
  __regBasePriMax = (basePri & 0xFFU);
}






 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}






 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & (uint32_t)1);
}










 
static __inline uint32_t __get_FPSCR(void)
{

  register uint32_t __regfpscr         __asm("fpscr");
  return(__regfpscr);



}






 
static __inline void __set_FPSCR(uint32_t fpscr)
{

  register uint32_t __regfpscr         __asm("fpscr");
  __regfpscr = (fpscr);

}





 


 



 




 






 







 






 








 










 










 











 








 

__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}







 

__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}









 









 








 
#line 455 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\cmsis_armcc.h"







 










 












 












 














 














 














 










 









 









 









 

__attribute__((section(".rrx_text"))) static __inline __asm uint32_t __RRX(uint32_t value)
{
  rrx r0, r0
  bx lr
}








 








 








 








 








 








 




   


 



 



#line 720 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\cmsis_armcc.h"











 


#line 54 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmInstr.h"

 
#line 84 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmInstr.h"

   

#line 211 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmFunc.h"
 




 

























 












 



 

 
#line 54 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmFunc.h"

 
#line 84 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmFunc.h"

 

#line 212 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmSimd.h"
 




 

























 
















 



 

 
#line 58 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmSimd.h"

 
#line 88 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cmSimd.h"

 






#line 213 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"
















 
#line 256 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

 






 
#line 272 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

 




 













 



 






 



 
typedef union
{
  struct
  {
    uint32_t _reserved0:16;               
    uint32_t GE:4;                        
    uint32_t _reserved1:7;                
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;

 





















 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;

 






 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:7;                
    uint32_t GE:4;                        
    uint32_t _reserved1:4;                
    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;

 






























 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 









 







 



 
typedef struct
{
  volatile uint32_t ISER[8U];                
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];                
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];                
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];                
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];                
        uint32_t RESERVED4[56U];
  volatile uint8_t  IP[240U];                
        uint32_t RESERVED5[644U];
  volatile  uint32_t STIR;                    
}  NVIC_Type;

 



 







 



 
typedef struct
{
  volatile const  uint32_t CPUID;                   
  volatile uint32_t ICSR;                    
  volatile uint32_t VTOR;                    
  volatile uint32_t AIRCR;                   
  volatile uint32_t SCR;                     
  volatile uint32_t CCR;                     
  volatile uint8_t  SHP[12U];                
  volatile uint32_t SHCSR;                   
  volatile uint32_t CFSR;                    
  volatile uint32_t HFSR;                    
  volatile uint32_t DFSR;                    
  volatile uint32_t MMFAR;                   
  volatile uint32_t BFAR;                    
  volatile uint32_t AFSR;                    
  volatile const  uint32_t PFR[2U];                 
  volatile const  uint32_t DFR;                     
  volatile const  uint32_t ADR;                     
  volatile const  uint32_t MMFR[4U];                
  volatile const  uint32_t ISAR[5U];                
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;                   
} SCB_Type;

 















 






























 



 





















 









 


















 










































 









 









 















 







 



 
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const  uint32_t ICTR;                    
  volatile uint32_t ACTLR;                   
} SCnSCB_Type;

 



 















 







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t LOAD;                    
  volatile uint32_t VAL;                     
  volatile const  uint32_t CALIB;                   
} SysTick_Type;

 












 



 



 









 







 



 
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                  
    volatile  uint16_t   u16;                 
    volatile  uint32_t   u32;                 
  }  PORT [32U];                          
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;                     
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;                     
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;                     
        uint32_t RESERVED3[29U];
  volatile  uint32_t IWR;                     
  volatile const  uint32_t IRR;                     
  volatile uint32_t IMCR;                    
        uint32_t RESERVED4[43U];
  volatile  uint32_t LAR;                     
  volatile const  uint32_t LSR;                     
        uint32_t RESERVED5[6U];
  volatile const  uint32_t PID4;                    
  volatile const  uint32_t PID5;                    
  volatile const  uint32_t PID6;                    
  volatile const  uint32_t PID7;                    
  volatile const  uint32_t PID0;                    
  volatile const  uint32_t PID1;                    
  volatile const  uint32_t PID2;                    
  volatile const  uint32_t PID3;                    
  volatile const  uint32_t CID0;                    
  volatile const  uint32_t CID1;                    
  volatile const  uint32_t CID2;                    
  volatile const  uint32_t CID3;                    
} ITM_Type;

 



 



























 



 



 



 









   







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t CYCCNT;                  
  volatile uint32_t CPICNT;                  
  volatile uint32_t EXCCNT;                  
  volatile uint32_t SLEEPCNT;                
  volatile uint32_t LSUCNT;                  
  volatile uint32_t FOLDCNT;                 
  volatile const  uint32_t PCSR;                    
  volatile uint32_t COMP0;                   
  volatile uint32_t MASK0;                   
  volatile uint32_t FUNCTION0;               
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;                   
  volatile uint32_t MASK1;                   
  volatile uint32_t FUNCTION1;               
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;                   
  volatile uint32_t MASK2;                   
  volatile uint32_t FUNCTION2;               
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;                   
  volatile uint32_t MASK3;                   
  volatile uint32_t FUNCTION3;               
} DWT_Type;

 






















































 



 



 



 



 



 



 



























   







 



 
typedef struct
{
  volatile uint32_t SSPSR;                   
  volatile uint32_t CSPSR;                   
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;                    
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;                    
        uint32_t RESERVED2[131U];
  volatile const  uint32_t FFSR;                    
  volatile uint32_t FFCR;                    
  volatile const  uint32_t FSCR;                    
        uint32_t RESERVED3[759U];
  volatile const  uint32_t TRIGGER;                 
  volatile const  uint32_t FIFO0;                   
  volatile const  uint32_t ITATBCTR2;               
        uint32_t RESERVED4[1U];
  volatile const  uint32_t ITATBCTR0;               
  volatile const  uint32_t FIFO1;                   
  volatile uint32_t ITCTRL;                  
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;                
  volatile uint32_t CLAIMCLR;                
        uint32_t RESERVED7[8U];
  volatile const  uint32_t DEVID;                   
  volatile const  uint32_t DEVTYPE;                 
} TPI_Type;

 



 



 












 






 



 





















 



 





















 



 



 


















 






   








 



 
typedef struct
{
  volatile const  uint32_t TYPE;                    
  volatile uint32_t CTRL;                    
  volatile uint32_t RNR;                     
  volatile uint32_t RBAR;                    
  volatile uint32_t RASR;                    
  volatile uint32_t RBAR_A1;                 
  volatile uint32_t RASR_A1;                 
  volatile uint32_t RBAR_A2;                 
  volatile uint32_t RASR_A2;                 
  volatile uint32_t RBAR_A3;                 
  volatile uint32_t RASR_A3;                 
} MPU_Type;

 









 









 



 









 






























 









 



 
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;                   
  volatile uint32_t FPCAR;                   
  volatile uint32_t FPDSCR;                  
  volatile const  uint32_t MVFR0;                   
  volatile const  uint32_t MVFR1;                   
} FPU_Type;

 



























 



 












 
























 












 








 



 
typedef struct
{
  volatile uint32_t DHCSR;                   
  volatile  uint32_t DCRSR;                   
  volatile uint32_t DCRDR;                   
  volatile uint32_t DEMCR;                   
} CoreDebug_Type;

 




































 






 







































 







 






 







 


 







 

 
#line 1541 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"

#line 1550 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\4.5.0\\CMSIS\\Include\\core_cm4.h"











 










 


 



 





 









 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);              

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                    
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));  
  reg_value  =  (reg_value                                   |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U)                      );               
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}






 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}






 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}






 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}








 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
}






 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}






 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}








 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
}








 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) < 0)
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 3)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)]               = (uint8_t)((priority << (8U - 3)) & (uint32_t)0xFFUL);
  }
}










 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) < 0)
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] >> (8U - 3)));
  }
  else
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)]               >> (8U - 3)));
  }
}












 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3)) ? (uint32_t)(3) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(3)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority     & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL)))
         );
}












 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(3)) ? (uint32_t)(3) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(3)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(3));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority     = (Priority                   ) & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL);
}





 
static __inline void NVIC_SystemReset(void)
{
  do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);                                                          
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = (uint32_t)((0x5FAUL << 16U)    |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U)    );          
  do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);                                                           

  for(;;)                                                            
  {
    __nop();
  }
}

 



 





 













 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);                                                    
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = (uint32_t)(ticks - 1UL);                          
  NVIC_SetPriority (SysTick_IRQn, (1UL << 3) - 1UL);  
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0UL;                                              
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2U) |
                   (1UL << 1U)   |
                   (1UL );                          
  return (0UL);                                                      
}



 



 





 

extern volatile int32_t ITM_RxBuffer;                     










 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&       
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL               ) != 0UL)   )      
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}







 
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;                            

  if (ITM_RxBuffer != 0x5AA55AA5U)
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5U;        
  }

  return (ch);
}







 
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == 0x5AA55AA5U)
  {
    return (0);                               
  }
  else
  {
    return (1);                               
  }
}

 










#line 138 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\system_nrf52.h"




























 
 







#line 39 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\system_nrf52.h"


extern uint32_t SystemCoreClock;     









 
extern void SystemInit (void);









 
extern void SystemCoreClockUpdate (void);





#line 139 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"


 
 
 




 


 

  #pragma push
  #pragma anon_unions
#line 166 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"


typedef struct {
  volatile const  uint32_t  PART;                               
  volatile const  uint32_t  VARIANT;                            
  volatile const  uint32_t  PACKAGE;                            
  volatile const  uint32_t  RAM;                                
  volatile const  uint32_t  FLASH;                              
  volatile uint32_t  UNUSED0[3];                         
} FICR_INFO_Type;

typedef struct {
  volatile const  uint32_t  A0;                                 
  volatile const  uint32_t  A1;                                 
  volatile const  uint32_t  A2;                                 
  volatile const  uint32_t  A3;                                 
  volatile const  uint32_t  A4;                                 
  volatile const  uint32_t  A5;                                 
  volatile const  uint32_t  B0;                                 
  volatile const  uint32_t  B1;                                 
  volatile const  uint32_t  B2;                                 
  volatile const  uint32_t  B3;                                 
  volatile const  uint32_t  B4;                                 
  volatile const  uint32_t  B5;                                 
  volatile const  uint32_t  T0;                                 
  volatile const  uint32_t  T1;                                 
  volatile const  uint32_t  T2;                                 
  volatile const  uint32_t  T3;                                 
  volatile const  uint32_t  T4;                                 
} FICR_TEMP_Type;

typedef struct {
  volatile const  uint32_t  TAGHEADER0;                        
 
  volatile const  uint32_t  TAGHEADER1;                        
 
  volatile const  uint32_t  TAGHEADER2;                        
 
  volatile const  uint32_t  TAGHEADER3;                        
 
} FICR_NFC_Type;

typedef struct {
  volatile uint32_t  POWER;                              
  volatile  uint32_t  POWERSET;                           
  volatile  uint32_t  POWERCLR;                           
  volatile const  uint32_t  RESERVED0;
} POWER_RAM_Type;

typedef struct {
  volatile uint32_t  RTS;                                
  volatile uint32_t  TXD;                                
  volatile uint32_t  CTS;                                
  volatile uint32_t  RXD;                                
} UARTE_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} UARTE_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} UARTE_TXD_Type;

typedef struct {
  volatile uint32_t  SCK;                                
  volatile uint32_t  MOSI;                               
  volatile uint32_t  MISO;                               
} SPIM_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
  volatile uint32_t  LIST;                               
} SPIM_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
  volatile uint32_t  LIST;                               
} SPIM_TXD_Type;

typedef struct {
  volatile uint32_t  SCK;                                
  volatile uint32_t  MISO;                               
  volatile uint32_t  MOSI;                               
  volatile uint32_t  CSN;                                
} SPIS_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} SPIS_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} SPIS_TXD_Type;

typedef struct {
  volatile uint32_t  SCL;                                
  volatile uint32_t  SDA;                                
} TWIM_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
  volatile uint32_t  LIST;                               
} TWIM_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
  volatile uint32_t  LIST;                               
} TWIM_TXD_Type;

typedef struct {
  volatile uint32_t  SCL;                                
  volatile uint32_t  SDA;                                
} TWIS_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} TWIS_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} TWIS_TXD_Type;

typedef struct {
  volatile uint32_t  SCK;                                
  volatile uint32_t  MOSI;                               
  volatile uint32_t  MISO;                               
} SPI_PSEL_Type;

typedef struct {
  volatile uint32_t  RX;                                 
} NFCT_FRAMESTATUS_Type;

typedef struct {
  volatile uint32_t  FRAMECONFIG;                        
  volatile uint32_t  AMOUNT;                             
} NFCT_TXD_Type;

typedef struct {
  volatile uint32_t  FRAMECONFIG;                        
  volatile const  uint32_t  AMOUNT;                             
} NFCT_RXD_Type;

typedef struct {
  volatile uint32_t  LIMITH;                             
  volatile uint32_t  LIMITL;                             
} SAADC_EVENTS_CH_Type;

typedef struct {
  volatile uint32_t  PSELP;                              
  volatile uint32_t  PSELN;                              
  volatile uint32_t  CONFIG;                             
  volatile uint32_t  LIMIT;                             
 
} SAADC_CH_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
  volatile const  uint32_t  AMOUNT;                             
} SAADC_RESULT_Type;

typedef struct {
  volatile uint32_t  LED;                                
  volatile uint32_t  A;                                  
  volatile uint32_t  B;                                  
} QDEC_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                               
 
  volatile uint32_t  CNT;                               
 
  volatile uint32_t  REFRESH;                           
 
  volatile uint32_t  ENDDELAY;                           
  volatile const  uint32_t  RESERVED1[4];
} PWM_SEQ_Type;

typedef struct {
  volatile uint32_t  OUT[4];                            
 
} PWM_PSEL_Type;

typedef struct {
  volatile uint32_t  CLK;                                
  volatile uint32_t  DIN;                                
} PDM_PSEL_Type;

typedef struct {
  volatile uint32_t  PTR;                                
  volatile uint32_t  MAXCNT;                             
} PDM_SAMPLE_Type;

typedef struct {
  volatile  uint32_t  EN;                                 
  volatile  uint32_t  DIS;                                
} PPI_TASKS_CHG_Type;

typedef struct {
  volatile uint32_t  EEP;                                
  volatile uint32_t  TEP;                                
} PPI_CH_Type;

typedef struct {
  volatile uint32_t  TEP;                                
} PPI_FORK_Type;

typedef struct {
  volatile uint32_t  WA;                                 
  volatile uint32_t  RA;                                 
} MWU_EVENTS_REGION_Type;

typedef struct {
  volatile uint32_t  WA;                                
 
  volatile uint32_t  RA;                                 
} MWU_EVENTS_PREGION_Type;

typedef struct {
  volatile uint32_t  SUBSTATWA;                         

 
  volatile uint32_t  SUBSTATRA;                         

 
} MWU_PERREGION_Type;

typedef struct {
  volatile uint32_t  START;                              
  volatile uint32_t  END;                                
  volatile const  uint32_t  RESERVED2[2];
} MWU_REGION_Type;

typedef struct {
  volatile const  uint32_t  START;                              
  volatile const  uint32_t  END;                                
  volatile uint32_t  SUBS;                               
  volatile const  uint32_t  RESERVED3;
} MWU_PREGION_Type;

typedef struct {
  volatile uint32_t  MODE;                               
  volatile uint32_t  RXEN;                               
  volatile uint32_t  TXEN;                               
  volatile uint32_t  MCKEN;                              
  volatile uint32_t  MCKFREQ;                            
  volatile uint32_t  RATIO;                              
  volatile uint32_t  SWIDTH;                             
  volatile uint32_t  ALIGN;                              
  volatile uint32_t  FORMAT;                             
  volatile uint32_t  CHANNELS;                           
} I2S_CONFIG_Type;

typedef struct {
  volatile uint32_t  PTR;                                
} I2S_RXD_Type;

typedef struct {
  volatile uint32_t  PTR;                                
} I2S_TXD_Type;

typedef struct {
  volatile uint32_t  MAXCNT;                             
} I2S_RXTXD_Type;

typedef struct {
  volatile uint32_t  MCK;                                
  volatile uint32_t  SCK;                                
  volatile uint32_t  LRCK;                               
  volatile uint32_t  SDIN;                               
  volatile uint32_t  SDOUT;                              
} I2S_PSEL_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[4];
  volatile const  uint32_t  CODEPAGESIZE;                       
  volatile const  uint32_t  CODESIZE;                           
  volatile const  uint32_t  RESERVED1[18];
  volatile const  uint32_t  DEVICEID[2];                        
  volatile const  uint32_t  RESERVED2[6];
  volatile const  uint32_t  ER[4];                              
  volatile const  uint32_t  IR[4];                              
  volatile const  uint32_t  DEVICEADDRTYPE;                     
  volatile const  uint32_t  DEVICEADDR[2];                      
  volatile const  uint32_t  RESERVED3[21];
  FICR_INFO_Type INFO;                               
  volatile const  uint32_t  RESERVED4[185];
  FICR_TEMP_Type TEMP;                               
  volatile const  uint32_t  RESERVED5[2];
  FICR_NFC_Type NFC;                                 
} NRF_FICR_Type;


 
 
 




 

typedef struct {                                     
  volatile uint32_t  UNUSED0;                            
  volatile uint32_t  UNUSED1;                            
  volatile uint32_t  UNUSED2;                            
  volatile const  uint32_t  RESERVED0;
  volatile uint32_t  UNUSED3;                            
  volatile uint32_t  NRFFW[15];                          
  volatile uint32_t  NRFHW[12];                          
  volatile uint32_t  CUSTOMER[32];                       
  volatile const  uint32_t  RESERVED1[64];
  volatile uint32_t  PSELRESET[2];                      
 
  volatile uint32_t  APPROTECT;                          
  volatile uint32_t  NFCPINS;                           
 
} NRF_UICR_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[384];
  volatile uint32_t  CONFIG0;                            
  volatile uint32_t  CONFIG1;                            
  volatile uint32_t  DISABLEINDEBUG;                     
  volatile uint32_t  UNUSED0;                            
  volatile uint32_t  CONFIG2;                            
  volatile uint32_t  CONFIG3;                            
} NRF_BPROT_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[30];
  volatile  uint32_t  TASKS_CONSTLAT;                     
  volatile  uint32_t  TASKS_LOWPWR;                       
  volatile const  uint32_t  RESERVED1[34];
  volatile uint32_t  EVENTS_POFWARN;                     
  volatile const  uint32_t  RESERVED2[2];
  volatile uint32_t  EVENTS_SLEEPENTER;                  
  volatile uint32_t  EVENTS_SLEEPEXIT;                   
  volatile const  uint32_t  RESERVED3[122];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED4[61];
  volatile uint32_t  RESETREAS;                          
  volatile const  uint32_t  RESERVED5[9];
  volatile const  uint32_t  RAMSTATUS;                          
  volatile const  uint32_t  RESERVED6[53];
  volatile  uint32_t  SYSTEMOFF;                          
  volatile const  uint32_t  RESERVED7[3];
  volatile uint32_t  POFCON;                             
  volatile const  uint32_t  RESERVED8[2];
  volatile uint32_t  GPREGRET;                           
  volatile uint32_t  GPREGRET2;                          
  volatile uint32_t  RAMON;                             
 
  volatile const  uint32_t  RESERVED9[11];
  volatile uint32_t  RAMONB;                            
 
  volatile const  uint32_t  RESERVED10[8];
  volatile uint32_t  DCDCEN;                             
  volatile const  uint32_t  RESERVED11[225];
  POWER_RAM_Type RAM[8];                             
} NRF_POWER_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_HFCLKSTART;                   
  volatile  uint32_t  TASKS_HFCLKSTOP;                    
  volatile  uint32_t  TASKS_LFCLKSTART;                   
  volatile  uint32_t  TASKS_LFCLKSTOP;                    
  volatile  uint32_t  TASKS_CAL;                          
  volatile  uint32_t  TASKS_CTSTART;                      
  volatile  uint32_t  TASKS_CTSTOP;                       
  volatile const  uint32_t  RESERVED0[57];
  volatile uint32_t  EVENTS_HFCLKSTARTED;                
  volatile uint32_t  EVENTS_LFCLKSTARTED;                
  volatile const  uint32_t  RESERVED1;
  volatile uint32_t  EVENTS_DONE;                        
  volatile uint32_t  EVENTS_CTTO;                        
  volatile const  uint32_t  RESERVED2[124];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[63];
  volatile const  uint32_t  HFCLKRUN;                           
  volatile const  uint32_t  HFCLKSTAT;                          
  volatile const  uint32_t  RESERVED4;
  volatile const  uint32_t  LFCLKRUN;                           
  volatile const  uint32_t  LFCLKSTAT;                          
  volatile const  uint32_t  LFCLKSRCCOPY;                       
  volatile const  uint32_t  RESERVED5[62];
  volatile uint32_t  LFCLKSRC;                           
  volatile const  uint32_t  RESERVED6[7];
  volatile uint32_t  CTIV;                               
  volatile const  uint32_t  RESERVED7[8];
  volatile uint32_t  TRACECONFIG;                        
} NRF_CLOCK_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_TXEN;                         
  volatile  uint32_t  TASKS_RXEN;                         
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_DISABLE;                      
  volatile  uint32_t  TASKS_RSSISTART;                   
 
  volatile  uint32_t  TASKS_RSSISTOP;                     
  volatile  uint32_t  TASKS_BCSTART;                      
  volatile  uint32_t  TASKS_BCSTOP;                       
  volatile const  uint32_t  RESERVED0[55];
  volatile uint32_t  EVENTS_READY;                       
  volatile uint32_t  EVENTS_ADDRESS;                     
  volatile uint32_t  EVENTS_PAYLOAD;                     
  volatile uint32_t  EVENTS_END;                         
  volatile uint32_t  EVENTS_DISABLED;                    
  volatile uint32_t  EVENTS_DEVMATCH;                    
  volatile uint32_t  EVENTS_DEVMISS;                     
  volatile uint32_t  EVENTS_RSSIEND;                     
  volatile const  uint32_t  RESERVED1[2];
  volatile uint32_t  EVENTS_BCMATCH;                     
  volatile const  uint32_t  RESERVED2;
  volatile uint32_t  EVENTS_CRCOK;                       
  volatile uint32_t  EVENTS_CRCERROR;                    
  volatile const  uint32_t  RESERVED3[50];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED4[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED5[61];
  volatile const  uint32_t  CRCSTATUS;                          
  volatile const  uint32_t  RESERVED6;
  volatile const  uint32_t  RXMATCH;                            
  volatile const  uint32_t  RXCRC;                              
  volatile const  uint32_t  DAI;                                
  volatile const  uint32_t  RESERVED7[60];
  volatile uint32_t  PACKETPTR;                          
  volatile uint32_t  FREQUENCY;                          
  volatile uint32_t  TXPOWER;                            
  volatile uint32_t  MODE;                               
  volatile uint32_t  PCNF0;                              
  volatile uint32_t  PCNF1;                              
  volatile uint32_t  BASE0;                              
  volatile uint32_t  BASE1;                              
  volatile uint32_t  PREFIX0;                            
  volatile uint32_t  PREFIX1;                            
  volatile uint32_t  TXADDRESS;                          
  volatile uint32_t  RXADDRESSES;                        
  volatile uint32_t  CRCCNF;                             
  volatile uint32_t  CRCPOLY;                            
  volatile uint32_t  CRCINIT;                            
  volatile uint32_t  UNUSED0;                            
  volatile uint32_t  TIFS;                               
  volatile const  uint32_t  RSSISAMPLE;                         
  volatile const  uint32_t  RESERVED8;
  volatile const  uint32_t  STATE;                              
  volatile uint32_t  DATAWHITEIV;                        
  volatile const  uint32_t  RESERVED9[2];
  volatile uint32_t  BCC;                                
  volatile const  uint32_t  RESERVED10[39];
  volatile uint32_t  DAB[8];                             
  volatile uint32_t  DAP[8];                             
  volatile uint32_t  DACNF;                              
  volatile const  uint32_t  RESERVED11[3];
  volatile uint32_t  MODECNF0;                           
  volatile const  uint32_t  RESERVED12[618];
  volatile uint32_t  POWER;                              
} NRF_RADIO_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_STARTRX;                      
  volatile  uint32_t  TASKS_STOPRX;                       
  volatile  uint32_t  TASKS_STARTTX;                      
  volatile  uint32_t  TASKS_STOPTX;                       
  volatile const  uint32_t  RESERVED0[7];
  volatile  uint32_t  TASKS_FLUSHRX;                      
  volatile const  uint32_t  RESERVED1[52];
  volatile uint32_t  EVENTS_CTS;                         
  volatile uint32_t  EVENTS_NCTS;                        
  volatile uint32_t  EVENTS_RXDRDY;                     
 
  volatile const  uint32_t  RESERVED2;
  volatile uint32_t  EVENTS_ENDRX;                       
  volatile const  uint32_t  RESERVED3[2];
  volatile uint32_t  EVENTS_TXDRDY;                      
  volatile uint32_t  EVENTS_ENDTX;                       
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED4[7];
  volatile uint32_t  EVENTS_RXTO;                        
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  EVENTS_RXSTARTED;                   
  volatile uint32_t  EVENTS_TXSTARTED;                   
  volatile const  uint32_t  RESERVED6;
  volatile uint32_t  EVENTS_TXSTOPPED;                   
  volatile const  uint32_t  RESERVED7[41];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED8[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED9[93];
  volatile uint32_t  ERRORSRC;                           
  volatile const  uint32_t  RESERVED10[31];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED11;
  UARTE_PSEL_Type PSEL;                              
  volatile const  uint32_t  RESERVED12[3];
  volatile uint32_t  BAUDRATE;                           
  volatile const  uint32_t  RESERVED13[3];
  UARTE_RXD_Type RXD;                                
  volatile const  uint32_t  RESERVED14;
  UARTE_TXD_Type TXD;                                
  volatile const  uint32_t  RESERVED15[7];
  volatile uint32_t  CONFIG;                             
} NRF_UARTE_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_STARTRX;                      
  volatile  uint32_t  TASKS_STOPRX;                       
  volatile  uint32_t  TASKS_STARTTX;                      
  volatile  uint32_t  TASKS_STOPTX;                       
  volatile const  uint32_t  RESERVED0[3];
  volatile  uint32_t  TASKS_SUSPEND;                      
  volatile const  uint32_t  RESERVED1[56];
  volatile uint32_t  EVENTS_CTS;                         
  volatile uint32_t  EVENTS_NCTS;                        
  volatile uint32_t  EVENTS_RXDRDY;                      
  volatile const  uint32_t  RESERVED2[4];
  volatile uint32_t  EVENTS_TXDRDY;                      
  volatile const  uint32_t  RESERVED3;
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED4[7];
  volatile uint32_t  EVENTS_RXTO;                        
  volatile const  uint32_t  RESERVED5[46];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED6[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED7[93];
  volatile uint32_t  ERRORSRC;                           
  volatile const  uint32_t  RESERVED8[31];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED9;
  volatile uint32_t  PSELRTS;                            
  volatile uint32_t  PSELTXD;                            
  volatile uint32_t  PSELCTS;                            
  volatile uint32_t  PSELRXD;                            
  volatile const  uint32_t  RXD;                                
  volatile  uint32_t  TXD;                                
  volatile const  uint32_t  RESERVED10;
  volatile uint32_t  BAUDRATE;                           
  volatile const  uint32_t  RESERVED11[17];
  volatile uint32_t  CONFIG;                             
} NRF_UART_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[4];
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED1;
  volatile  uint32_t  TASKS_SUSPEND;                      
  volatile  uint32_t  TASKS_RESUME;                       
  volatile const  uint32_t  RESERVED2[56];
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile const  uint32_t  RESERVED3[2];
  volatile uint32_t  EVENTS_ENDRX;                       
  volatile const  uint32_t  RESERVED4;
  volatile uint32_t  EVENTS_END;                         
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  EVENTS_ENDTX;                       
  volatile const  uint32_t  RESERVED6[10];
  volatile uint32_t  EVENTS_STARTED;                     
  volatile const  uint32_t  RESERVED7[44];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED8[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED9[125];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED10;
  SPIM_PSEL_Type PSEL;                               
  volatile const  uint32_t  RESERVED11[4];
  volatile uint32_t  FREQUENCY;                          
  volatile const  uint32_t  RESERVED12[3];
  SPIM_RXD_Type RXD;                                 
  SPIM_TXD_Type TXD;                                 
  volatile uint32_t  CONFIG;                             
  volatile const  uint32_t  RESERVED13[26];
  volatile uint32_t  ORC;                               
 
} NRF_SPIM_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[9];
  volatile  uint32_t  TASKS_ACQUIRE;                      
  volatile  uint32_t  TASKS_RELEASE;                      
  volatile const  uint32_t  RESERVED1[54];
  volatile uint32_t  EVENTS_END;                         
  volatile const  uint32_t  RESERVED2[2];
  volatile uint32_t  EVENTS_ENDRX;                       
  volatile const  uint32_t  RESERVED3[5];
  volatile uint32_t  EVENTS_ACQUIRED;                    
  volatile const  uint32_t  RESERVED4[53];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED5[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED6[61];
  volatile const  uint32_t  SEMSTAT;                            
  volatile const  uint32_t  RESERVED7[15];
  volatile uint32_t  STATUS;                             
  volatile const  uint32_t  RESERVED8[47];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED9;
  SPIS_PSEL_Type PSEL;                               
  volatile const  uint32_t  RESERVED10[7];
  SPIS_RXD_Type RXD;                                 
  volatile const  uint32_t  RESERVED11;
  SPIS_TXD_Type TXD;                                 
  volatile const  uint32_t  RESERVED12;
  volatile uint32_t  CONFIG;                             
  volatile const  uint32_t  RESERVED13;
  volatile uint32_t  DEF;                               
 
  volatile const  uint32_t  RESERVED14[24];
  volatile uint32_t  ORC;                                
} NRF_SPIS_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_STARTRX;                      
  volatile const  uint32_t  RESERVED0;
  volatile  uint32_t  TASKS_STARTTX;                      
  volatile const  uint32_t  RESERVED1[2];
  volatile  uint32_t  TASKS_STOP;                        
 
  volatile const  uint32_t  RESERVED2;
  volatile  uint32_t  TASKS_SUSPEND;                      
  volatile  uint32_t  TASKS_RESUME;                       
  volatile const  uint32_t  RESERVED3[56];
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile const  uint32_t  RESERVED4[7];
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED5[8];
  volatile uint32_t  EVENTS_SUSPENDED;                  
 
  volatile uint32_t  EVENTS_RXSTARTED;                   
  volatile uint32_t  EVENTS_TXSTARTED;                   
  volatile const  uint32_t  RESERVED6[2];
  volatile uint32_t  EVENTS_LASTRX;                      
  volatile uint32_t  EVENTS_LASTTX;                      
  volatile const  uint32_t  RESERVED7[39];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED8[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED9[110];
  volatile uint32_t  ERRORSRC;                           
  volatile const  uint32_t  RESERVED10[14];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED11;
  TWIM_PSEL_Type PSEL;                               
  volatile const  uint32_t  RESERVED12[5];
  volatile uint32_t  FREQUENCY;                          
  volatile const  uint32_t  RESERVED13[3];
  TWIM_RXD_Type RXD;                                 
  TWIM_TXD_Type TXD;                                 
  volatile const  uint32_t  RESERVED14[13];
  volatile uint32_t  ADDRESS;                            
} NRF_TWIM_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[5];
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED1;
  volatile  uint32_t  TASKS_SUSPEND;                      
  volatile  uint32_t  TASKS_RESUME;                       
  volatile const  uint32_t  RESERVED2[3];
  volatile  uint32_t  TASKS_PREPARERX;                    
  volatile  uint32_t  TASKS_PREPARETX;                    
  volatile const  uint32_t  RESERVED3[51];
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile const  uint32_t  RESERVED4[7];
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED5[9];
  volatile uint32_t  EVENTS_RXSTARTED;                   
  volatile uint32_t  EVENTS_TXSTARTED;                   
  volatile const  uint32_t  RESERVED6[4];
  volatile uint32_t  EVENTS_WRITE;                       
  volatile uint32_t  EVENTS_READ;                        
  volatile const  uint32_t  RESERVED7[37];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED8[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED9[113];
  volatile uint32_t  ERRORSRC;                           
  volatile const  uint32_t  MATCH;                              
  volatile const  uint32_t  RESERVED10[10];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED11;
  TWIS_PSEL_Type PSEL;                               
  volatile const  uint32_t  RESERVED12[9];
  TWIS_RXD_Type RXD;                                 
  volatile const  uint32_t  RESERVED13;
  TWIS_TXD_Type TXD;                                 
  volatile const  uint32_t  RESERVED14[14];
  volatile uint32_t  ADDRESS[2];                         
  volatile const  uint32_t  RESERVED15;
  volatile uint32_t  CONFIG;                             
  volatile const  uint32_t  RESERVED16[10];
  volatile uint32_t  ORC;                               
 
} NRF_TWIS_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[66];
  volatile uint32_t  EVENTS_READY;                       
  volatile const  uint32_t  RESERVED1[126];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[125];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED3;
  SPI_PSEL_Type PSEL;                                
  volatile const  uint32_t  RESERVED4;
  volatile const  uint32_t  RXD;                                
  volatile uint32_t  TXD;                                
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  FREQUENCY;                          
  volatile const  uint32_t  RESERVED6[11];
  volatile uint32_t  CONFIG;                             
} NRF_SPI_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_STARTRX;                      
  volatile const  uint32_t  RESERVED0;
  volatile  uint32_t  TASKS_STARTTX;                      
  volatile const  uint32_t  RESERVED1[2];
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED2;
  volatile  uint32_t  TASKS_SUSPEND;                      
  volatile  uint32_t  TASKS_RESUME;                       
  volatile const  uint32_t  RESERVED3[56];
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile uint32_t  EVENTS_RXDREADY;                    
  volatile const  uint32_t  RESERVED4[4];
  volatile uint32_t  EVENTS_TXDSENT;                     
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED6[4];
  volatile uint32_t  EVENTS_BB;                         
 
  volatile const  uint32_t  RESERVED7[3];
  volatile uint32_t  EVENTS_SUSPENDED;                   
  volatile const  uint32_t  RESERVED8[45];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED9[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED10[110];
  volatile uint32_t  ERRORSRC;                           
  volatile const  uint32_t  RESERVED11[14];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED12;
  volatile uint32_t  PSELSCL;                            
  volatile uint32_t  PSELSDA;                            
  volatile const  uint32_t  RESERVED13[2];
  volatile const  uint32_t  RXD;                                
  volatile uint32_t  TXD;                                
  volatile const  uint32_t  RESERVED14;
  volatile uint32_t  FREQUENCY;                          
  volatile const  uint32_t  RESERVED15[24];
  volatile uint32_t  ADDRESS;                            
} NRF_TWI_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_ACTIVATE;                    
 
  volatile  uint32_t  TASKS_DISABLE;                      
  volatile  uint32_t  TASKS_SENSE;                        
  volatile  uint32_t  TASKS_STARTTX;                      
  volatile const  uint32_t  RESERVED0[3];
  volatile  uint32_t  TASKS_ENABLERXDATA;                 
  volatile const  uint32_t  RESERVED1;
  volatile  uint32_t  TASKS_GOIDLE;                       
  volatile  uint32_t  TASKS_GOSLEEP;                      
  volatile const  uint32_t  RESERVED2[53];
  volatile uint32_t  EVENTS_READY;                       
  volatile uint32_t  EVENTS_FIELDDETECTED;               
  volatile uint32_t  EVENTS_FIELDLOST;                   
  volatile uint32_t  EVENTS_TXFRAMESTART;                
  volatile uint32_t  EVENTS_TXFRAMEEND;                  
  volatile uint32_t  EVENTS_RXFRAMESTART;                
  volatile uint32_t  EVENTS_RXFRAMEEND;                 
 
  volatile uint32_t  EVENTS_ERROR;                      
 
  volatile const  uint32_t  RESERVED3[2];
  volatile uint32_t  EVENTS_RXERROR;                    
 
  volatile uint32_t  EVENTS_ENDRX;                       
  volatile uint32_t  EVENTS_ENDTX;                      
 
  volatile const  uint32_t  RESERVED4;
  volatile uint32_t  EVENTS_AUTOCOLRESSTARTED;           
  volatile const  uint32_t  RESERVED5[3];
  volatile uint32_t  EVENTS_COLLISION;                   
  volatile uint32_t  EVENTS_SELECTED;                    
  volatile uint32_t  EVENTS_STARTED;                     
  volatile const  uint32_t  RESERVED6[43];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED7[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED8[62];
  volatile uint32_t  ERRORSTATUS;                        
  volatile const  uint32_t  RESERVED9;
  NFCT_FRAMESTATUS_Type FRAMESTATUS;                 
  volatile const  uint32_t  RESERVED10[8];
  volatile const  uint32_t  CURRENTLOADCTRL;                    
  volatile const  uint32_t  RESERVED11[2];
  volatile const  uint32_t  FIELDPRESENT;                       
  volatile const  uint32_t  RESERVED12[49];
  volatile uint32_t  FRAMEDELAYMIN;                      
  volatile uint32_t  FRAMEDELAYMAX;                      
  volatile uint32_t  FRAMEDELAYMODE;                     
  volatile uint32_t  PACKETPTR;                          
  volatile uint32_t  MAXLEN;                            
 
  NFCT_TXD_Type TXD;                                 
  NFCT_RXD_Type RXD;                                 
  volatile const  uint32_t  RESERVED13[26];
  volatile uint32_t  NFCID1_LAST;                        
  volatile uint32_t  NFCID1_2ND_LAST;                    
  volatile uint32_t  NFCID1_3RD_LAST;                    
  volatile const  uint32_t  RESERVED14;
  volatile uint32_t  SENSRES;                            
  volatile uint32_t  SELRES;                             
} NRF_NFCT_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_OUT[8];                      
 
  volatile const  uint32_t  RESERVED0[4];
  volatile  uint32_t  TASKS_SET[8];                      
 
  volatile const  uint32_t  RESERVED1[4];
  volatile  uint32_t  TASKS_CLR[8];                      
 
  volatile const  uint32_t  RESERVED2[32];
  volatile uint32_t  EVENTS_IN[8];                      
 
  volatile const  uint32_t  RESERVED3[23];
  volatile uint32_t  EVENTS_PORT;                       
 
  volatile const  uint32_t  RESERVED4[97];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED5[129];
  volatile uint32_t  CONFIG[8];                         
 
} NRF_GPIOTE_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_SAMPLE;                       
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_CALIBRATEOFFSET;              
  volatile const  uint32_t  RESERVED0[60];
  volatile uint32_t  EVENTS_STARTED;                     
  volatile uint32_t  EVENTS_END;                         
  volatile uint32_t  EVENTS_DONE;                       

 
  volatile uint32_t  EVENTS_RESULTDONE;                  
  volatile uint32_t  EVENTS_CALIBRATEDONE;               
  volatile uint32_t  EVENTS_STOPPED;                     
  SAADC_EVENTS_CH_Type EVENTS_CH[8];                 
  volatile const  uint32_t  RESERVED1[106];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[61];
  volatile const  uint32_t  STATUS;                             
  volatile const  uint32_t  RESERVED3[63];
  volatile uint32_t  ENABLE;                             
  volatile const  uint32_t  RESERVED4[3];
  SAADC_CH_Type CH[8];                               
  volatile const  uint32_t  RESERVED5[24];
  volatile uint32_t  RESOLUTION;                         
  volatile uint32_t  OVERSAMPLE;                        

 
  volatile uint32_t  SAMPLERATE;                         
  volatile const  uint32_t  RESERVED6[12];
  SAADC_RESULT_Type RESULT;                          
} NRF_SAADC_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_COUNT;                        
  volatile  uint32_t  TASKS_CLEAR;                        
  volatile  uint32_t  TASKS_SHUTDOWN;                     
  volatile const  uint32_t  RESERVED0[11];
  volatile  uint32_t  TASKS_CAPTURE[6];                   
  volatile const  uint32_t  RESERVED1[58];
  volatile uint32_t  EVENTS_COMPARE[6];                  
  volatile const  uint32_t  RESERVED2[42];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED3[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED4[126];
  volatile uint32_t  MODE;                               
  volatile uint32_t  BITMODE;                            
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  PRESCALER;                          
  volatile const  uint32_t  RESERVED6[11];
  volatile uint32_t  CC[6];                              
} NRF_TIMER_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_CLEAR;                        
  volatile  uint32_t  TASKS_TRIGOVRFLW;                   
  volatile const  uint32_t  RESERVED0[60];
  volatile uint32_t  EVENTS_TICK;                        
  volatile uint32_t  EVENTS_OVRFLW;                      
  volatile const  uint32_t  RESERVED1[14];
  volatile uint32_t  EVENTS_COMPARE[4];                  
  volatile const  uint32_t  RESERVED2[109];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[13];
  volatile uint32_t  EVTEN;                              
  volatile uint32_t  EVTENSET;                           
  volatile uint32_t  EVTENCLR;                           
  volatile const  uint32_t  RESERVED4[110];
  volatile const  uint32_t  COUNTER;                            
  volatile uint32_t  PRESCALER;                         
 
  volatile const  uint32_t  RESERVED5[13];
  volatile uint32_t  CC[4];                              
} NRF_RTC_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED0[62];
  volatile uint32_t  EVENTS_DATARDY;                     
  volatile const  uint32_t  RESERVED1[128];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[127];
  volatile const  int32_t   TEMP;                               
  volatile const  uint32_t  RESERVED3[5];
  volatile uint32_t  A0;                                 
  volatile uint32_t  A1;                                 
  volatile uint32_t  A2;                                 
  volatile uint32_t  A3;                                 
  volatile uint32_t  A4;                                 
  volatile uint32_t  A5;                                 
  volatile const  uint32_t  RESERVED4[2];
  volatile uint32_t  B0;                                 
  volatile uint32_t  B1;                                 
  volatile uint32_t  B2;                                 
  volatile uint32_t  B3;                                 
  volatile uint32_t  B4;                                 
  volatile uint32_t  B5;                                 
  volatile const  uint32_t  RESERVED5[2];
  volatile uint32_t  T0;                                 
  volatile uint32_t  T1;                                 
  volatile uint32_t  T2;                                 
  volatile uint32_t  T3;                                 
  volatile uint32_t  T4;                                 
} NRF_TEMP_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED0[62];
  volatile uint32_t  EVENTS_VALRDY;                     
 
  volatile const  uint32_t  RESERVED1[63];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED2[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[126];
  volatile uint32_t  CONFIG;                             
  volatile const  uint32_t  VALUE;                              
} NRF_RNG_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_STARTECB;                     
  volatile  uint32_t  TASKS_STOPECB;                      
  volatile const  uint32_t  RESERVED0[62];
  volatile uint32_t  EVENTS_ENDECB;                      
  volatile uint32_t  EVENTS_ERRORECB;                   
 
  volatile const  uint32_t  RESERVED1[127];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[126];
  volatile uint32_t  ECBDATAPTR;                         
} NRF_ECB_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_KSGEN;                       
 
  volatile  uint32_t  TASKS_CRYPT;                       
 
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED0[61];
  volatile uint32_t  EVENTS_ENDKSGEN;                    
  volatile uint32_t  EVENTS_ENDCRYPT;                    
  volatile uint32_t  EVENTS_ERROR;                       
  volatile const  uint32_t  RESERVED1[61];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED2[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[61];
  volatile const  uint32_t  MICSTATUS;                          
  volatile const  uint32_t  RESERVED4[63];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  MODE;                               
  volatile uint32_t  CNFPTR;                             
  volatile uint32_t  INPTR;                              
  volatile uint32_t  OUTPTR;                             
  volatile uint32_t  SCRATCHPTR;                         
} NRF_CCM_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                       
 
  volatile const  uint32_t  RESERVED0;
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED1[61];
  volatile uint32_t  EVENTS_END;                         
  volatile uint32_t  EVENTS_RESOLVED;                    
  volatile uint32_t  EVENTS_NOTRESOLVED;                 
  volatile const  uint32_t  RESERVED2[126];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[61];
  volatile const  uint32_t  STATUS;                             
  volatile const  uint32_t  RESERVED4[63];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  NIRK;                               
  volatile uint32_t  IRKPTR;                             
  volatile const  uint32_t  RESERVED5;
  volatile uint32_t  ADDRPTR;                            
  volatile uint32_t  SCRATCHPTR;                         
} NRF_AAR_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile const  uint32_t  RESERVED0[63];
  volatile uint32_t  EVENTS_TIMEOUT;                     
  volatile const  uint32_t  RESERVED1[128];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[61];
  volatile const  uint32_t  RUNSTATUS;                          
  volatile const  uint32_t  REQSTATUS;                          
  volatile const  uint32_t  RESERVED3[63];
  volatile uint32_t  CRV;                                
  volatile uint32_t  RREN;                               
  volatile uint32_t  CONFIG;                             
  volatile const  uint32_t  RESERVED4[60];
  volatile  uint32_t  RR[8];                              
} NRF_WDT_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_READCLRACC;                   
  volatile  uint32_t  TASKS_RDCLRACC;                     
  volatile  uint32_t  TASKS_RDCLRDBL;                     
  volatile const  uint32_t  RESERVED0[59];
  volatile uint32_t  EVENTS_SAMPLERDY;                  
 
  volatile uint32_t  EVENTS_REPORTRDY;                   
  volatile uint32_t  EVENTS_ACCOF;                       
  volatile uint32_t  EVENTS_DBLRDY;                      
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile const  uint32_t  RESERVED1[59];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED2[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[125];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  LEDPOL;                             
  volatile uint32_t  SAMPLEPER;                          
  volatile const  int32_t   SAMPLE;                             
  volatile uint32_t  REPORTPER;                         
 
  volatile const  int32_t   ACC;                                
  volatile const  int32_t   ACCREAD;                           
 
  QDEC_PSEL_Type PSEL;                               
  volatile uint32_t  DBFEN;                              
  volatile const  uint32_t  RESERVED4[5];
  volatile uint32_t  LEDPRE;                             
  volatile const  uint32_t  ACCDBL;                             
  volatile const  uint32_t  ACCDBLREAD;                        
 
} NRF_QDEC_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_SAMPLE;                       
  volatile const  uint32_t  RESERVED0[61];
  volatile uint32_t  EVENTS_READY;                       
  volatile uint32_t  EVENTS_DOWN;                        
  volatile uint32_t  EVENTS_UP;                          
  volatile uint32_t  EVENTS_CROSS;                       
  volatile const  uint32_t  RESERVED1[60];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED2[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[61];
  volatile const  uint32_t  RESULT;                             
  volatile const  uint32_t  RESERVED4[63];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  PSEL;                               
  volatile uint32_t  REFSEL;                             
  volatile uint32_t  EXTREFSEL;                          
  volatile const  uint32_t  RESERVED5[8];
  volatile uint32_t  TH;                                 
  volatile uint32_t  MODE;                               
  volatile uint32_t  HYST;                               
  volatile uint32_t  ISOURCE;                            
} NRF_COMP_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile  uint32_t  TASKS_SAMPLE;                       
  volatile const  uint32_t  RESERVED0[61];
  volatile uint32_t  EVENTS_READY;                       
  volatile uint32_t  EVENTS_DOWN;                        
  volatile uint32_t  EVENTS_UP;                          
  volatile uint32_t  EVENTS_CROSS;                       
  volatile const  uint32_t  RESERVED1[60];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED2[64];
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[61];
  volatile const  uint32_t  RESULT;                             
  volatile const  uint32_t  RESERVED4[63];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  PSEL;                               
  volatile uint32_t  REFSEL;                             
  volatile uint32_t  EXTREFSEL;                          
  volatile const  uint32_t  RESERVED5[4];
  volatile uint32_t  ANADETECT;                          
  volatile const  uint32_t  RESERVED6[5];
  volatile uint32_t  HYST;                               
} NRF_LPCOMP_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  UNUSED;                             
} NRF_SWI_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_TRIGGER[16];                 
 
  volatile const  uint32_t  RESERVED0[48];
  volatile uint32_t  EVENTS_TRIGGERED[16];              
 
  volatile const  uint32_t  RESERVED1[112];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
} NRF_EGU_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0;
  volatile  uint32_t  TASKS_STOP;                        
 
  volatile  uint32_t  TASKS_SEQSTART[2];                 


 
  volatile  uint32_t  TASKS_NEXTSTEP;                    

 
  volatile const  uint32_t  RESERVED1[60];
  volatile uint32_t  EVENTS_STOPPED;                    
 
  volatile uint32_t  EVENTS_SEQSTARTED[2];              
 
  volatile uint32_t  EVENTS_SEQEND[2];                  
 
  volatile uint32_t  EVENTS_PWMPERIODEND;                
  volatile uint32_t  EVENTS_LOOPSDONE;                  
 
  volatile const  uint32_t  RESERVED2[56];
  volatile uint32_t  SHORTS;                             
  volatile const  uint32_t  RESERVED3[63];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED4[125];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  MODE;                               
  volatile uint32_t  COUNTERTOP;                         
  volatile uint32_t  PRESCALER;                          
  volatile uint32_t  DECODER;                            
  volatile uint32_t  LOOP;                               
  volatile const  uint32_t  RESERVED5[2];
  PWM_SEQ_Type SEQ[2];                               
  PWM_PSEL_Type PSEL;                                
} NRF_PWM_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                        
  volatile  uint32_t  TASKS_STOP;                         
  volatile const  uint32_t  RESERVED0[62];
  volatile uint32_t  EVENTS_STARTED;                     
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile uint32_t  EVENTS_END;                        

 
  volatile const  uint32_t  RESERVED1[125];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED2[125];
  volatile uint32_t  ENABLE;                             
  volatile uint32_t  PDMCLKCTRL;                         
  volatile uint32_t  MODE;                               
  volatile const  uint32_t  RESERVED3[3];
  volatile uint32_t  GAINL;                              
  volatile uint32_t  GAINR;                              
  volatile const  uint32_t  RESERVED4[8];
  PDM_PSEL_Type PSEL;                                
  volatile const  uint32_t  RESERVED5[6];
  PDM_SAMPLE_Type SAMPLE;                            
} NRF_PDM_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[256];
  volatile const  uint32_t  READY;                              
  volatile const  uint32_t  RESERVED1[64];
  volatile uint32_t  CONFIG;                             
  
  union {
    volatile uint32_t  ERASEPCR1;                       
 
    volatile uint32_t  ERASEPAGE;                        
  };
  volatile uint32_t  ERASEALL;                           
  volatile uint32_t  ERASEPCR0;                         
 
  volatile uint32_t  ERASEUICR;                          
  volatile const  uint32_t  RESERVED2[10];
  volatile uint32_t  ICACHECNF;                          
  volatile const  uint32_t  RESERVED3;
  volatile uint32_t  IHIT;                               
  volatile uint32_t  IMISS;                              
} NRF_NVMC_Type;


 
 
 




 

typedef struct {                                     
  PPI_TASKS_CHG_Type TASKS_CHG[6];                   
  volatile const  uint32_t  RESERVED0[308];
  volatile uint32_t  CHEN;                               
  volatile uint32_t  CHENSET;                            
  volatile uint32_t  CHENCLR;                            
  volatile const  uint32_t  RESERVED1;
  PPI_CH_Type CH[20];                                
  volatile const  uint32_t  RESERVED2[148];
  volatile uint32_t  CHG[6];                             
  volatile const  uint32_t  RESERVED3[62];
  PPI_FORK_Type FORK[32];                            
} NRF_PPI_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[64];
  MWU_EVENTS_REGION_Type EVENTS_REGION[4];           
  volatile const  uint32_t  RESERVED1[16];
  MWU_EVENTS_PREGION_Type EVENTS_PREGION[2];         
  volatile const  uint32_t  RESERVED2[100];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[5];
  volatile uint32_t  NMIEN;                              
  volatile uint32_t  NMIENSET;                           
  volatile uint32_t  NMIENCLR;                           
  volatile const  uint32_t  RESERVED4[53];
  MWU_PERREGION_Type PERREGION[2];                   
  volatile const  uint32_t  RESERVED5[64];
  volatile uint32_t  REGIONEN;                           
  volatile uint32_t  REGIONENSET;                        
  volatile uint32_t  REGIONENCLR;                        
  volatile const  uint32_t  RESERVED6[57];
  MWU_REGION_Type REGION[4];                         
  volatile const  uint32_t  RESERVED7[32];
  MWU_PREGION_Type PREGION[2];                       
} NRF_MWU_Type;


 
 
 




 

typedef struct {                                     
  volatile  uint32_t  TASKS_START;                       
 
  volatile  uint32_t  TASKS_STOP;                        
 
  volatile const  uint32_t  RESERVED0[63];
  volatile uint32_t  EVENTS_RXPTRUPD;                   


 
  volatile uint32_t  EVENTS_STOPPED;                     
  volatile const  uint32_t  RESERVED1[2];
  volatile uint32_t  EVENTS_TXPTRUPD;                   


 
  volatile const  uint32_t  RESERVED2[122];
  volatile uint32_t  INTEN;                              
  volatile uint32_t  INTENSET;                           
  volatile uint32_t  INTENCLR;                           
  volatile const  uint32_t  RESERVED3[125];
  volatile uint32_t  ENABLE;                             
  I2S_CONFIG_Type CONFIG;                            
  volatile const  uint32_t  RESERVED4[3];
  I2S_RXD_Type RXD;                                  
  volatile const  uint32_t  RESERVED5;
  I2S_TXD_Type TXD;                                  
  volatile const  uint32_t  RESERVED6[3];
  I2S_RXTXD_Type RXTXD;                              
  volatile const  uint32_t  RESERVED7[3];
  I2S_PSEL_Type PSEL;                                
} NRF_I2S_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  UNUSED;                             
} NRF_FPU_Type;


 
 
 




 

typedef struct {                                     
  volatile const  uint32_t  RESERVED0[321];
  volatile uint32_t  OUT;                                
  volatile uint32_t  OUTSET;                             
  volatile uint32_t  OUTCLR;                             
  volatile const  uint32_t  IN;                                 
  volatile uint32_t  DIR;                                
  volatile uint32_t  DIRSET;                             
  volatile uint32_t  DIRCLR;                             
  volatile uint32_t  LATCH;                             
 
  volatile uint32_t  DETECTMODE;                         
  volatile const  uint32_t  RESERVED1[118];
  volatile uint32_t  PIN_CNF[32];                        
} NRF_GPIO_Type;


 

  #pragma pop
#line 1935 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"




 
 
 

#line 2008 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"


 
 
 

#line 2079 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52.h"


   
   
   








#line 54 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"




























 
 



 

 
 

 
 

 






 






 






 
 

 






 






 






 
 

 



 
 

 





 
 

 



 
 

 



 
 

 



 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 






 
 

 
 

 





 
 

 






 






 






 
 

 






 






 






 
 

 





 
 

 





 
 

 





 





 





 
 

 



 
 

 



 
 

 



 
 

 




 
 

 
 

 






 






 






 






 
 

 






 






 






 






 
 

 





 
 

 





 





 
 

 





 
 

 





 






 
 

 






 
 

 





 





 






 
 

 



 
 

 






 
#line 1223 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"


 
 

 
 

 





 





 





 





 





 
 

 





 





 





 





 
 

 






 






 






 






 
 

 






 






 






 






 
 

 





 
 

 





 
 

 
#line 1382 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 1394 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 
 

 



 



 
 

 





 






 
 

 





 
 

 
#line 1450 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"


 
 

 
 

 






 






 
 

 






 






 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 







 
 

 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 
 

 



 
 

 





 
 

 
#line 1904 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 






 
 

 
#line 1925 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 1936 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 



 



 



 
 

 



 



 



 



 
 

 



 



 



 



 
 

 



 



 



 




 
 

 
 

 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 
 

 





 
#line 2284 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 



 







 
 

 
 

 





 





 





 
 

 






 






 






 
 

 






 






 






 
 

 





 
 

 





 
 

 





 
 

 





 
 

 





 
 

 
#line 2438 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 2454 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 






 
 

 





 
 

 





 
 

 






 
 

 



 
 

 



 
 

 



 
 

 





 



 
 

 





 



 
 

 





 



 
 

 





 



 
 

 





 




 
 

 
 

 





 





 





 





 





 
 

 






 






 






 






 
 

 






 






 






 






 
 

 





 
 

 





 
 

 
#line 2710 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 2733 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 
 

 






 
 

 






 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 






 
 

 
 

 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 



 



 



 
 

 





 





 





 
 

 



 
 

 





 





 
 

 



 
 

 



 
 

 
#line 4536 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 





 





 





 





 
 

 



 



 
 

 





 





 





 
 

 



 



 
 

 



 



 



 



 
 

 



 



 



 
 

 



 



 



 
 

 



 



 






 



 
#line 4701 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 



 



 





 




 
 

 
 

 





 
 

 






 
 

 



 
 

 



 
 

 





 
 

 



 
 

 





 
 

 





 





 
 

 



 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 





 
 

 






 
#line 6540 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 






 





 






 
 

 
 

 





 





 





 
 

 






 






 






 
 

 






 






 






 
 

 





 
 

 






 
 

 





 





 
 

 






 
 

 






 
 

 





 



 
 

 





 



 
 

 



 
 

 




 
 

 
 

 






 






 






 
 

 






 






 






 
 

 





 





 





 





 





 





 





 





 
 

 





 





 





 





 
 

 




 
 

 
#line 6883 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 





 
 

 



 
 

 



 
 

 





 





 





 





 
 

 





 





 





 





 
 

 





 
 

 





 





 





 





 
 

 




 




 




 




 
 

 




 




 




 





 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 



 
 

 



 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 




 
 

 
 

 





 





 





 





 





 
 

 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 
 

 





 
 

 





 
 

 



 
 

 
#line 8134 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 
#line 8151 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 




 
 

 



 
 

 




 
 

 




 
 

 



 
 

 





 




 
 

 
 

 





 





 





 





 





 





 





 
 

 






 






 






 






 






 
 

 






 






 






 






 






 
 

 





 
 

 





 
 

 
#line 8363 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 
#line 8386 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 





 



 
 

 





 



 
 

 





 



 
 

 





 
 

 



 
 

 



 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 
 

 





 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 



 
 

 
#line 8751 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 8762 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 





 



 



 



 
 

 





 





 



 



 



 
 

 



 
 

 



 
 

 



 



 



 



 
 

 



 



 



 



 
 

 



 
 

 





 





 





 





 





 





 





 





 
 

 





 
#line 8943 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 



 
 

 



 
 

 
#line 8987 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 



 



 



 



 



 



 



 





 





 





 





 





 





 





 





 
 

 






 





 
 

 






 
 

 
 

 





 
 

 






 
 

 






 
 

 





 
 

 




 
 

 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 





 





 





 





 





 





 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 



 
 

 



 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 






 
 

 





 
 

 





 
 

 
#line 9904 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 9921 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 





 
#line 9946 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 





 
#line 9964 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
#line 9972 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
#line 9980 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 



 
 

 
#line 10002 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 
#line 10018 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 



 
 

 



 
 

 



 
 

 




 
 

 
 

 






 
 

 






 
 

 





 
 

 




 
 

 




 
 

 




 
 

 



 
 

 



 
 

 
#line 10137 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 





 






 
 

 
 

 





 
 

 






 






 






 






 






 
 

 






 






 






 






 






 
 

 





 
 

 





 



 
 

 





 



 
 

 





 



 
 

 
#line 10309 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 



 
 

 





 
 

 



 
 

 



 
 

 



 
 

 





 
 

 





 





 





 
 

 




 
 

 
 

 





 
 

 






 






 






 
 

 






 






 






 
 

 
#line 10469 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 






 






 
 

 





 
 

 





 



 
 

 





 



 
 

 





 



 
 

 





 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 





 





 
 

 



 
 

 




 
 

 
 

 






 
 

 






 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 




 
 

 
 

 





 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 






 
 

 
#line 10964 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 




 
 

 
 

 





 





 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 





 





 





 
 

 





 
 

 




 
 

 




 
 

 



 
 

 



 
 

 






 
 

 




 
 

 
 

 





 





 





 





 





 
 

 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 
 

 





 





 
 

 





 
 

 





 



 
 

 





 



 
 

 






 
 

 



 
 

 



 
 

 



 
 

 





 
 

 



 
 

 



 
 

 



 
 

 





 
 

 




 
 

 
 

 





 





 
 

 





 





 





 





 





 





 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 





 





 





 
 

 



 
 

 





 
 

 





 



 
 

 





 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 





 
 

 




 
 

 
 

 





 





 
 

 






 






 






 






 






 






 
 

 






 






 






 






 






 






 
 

 





 





 





 





 
 

 





 
 

 




 
 

 




 
 

 




 
 

 




 
 

 



 
 

 



 
 

 
#line 11974 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 





 






 
 

 
 

 





 





 
 

 





 





 





 





 





 





 





 





 





 





 





 
 

 






 






 






 






 






 






 






 






 






 






 






 
 

 






 






 






 






 






 






 






 






 






 






 






 
 

 





 





 





 





 
 

 





 
 

 





 



 
 

 





 



 
 

 





 



 
 

 





 



 
 

 
#line 12349 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_bitfields.h"

 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 



 
 

 





 






 
 

 
 

 



 
 

 



 
 

 



 
 

 





 



 
 

 





 
 

 






 
 

 
 

 






 
 

 






 
 

 





 
 

 





 





 





 





 





 





 





 





 
 

 



 
 

 





 





 





 





 





 





 





 





 
 

 





 





 
 

 





 
#line 55 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"




























 
 



 




 


 
 
#line 55 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"

#line 67 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"


 
 








 
 




 
 





 
 





 










 











 
 


 





 




































































































































































































































































































































































































 

 
 



 
 




 
#line 542 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"


 
 






 
 



 





 





 




 
 
#line 584 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"

 
#line 618 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf51_to_nrf52.h"

 





 



































































































































































































































































































































 



#line 56 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"
#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_name_change.h"




























 
 



 




 

 
 
#line 62 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf52_name_change.h"

 
 


 
 



 



#line 57 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"




#line 1 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\compiler_abstraction.h"




























 
 



 

























#line 141 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\compiler_abstraction.h"

 

#line 62 "C:\\Keil_v5\\ARM\\PACK\\NordicSemiconductor\\nRF_DeviceFamilyPack\\8.9.0\\Device\\Include\\nrf.h"





#line 29 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_errors.h"










 




























 




#line 46 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_errors.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_error.h"


































  
 




 

 








 




 

#line 79 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_error.h"








 
#line 47 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_errors.h"








 


 




 



 





 


 





 
#line 91 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_errors.h"
 





 



 











 
typedef uint32_t ret_code_t;
 
 








#line 30 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nordic_common.h"









 



 








 


 


 


 


 
   

 
   















 

 
















 

 




 



 






 







 










 


#line 146 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nordic_common.h"









#line 31 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error_weak.h"










 















 



















 
void app_error_fault_handler(uint32_t id, uint32_t pc, uint32_t info);


 






#line 32 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"











 


 


 
typedef struct
{
    uint16_t        line_num;     
    uint8_t const * p_file_name;  
    uint32_t        err_code;     
} error_info_t;


 
typedef struct
{
    uint16_t        line_num;     
    uint8_t const * p_file_name;  
} assert_info_t;






 
void app_error_handler(uint32_t error_code, uint32_t line_num, const uint8_t * p_file_name);




 
void app_error_handler_bare(ret_code_t error_code);








 
void app_error_save_and_stop(uint32_t id, uint32_t pc, uint32_t info);











 
static __inline void app_error_log(uint32_t id, uint32_t pc, uint32_t info)
{
    switch (id)
    {
        case 0x00004000 + 2:
            
            if (((assert_info_t *)(info))->p_file_name)
            {
               
                
            }
            
            break;

        case 0x00004000 + 1:
            
            if (((error_info_t *)(info))->p_file_name)
            {
                
                
            }
            
            break;
    }
}








 

static __inline void app_error_print(uint32_t id, uint32_t pc, uint32_t info)
{
    unsigned int tmp = id;
    printf("app_error_print():\r\n");
    printf("Fault identifier:  0x%X\r\n", tmp);
    printf("Program counter:   0x%X\r\n", tmp = pc);
    printf("Fault information: 0x%X\r\n", tmp = info);

    switch (id)
    {
        case 0x00004000 + 2:
            printf("Line Number: %u\r\n", tmp = ((assert_info_t *)(info))->line_num);
            printf("File Name:   %s\r\n",       ((assert_info_t *)(info))->p_file_name);
            break;

        case 0x00004000 + 1:
            printf("Line Number: %u\r\n",   tmp = ((error_info_t *)(info))->line_num);
            printf("File Name:   %s\r\n",         ((error_info_t *)(info))->p_file_name);
            printf("Error Code:  0x%X\r\n", tmp = ((error_info_t *)(info))->err_code);
            break;
    }
}






 
#line 177 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"



 
#line 190 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"




 
#line 204 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_error.h"








 
#line 44 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"










 








 




#line 26 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"
#line 27 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"
#line 28 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"
#line 29 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"







extern char STACK$$Base;
extern char STACK$$Length;
#line 51 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"


enum
{
    UNIT_0_625_MS = 625,                                 
    UNIT_1_25_MS  = 1250,                                
    UNIT_10_MS    = 10000                                
};






 









 





























 
#line 112 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"






 
#line 127 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"







 
#line 142 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"

 
#line 153 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"







 
#line 168 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util.h"


 
typedef uint8_t uint16_le_t[2];

 
typedef uint8_t uint32_le_t[4];

 
typedef struct
{
    uint16_t  size;                  
    uint8_t * p_data;                
} uint8_array_t;








 









 







 












 








 










 




 









 






 






 










 
static __inline uint64_t value_rescale(uint32_t value, uint32_t old_unit_reversal, uint16_t new_unit_reversal)
{
    return (uint64_t)((((uint64_t)value * new_unit_reversal) + ((old_unit_reversal) / 2)) / (old_unit_reversal));
}







 
static __inline uint8_t uint16_encode(uint16_t value, uint8_t * p_encoded_data)
{
    p_encoded_data[0] = (uint8_t) ((value & 0x00FF) >> 0);
    p_encoded_data[1] = (uint8_t) ((value & 0xFF00) >> 8);
    return sizeof(uint16_t);
}







 
static __inline uint8_t uint24_encode(uint32_t value, uint8_t * p_encoded_data)
{
    p_encoded_data[0] = (uint8_t) ((value & 0x000000FF) >> 0);
    p_encoded_data[1] = (uint8_t) ((value & 0x0000FF00) >> 8);
    p_encoded_data[2] = (uint8_t) ((value & 0x00FF0000) >> 16);
    return 3;
}







 
static __inline uint8_t uint32_encode(uint32_t value, uint8_t * p_encoded_data)
{
    p_encoded_data[0] = (uint8_t) ((value & 0x000000FF) >> 0);
    p_encoded_data[1] = (uint8_t) ((value & 0x0000FF00) >> 8);
    p_encoded_data[2] = (uint8_t) ((value & 0x00FF0000) >> 16);
    p_encoded_data[3] = (uint8_t) ((value & 0xFF000000) >> 24);
    return sizeof(uint32_t);
}







 
static __inline uint8_t uint48_encode(uint64_t value, uint8_t * p_encoded_data)
{
    p_encoded_data[0] = (uint8_t) ((value & 0x0000000000FF) >> 0);
    p_encoded_data[1] = (uint8_t) ((value & 0x00000000FF00) >> 8);
    p_encoded_data[2] = (uint8_t) ((value & 0x000000FF0000) >> 16);
    p_encoded_data[3] = (uint8_t) ((value & 0x0000FF000000) >> 24);
    p_encoded_data[4] = (uint8_t) ((value & 0x00FF00000000) >> 32);
    p_encoded_data[5] = (uint8_t) ((value & 0xFF0000000000) >> 40);
    return 6;
}






 
static __inline uint16_t uint16_decode(const uint8_t * p_encoded_data)
{
        return ( (((uint16_t)((uint8_t *)p_encoded_data)[0])) |
                 (((uint16_t)((uint8_t *)p_encoded_data)[1]) << 8 ));
}






 
static __inline uint16_t uint16_big_decode(const uint8_t * p_encoded_data)
{
        return ( (((uint16_t)((uint8_t *)p_encoded_data)[0]) << 8 ) |
                 (((uint16_t)((uint8_t *)p_encoded_data)[1])) );
}






 
static __inline uint32_t uint24_decode(const uint8_t * p_encoded_data)
{
    return ( (((uint32_t)((uint8_t *)p_encoded_data)[0]) << 0)  |
             (((uint32_t)((uint8_t *)p_encoded_data)[1]) << 8)  |
             (((uint32_t)((uint8_t *)p_encoded_data)[2]) << 16));
}






 
static __inline uint32_t uint32_decode(const uint8_t * p_encoded_data)
{
    return ( (((uint32_t)((uint8_t *)p_encoded_data)[0]) << 0)  |
             (((uint32_t)((uint8_t *)p_encoded_data)[1]) << 8)  |
             (((uint32_t)((uint8_t *)p_encoded_data)[2]) << 16) |
             (((uint32_t)((uint8_t *)p_encoded_data)[3]) << 24 ));
}






 
static __inline uint32_t uint32_big_decode(const uint8_t * p_encoded_data)
{
    return ( (((uint32_t)((uint8_t *)p_encoded_data)[0]) << 24) |
             (((uint32_t)((uint8_t *)p_encoded_data)[1]) << 16) |
             (((uint32_t)((uint8_t *)p_encoded_data)[2]) << 8)  |
             (((uint32_t)((uint8_t *)p_encoded_data)[3]) << 0) );
}







 
static __inline uint8_t uint32_big_encode(uint32_t value, uint8_t * p_encoded_data)
{
    *(uint32_t *)p_encoded_data = __rev(value);
    return sizeof(uint32_t);
}






 
static __inline uint64_t uint48_decode(const uint8_t * p_encoded_data)
{
    return ( (((uint64_t)((uint8_t *)p_encoded_data)[0]) << 0)  |
             (((uint64_t)((uint8_t *)p_encoded_data)[1]) << 8)  |
             (((uint64_t)((uint8_t *)p_encoded_data)[2]) << 16) |
             (((uint64_t)((uint8_t *)p_encoded_data)[3]) << 24) |
             (((uint64_t)((uint8_t *)p_encoded_data)[4]) << 32) |
             (((uint64_t)((uint8_t *)p_encoded_data)[5]) << 40 ));
}




















 
static __inline uint8_t battery_level_in_percent(const uint16_t mvolts)
{
    uint8_t battery_level;

    if (mvolts >= 3000)
    {
        battery_level = 100;
    }
    else if (mvolts > 2900)
    {
        battery_level = 100 - ((3000 - mvolts) * 58) / 100;
    }
    else if (mvolts > 2740)
    {
        battery_level = 42 - ((2900 - mvolts) * 24) / 160;
    }
    else if (mvolts > 2440)
    {
        battery_level = 18 - ((2740 - mvolts) * 12) / 300;
    }
    else if (mvolts > 2100)
    {
        battery_level = 6 - ((2440 - mvolts) * 6) / 340;
    }
    else
    {
        battery_level = 0;
    }

    return battery_level;
}






 
static __inline _Bool is_word_aligned(void const* p)
{
    return (((uintptr_t)p & 0x03) == 0);
}







 
static __inline _Bool is_address_from_stack(void * ptr)
{
    if (((uint32_t)ptr >= (uint32_t)&STACK$$Base) &&
        ((uint32_t)ptr <  (uint32_t)((void*)((uint32_t)&STACK$$Base + (uint32_t)&STACK$$Length))) )
    {
        return 1;
    }
    else
    {
        return 0;
    }
}








 
#line 45 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 46 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 47 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 48 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"
#line 49 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"


















 
#line 74 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"


















 



typedef struct app_timer_t { uint32_t data[(((32) + (sizeof(uint32_t)) - 1) / (sizeof(uint32_t)))]; } app_timer_t;


 
typedef app_timer_t * app_timer_id_t;





 





 
typedef void (*app_timer_timeout_handler_t)(void * p_context);

 
typedef uint32_t (*app_timer_evt_schedule_func_t) (app_timer_timeout_handler_t timeout_handler,
                                                   void *                      p_context);

 
typedef enum
{
    APP_TIMER_MODE_SINGLE_SHOT,                  
    APP_TIMER_MODE_REPEATED                      
} app_timer_mode_t;





















 
   
#line 159 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.h"

























 
uint32_t app_timer_init(uint32_t                      prescaler,
                        uint8_t                       op_queue_size,
                        void *                        p_buffer,
                        app_timer_evt_schedule_func_t evt_schedule_func);



















 
uint32_t app_timer_create(app_timer_id_t const *      p_timer_id,
                          app_timer_mode_t            mode,
                          app_timer_timeout_handler_t timeout_handler);




















 
uint32_t app_timer_start(app_timer_id_t timer_id, uint32_t timeout_ticks, void * p_context);










 
uint32_t app_timer_stop(app_timer_id_t timer_id);






 
uint32_t app_timer_stop_all(void);




 
uint32_t app_timer_cnt_get(void);








 
uint32_t app_timer_cnt_diff_compute(uint32_t   ticks_to,
                                    uint32_t   ticks_from,
                                    uint32_t * p_ticks_diff);









 
uint8_t app_timer_op_queue_utilization_get(void);








 
#line 15 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 16 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 17 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"


































  






 




#line 48 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"
#line 49 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_svc.h"


































 
 



#line 41 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_svc.h"




    




#line 82 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_svc.h"



#line 50 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"
#line 51 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"

#line 1 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_error_soc.h"


































 








 

 



#line 51 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_error_soc.h"




 


 




 




 


 










 
#line 53 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"






 

 



 


 






#line 87 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_soc.h"










 


 

 
enum NRF_SOC_SVCS
{
  SD_PPI_CHANNEL_ENABLE_GET = (0x20),
  SD_PPI_CHANNEL_ENABLE_SET,
  SD_PPI_CHANNEL_ENABLE_CLR,
  SD_PPI_CHANNEL_ASSIGN,
  SD_PPI_GROUP_TASK_ENABLE,
  SD_PPI_GROUP_TASK_DISABLE,
  SD_PPI_GROUP_ASSIGN,
  SD_PPI_GROUP_GET,
  SD_FLASH_PAGE_ERASE,
  SD_FLASH_WRITE,
  SD_FLASH_PROTECT,
  SD_MUTEX_NEW = (0x2B),
  SD_MUTEX_ACQUIRE,
  SD_MUTEX_RELEASE,
  SD_RAND_APPLICATION_POOL_CAPACITY_GET,
  SD_RAND_APPLICATION_BYTES_AVAILABLE_GET,
  SD_RAND_APPLICATION_VECTOR_GET,
  SD_POWER_MODE_SET,
  SD_POWER_SYSTEM_OFF,
  SD_POWER_RESET_REASON_GET,
  SD_POWER_RESET_REASON_CLR,
  SD_POWER_POF_ENABLE,
  SD_POWER_POF_THRESHOLD_SET,
  SD_POWER_RAMON_SET,
  SD_POWER_RAMON_CLR,
  SD_POWER_RAMON_GET,
  SD_POWER_GPREGRET_SET,
  SD_POWER_GPREGRET_CLR,
  SD_POWER_GPREGRET_GET,
  SD_POWER_DCDC_MODE_SET,
  SD_APP_EVT_WAIT,
  SD_CLOCK_HFCLK_REQUEST,
  SD_CLOCK_HFCLK_RELEASE,
  SD_CLOCK_HFCLK_IS_RUNNING,
  SD_RADIO_NOTIFICATION_CFG_SET,
  SD_ECB_BLOCK_ENCRYPT,
  SD_ECB_BLOCKS_ENCRYPT,
  SD_RADIO_SESSION_OPEN,
  SD_RADIO_SESSION_CLOSE,
  SD_RADIO_REQUEST,
  SD_EVT_GET,
  SD_TEMP_GET,
  SVC_SOC_LAST
};

 
enum NRF_MUTEX_VALUES
{
  NRF_MUTEX_FREE,
  NRF_MUTEX_TAKEN
};

 
enum NRF_POWER_MODES
{
  NRF_POWER_MODE_CONSTLAT,   
  NRF_POWER_MODE_LOWPWR      
};


 
enum NRF_POWER_THRESHOLDS
{
  NRF_POWER_THRESHOLD_V21,   
  NRF_POWER_THRESHOLD_V23,   
  NRF_POWER_THRESHOLD_V25,    
  NRF_POWER_THRESHOLD_V27    
};


 
enum NRF_POWER_DCDC_MODES
{
  NRF_POWER_DCDC_DISABLE,           
  NRF_POWER_DCDC_ENABLE             
};

 
enum NRF_RADIO_NOTIFICATION_DISTANCES
{
  NRF_RADIO_NOTIFICATION_DISTANCE_NONE = 0,  
  NRF_RADIO_NOTIFICATION_DISTANCE_800US,     
  NRF_RADIO_NOTIFICATION_DISTANCE_1740US,    
  NRF_RADIO_NOTIFICATION_DISTANCE_2680US,    
  NRF_RADIO_NOTIFICATION_DISTANCE_3620US,    
  NRF_RADIO_NOTIFICATION_DISTANCE_4560US,    
  NRF_RADIO_NOTIFICATION_DISTANCE_5500US     
};


 
enum NRF_RADIO_NOTIFICATION_TYPES
{
  NRF_RADIO_NOTIFICATION_TYPE_NONE = 0,         
  NRF_RADIO_NOTIFICATION_TYPE_INT_ON_ACTIVE,    
  NRF_RADIO_NOTIFICATION_TYPE_INT_ON_INACTIVE,  
  NRF_RADIO_NOTIFICATION_TYPE_INT_ON_BOTH,      
};

 
enum NRF_RADIO_CALLBACK_SIGNAL_TYPE
{
  NRF_RADIO_CALLBACK_SIGNAL_TYPE_START,              
  NRF_RADIO_CALLBACK_SIGNAL_TYPE_TIMER0,             
  NRF_RADIO_CALLBACK_SIGNAL_TYPE_RADIO,              
  NRF_RADIO_CALLBACK_SIGNAL_TYPE_EXTEND_FAILED,      
  NRF_RADIO_CALLBACK_SIGNAL_TYPE_EXTEND_SUCCEEDED    
};





 
enum NRF_RADIO_SIGNAL_CALLBACK_ACTION
{
  NRF_RADIO_SIGNAL_CALLBACK_ACTION_NONE,             
  NRF_RADIO_SIGNAL_CALLBACK_ACTION_EXTEND,           
  NRF_RADIO_SIGNAL_CALLBACK_ACTION_END,              
  NRF_RADIO_SIGNAL_CALLBACK_ACTION_REQUEST_AND_END   
};

 
enum NRF_RADIO_HFCLK_CFG
{
  NRF_RADIO_HFCLK_CFG_XTAL_GUARANTEED, 

 
  NRF_RADIO_HFCLK_CFG_NO_GUARANTEE    



 
};

 
enum NRF_RADIO_PRIORITY
{
  NRF_RADIO_PRIORITY_HIGH,                           
  NRF_RADIO_PRIORITY_NORMAL,                         
};

 
enum NRF_RADIO_REQUEST_TYPE
{
  NRF_RADIO_REQ_TYPE_EARLIEST,                       
  NRF_RADIO_REQ_TYPE_NORMAL                          
};

 
enum NRF_SOC_EVTS
{
  NRF_EVT_HFCLKSTARTED,                          
  NRF_EVT_POWER_FAILURE_WARNING,                 
  NRF_EVT_FLASH_OPERATION_SUCCESS,               
  NRF_EVT_FLASH_OPERATION_ERROR,                 
  NRF_EVT_RADIO_BLOCKED,                         
  NRF_EVT_RADIO_CANCELED,                        
  NRF_EVT_RADIO_SIGNAL_CALLBACK_INVALID_RETURN,  
  NRF_EVT_RADIO_SESSION_IDLE,                    
  NRF_EVT_RADIO_SESSION_CLOSED,                  
  NRF_EVT_NUMBER_OF_EVTS
};

 



 



 
typedef volatile uint8_t nrf_mutex_t;

 
typedef struct
{
  uint8_t       hfclk;                               
  uint8_t       priority;                            
  uint32_t      length_us;                           
  uint32_t      timeout_us;                          
} nrf_radio_request_earliest_t;

 
typedef struct
{
  uint8_t       hfclk;                               
  uint8_t       priority;                            
  uint32_t      distance_us;                         
  uint32_t      length_us;                           
} nrf_radio_request_normal_t;

 
typedef struct
{
  uint8_t                         request_type;      
  union
  {
    nrf_radio_request_earliest_t  earliest;          
    nrf_radio_request_normal_t    normal;            
  } params;                                          
} nrf_radio_request_t;

 
typedef struct
{
  uint8_t               callback_action;             
  union
  {
    struct
    {
      nrf_radio_request_t * p_next;                  
    } request;                                       
    struct
    {
      uint32_t              length_us;               
    } extend;                                        
  } params;                                          
} nrf_radio_signal_callback_return_param_t;












 
typedef nrf_radio_signal_callback_return_param_t * (*nrf_radio_signal_callback_t) (uint8_t signal_type);

 
typedef uint8_t soc_ecb_key_t[(16)];                 
typedef uint8_t soc_ecb_cleartext_t[(16)];     
typedef uint8_t soc_ecb_ciphertext_t[((16))];   

 
typedef struct
{
  soc_ecb_key_t        key;             
  soc_ecb_cleartext_t  cleartext;       
  soc_ecb_ciphertext_t ciphertext;      
} nrf_ecb_hal_data_t;


 
typedef struct
{
  soc_ecb_key_t*        p_key;            
  soc_ecb_cleartext_t*  p_cleartext;      
  soc_ecb_ciphertext_t* p_ciphertext;     
} nrf_ecb_hal_data_block_t;

 


 






 
uint32_t __svc(SD_MUTEX_NEW) sd_mutex_new(nrf_mutex_t * p_mutex);







 
uint32_t __svc(SD_MUTEX_ACQUIRE) sd_mutex_acquire(nrf_mutex_t * p_mutex);






 
uint32_t __svc(SD_MUTEX_RELEASE) sd_mutex_release(nrf_mutex_t * p_mutex);






 
uint32_t __svc(SD_RAND_APPLICATION_POOL_CAPACITY_GET) sd_rand_application_pool_capacity_get(uint8_t * p_pool_capacity);






 
uint32_t __svc(SD_RAND_APPLICATION_BYTES_AVAILABLE_GET) sd_rand_application_bytes_available_get(uint8_t * p_bytes_available);








 
uint32_t __svc(SD_RAND_APPLICATION_VECTOR_GET) sd_rand_application_vector_get(uint8_t * p_buff, uint8_t length);






 
uint32_t __svc(SD_POWER_RESET_REASON_GET) sd_power_reset_reason_get(uint32_t * p_reset_reason);






 
uint32_t __svc(SD_POWER_RESET_REASON_CLR) sd_power_reset_reason_clr(uint32_t reset_reason_clr_msk);







 
uint32_t __svc(SD_POWER_MODE_SET) sd_power_mode_set(uint8_t power_mode);




 
uint32_t __svc(SD_POWER_SYSTEM_OFF) sd_power_system_off(void);









 
uint32_t __svc(SD_POWER_POF_ENABLE) sd_power_pof_enable(uint8_t pof_enable);







 
uint32_t __svc(SD_POWER_POF_THRESHOLD_SET) sd_power_pof_threshold_set(uint8_t threshold);






 
uint32_t __svc(SD_POWER_RAMON_SET) sd_power_ramon_set(uint32_t ramon);






 
uint32_t __svc(SD_POWER_RAMON_CLR) sd_power_ramon_clr(uint32_t ramon);






 
uint32_t __svc(SD_POWER_RAMON_GET) sd_power_ramon_get(uint32_t * p_ramon);








 
uint32_t __svc(SD_POWER_GPREGRET_SET) sd_power_gpregret_set(uint32_t gpregret_id, uint32_t gpregret_msk);








 
uint32_t __svc(SD_POWER_GPREGRET_CLR) sd_power_gpregret_clr(uint32_t gpregret_id, uint32_t gpregret_msk);








 
uint32_t __svc(SD_POWER_GPREGRET_GET) sd_power_gpregret_get(uint32_t gpregret_id, uint32_t *p_gpregret);









 
uint32_t __svc(SD_POWER_DCDC_MODE_SET) sd_power_dcdc_mode_set(uint8_t dcdc_mode);










 
uint32_t __svc(SD_CLOCK_HFCLK_REQUEST) sd_clock_hfclk_request(void);









 
uint32_t __svc(SD_CLOCK_HFCLK_RELEASE) sd_clock_hfclk_release(void);









 
uint32_t __svc(SD_CLOCK_HFCLK_IS_RUNNING) sd_clock_hfclk_is_running(uint32_t * p_is_running);























 
uint32_t __svc(SD_APP_EVT_WAIT) sd_app_evt_wait(void);






 
uint32_t __svc(SD_PPI_CHANNEL_ENABLE_GET) sd_ppi_channel_enable_get(uint32_t * p_channel_enable);






 
uint32_t __svc(SD_PPI_CHANNEL_ENABLE_SET) sd_ppi_channel_enable_set(uint32_t channel_enable_set_msk);






 
uint32_t __svc(SD_PPI_CHANNEL_ENABLE_CLR) sd_ppi_channel_enable_clr(uint32_t channel_enable_clr_msk);









 
uint32_t __svc(SD_PPI_CHANNEL_ASSIGN) sd_ppi_channel_assign(uint8_t channel_num, const volatile void * evt_endpoint, const volatile void * task_endpoint);







 
uint32_t __svc(SD_PPI_GROUP_TASK_ENABLE) sd_ppi_group_task_enable(uint8_t group_num);







 
uint32_t __svc(SD_PPI_GROUP_TASK_DISABLE) sd_ppi_group_task_disable(uint8_t group_num);








 
uint32_t __svc(SD_PPI_GROUP_ASSIGN) sd_ppi_group_assign(uint8_t group_num, uint32_t channel_msk);








 
uint32_t __svc(SD_PPI_GROUP_GET) sd_ppi_group_get(uint8_t group_num, uint32_t * p_channel_msk);



























 
uint32_t __svc(SD_RADIO_NOTIFICATION_CFG_SET) sd_radio_notification_cfg_set(uint8_t type, uint8_t distance);














 
uint32_t __svc(SD_ECB_BLOCK_ENCRYPT) sd_ecb_block_encrypt(nrf_ecb_hal_data_t * p_ecb_data);















 
uint32_t __svc(SD_ECB_BLOCKS_ENCRYPT) sd_ecb_blocks_encrypt(uint8_t block_count, nrf_ecb_hal_data_block_t * p_data_blocks);









 
uint32_t __svc(SD_EVT_GET) sd_evt_get(uint32_t * p_evt_id);









 
uint32_t __svc(SD_TEMP_GET) sd_temp_get(int32_t * p_temp);
































 
uint32_t __svc(SD_FLASH_WRITE) sd_flash_write(uint32_t * const p_dst, uint32_t const * const p_src, uint32_t size);



























 
uint32_t __svc(SD_FLASH_PAGE_ERASE) sd_flash_page_erase(uint32_t page_number);

















 
uint32_t __svc(SD_FLASH_PROTECT) sd_flash_protect(uint32_t block_cfg0, uint32_t block_cfg1, uint32_t block_cfg2, uint32_t block_cfg3);




















 
 uint32_t __svc(SD_RADIO_SESSION_OPEN) sd_radio_session_open(nrf_radio_signal_callback_t p_radio_signal_callback);











 
 uint32_t __svc(SD_RADIO_SESSION_CLOSE) sd_radio_session_close(void);






























 
 uint32_t __svc(SD_RADIO_REQUEST) sd_radio_request(nrf_radio_request_t * p_request );

 






 
#line 18 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 19 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "..\\..\\..\\..\\..\\..\\components\\drivers_nrf\\delay\\nrf_delay.h"



#line 5 "..\\..\\..\\..\\..\\..\\components\\drivers_nrf\\delay\\nrf_delay.h"














 
 
static __inline void nrf_delay_us(uint32_t number_of_us);












 

 
static __inline void nrf_delay_ms(uint32_t number_of_ms);


static __inline void nrf_delay_us(uint32_t number_of_us)
{
    if(!number_of_us)
        return;
__asm
    {
loop:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    CMP SystemCoreClock, (16000000UL)
    BEQ cond
    NOP

    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

cond:
    SUBS number_of_us,number_of_us, #1
    BNE    loop
    }
}

#line 213 "..\\..\\..\\..\\..\\..\\components\\drivers_nrf\\delay\\nrf_delay.h"

static __inline void nrf_delay_ms(uint32_t number_of_ms)
{
    nrf_delay_us(1000*number_of_ms);
}






#line 20 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"










 








 




#line 26 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 27 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 28 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 30 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"


































 














 




#line 56 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"
#line 57 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"

#line 59 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"






 


 



#line 93 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"




   
#line 112 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"

   



 

 


 

 
typedef struct
{
  uint32_t volatile __irq_masks[(2)];  
  uint32_t volatile __cr_flag;                           
} nrf_nvic_state_t;


 
extern nrf_nvic_state_t nrf_nvic_state;

 


 




 
static inline int __sd_nvic_irq_disable(void)
{
  int pm = __get_PRIMASK();
  __disable_irq();
  return pm;
}


 
static inline void __sd_nvic_irq_enable(void)
{
  __enable_irq();
}





 
static inline uint32_t __sd_nvic_app_accessible_irq(IRQn_Type IRQn)
{
  if (IRQn < 32)
  {
    return ((1UL<<IRQn) & (~((uint32_t)( (1U << POWER_CLOCK_IRQn) | (1U << RADIO_IRQn) | (1U << RTC0_IRQn) | (1U << TIMER0_IRQn) | (1U << RNG_IRQn) | (1U << ECB_IRQn) | (1U << CCM_AAR_IRQn) | (1U << TEMP_IRQn) | (1U << (30)) | (1U << (uint32_t)SWI4_EGU4_IRQn) | (1U << (uint32_t)SWI5_EGU5_IRQn) )))) != 0;
  }

  else if (IRQn < 64)
  {
    return ((1UL<<(IRQn-32)) & (~((uint32_t)0))) != 0;
  }

  else
  {
    return 1;
  }
}





 
static inline uint32_t __sd_nvic_is_app_accessible_priority(uint32_t priority)
{
  if(priority >= (1 << 3))
  {
    return 0;
  }
#line 201 "..\\..\\..\\..\\..\\..\\components\\softdevice\\s132\\headers\\nrf_nvic.h"
  if(   priority == 0
     || priority == 1
     || priority == 4
     || priority == 5
     )
  {
    return 0;
  }

  return 1;
}

 


 











 
static inline uint32_t sd_nvic_EnableIRQ(IRQn_Type IRQn)
{
  if (!__sd_nvic_app_accessible_irq(IRQn))
  {
    return ((0x2000) + 1);
  }
  if (!__sd_nvic_is_app_accessible_priority(NVIC_GetPriority(IRQn)))
  {
    return ((0x2000) + 2);
  }

  if (nrf_nvic_state.__cr_flag)
  {
    nrf_nvic_state.__irq_masks[(uint32_t)((int32_t)IRQn) >> 5] |= (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F));
  }
  else
  {
    NVIC_EnableIRQ(IRQn);
  }
  return ((0x0) + 0);
}










 
static inline uint32_t sd_nvic_DisableIRQ(IRQn_Type IRQn)
{
  if (!__sd_nvic_app_accessible_irq(IRQn))
  {
    return ((0x2000) + 1);
  }

  if (nrf_nvic_state.__cr_flag)
  {
    nrf_nvic_state.__irq_masks[(uint32_t)((int32_t)IRQn) >> 5] &= ~(1UL << ((uint32_t)(IRQn) & 0x1F));
  }
  else
  {
    NVIC_DisableIRQ(IRQn);
  }

  return ((0x0) + 0);
}











 
static inline uint32_t sd_nvic_GetPendingIRQ(IRQn_Type IRQn, uint32_t * p_pending_irq)
{
  if (__sd_nvic_app_accessible_irq(IRQn))
  {
    *p_pending_irq = NVIC_GetPendingIRQ(IRQn);
    return ((0x0) + 0);
  }
  else
  {
    return ((0x2000) + 1);
  }
}










 
static inline uint32_t sd_nvic_SetPendingIRQ(IRQn_Type IRQn)
{
  if (__sd_nvic_app_accessible_irq(IRQn))
  {
    NVIC_SetPendingIRQ(IRQn);
    return ((0x0) + 0);
  }
  else
  {
    return ((0x2000) + 1);
  }
}










 
static inline uint32_t sd_nvic_ClearPendingIRQ(IRQn_Type IRQn)
{
  if (__sd_nvic_app_accessible_irq(IRQn))
  {
    NVIC_ClearPendingIRQ(IRQn);
    return ((0x0) + 0);
  }
  else
  {
    return ((0x2000) + 1);
  }
}













 
static inline uint32_t sd_nvic_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if (!__sd_nvic_app_accessible_irq(IRQn))
  {
    return ((0x2000) + 1);
  }

  if (!__sd_nvic_is_app_accessible_priority(priority))
  {
    return ((0x2000) + 2);
  }

  NVIC_SetPriority(IRQn, (uint32_t)priority);
  return ((0x0) + 0);
}











 
static inline uint32_t sd_nvic_GetPriority(IRQn_Type IRQn, uint32_t * p_priority)
{
  if (__sd_nvic_app_accessible_irq(IRQn))
  {
    *p_priority = (NVIC_GetPriority(IRQn) & 0xFF);
    return ((0x0) + 0);
  }
  else
  {
    return ((0x2000) + 1);
  }
}





 
static inline uint32_t sd_nvic_SystemReset(void)
{
  NVIC_SystemReset();
  return ((0x2000) + 3);
}











 
static inline uint32_t sd_nvic_critical_region_enter(uint8_t * p_is_nested_critical_region)
{
  int was_masked = __sd_nvic_irq_disable();
  if (!nrf_nvic_state.__cr_flag)
  {
    nrf_nvic_state.__cr_flag = 1;
    nrf_nvic_state.__irq_masks[0] = ( ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] & (~((uint32_t)( (1U << POWER_CLOCK_IRQn) | (1U << RADIO_IRQn) | (1U << RTC0_IRQn) | (1U << TIMER0_IRQn) | (1U << RNG_IRQn) | (1U << ECB_IRQn) | (1U << CCM_AAR_IRQn) | (1U << TEMP_IRQn) | (1U << (30)) | (1U << (uint32_t)SWI4_EGU4_IRQn) | (1U << (uint32_t)SWI5_EGU5_IRQn) ))) );
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] = (~((uint32_t)( (1U << POWER_CLOCK_IRQn) | (1U << RADIO_IRQn) | (1U << RTC0_IRQn) | (1U << TIMER0_IRQn) | (1U << RNG_IRQn) | (1U << ECB_IRQn) | (1U << CCM_AAR_IRQn) | (1U << TEMP_IRQn) | (1U << (30)) | (1U << (uint32_t)SWI4_EGU4_IRQn) | (1U << (uint32_t)SWI5_EGU5_IRQn) )));

    nrf_nvic_state.__irq_masks[1] = ( ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[1] & (~((uint32_t)0)) );
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[1] = (~((uint32_t)0));

    *p_is_nested_critical_region = 0;
  }
  else
  {
    *p_is_nested_critical_region = 1;
  }
  if (!was_masked)
  {
    __sd_nvic_irq_enable();
  }
  return ((0x0) + 0);
}









 
static inline uint32_t sd_nvic_critical_region_exit(uint8_t is_nested_critical_region)
{
  if (nrf_nvic_state.__cr_flag && (is_nested_critical_region == 0))
  {
    int was_masked = __sd_nvic_irq_disable();
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0] = nrf_nvic_state.__irq_masks[0];

    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[1] = nrf_nvic_state.__irq_masks[1];

    nrf_nvic_state.__cr_flag = 0;
    if (!was_masked)
    {
      __sd_nvic_irq_enable();
    }
  }

  return ((0x0) + 0);
}
 







 
#line 31 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nrf_assert.h"







 



 




#line 18 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nrf_assert.h"
#line 19 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nrf_assert.h"
#line 20 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nrf_assert.h"
























 

void assert_nrf_callback(uint16_t line_num, const uint8_t *file_name);


#line 80 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\nrf_assert.h"






#line 33 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"
#line 34 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"





#line 60 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"



 
typedef enum
{



    APP_IRQ_PRIORITY_HIGHEST = 2,

    APP_IRQ_PRIORITY_HIGH    = 2,



    APP_IRQ_PRIORITY_MID     = 3,

    APP_IRQ_PRIORITY_LOW     = 6,
    APP_IRQ_PRIORITY_LOWEST  = 7,
    APP_IRQ_PRIORITY_THREAD  = 15      
} app_irq_priority_t;



 
typedef enum
{
    APP_LEVEL_UNPRIVILEGED,
    APP_LEVEL_PRIVILEGED
} app_level_t;

 

 


 








void app_util_critical_region_enter (uint8_t *p_nested);
void app_util_critical_region_exit (uint8_t nested);






 
#line 122 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"






 
#line 136 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"

 







 
#line 156 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"



 
#line 170 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\app_util_platform.h"


 










 
static __inline uint8_t current_int_priority_get(void)
{
    uint32_t isr_vector_num = __get_IPSR() & (0x1FFUL ) ;
    if (isr_vector_num > 0)
    {
        int32_t irq_type = ((int32_t)isr_vector_num - 16);
        return (NVIC_GetPriority((IRQn_Type)irq_type) & 0xFF);
    }
    else
    {
        return APP_IRQ_PRIORITY_THREAD;
    }
}






 
static __inline uint8_t privilege_level_get(void)
{




    uint32_t isr_vector_num = __get_IPSR() & (0x1FFUL ) ;
    if (0 == isr_vector_num)
    {
         
        int32_t control = __get_CONTROL();
        return control & (1UL ) ? APP_LEVEL_UNPRIVILEGED : APP_LEVEL_PRIVILEGED;
    }
    else
    {
         
        return APP_LEVEL_PRIVILEGED;
    }

}








 
#line 21 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"










 

 







 




#line 27 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 28 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"


  



    typedef unsigned int size_t;    
#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"




extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 193 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 209 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 232 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 247 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 270 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 502 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\string.h"



 

#line 29 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 30 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 31 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_os.h"










 

  









 















 

 
 







#line 32 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 33 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 34 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"
#line 1 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_macros.h"










 








 

















 
#line 47 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_macros.h"






 











 
#line 74 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_macros.h"






 







 











 












 












 











 











 






 







#line 35 "..\\..\\..\\..\\..\\..\\components\\libraries\\util\\sdk_common.h"






 
 







#line 22 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"







;enum { assert_line_29 = 1 / (! !(APP_IRQ_PRIORITY_LOW == APP_IRQ_PRIORITY_LOW)) };












 
typedef struct
{
    uint32_t                    ticks_to_expire;                             
    uint32_t                    ticks_at_start;                              
    uint32_t                    ticks_first_interval;                        
    uint32_t                    ticks_periodic_interval;                     
    _Bool                        is_running;                                  
    app_timer_mode_t            mode;                                        
    app_timer_timeout_handler_t p_timeout_handler;                           
    void *                      p_context;                                   
    void *                      next;                                        
} timer_node_t;

;enum { assert_line_56 = 1 / (! !(sizeof(timer_node_t) == 32)) };

 
typedef enum
{
    TIMER_USER_OP_TYPE_NONE,                                                 
    TIMER_USER_OP_TYPE_START,                                                
    TIMER_USER_OP_TYPE_STOP,                                                 
    TIMER_USER_OP_TYPE_STOP_ALL                                              
} timer_user_op_type_t;

 
typedef struct
{
    uint32_t ticks_at_start;                                                 
    uint32_t ticks_first_interval;                                           
    uint32_t ticks_periodic_interval;                                        
    void *   p_context;                                                      
} timer_user_op_start_t;

 
typedef struct
{
    timer_user_op_type_t op_type;                                              
    timer_node_t *       p_node;
    union
    {
        timer_user_op_start_t start;                                         
    } params;
} timer_user_op_t;

;enum { assert_line_87 = 1 / (! !(sizeof(timer_user_op_t) <= 24)) };
;enum { assert_line_88 = 1 / (! !(sizeof(timer_user_op_t) % 4 == 0)) };





 
typedef struct
{
    uint8_t           first;                                                     
    uint8_t           last;                                                      
    uint8_t           size;                                                      
    timer_user_op_t * p_user_op_queue;                                           
} timer_op_queue_t;

;enum { assert_line_103 = 1 / (! !(sizeof(timer_op_queue_t) % 4 == 0)) };



static timer_op_queue_t              m_op_queue;                                 
static timer_node_t *                mp_timer_id_head;                           
static uint32_t                      m_ticks_latest;                             
static uint32_t                      m_ticks_elapsed[(2)];    
static uint8_t                       m_ticks_elapsed_q_read_ind;                 
static uint8_t                       m_ticks_elapsed_q_write_ind;                
static app_timer_evt_schedule_func_t m_evt_schedule_func;                        
static _Bool                          m_rtc1_running;                             
static _Bool                          m_rtc1_reset;                               








 
static void rtc1_init(uint32_t prescaler)
{
    ((NRF_RTC_Type *) 0x40011000UL)->PRESCALER = prescaler;
    NVIC_SetPriority(RTC1_IRQn, APP_IRQ_PRIORITY_LOW);
}



 
static void rtc1_start(void)
{
    ((NRF_RTC_Type *) 0x40011000UL)->EVTENSET = (0x1UL << (16UL));
    ((NRF_RTC_Type *) 0x40011000UL)->INTENSET = (0x1UL << (16UL));

    NVIC_ClearPendingIRQ(RTC1_IRQn);
    NVIC_EnableIRQ(RTC1_IRQn);

    ((NRF_RTC_Type *) 0x40011000UL)->TASKS_START = 1;
    nrf_delay_us(47);

    m_rtc1_running = 1;
}



 
static void rtc1_stop(void)
{
    NVIC_DisableIRQ(RTC1_IRQn);

    ((NRF_RTC_Type *) 0x40011000UL)->EVTENCLR = (0x1UL << (16UL));
    ((NRF_RTC_Type *) 0x40011000UL)->INTENCLR = (0x1UL << (16UL));

    ((NRF_RTC_Type *) 0x40011000UL)->TASKS_STOP = 1;
    nrf_delay_us(47);

    ((NRF_RTC_Type *) 0x40011000UL)->TASKS_CLEAR = 1;
    m_ticks_latest        = 0;
    nrf_delay_us(47);

    m_rtc1_running = 0;
}





 
static __inline uint32_t rtc1_counter_get(void)
{
    return ((NRF_RTC_Type *) 0x40011000UL)->COUNTER;
}





 
static __inline uint32_t ticks_diff_get(uint32_t ticks_now, uint32_t ticks_old)
{
    return ((ticks_now - ticks_old) & 0x00FFFFFF);
}






 
static __inline void rtc1_compare0_set(uint32_t value)
{
    ((NRF_RTC_Type *) 0x40011000UL)->CC[0] = value;
}





 
static void timer_list_insert(timer_node_t * p_timer)
{
    if (mp_timer_id_head == 0)
    {
        mp_timer_id_head = p_timer;
    }
    else
    {
        if (p_timer->ticks_to_expire <= mp_timer_id_head->ticks_to_expire)
        {
            mp_timer_id_head->ticks_to_expire -= p_timer->ticks_to_expire;

            p_timer->next   = mp_timer_id_head;
            mp_timer_id_head = p_timer;
        }
        else
        {
            timer_node_t * p_previous;
            timer_node_t * p_current;
            uint32_t       ticks_to_expire;

            ticks_to_expire   = p_timer->ticks_to_expire;
            p_previous        = mp_timer_id_head;
            p_current         = mp_timer_id_head;

            while ((p_current != 0) && (ticks_to_expire > p_current->ticks_to_expire))
            {
                ticks_to_expire   -= p_current->ticks_to_expire;
                p_previous         = p_current;
                p_current          = p_current->next;
            }

            if (p_current != 0)
            {
                p_current->ticks_to_expire -= ticks_to_expire;
            }

            p_timer->ticks_to_expire = ticks_to_expire;
            p_timer->next            = p_current;
            p_previous->next         = p_timer;
        }
    }
}





 
static void timer_list_remove(timer_node_t * p_timer)
{
    timer_node_t * p_previous;
    timer_node_t * p_current;
    uint32_t       timeout;

    
    p_previous = mp_timer_id_head;
    p_current  = p_previous;

    while (p_current != 0)
    {
        if (p_current == p_timer)
        {
            break;
        }
        p_previous = p_current;
        p_current  = p_current->next;
    }

    
    if (p_current == 0)
    {
        return;
    }

    
    if (p_previous == p_current)
    {
        mp_timer_id_head = mp_timer_id_head->next;

        
        if (mp_timer_id_head == 0)
        {
            ((NRF_RTC_Type *) 0x40011000UL)->TASKS_CLEAR = 1;
            m_ticks_latest        = 0;
            m_rtc1_reset          = 1;
        }
    }

    
    timeout = p_current->ticks_to_expire;

    
    p_previous->next = p_current->next;

    
    p_current = p_previous->next;
    if (p_current != 0)
    {
        p_current->ticks_to_expire += timeout;
    }
}



 
static void timer_timeouts_check_sched(void)
{
    NVIC_SetPendingIRQ(RTC1_IRQn);
}



 
static void timer_list_handler_sched(void)
{
    NVIC_SetPendingIRQ(SWI0_EGU0_IRQn);
}






 
static void timeout_handler_exec(timer_node_t * p_timer)
{
    if (m_evt_schedule_func != 0)
    {
        uint32_t err_code = m_evt_schedule_func(p_timer->p_timeout_handler, p_timer->p_context);
        do { const uint32_t LOCAL_ERR_CODE = (err_code); if (LOCAL_ERR_CODE != ((0x0) + 0)) { do { app_error_handler_bare((LOCAL_ERR_CODE)); } while (0); } } while (0);
    }
    else
    {
        p_timer->p_timeout_handler(p_timer->p_context);
    }
}



 
static void timer_timeouts_check(void)
{
    
    if (mp_timer_id_head != 0)
    {
        timer_node_t *  p_timer;
        timer_node_t *  p_previous_timer;
        uint32_t        ticks_elapsed;
        uint32_t        ticks_expired;

        
        ticks_expired = 0;

        
        ticks_elapsed = ticks_diff_get(rtc1_counter_get(), m_ticks_latest);

        
        p_timer = mp_timer_id_head;

        
        while (p_timer != 0)
        {
            
            if (ticks_elapsed < p_timer->ticks_to_expire)
            {
                break;
            }

            
            ticks_elapsed -= p_timer->ticks_to_expire;
            ticks_expired += p_timer->ticks_to_expire;

            
            p_previous_timer = p_timer;
            p_timer = p_timer->next;

            
            if (p_previous_timer->is_running)
            {
                p_previous_timer->is_running = 0;
                timeout_handler_exec(p_previous_timer);
            }
        }

        
        if (m_ticks_elapsed_q_read_ind == m_ticks_elapsed_q_write_ind)
        {
            
            
            

            
            if (++m_ticks_elapsed_q_write_ind == (2))
            {
                
                
                m_ticks_elapsed_q_write_ind = 0;
            }
        }

        
        m_ticks_elapsed[m_ticks_elapsed_q_write_ind] = ticks_expired;

        timer_list_handler_sched();
    }
}







 
static _Bool elapsed_ticks_acquire(uint32_t * p_ticks_elapsed)
{
    
    if (m_ticks_elapsed_q_read_ind != m_ticks_elapsed_q_write_ind)
    {
        
        m_ticks_elapsed_q_read_ind++;
        if (m_ticks_elapsed_q_read_ind == (2))
        {
            m_ticks_elapsed_q_read_ind = 0;
        }

        *p_ticks_elapsed = m_ticks_elapsed[m_ticks_elapsed_q_read_ind];

        m_ticks_latest += *p_ticks_elapsed;
        m_ticks_latest &= 0x00FFFFFF;

        return 1;
    }
    else
    {
        
        *p_ticks_elapsed = 0;
        return 0;
    }
}





 
static _Bool list_deletions_handler(void)
{
    timer_node_t * p_timer_old_head;
    uint8_t        user_ops_first = m_op_queue.first;

    
    p_timer_old_head = mp_timer_id_head;

    while (user_ops_first != m_op_queue.last)
    {
        timer_user_op_t * p_user_op = &m_op_queue.p_user_op_queue[user_ops_first];

        
        user_ops_first++;
        if (user_ops_first == m_op_queue.size)
        {
            user_ops_first = 0;
        }

        switch (p_user_op->op_type)
        {
            case TIMER_USER_OP_TYPE_STOP:
                
                timer_list_remove(p_user_op->p_node);
                break;

            case TIMER_USER_OP_TYPE_STOP_ALL:
                
                while (mp_timer_id_head != 0)
                {
                    timer_node_t * p_head = mp_timer_id_head;

                    p_head->is_running = 0;
                    mp_timer_id_head    = p_head->next;
                }
                break;

            default:
                
                break;
        }
    }

    
    return (mp_timer_id_head != p_timer_old_head);
}







 
static void expired_timers_handler(uint32_t         ticks_elapsed,
                                   uint32_t         ticks_previous,
                                   timer_node_t **  p_restart_list_head)
{
    uint32_t ticks_expired = 0;

    while (mp_timer_id_head != 0)
    {
        timer_node_t * p_timer;
        timer_node_t * p_timer_expired;

        
        p_timer = mp_timer_id_head;

        
        if (ticks_elapsed < p_timer->ticks_to_expire)
        {
            p_timer->ticks_to_expire -= ticks_elapsed;
            break;
        }

        
        ticks_elapsed -= p_timer->ticks_to_expire;
        ticks_expired += p_timer->ticks_to_expire;

        
        p_timer->ticks_to_expire = 0;

        
        p_timer_expired  = mp_timer_id_head;
        mp_timer_id_head = p_timer->next;

        
        if (p_timer->ticks_periodic_interval != 0)
        {
            p_timer->ticks_at_start       = (ticks_previous + ticks_expired) & 0x00FFFFFF;
            p_timer->ticks_first_interval = p_timer->ticks_periodic_interval;
            p_timer->next                 = *p_restart_list_head;
            *p_restart_list_head          = p_timer_expired;
        }
    }
}







 
static _Bool list_insertions_handler(timer_node_t * p_restart_list_head)
{
    timer_node_t * p_timer_id_old_head;

    
    p_timer_id_old_head = mp_timer_id_head;

    
    while ((p_restart_list_head != 0) || (m_op_queue.first != m_op_queue.last))
    {
        timer_node_t * p_timer;

        if (p_restart_list_head != 0)
        {
            p_timer           = p_restart_list_head;
            p_restart_list_head = p_timer->next;
        }
        else
        {
            timer_user_op_t * p_user_op = &m_op_queue.p_user_op_queue[m_op_queue.first];

            m_op_queue.first++;
            if (m_op_queue.first == m_op_queue.size)
            {
                m_op_queue.first = 0;
            }

            p_timer = p_user_op->p_node;

            if ((p_user_op->op_type != TIMER_USER_OP_TYPE_START) || p_timer->is_running)
            {
                continue;
            }

            p_timer->ticks_at_start          = p_user_op->params.start.ticks_at_start;
            p_timer->ticks_first_interval    = p_user_op->params.start.ticks_first_interval;
            p_timer->ticks_periodic_interval = p_user_op->params.start.ticks_periodic_interval;
            p_timer->p_context               = p_user_op->params.start.p_context;

            if (m_rtc1_reset)
            {
                p_timer->ticks_at_start = 0;
            }
        }

        
        if (
             ((p_timer->ticks_at_start - m_ticks_latest) & 0x00FFFFFF)
             <
             (0x00FFFFFF / 2)
            )
        {
            p_timer->ticks_to_expire = ticks_diff_get(p_timer->ticks_at_start, m_ticks_latest) +
                                       p_timer->ticks_first_interval;
        }
        else
        {
            uint32_t delta_current_start;

            delta_current_start = ticks_diff_get(m_ticks_latest, p_timer->ticks_at_start);
            if (p_timer->ticks_first_interval > delta_current_start)
            {
                p_timer->ticks_to_expire = p_timer->ticks_first_interval - delta_current_start;
            }
            else
            {
                p_timer->ticks_to_expire = 0;
            }
        }

        p_timer->ticks_at_start       = 0;
        p_timer->ticks_first_interval = 0;
        p_timer->is_running           = 1;
        p_timer->next                 = 0;

        
        timer_list_insert(p_timer);
    }

    return (mp_timer_id_head != p_timer_id_old_head);
}



 
static void compare_reg_update(timer_node_t * p_timer_id_head_old)
{
    
    if (mp_timer_id_head != 0)
    {
        uint32_t ticks_to_expire = mp_timer_id_head->ticks_to_expire;
        uint32_t pre_counter_val = rtc1_counter_get();
        uint32_t cc              = m_ticks_latest;
        uint32_t ticks_elapsed   = ticks_diff_get(pre_counter_val, cc) + 3;

        if (!m_rtc1_running)
        {
            
            rtc1_start();
        }

        cc += (ticks_elapsed < ticks_to_expire) ? ticks_to_expire : ticks_elapsed;
        cc &= 0x00FFFFFF;

        rtc1_compare0_set(cc);

        uint32_t post_counter_val = rtc1_counter_get();

        if (
            (ticks_diff_get(post_counter_val, pre_counter_val) + 3)
            >
            ticks_diff_get(cc, pre_counter_val)
           )
        {
            
            
            
            
            
            rtc1_compare0_set(rtc1_counter_get());  
            nrf_delay_us(47);
            timer_timeouts_check_sched();
        }
    }
    else
    {

        
        rtc1_stop();

    }
}



 
static void timer_list_handler(void)
{
    timer_node_t * p_restart_list_head = 0;

    uint32_t       ticks_elapsed;
    uint32_t       ticks_previous;
    _Bool           ticks_have_elapsed;
    _Bool           compare_update;
    timer_node_t * p_timer_id_head_old;

#line 714 "..\\..\\..\\..\\..\\..\\components\\libraries\\timer\\app_timer.c"

    
    ticks_previous    = m_ticks_latest;
    p_timer_id_head_old = mp_timer_id_head;

    
    ticks_have_elapsed = elapsed_ticks_acquire(&ticks_elapsed);

    
    compare_update = list_deletions_handler();

    
    if (ticks_have_elapsed)
    {
        expired_timers_handler(ticks_elapsed, ticks_previous, &p_restart_list_head);
        compare_update = 1;
    }

    
    if (list_insertions_handler(p_restart_list_head))
    {
        compare_update = 1;
    }

    
    if (compare_update)
    {
        compare_reg_update(p_timer_id_head_old);
    }
    m_rtc1_reset = 0;
}





 
static void user_op_enque(uint8_t last_index)
{
    m_op_queue.last = last_index;
}







 
static timer_user_op_t * user_op_alloc( uint8_t * p_last_index)
{
    uint8_t           last;
    timer_user_op_t * p_user_op;

    last = m_op_queue.last + 1;
    if (last == m_op_queue.size)
    {
        
        last = 0;
    }
    if (last == m_op_queue.first)
    {
        
        return 0;
    }

    *p_last_index = last;
    p_user_op     = &m_op_queue.p_user_op_queue[m_op_queue.last];

    return p_user_op;
}










 

static uint32_t timer_start_op_schedule(timer_node_t * p_node,
                                        uint32_t        timeout_initial,
                                        uint32_t        timeout_periodic,
                                        void *          p_context)
{
    uint8_t last_index;
    uint32_t err_code = ((0x0) + 0);

    { uint8_t __CR_NESTED = 0; app_util_critical_region_enter(&__CR_NESTED);;
    timer_user_op_t * p_user_op = user_op_alloc(&last_index);
    if (p_user_op == 0)
    {
        err_code = ((0x0) + 4);
    }
    else
    {

        p_user_op->op_type                              = TIMER_USER_OP_TYPE_START;
        p_user_op->p_node                               = p_node;
        p_user_op->params.start.ticks_at_start          = rtc1_counter_get();
        p_user_op->params.start.ticks_first_interval    = timeout_initial;
        p_user_op->params.start.ticks_periodic_interval = timeout_periodic;
        p_user_op->params.start.p_context               = p_context;

        user_op_enque(last_index);
    }
    app_util_critical_region_exit(__CR_NESTED); };

    if (err_code == ((0x0) + 0))
    {
        timer_list_handler_sched();
    }

    return err_code;
}









 
static uint32_t timer_stop_op_schedule(timer_node_t * p_node,
                                       timer_user_op_type_t op_type)
{
    uint8_t last_index;
    uint32_t err_code = ((0x0) + 0);

    { uint8_t __CR_NESTED = 0; app_util_critical_region_enter(&__CR_NESTED);;
    timer_user_op_t * p_user_op = user_op_alloc(&last_index);
    if (p_user_op == 0)
    {
        err_code = ((0x0) + 4);
    }
    else
    {
        p_user_op->op_type  = op_type;
        p_user_op->p_node = p_node;

        user_op_enque(last_index);
    }
    app_util_critical_region_exit(__CR_NESTED); };

    if (err_code == ((0x0) + 0))
    {
        timer_list_handler_sched();
    }

    return err_code;
}




 
void RTC1_IRQHandler(void)
{
    
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_COMPARE[0] = 0;
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_COMPARE[1] = 0;
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_COMPARE[2] = 0;
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_COMPARE[3] = 0;
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_TICK       = 0;
    ((NRF_RTC_Type *) 0x40011000UL)->EVENTS_OVRFLW     = 0;

    
    timer_timeouts_check();
}





 
void SWI0_EGU0_IRQHandler(void)
{
    timer_list_handler();
}


uint32_t app_timer_init(uint32_t                      prescaler,
                        uint8_t                       op_queue_size,
                        void *                        p_buffer,
                        app_timer_evt_schedule_func_t evt_schedule_func)
{
    
    if (!is_word_aligned(p_buffer))
    {
        return ((0x0) + 7);
    }
    
    if (p_buffer == 0)
    {
        return ((0x0) + 7);
    }

    
    rtc1_stop();

    m_evt_schedule_func = evt_schedule_func;

    
    m_op_queue.first           = 0;
    m_op_queue.last            = 0;
    m_op_queue.size            = op_queue_size;
    m_op_queue.p_user_op_queue = p_buffer;

    mp_timer_id_head            = 0;
    m_ticks_elapsed_q_read_ind  = 0;
    m_ticks_elapsed_q_write_ind = 0;





    NVIC_ClearPendingIRQ(SWI0_EGU0_IRQn);
    NVIC_SetPriority(SWI0_EGU0_IRQn, APP_IRQ_PRIORITY_LOW);
    NVIC_EnableIRQ(SWI0_EGU0_IRQn);

    rtc1_init(prescaler);

    m_ticks_latest = rtc1_counter_get();

    return ((0x0) + 0);
}


uint32_t app_timer_create(app_timer_id_t const *      p_timer_id,
                          app_timer_mode_t            mode,
                          app_timer_timeout_handler_t timeout_handler)
{
    
    do { if (!(((m_op_queue . p_user_op_queue != 0)))) { return ((0x0) + 8); } } while (0);

    if (timeout_handler == 0)
    {
        return ((0x0) + 7);
    }
    if (p_timer_id == 0)
    {
        return ((0x0) + 7);
    }
    if (((timer_node_t*)*p_timer_id)->is_running)
    {
        return ((0x0) + 8);
    }

    timer_node_t * p_node     = (timer_node_t *)*p_timer_id;
    p_node->is_running        = 0;
    p_node->mode              = mode;
    p_node->p_timeout_handler = timeout_handler;
    return ((0x0) + 0);
}

uint32_t app_timer_start(app_timer_id_t timer_id, uint32_t timeout_ticks, void * p_context)
{
    uint32_t timeout_periodic;
    timer_node_t * p_node = (timer_node_t*)timer_id;

    
    do { if (!(((m_op_queue . p_user_op_queue != 0)))) { return ((0x0) + 8); } } while (0);

    if (timer_id == 0)
    {
        return ((0x0) + 8);
    }
    if (timeout_ticks < 5)
    {
        return ((0x0) + 7);
    }
    if (p_node->p_timeout_handler == 0)
    {
        return ((0x0) + 8);
    }

    
    timeout_periodic = (p_node->mode == APP_TIMER_MODE_REPEATED) ? timeout_ticks : 0;

    return timer_start_op_schedule(p_node,
                                   timeout_ticks,
                                   timeout_periodic,
                                   p_context);
}


uint32_t app_timer_stop(app_timer_id_t timer_id)
{
    timer_node_t * p_node = (timer_node_t*)timer_id;
    
    do { if (!(((m_op_queue . p_user_op_queue != 0)))) { return ((0x0) + 8); } } while (0);

    if ((timer_id == 0) || (p_node->p_timeout_handler == 0))
    {
        return ((0x0) + 8);
    }

    p_node->is_running = 0;
    
    return timer_stop_op_schedule(p_node, TIMER_USER_OP_TYPE_STOP);
}


uint32_t app_timer_stop_all(void)
{
    
    do { if (!(((m_op_queue . p_user_op_queue != 0)))) { return ((0x0) + 8); } } while (0);

    return timer_stop_op_schedule(0, TIMER_USER_OP_TYPE_STOP_ALL);
}


uint32_t app_timer_cnt_get(void)
{
    return rtc1_counter_get();
}


uint32_t app_timer_cnt_diff_compute(uint32_t   ticks_to,
                                    uint32_t   ticks_from,
                                    uint32_t * p_ticks_diff)
{
    *p_ticks_diff = ticks_diff_get(ticks_to, ticks_from);
    return ((0x0) + 0);
}

