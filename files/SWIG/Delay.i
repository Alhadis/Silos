








 













 






 

typedef signed    char  int8_t;
typedef unsigned  char  uint8_t;
typedef signed    short int16_t;
typedef unsigned  short uint16_t;
typedef signed    long  int32_t;
typedef unsigned  long  uint32_t;
typedef signed    long long int64_t;
typedef unsigned  long long uint64_t;

typedef signed    char  intn8_t;
typedef unsigned  char  uintn8_t;
typedef signed    short intn16_t;
typedef unsigned  short uintn16_t;
typedef signed    long  intn32_t;
typedef unsigned  long  uintn32_t;
typedef signed    long long intn64_t;
typedef unsigned  long long uintn64_t;

 
typedef uint8_t   bool_t;
typedef uintn8_t  booln_t;
 
typedef uint8_t   index_t;





typedef uint32_t zbClock32_t;
typedef uint32_t zbClock24_t;
typedef uint16_t zbClock16_t;


void Set2Bytes(void *ptr, uint16_t val);
bool_t IsEqual2BytesInt(void *ptr, uint16_t val);
void Inc4Bytes(uint8_t* aVal1, uint32_t Val2);

 

 
typedef uint8_t assertCode_t;

void BeeAppAssert(assertCode_t code);


 










 


extern void DelayMs(uint32_t ms);
extern void DelayUs(uint32_t us);
















 





 

 

 





 






 

   
   
  void DelayUs(uint32_t us)
  {
    __asm("cmp r0, #0");
    __asm("beq us_func_end");
    __asm("push {r0,r1,r2}");
    __asm("us_func_start: ldr r2, [PC, #4]");
    __asm("b us_loop_start");
    __asm("nop");
    __asm("DC32 " "24000/6000" "\n");
    
    __asm("us_loop_start: movs r1, r2");
    __asm("us_loop_start_r1: subs r1, r1, #1");
    __asm("cmp r1, #0");
    __asm("bne us_loop_start_r1");
    
    __asm("subs r0, r0, #1");
    __asm("cmp r0, #0");
    __asm("bne us_loop_start");
    
    __asm("us_func_end:  pop{r2} \n pop {r1} \n pop {r0}");
  }
   

   
  void DelayMs(uint32_t ms)
  {
    __asm("cmp r0, #0");
    __asm("beq ms_func_end");
    __asm("push {r0,r1,r2}");
    __asm("ms_func_start: ldr r2, [PC, #4]");
    __asm("b ms_loop_start");
    __asm("nop");
    __asm("DC32 " "24000/5" "\n");
    
    __asm("ms_loop_start: movs r1, r2");
    __asm("ms_loop_start_r1: subs r1, r1, #1");
    __asm("cmp r1, #0");
    __asm("bne ms_loop_start_r1");
    
    __asm("subs r0, r0, #1");
    __asm("cmp r0, #0");
    __asm("bne ms_loop_start");
    
    __asm("ms_func_end:  pop{r2} \n pop {r1} \n pop {r0}");
  }
   
