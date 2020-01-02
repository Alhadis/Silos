#line 1 "rs274ngc_pre.c"
   





















 

   




























































































 

    

#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
 
 
 





 






 









#line 34 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 125 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






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

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
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
    





 











#line 944 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"



 
#line 123 "rs274ngc_pre.c"
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"
 
 
 




 
 



 












  


 








#line 45 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"


  
  typedef unsigned int size_t;










    



    typedef unsigned short wchar_t;  
#line 74 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { __int64 quot, rem; } lldiv_t;
    


#line 95 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"
   



 

   




 
#line 114 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) __int64 atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) __int64 strtoll(const char * __restrict  ,
                               char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned __int64 strtoull(const char * __restrict  ,
                                         char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



 

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
   




 
#line 414 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 502 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 531 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"

extern __declspec(__nothrow) __pure int abs(int  );
   



 

extern __declspec(__nothrow) __pure div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __pure long int labs(long int  );
   



 




extern __declspec(__nothrow) __pure ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __pure __int64 llabs(__int64  );
   



 




extern __declspec(__nothrow) __pure lldiv_t lldiv(__int64  , __int64  );
   











 
#line 612 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"



 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __pure __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __sdiv64by32 __rt_sdiv64by32(
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











#line 866 "C:\\Keil\\ARM\\RV31\\INC\\stdlib.h"


 
#line 124 "rs274ngc_pre.c"
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\math.h"




 





 












 







 






#line 47 "C:\\Keil\\ARM\\RV31\\INC\\math.h"

#line 61 "C:\\Keil\\ARM\\RV31\\INC\\math.h"

   




 















 
#line 92 "C:\\Keil\\ARM\\RV31\\INC\\math.h"











 





extern __softfp unsigned __ARM_dcmp4(double  , double  );
extern __softfp unsigned __ARM_fcmp4(float  , float  );
    




 

extern __declspec(__nothrow) __softfp int __ARM_fpclassifyf(float  );
extern __declspec(__nothrow) __softfp int __ARM_fpclassify(double  );
     
     

__inline __declspec(__nothrow) __softfp int __ARM_isfinitef(float __x)
{
    return (((*(unsigned *)&(__x)) >> 23) & 0xff) != 0xff;
}
__inline __declspec(__nothrow) __softfp int __ARM_isfinite(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff) != 0x7ff;
}
     
     

__inline __declspec(__nothrow) __softfp int __ARM_isinff(float __x)
{
    return ((*(unsigned *)&(__x)) << 1) == 0xff000000;
}
__inline __declspec(__nothrow) __softfp int __ARM_isinf(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) << 1) == 0xffe00000) && ((*(unsigned *)&(__x)) == 0);
}
     
     

__inline __declspec(__nothrow) __softfp int __ARM_islessgreaterf(float __x, float __y)
{
    unsigned __f = __ARM_fcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
__inline __declspec(__nothrow) __softfp int __ARM_islessgreater(double __x, double __y)
{
    unsigned __f = __ARM_dcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
    


 

__inline __declspec(__nothrow) __softfp int __ARM_isnanf(float __x)
{
    return (0x7f800000 - ((*(unsigned *)&(__x)) & 0x7fffffff)) >> 31;
}
__inline __declspec(__nothrow) __softfp int __ARM_isnan(double __x)
{
    unsigned __xf = (*(1 + (unsigned *)&(__x))) | (((*(unsigned *)&(__x)) == 0) ? 0 : 1);
    return (0x7ff00000 - (__xf & 0x7fffffff)) >> 31;
}
     
     

__inline __declspec(__nothrow) __softfp int __ARM_isnormalf(float __x)
{
    unsigned __xe = ((*(unsigned *)&(__x)) >> 23) & 0xff;
    return (__xe != 0xff) && (__xe != 0);
}
__inline __declspec(__nothrow) __softfp int __ARM_isnormal(double __x)
{
    unsigned __xe = ((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff;
    return (__xe != 0x7ff) && (__xe != 0);
}
     
     

__inline __declspec(__nothrow) __softfp int __ARM_signbitf(float __x)
{
    return (*(unsigned *)&(__x)) >> 31;
}
__inline __declspec(__nothrow) __softfp int __ARM_signbit(double __x)
{
    return (*(1 + (unsigned *)&(__x))) >> 31;
}
     
     








#line 210 "C:\\Keil\\ARM\\RV31\\INC\\math.h"



   
  typedef float float_t;
  typedef double double_t;







extern const int math_errhandling;



extern __declspec(__nothrow) double acos(double  );
    
    
    
extern __declspec(__nothrow) double asin(double  );
    
    
    
    

extern __declspec(__nothrow) __pure double atan(double  );
    
    

extern __declspec(__nothrow) double atan2(double  , double  );
    
    
    
    

extern __declspec(__nothrow) double cos(double  );
    
    
    
    
extern __declspec(__nothrow) double sin(double  );
    
    
    
    

extern void __use_accurate_range_reduction(void);
    
    

extern __declspec(__nothrow) double tan(double  );
    
    
    
    

extern __declspec(__nothrow) double cosh(double  );
    
    
    
    
extern __declspec(__nothrow) double sinh(double  );
    
    
    
    
    

extern __declspec(__nothrow) __pure double tanh(double  );
    
    

extern __declspec(__nothrow) double exp(double  );
    
    
    
    
    

extern __declspec(__nothrow) double frexp(double  , int *  ) __attribute__((__nonnull__(2)));
    
    
    
    
    
    

extern __declspec(__nothrow) double ldexp(double  , int  );
    
    
    
    
extern __declspec(__nothrow) double log(double  );
    
    
    
    
    
extern __declspec(__nothrow) double log10(double  );
    
    
    
extern __declspec(__nothrow) double modf(double  , double *  ) __attribute__((__nonnull__(2)));
    
    
    
    

extern __declspec(__nothrow) double pow(double  , double  );
    
    
    
    
    
    
extern __declspec(__nothrow) double sqrt(double  );
    
    
    




    __inline double _sqrt(double __x) { return sqrt(__x); }




    __inline float _sqrtf(float __x) { return (float)sqrt(__x); }

    



 

extern __declspec(__nothrow) __pure double ceil(double  );
    
    
extern __declspec(__nothrow) __pure double fabs(double  );
    
    

extern __declspec(__nothrow) __pure double floor(double  );
    
    

extern __declspec(__nothrow) double fmod(double  , double  );
    
    
    
    
    

    









 



extern __declspec(__nothrow) double acosh(double  );
    

 
extern __declspec(__nothrow) double asinh(double  );
    

 
extern __declspec(__nothrow) double atanh(double  );
    

 
extern __declspec(__nothrow) double cbrt(double  );
    

 
__inline __declspec(__nothrow) __pure double copysign(double __x, double __y)
    

 
{
    (*(1 + (unsigned *)&(__x))) = ((*(1 + (unsigned *)&(__x))) & 0x7fffffff) | ((*(1 + (unsigned *)&(__y))) & 0x80000000);
    return __x;
}
__inline __declspec(__nothrow) __pure float copysignf(float __x, float __y)
    

 
{
    (*(unsigned *)&(__x)) = ((*(unsigned *)&(__x)) & 0x7fffffff) | ((*(unsigned *)&(__y)) & 0x80000000);
    return __x;
}
extern __declspec(__nothrow) double erf(double  );
    

 
extern __declspec(__nothrow) double erfc(double  );
    

 
extern __declspec(__nothrow) double expm1(double  );
    

 



    

 






#line 444 "C:\\Keil\\ARM\\RV31\\INC\\math.h"


extern __declspec(__nothrow) double hypot(double  , double  );
    




 
extern __declspec(__nothrow) int ilogb(double  );
    

 
extern __declspec(__nothrow) int ilogbf(float  );
    

 
extern __declspec(__nothrow) int ilogbl(long double  );
    

 







    

 





    



 





    



 





    

 





    



 





    



 





    



 





    

 





    

 





    


 

extern __declspec(__nothrow) double lgamma (double  );
    


 
extern __declspec(__nothrow) double log1p(double  );
    

 
extern __declspec(__nothrow) double logb(double  );
    

 
extern __declspec(__nothrow) float logbf(float  );
    

 
extern __declspec(__nothrow) long double logbl(long double  );
    

 
extern __declspec(__nothrow) double nextafter(double  , double  );
    


 
extern __declspec(__nothrow) float nextafterf(float  , float  );
    


 
extern __declspec(__nothrow) long double nextafterl(long double  , long double  );
    


 
extern __declspec(__nothrow) double nexttoward(double  , long double  );
    


 
extern __declspec(__nothrow) float nexttowardf(float  , long double  );
    


 
extern __declspec(__nothrow) long double nexttowardl(long double  , long double  );
    


 
extern __declspec(__nothrow) double remainder(double  , double  );
    

 
extern __declspec(__nothrow) __pure double rint(double  );
    

 
extern __declspec(__nothrow) double scalbln(double  , long int  );
    

 
extern __declspec(__nothrow) float scalblnf(float  , long int  );
    

 
extern __declspec(__nothrow) long double scalblnl(long double  , long int  );
    

 
extern __declspec(__nothrow) double scalbn(double  , int  );
    

 
extern __declspec(__nothrow) float scalbnf(float  , int  );
    

 
extern __declspec(__nothrow) long double scalbnl(long double  , int  );
    

 




    

 



 
extern __declspec(__nothrow) __pure float _fabsf(float);  
__inline __declspec(__nothrow) __pure float fabsf(float __f) { return _fabsf(__f); }
extern __declspec(__nothrow) float sinf(float  );
extern __declspec(__nothrow) float cosf(float  );
extern __declspec(__nothrow) float tanf(float  );
extern __declspec(__nothrow) float acosf(float  );
extern __declspec(__nothrow) float asinf(float  );
extern __declspec(__nothrow) float atanf(float  );
extern __declspec(__nothrow) float atan2f(float  , float  );
extern __declspec(__nothrow) float sinhf(float  );
extern __declspec(__nothrow) float coshf(float  );
extern __declspec(__nothrow) float tanhf(float  );
extern __declspec(__nothrow) float expf(float  );
extern __declspec(__nothrow) float logf(float  );
extern __declspec(__nothrow) float log10f(float  );
extern __declspec(__nothrow) float powf(float  , float  );
extern __declspec(__nothrow) float sqrtf(float  );
extern __declspec(__nothrow) float ldexpf(float  , int  );
extern __declspec(__nothrow) float frexpf(float  , int *  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) __pure float ceilf(float  );
extern __declspec(__nothrow) __pure float floorf(float  );
extern __declspec(__nothrow) float fmodf(float  , float  );
extern __declspec(__nothrow) float modff(float  , float *  ) __attribute__((__nonnull__(2)));

 
 













 
__declspec(__nothrow) long double acosl(long double );
__declspec(__nothrow) long double asinl(long double );
__declspec(__nothrow) long double atanl(long double );
__declspec(__nothrow) long double atan2l(long double , long double );
__declspec(__nothrow) long double ceill(long double );
__declspec(__nothrow) long double cosl(long double );
__declspec(__nothrow) long double coshl(long double );
__declspec(__nothrow) long double expl(long double );
__declspec(__nothrow) long double fabsl(long double );
__declspec(__nothrow) long double floorl(long double );
__declspec(__nothrow) long double fmodl(long double , long double );
__declspec(__nothrow) long double frexpl(long double , int* ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double ldexpl(long double , int );
__declspec(__nothrow) long double logl(long double );
__declspec(__nothrow) long double log10l(long double );
__declspec(__nothrow) long double modfl(long double  , long double *  ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double powl(long double , long double );
__declspec(__nothrow) long double sinl(long double );
__declspec(__nothrow) long double sinhl(long double );
__declspec(__nothrow) long double sqrtl(long double );
__declspec(__nothrow) long double tanl(long double );
__declspec(__nothrow) long double tanhl(long double );





 
extern __declspec(__nothrow) float acoshf(float  );
__declspec(__nothrow) long double acoshl(long double );
extern __declspec(__nothrow) float asinhf(float  );
__declspec(__nothrow) long double asinhl(long double );
extern __declspec(__nothrow) float atanhf(float  );
__declspec(__nothrow) long double atanhl(long double );
__declspec(__nothrow) long double copysignl(long double , long double );
extern __declspec(__nothrow) float cbrtf(float  );
__declspec(__nothrow) long double cbrtl(long double );
extern __declspec(__nothrow) float erff(float  );
__declspec(__nothrow) long double erfl(long double );
extern __declspec(__nothrow) float erfcf(float  );
__declspec(__nothrow) long double erfcl(long double );
extern __declspec(__nothrow) float expm1f(float  );
__declspec(__nothrow) long double expm1l(long double );
extern __declspec(__nothrow) float log1pf(float  );
__declspec(__nothrow) long double log1pl(long double );
extern __declspec(__nothrow) float hypotf(float  , float  );
__declspec(__nothrow) long double hypotl(long double , long double );
extern __declspec(__nothrow) float lgammaf(float  );
__declspec(__nothrow) long double lgammal(long double );
extern __declspec(__nothrow) float remainderf(float  , float  );
__declspec(__nothrow) long double remainderl(long double , long double );
extern __declspec(__nothrow) float rintf(float  );
__declspec(__nothrow) long double rintl(long double );



#line 824 "C:\\Keil\\ARM\\RV31\\INC\\math.h"





#line 979 "C:\\Keil\\ARM\\RV31\\INC\\math.h"











#line 1181 "C:\\Keil\\ARM\\RV31\\INC\\math.h"



 
#line 125 "rs274ngc_pre.c"
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
 
 
 
 




 








 











#line 37 "C:\\Keil\\ARM\\RV31\\INC\\string.h"


  
  typedef unsigned int size_t;








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
   













 


#line 184 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 200 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 223 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 238 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 261 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
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
    














































 







#line 493 "C:\\Keil\\ARM\\RV31\\INC\\string.h"



 
#line 126 "rs274ngc_pre.c"
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"
 
 
 
 





 






 







#line 32 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"






#line 46 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"

 
#line 56 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"

 
 









 
#line 78 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"





#line 130 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"

extern __declspec(__nothrow) __pure unsigned char **__rt_ctype_table(void);







    extern int (isalnum)(int  );

     





    extern int (isalpha)(int  );

     





    extern int (iscntrl)(int  );

     
     

 




    extern int (isdigit)(int  );

     

    extern int (isblank)(int  );
     
     
     





    extern int (isgraph)(int  );

     





    extern int (islower)(int  );

     





    extern int (isprint)(int  );

     
     





    extern int (ispunct)(int  );

     





    extern int (isspace)(int  );

     





    extern int (isupper)(int  );

     

 
 

__inline int __isxdigit_helper(int __t) { return (__t ^ (__t << 2)); }




    extern int (isxdigit)(int  );

     



extern int tolower(int  );
     
     

extern int toupper(int  );
     
     







#line 269 "C:\\Keil\\ARM\\RV31\\INC\\ctype.h"



 
#line 127 "rs274ngc_pre.c"
#line 1 "rs274ngc.h"
   





















 




   




 

    
    
    

#line 40 "rs274ngc.h"
#line 1 "canon.h"
   





















 




   


















 

typedef int CANON_PLANE;




typedef int CANON_UNITS;




typedef int CANON_MOTION_MODE;




typedef int CANON_SPEED_FEED_MODE;



typedef int CANON_DIRECTION;




typedef int CANON_FEED_REFERENCE;



typedef int CANON_SIDE;




typedef int CANON_AXIS;
#line 89 "canon.h"

   











 


















































 

    



typedef struct canon_tool_table
{
    int id;
    double length;
    double diameter;
}CANON_TOOL_TABLE;

    

    
extern void INIT_CANON();

    

extern void SET_ORIGIN_OFFSETS(
double x, double y, double z
#line 196 "canon.h"
);

   


 

extern void USE_LENGTH_UNITS(CANON_UNITS u);

   
 

extern void SELECT_PLANE(CANON_PLANE pl);

   

 

    

extern void SET_TRAVERSE_RATE(double rate);

   

 

extern void STRAIGHT_TRAVERSE(
double x, double y, double z
#line 245 "canon.h"
);
   















 

    

extern void SET_FEED_RATE(double rate);

   




























 

extern void SET_FEED_REFERENCE(CANON_FEED_REFERENCE reference);

   
















































 

extern void SET_MOTION_CONTROL_MODE(CANON_MOTION_MODE mode);

   




 

extern void SET_CUTTER_RADIUS_COMPENSATION(double radius);

    

extern void START_CUTTER_RADIUS_COMPENSATION(int direction);

   
 

extern void STOP_CUTTER_RADIUS_COMPENSATION();

   
 

extern void START_SPEED_FEED_SYNCH();
extern void STOP_SPEED_FEED_SYNCH();

    

extern void ARC_FEED(
double first_end,
double second_end,
double first_axis,
double second_axis,
int rotation,
double axis_end_point
#line 408 "canon.h"
);

   
















































 

extern void STRAIGHT_FEED(
double x, double y, double z
#line 484 "canon.h"
);

   

 

extern void STRAIGHT_PROBE (
double x, double y, double z
#line 513 "canon.h"
);

   


 

extern void STOP();

    

extern void DWELL(double seconds);

    

    

extern void SPINDLE_RETRACT_TRAVERSE();

    

extern void START_SPINDLE_CLOCKWISE();

   
 

extern void START_SPINDLE_COUNTERCLOCKWISE();

   
 

extern void SET_SPINDLE_SPEED(double r);

   


 

extern void STOP_SPINDLE_TURNING();

   
 

extern void SPINDLE_RETRACT();
extern void ORIENT_SPINDLE(double orientation, CANON_DIRECTION direction);
extern void LOCK_SPINDLE_Z();
extern void USE_SPINDLE_FORCE();
extern void USE_NO_SPINDLE_FORCE();

    
extern void USE_TOOL_LENGTH_OFFSET(double length);

extern void CHANGE_TOOL(int slot);                 

   




























 

extern void SELECT_TOOL(int i);                    

    

extern void CLAMP_AXIS(CANON_AXIS axis);

   




 

extern void COMMENT(char *s);

   


 

extern void DISABLE_FEED_OVERRIDE();
extern void ENABLE_FEED_OVERRIDE();
extern void DISABLE_SPEED_OVERRIDE();
extern void ENABLE_SPEED_OVERRIDE();
extern void FLOOD_OFF();
    
extern void FLOOD_ON();
    

extern void MESSAGE(char *s);

extern void MIST_OFF();
    

extern void MIST_ON();
    

extern void PALLET_SHUTTLE();

   





 

extern void TURN_PROBE_OFF();
extern void TURN_PROBE_ON();

extern void UNCLAMP_AXIS(CANON_AXIS axis);

   

 

    
extern void NURB_KNOT_VECTOR();                    
extern void NURB_CONTROL_POINT(int i, double x, double y, double z, double w );
extern void NURB_FEED(double sStart, double sEnd);

    
extern void OPTIONAL_PROGRAM_STOP();

   





 

extern void PROGRAM_END();
   
 

extern void PROGRAM_STOP();
   



 

    

   






 

   


 

   
extern double GET_EXTERNAL_FEED_RATE();

   
extern int GET_EXTERNAL_FLOOD();

   


 

   
CANON_UNITS GET_EXTERNAL_LENGTH_UNIT_TYPE();

   
extern int GET_EXTERNAL_MIST();

   
extern CANON_MOTION_MODE GET_EXTERNAL_MOTION_CONTROL_MODE();

   

























 

   
   
   
extern void GET_EXTERNAL_PARAMETER_FILE_NAME(char * filename, unsigned int max_size);

   
extern CANON_PLANE GET_EXTERNAL_PLANE();
















   
extern double GET_EXTERNAL_POSITION_X();

   
extern double GET_EXTERNAL_POSITION_Y();

   
extern double GET_EXTERNAL_POSITION_Z();
















   
extern double GET_EXTERNAL_PROBE_POSITION_X();

   
extern double GET_EXTERNAL_PROBE_POSITION_Y();

   
extern double GET_EXTERNAL_PROBE_POSITION_Z();

   
extern double GET_EXTERNAL_PROBE_VALUE();

   
   
extern int GET_EXTERNAL_QUEUE_EMPTY();

   
extern double GET_EXTERNAL_SPEED();

   
extern CANON_DIRECTION GET_EXTERNAL_SPINDLE();

   
extern double GET_EXTERNAL_TOOL_LENGTH_OFFSET();

   
extern int GET_EXTERNAL_TOOL_MAX();

   
   
   
extern int GET_EXTERNAL_TOOL_SLOT();

   
   
extern CANON_TOOL_TABLE GET_EXTERNAL_TOOL_TABLE(int pocket);

   
extern double GET_EXTERNAL_TRAVERSE_RATE();
#line 41 "rs274ngc.h"

    
    
    

#line 53 "rs274ngc.h"











    



   
 












   




   



   


   



   



   



   
   



   


   
   
   

#line 131 "rs274ngc.h"

   
#line 144 "rs274ngc.h"

   
#line 198 "rs274ngc.h"

    
    
    

    
typedef enum {MODE_ABSOLUTE, MODE_INCREMENTAL}
DISTANCE_MODE;

    
typedef enum {R_PLANE, OLD_Z}
RETRACT_MODE;

typedef int ON_OFF;

typedef struct block_struct
{
#line 227 "rs274ngc.h"
    char     comment[256];
    int      d_number;
    double   f_number;
    int      g_modes[14];
    int      h_number;
    ON_OFF   i_flag;
    double   i_number;
    ON_OFF   j_flag;
    double   j_number;
    ON_OFF   k_flag;
    double   k_number;
    int      l_number;
    int      line_number;
    int      motion_to_be;
    int      m_count;
    int      m_modes[10];
    double   p_number;
    double   q_number;
    ON_OFF   r_flag;
    double   r_number;
    double   s_number;
    int      t_number;
    ON_OFF   x_flag;
    double   x_number;
    ON_OFF   y_flag;
    double   y_number;
    ON_OFF   z_flag;
    double   z_number;
} block;

typedef block * block_pointer;

   












 

typedef struct setup_struct
{
#line 291 "rs274ngc.h"
    int active_g_codes
        [12];                
    int active_m_codes
        [7];                
    double active_settings
        [3];               
    double axis_offset_x;                         
    double axis_offset_y;                         
    double axis_offset_z;                         
    block block1;                                 
    char blocktext[256];           
    CANON_MOTION_MODE control_mode;               
    int current_slot;                             
    double current_x;                             
    double current_y;                             
    double current_z;                             
    double cutter_comp_radius;                    
    int cutter_comp_side;                         
    double cycle_cc;                              
    double cycle_i;                               
    double cycle_j;                               
    double cycle_k;                               
    int cycle_l;                                  
    double cycle_p;                               
    double cycle_q;                               
    double cycle_r;                               
    DISTANCE_MODE distance_mode;                  
    int feed_mode;                                
    ON_OFF feed_override;                         
    double feed_rate;                             
    char filename[256];            
    FILE * file_pointer;                          
    ON_OFF flood;                                 
    int length_offset_index;                      
    CANON_UNITS length_units;                     
    int line_length;                              
    char linetext[256];            
    ON_OFF mist;                                  
    int motion_mode;                              
    int origin_index;                             
    double origin_offset_x;                       
    double origin_offset_y;                       
    double origin_offset_z;                       
    double parameters
        [5400];                
    int parameter_occurrence;                     
    int parameter_numbers[50];                    
    double parameter_values[50];                  
    ON_OFF percent_flag;                          
    CANON_PLANE plane;                            
    ON_OFF probe_flag;                            
    double program_x;                             
    double program_y;                             
    RETRACT_MODE retract_mode;                    
    int selected_tool_slot;                       
    int sequence_number;                          
    double speed;                                 
    CANON_SPEED_FEED_MODE speed_feed_mode;        
    ON_OFF speed_override;                        
    CANON_DIRECTION spindle_turning;              
    char stack[50][80];                           
    int stack_index;                              
    double tool_length_offset;                    
    int tool_max;                                 
    CANON_TOOL_TABLE tool_table
        [128 + 1];                     
    int tool_table_index;                         
    double traverse_rate;                         
} setup;

typedef setup * setup_pointer;

   
typedef int (*read_function_pointer) (char *, int *, block_pointer, double *);

    
   





 

   
extern int rs274ngc_close();

   
extern int rs274ngc_execute();

   
extern int rs274ngc_exit();

   
extern int rs274ngc_init();

   
extern int rs274ngc_load_tool_table();

   
extern int rs274ngc_open(const char *filename);

   
extern int rs274ngc_read(const char * mdi);

   
extern int rs274ngc_reset();

   
extern int rs274ngc_restore_parameters(const char * filename);

   
extern int rs274ngc_save_parameters(const char * filename,
const double parameters[]);

   
extern int rs274ngc_synch();

    
   







 

   
extern void rs274ngc_active_g_codes(int * codes);

   
extern void rs274ngc_active_m_codes(int * codes);

   
extern void rs274ngc_active_settings(double * settings);

   
   
extern void rs274ngc_error_text(int error_code, char * error_text,unsigned
int max_size);

   
   
extern void rs274ngc_file_name(char * file_name,unsigned int max_size);

   
extern int rs274ngc_line_length();

   
   
extern void rs274ngc_line_text(char * line_text, int max_size);

   
extern int rs274ngc_sequence_number();

   
   
   
extern void rs274ngc_stack_name(int stack_index, char * function_name,
int max_size);
#line 128 "rs274ngc_pre.c"
#line 1 "rs274ngc_return.h"
   





















 




#line 226 "rs274ngc_return.h"

#line 129 "rs274ngc_pre.c"

char * _rs274ngc_errors[] =
{
      "No error",
      "No error",
      "No error",
      "No error",
      "A file is already open", 
      "All axes missing with g92", 
      "All axes missing with motion code", 
      "Arc radius too small to reach end point", 
      "Argument to acos out of range", 
      "Argument to asin out of range", 
      "Attempt to divide by zero", 
      "Attempt to raise negative to non integer power", 
      "Bad character used", 
      "Bad format unsigned integer", 
      "Bad number format", 
      "Bug bad g code modal group 0", 
      "Bug code not g0 or g1", 
      "Bug code not g17 g18 or g19", 
      "Bug code not g20 or g21", 
      "Bug code not g28 or g30", 
      "Bug code not g2 or g3", 
      "Bug code not g40 g41 or g42", 
      "Bug code not g43 or g49", 
      "Bug code not g4 g10 g28 g30 g53 or g92 series", 
      "Bug code not g61 g61 1 or g64", 
      "Bug code not g90 or g91", 
      "Bug code not g93 or g94", 
      "Bug code not g98 or g99", 
      "Bug code not in g92 series", 
      "Bug code not in range g54 to g593", 
      "Bug code not m0 m1 m2 m30 m60", 
      "Bug distance mode not g90 or g91", 
      "Bug function should not have been called", 
      "Bug in tool radius comp", 
      "Bug plane not xy yz or xz", 
      "Bug side not right or left", 
      "Bug unknown motion code", 
      "Bug unknown operation", 
      "Cannot change axis offsets with cutter radius comp", 
      "Cannot change units with cutter radius comp", 
      "Cannot create backup file", 
      "Cannot do g1 with zero feed rate", 
      "Cannot do zero repeats of cycle", 
      "Cannot make arc with zero feed rate", 
      "Cannot move rotary axes during probing", 
      "Cannot open backup file", 
      "Cannot open variable file", 
      "Cannot probe in inverse time feed mode", 
      "Cannot probe with cutter radius comp on", 
      "Cannot probe with zero feed rate", 
      "Cannot put a b in canned cycle", 
      "Cannot put a c in canned cycle", 
      "Cannot put an a in canned cycle", 
      "Cannot turn cutter radius comp on out of xy plane", 
      "Cannot turn cutter radius comp on when on", 
      "Cannot use a word", 
      "Cannot use axis values with g80", 
      "Cannot use axis values without a g code that uses them", 
      "Cannot use b word", 
      "Cannot use c word", 
      "Cannot use g28 or g30 with cutter radius comp", 
      "Cannot use g53 incremental", 
      "Cannot use g53 with cutter radius comp", 
      "Cannot use two g codes that both use axis values", 
      "Cannot use xz plane with cutter radius comp", 
      "Cannot use yz plane with cutter radius comp", 
      "Command too long", 
      "Concave corner with cutter radius comp", 
      "Coordinate system index parameter 5220 out of range", 
      "Current point same as end point of arc", 
      "Cutter gouging with cutter radius comp", 
      "D word with no g41 or g42", 
      "Dwell time missing with g4", 
      "Dwell time p word missing with g82", 
      "Dwell time p word missing with g86", 
      "Dwell time p word missing with g88", 
      "Dwell time p word missing with g89", 
      "Equal sign missing in parameter setting", 
      "F word missing with inverse time arc move", 
      "F word missing with inverse time g1 move", 
      "File ended with no percent sign", 
      "File ended with no percent sign or program end", 
      "File name too long", 
      "File not open", 
      "G code out of range", 
      "H word with no g43", 
      "I word given for arc in yz plane", 
      "I word missing with g87", 
      "I word with no g2 or g3 or g87 to use it", 
      "J word given for arc in xz plane", 
      "J word missing with g87", 
      "J word with no g2 or g3 or g87 to use it", 
      "K word given for arc in xy plane", 
      "K word missing with g87", 
      "K word with no g2 or g3 or g87 to use it", 
      "L word with no canned cycle or g10", 
      "Left bracket missing after slash with atan", 
      "Left bracket missing after unary operation name", 
      "Line number greater than 99999", 
      "Line with g10 does not have l2", 
      "M code greater than 99", 
      "Mixed radius ijk format for arc", 
      "Multiple a words on one line", 
      "Multiple b words on one line", 
      "Multiple c words on one line", 
      "Multiple d words on one line", 
      "Multiple f words on one line", 
      "Multiple h words on one line", 
      "Multiple i words on one line", 
      "Multiple j words on one line", 
      "Multiple k words on one line", 
      "Multiple l words on one line", 
      "Multiple p words on one line", 
      "Multiple q words on one line", 
      "Multiple r words on one line", 
      "Multiple s words on one line", 
      "Multiple t words on one line", 
      "Multiple x words on one line", 
      "Multiple y words on one line", 
      "Multiple z words on one line", 
      "Must use g0 or g1 with g53", 
      "Negative argument to sqrt", 
      "Negative d word tool radius index used", 
      "Negative f word used", 
      "Negative g code used", 
      "Negative h word tool length offset index used", 
      "Negative l word used", 
      "Negative m code used", 
      "Negative or zero q value used", 
      "Negative p word used", 
      "Negative spindle speed used", 
      "Negative tool id used", 
      "Nested comment found", 
      "No characters found in reading real value", 
      "No digits found where real number should be", 
      "Non integer value for integer", 
      "Null missing after newline", 
      "Offset index missing", 
      "P value not an integer with g10 l2", 
      "P value out of range with g10 l2", 
      "P word with no g4 g10 g82 g86 g88 g89", 
      "Parameter file out of order", 
      "Parameter number out of range", 
      "Q word missing with g83", 
      "Q word with no g83", 
      "Queue is not empty after probing", 
      "R clearance plane unspecified in cycle", 
      "R i j k words all missing for arc", 
      "R less than x in cycle in yz plane", 
      "R less than y in cycle in xz plane", 
      "R less than z in cycle in xy plane", 
      "R word with no g code that uses it", 
      "Radius to end of arc differs from radius to start", 
      "Radius too small to reach end point", 
      "Required parameter missing", 
      "Selected tool slot number too large", 
      "Slash missing after first atan argument", 
      "Spindle not turning clockwise in g84", 
      "Spindle not turning in g86", 
      "Spindle not turning in g87", 
      "Spindle not turning in g88", 
      "Sscanf failed", 
      "Start point too close to probe point", 
      "Too many m codes on line", 
      "Tool length offset index too big", 
      "Tool max too large", 
      "Tool radius index too big", 
      "Tool radius not less than arc radius with comp", 
      "Two g codes used from same modal group", 
      "Two m codes used from same modal group", 
      "Unable to open file", 
      "Unclosed comment found", 
      "Unclosed expression", 
      "Unknown g code used", 
      "Unknown m code used", 
      "Unknown operation", 
      "Unknown operation name starting with a", 
      "Unknown operation name starting with m", 
      "Unknown operation name starting with o", 
      "Unknown operation name starting with x", 
      "Unknown word starting with a", 
      "Unknown word starting with c", 
      "Unknown word starting with e", 
      "Unknown word starting with f", 
      "Unknown word starting with l", 
      "Unknown word starting with r", 
      "Unknown word starting with s", 
      "Unknown word starting with t", 
      "Unknown word where unary operation could be", 
      "X and y words missing for arc in xy plane", 
      "X and z words missing for arc in xz plane", 
      "X value unspecified in yz plane canned cycle", 
      "X y and z words all missing with g38 2", 
      "Y and z words missing for arc in yz plane", 
      "Y value unspecified in xz plane canned cycle", 
      "Z value unspecified in xy plane canned cycle", 
      "Zero or negative argument to ln", 
      "Zero radius arc", 
    "The End"
};



   














 

#line 358 "rs274ngc_pre.c"







#line 371 "rs274ngc_pre.c"

#line 383 "rs274ngc_pre.c"

   



 

            static int arc_data_comp_ijk(int move, int side, double tool_radius,
            double current_x, double current_y, double end_x, double end_y,
            double i_number, double j_number, double * center_x, double * center_y,
            int * turn, double tolerance);
static int arc_data_comp_r(int move, int side, double tool_radius,
double current_x, double current_y, double end_x, double end_y,
double big_radius, double * center_x, double * center_y, int * turn);
static int arc_data_ijk(int move, double current_x, double current_y,
double end_x, double end_y, double i_number, double j_number,
double * center_x, double * center_y, int * turn, double tolerance);
static int arc_data_r(int move, double current_x, double current_y,
double end_x, double end_y, double radius, double * center_x,
double * center_y, int * turn);
static int check_g_codes(block_pointer block, setup_pointer settings);
static int check_items(block_pointer block, setup_pointer settings);
static int check_m_codes(block_pointer block);
static int check_other_codes(block_pointer block);
static int close_and_downcase(char * line);
static int convert_arc(int move, block_pointer block, setup_pointer settings);
static int convert_arc2(int move, block_pointer block,
setup_pointer settings, double * current1, double * current2,
double * current3, double end1, double end2,
double end3











, double offset1,
double offset2);
static int convert_arc_comp1(int move, block_pointer block,
setup_pointer settings, double end_x, double end_y,
double end_z











);
static int convert_arc_comp2(int move, block_pointer block,
setup_pointer settings, double end_x, double end_y,
double end_z











);
static int convert_axis_offsets(int g_code, block_pointer block,
setup_pointer settings);
static int convert_comment(char * comment);
static int convert_control_mode(int g_code, setup_pointer settings);
static int convert_coordinate_system(int g_code, setup_pointer settings);
static int convert_cutter_compensation(int g_code, block_pointer block,
setup_pointer settings);
static int convert_cutter_compensation_off(setup_pointer settings);
static int convert_cutter_compensation_on(int side, block_pointer block,
setup_pointer settings);
static int convert_cycle(int motion, block_pointer block,
setup_pointer settings);
static int convert_cycle_g81(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z);
static int convert_cycle_g82(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z, double dwell);
static int convert_cycle_g83(CANON_PLANE plane, double x, double y,
double r, double clear_z, double bottom_z, double delta);
static int convert_cycle_g84(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z, CANON_DIRECTION direction,
CANON_SPEED_FEED_MODE mode);
static int convert_cycle_g85(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z);
static int convert_cycle_g86(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z, double dwell, CANON_DIRECTION direction);
static int convert_cycle_g87(CANON_PLANE plane, double x, double offset_x,
double y, double offset_y, double r, double clear_z, double middle_z,
double bottom_z, CANON_DIRECTION direction);
static int convert_cycle_g88(CANON_PLANE plane, double x, double y,
double bottom_z, double dwell, CANON_DIRECTION direction);
static int convert_cycle_g89(CANON_PLANE plane, double x, double y,
double clear_z, double bottom_z, double dwell);
static int convert_cycle_xy(int motion, block_pointer block,
setup_pointer settings);
static int convert_cycle_yz(int motion, block_pointer block,
setup_pointer settings);
static int convert_cycle_zx(int motion, block_pointer block,
setup_pointer settings);
static int convert_distance_mode(int g_code, setup_pointer settings);
static int convert_dwell(double time);
static int convert_feed_mode(int g_code, setup_pointer settings);
static int convert_feed_rate(block_pointer block, setup_pointer settings);
static int convert_g(block_pointer block, setup_pointer settings);
static int convert_home(int move, block_pointer block, setup_pointer settings);
static int convert_length_units(int g_code, setup_pointer settings);
static int convert_m(block_pointer block, setup_pointer settings);
static int convert_modal_0(int code, block_pointer block,
setup_pointer settings);
static int convert_motion(int motion, block_pointer block,
setup_pointer settings);
static int convert_probe(block_pointer block, setup_pointer settings);
static int convert_retract_mode(int g_code, setup_pointer settings);
static int convert_setup(block_pointer block, setup_pointer settings);
static int convert_set_plane(int g_code, setup_pointer settings);
static int convert_speed(block_pointer block, setup_pointer settings);
static int convert_stop(block_pointer block, setup_pointer settings);
static int convert_straight(int move, block_pointer block,
setup_pointer settings);
static int convert_straight_comp1(int move, block_pointer block,
setup_pointer settings, double px, double py,
double end_z











);
static int convert_straight_comp2(int move, block_pointer block,
setup_pointer settings, double px, double py,
double end_z











);
static int convert_tool_change(setup_pointer settings);
static int convert_tool_length_offset(int g_code, block_pointer block,
setup_pointer settings);
static int convert_tool_select(block_pointer block, setup_pointer settings);
static int cycle_feed(CANON_PLANE plane, double end1,
double end2, double end3);
static int cycle_traverse(CANON_PLANE plane, double end1, double end2,
double end3);
static int enhance_block(block_pointer block, setup_pointer settings);
static int execute_binary(double * left, int operation, double * right);
static int execute_binary1(double * left, int operation, double * right);
static int execute_binary2(double * left, int operation, double * right);
static int execute_block(block_pointer block, setup_pointer settings);
static int execute_unary(double * double_ptr, int operation);
static double find_arc_length(double x1, double y1, double z1,
double center_x, double center_y, int turn, double x2, double y2, double z2);
static int find_ends(block_pointer block, setup_pointer settings, double * px,
double * py, double * pz











);
static int find_relative(double x1, double y1,
double z1











, double * x2, double * y2,
double * z2











,
setup_pointer settings);
static double find_straight_length(double x2, double y2,
double z2











, double x1, double y1,
double z1











);
static double find_turn(double x1, double y1, double center_x, double center_y,
int turn, double x2, double y2);
static int init_block(block_pointer block);
static int inverse_time_rate_arc(double x1, double y1, double z1,
double cx, double cy, int turn, double x2, double y2, double z2,
block_pointer block, setup_pointer settings);
static int inverse_time_rate_arc2(double start_x, double start_y, int turn1,
double mid_x, double mid_y, double cx, double cy, int turn2, double end_x,
double end_y, double end_z, block_pointer block, setup_pointer settings);
static int inverse_time_rate_as(double start_x, double start_y, int turn,
double mid_x, double mid_y, double end_x, double end_y,
double end_z











,
block_pointer block, setup_pointer settings);
static int inverse_time_rate_straight(double end_x, double end_y,
double end_z











,
block_pointer block, setup_pointer settings);
static int parse_line(char * line, block_pointer block,setup_pointer settings);
static int precedence(int an_operator);
static int read_a(char * line, int * counter, block_pointer block,
double * parameters);
static int read_atan(char * line, int * counter, double * double_ptr,
double * parameters);
static int read_b(char * line, int * counter, block_pointer block,
double * parameters);
static int read_c(char * line, int * counter, block_pointer block,
double * parameters);
static int read_comment(char * line, int * counter, block_pointer block,
double * parameters);
static int read_d(char * line, int * counter, block_pointer block,
double * parameters);
static int read_f(char * line, int * counter, block_pointer block,
double * parameters);
static int read_g(char * line, int * counter, block_pointer block,
double * parameters);
static int read_h(char * line, int * counter, block_pointer block,
double * parameters);
static int read_i(char * line, int * counter, block_pointer block,
double * parameters);
static int read_integer_unsigned(char * line, int * counter,
int * integer_ptr);
static int read_integer_value(char * line, int * counter, int * integer_ptr,
double * parameters);
static int read_items(block_pointer block, char * line, double * parameters);
static int read_j(char * line, int * counter, block_pointer block,
double * parameters);
static int read_k(char * line, int * counter, block_pointer block,
double * parameters);
static int read_l(char * line, int * counter, block_pointer block,
double * parameters);
static int read_line_number(char * line, int * counter, block_pointer block);
static int read_m(char * line, int * counter, block_pointer block,
double * parameters);
static int read_one_item(char * line, int * counter, block_pointer block,
double * parameters);
static int read_operation(char * line, int * counter, int * operation);
static int read_operation_unary(char * line, int * counter, int * operation);
static int read_p(char * line, int * counter, block_pointer block,
double * parameters);
static int read_parameter(char * line, int * counter, double * double_ptr,
double * parameters);
static int read_parameter_setting(char * line, int * counter,
block_pointer block, double * parameters);
static int read_q(char * line, int * counter, block_pointer block,
double * parameters);
static int read_r(char * line, int * counter, block_pointer block,
double * parameters);
static int read_real_expression(char * line, int * counter,
double * hold2, double * parameters);
static int read_real_number(char * line, int * counter, double * double_ptr);
static int read_real_value(char * line, int * counter, double * double_ptr,
double * parameters);
static int read_s(char * line, int * counter, block_pointer block,
double * parameters);
static int read_t(char * line, int * counter, block_pointer block,
double * parameters);
static int read_text(const char * command, FILE * inport, char * raw_line,
char * line, int * length);
static int read_unary(char * line, int * counter, double * double_ptr,
double * parameters);
static int read_x(char * line, int * counter, block_pointer block,
double * parameters);
static int read_y(char * line, int * counter, block_pointer block,
double * parameters);
static int read_z(char * line, int * counter, block_pointer block,
double * parameters);
static int set_probe_data(setup_pointer settings);
static int write_g_codes(block_pointer block, setup_pointer settings);
static int write_m_codes(block_pointer block, setup_pointer settings);
static int write_settings(setup_pointer settings);

   










































 

static const int _gees[] =
{
        1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 2,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            2,-1,-1,-1,-1,-1,-1,-1,-1,-1, 2,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            6,-1,-1,-1,-1,-1,-1,-1,-1,-1, 6,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            7,-1,-1,-1,-1,-1,-1,-1,-1,-1, 7,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            7,-1,-1,-1,-1,-1,-1,-1,-1,-1, 8,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 8,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 0,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           12,-1,-1,-1,-1,-1,-1,-1,-1,-1,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           12,-1,-1,-1,-1,-1,-1,-1,-1,-1,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           12,-1,-1,-1,-1,-1,-1,-1,-1,-1,12,12,12,12,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,13,13,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           13,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            3,-1,-1,-1,-1,-1,-1,-1,-1,-1, 3,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            0, 0, 0, 0,-1,-1,-1,-1,-1,-1, 5,-1,-1,-1,-1,-1,-1,-1,-1,-1,
            5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
           10,-1,-1,-1,-1,-1,-1,-1,-1,-1,10,-1,-1,-1,-1,-1,-1,-1,-1,-1};

   













 

    static const int _ems[] =
    {
        4,  4,  4,  7,  7,  7,  6,  8,  8,  8,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            4, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1, -1, -1, -1,  9,  9,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            4, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    };

   






 

    static const int _required_parameters[] =
    {
        5161, 5162, 5163,                          
#line 892 "rs274ngc_pre.c"
            5181, 5182, 5183,                      
#line 902 "rs274ngc_pre.c"
            5211, 5212, 5213,                      
#line 912 "rs274ngc_pre.c"
            5220,                                  
            5221, 5222, 5223,                      
#line 923 "rs274ngc_pre.c"
            5241, 5242, 5243,                      
#line 933 "rs274ngc_pre.c"
            5261, 5262, 5263,                      
#line 943 "rs274ngc_pre.c"
            5281, 5282, 5283,                      
#line 953 "rs274ngc_pre.c"
            5301, 5302, 5303,                      
#line 963 "rs274ngc_pre.c"
            5321, 5322, 5323,                      
#line 973 "rs274ngc_pre.c"
            5341, 5342, 5343,                      
#line 983 "rs274ngc_pre.c"
            5361, 5362, 5363,                      
#line 993 "rs274ngc_pre.c"
            5381, 5382, 5383,                      
#line 1003 "rs274ngc_pre.c"
            5400
    };

   




 

    static const read_function_pointer _readers[] =
    {
        0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0, 0, 0, read_parameter_setting,0,      0,      0,      0,
            read_comment, 0, 0,     0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,
            0,      0,      0,      0,      0,      0,      0,      read_a, read_b, read_c,
            read_d, 0,      read_f, read_g, read_h, read_i, read_j, read_k, read_l, read_m,
            0,      0,      read_p, read_q, read_r, read_s, read_t, 0     , 0,      0,
            read_x, read_y, read_z
    };

    

   
 

    static setup _setup;

    
    

   



 

    

   



















 

    static int arc_data_comp_ijk(                  
    int move,                                      
    int side,                                      
    double tool_radius,                            
    double current_x,                              
    double current_y,                              
    double end_x,                                  
    double end_y,                                  
    double i_number,                               
    double j_number,                               
    double * center_x,                             
    double * center_y,                             
    int * turn,                                    
    double tolerance)                              
    {
        static char name[] = "arc_data_comp_ijk";
        double arc_radius;
        double radius2;

        *center_x = (current_x + i_number);
        *center_y = (current_y + j_number);
        arc_radius = hypot(i_number, j_number);
        radius2 = hypot((*center_x - end_x), (*center_y - end_y));
        radius2 =
            (((side == 2 ) && (move == 30)) ||
            ((side == 1) && (move == 20))) ?
            (radius2 - tool_radius): (radius2 + tool_radius);
        if ((fabs(arc_radius - radius2) > tolerance)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 152; } else;

    
        if (move == 20)
            *turn = -1;
        else if (move == 30)
            *turn = 1;
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 20; } else;
        return 0;
    }

    

   




















































 

    static int arc_data_comp_r(                    
    int move,                                      
    int side,                                      
    double tool_radius,                            
    double current_x,                              
    double current_y,                              
    double end_x,                                  
    double end_y,                                  
    double big_radius,                             
    double * center_x,                             
    double * center_y,                             
    int * turn)                                    
    {
        static char name[] = "arc_data_comp_r";
        double abs_radius;                         
        double alpha;                              
        double distance;                           
        double mid_length;                         
        double offset;                             
        double radius2;                            
        double mid_x;                              
        double mid_y;                              
        double theta;                              

        abs_radius = fabs(big_radius);
        if (((abs_radius <= tool_radius) && (((side == 2 ) && (move == 30)) || ((side == 1) && (move == 20))))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 167; } else;



        distance = hypot((end_x - current_x), (end_y - current_y));
        alpha = atan2 ((end_y - current_y), (end_x - current_x));
        theta = (((move == 30) && (big_radius > 0)) ||
            ((move == 20) && (big_radius < 0))) ?
            (alpha + 1.5707963267948966) : (alpha - 1.5707963267948966);
        radius2 = (((side == 2 ) && (move == 30)) ||
            ((side == 1) && (move == 20))) ?
            (abs_radius - tool_radius) : (abs_radius + tool_radius);
        if ((distance > (radius2 + abs_radius))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 153; } else;

        mid_length = (((radius2 * radius2) + (distance * distance) -
            (abs_radius * abs_radius)) / (2.0 * distance));
        mid_x = (current_x + (mid_length * cos(alpha)));
        mid_y = (current_y + (mid_length * sin(alpha)));
        if (((radius2 * radius2) <= (mid_length * mid_length))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 33; } else;

        offset = sqrt((radius2 * radius2) - (mid_length * mid_length));
        *center_x = mid_x + (offset * cos(theta));
        *center_y = mid_y + (offset * sin(theta));
        *turn = (move == 20) ? -1 : 1;

        return 0;
    }

    

   
























 

    static int arc_data_ijk(                       
    int move,                                      
    double current_x,                              
    double current_y,                              
    double end_x,                                  
    double end_y,                                  
    double i_number,                               
    double j_number,                               
    double * center_x,                             
    double * center_y,                             
    int * turn,                                    
    double tolerance)                              
    {
        static char name[] = "arc_data_ijk";
        double radius;                             
        double radius2;                            
        *center_x = (current_x + i_number);
        *center_y = (current_y + j_number);
        radius = hypot((*center_x - current_x), (*center_y - current_y));
        radius2 = hypot((*center_x - end_x), (*center_y - end_y));
        if (((radius == 0.0) || (radius2 == 0.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 197; } else;
        if ((fabs(radius - radius2) > tolerance)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 152; } else;

        if (move == 20)
            *turn = -1;
        else if (move == 30)
            *turn = 1;
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 20; } else;
        return 0;
    }

    

   































 

    static int arc_data_r(                         
    int move,                                      
    double current_x,                              
    double current_y,                              
    double end_x,                                  
    double end_y,                                  
    double radius,                                 
    double * center_x,                             
    double * center_y,                             
    int * turn)                                    
    {
        static char name[] = "arc_data_r";
        double abs_radius;                         
        double half_length;                        
        double mid_x;                              
        double mid_y;                              
        double offset;                             
        double theta;                              
        double turn2;                              

        if (((end_x == current_x) && (end_y == current_y))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 69; } else;

        abs_radius = fabs(radius);
        mid_x = (end_x + current_x)/2.0;
        mid_y = (end_y + current_y)/2.0;
        half_length = hypot((mid_x - end_x), (mid_y - end_y));
        if (((half_length/abs_radius) > (1+1e-12))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 7; } else;

        if ((half_length/abs_radius) > (1-1e-12))
            half_length = abs_radius;         
    
        if (((move == 20) && (radius > 0)) ||
            ((move == 30) && (radius < 0)))
            theta = atan2((end_y - current_y), (end_x - current_x)) - 1.5707963267948966;
        else
            theta = atan2((end_y - current_y), (end_x - current_x)) + 1.5707963267948966;

        turn2 = asin (half_length/abs_radius);
        offset = abs_radius * cos(turn2);
        *center_x = mid_x + (offset * cos(theta));
        *center_y = mid_y + (offset * sin(theta));
        *turn = (move == 20) ? -1 : 1;

        return 0;
    }

    

   














































 

    static int check_g_codes(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "check_g_codes";
        int mode0;
        int p_int;

        mode0 = block->g_modes[0];

        if (mode0 == -1)
            {}
            else if (mode0 == 40)
        {
            if ((block->p_number == -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 72; } else;
        }
        else if (mode0 == 100)
        {
            p_int = (int)(block->p_number + 0.0001);
            if ((block->l_number != 2)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 99; } else;
            if ((((block->p_number + 0.0001) - p_int) > 0.0002)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 138; } else;

            if (((p_int < 1) || (p_int > 9))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 139; } else;
        }
        else if (mode0 == 280)
            {}
            else if (mode0 == 300)
                {}
                else if (mode0 == 530)
                {
                    if (((block->motion_to_be != 0) && (block->motion_to_be != 10))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 120; } else;

            if (((block->g_modes[3] == 910) || ((block->g_modes[3] != 900) && (settings->distance_mode == MODE_INCREMENTAL)))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 61; } else;



        }
        else if (mode0 == 920)
            {}
            else if ((mode0 == 921) || (mode0 == 922) || (mode0 == 923))
                {}
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 15; } else;
        return 0;
    }

    

   
























 

    static int check_items(                        
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "check_items";
        int status;

        if ((status = (check_g_codes(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (check_m_codes(block))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (check_other_codes(block))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        return 0;
    }

    

   















 

    static int check_m_codes(                      
    block_pointer block)                           
    {
        static char name[] = "check_m_codes";

        if ((block->m_count > 4)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 163; } else;
        return 0;
    }

    

   







































 

    static int check_other_codes(                  
    block_pointer block)                           
    {
        static char name[] = "check_other_codes";
        int motion;

        motion = block->motion_to_be;
#line 1602 "rs274ngc_pre.c"
        if (block->d_number != -1)
        {
            if (((block->g_modes[7] != 410) && (block->g_modes[7] != 420))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 71; } else;

        }
        if (block->h_number != -1)
        {
            if ((block->g_modes[8] != 430)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 85; } else;
        }

        if (block->i_flag == 1)                   
        {
            if (((motion != 20) && (motion != 30) && (motion != 870))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 88; } else;

        }

        if (block->j_flag == 1)                   
        {
            if (((motion != 20) && (motion != 30) && (motion != 870))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 91; } else;

        }

        if (block->k_flag == 1)                   
        {
            if (((motion != 20) && (motion != 30) && (motion != 870))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 94; } else;

        }

        if (block->l_number != -1)
        {
            if ((((motion < 810) || (motion > 890)) && (block->g_modes[0] != 100))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 95; } else;


        }

        if (block->p_number != -1.0)
        {
            if (((block->g_modes[0] != 100) && (block->g_modes[0] != 40) && (motion != 820) && (motion != 860) && (motion != 880) && (motion != 890))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 140; } else;




        }

        if (block->q_number != -1.0)
        {
            if ((motion != 830)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 144; } else;
        }

        if (block->r_flag == 1)
        {
            if ((((motion != 20) && (motion != 30)) && ((motion < 810) || (motion > 890)))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 151; } else;


        }

        return 0;
    }

    

   





































 

    static int close_and_downcase(                 
    char * line)                                   
    {
        static char name[] = "close_and_downcase";
        int m;
        int n;
        int comment;
        char item;
        comment = 0;
        for (n = 0, m = 0; (item = line[m]) != (char) 0; m++)
        {
            if (comment)
            {
                line[n++] = item;
                if (item == ')')
                {
                    comment = 0;
                }
                else if (item == '(')
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 132; } else;
            }
            else if ((item == ' ') || (item == '\t') || (item == '\r'));
    
            else if (item == '\n')                 
            {                                      
                if ((line[m+1] != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 136; } else;
            }
            else if ((64 < item) && (item < 91))  
            {
                line[n++] = (32 + item);
            }
            else if (item == '(')                  
            {
                comment = 1;
                line[n++] = item;
            }
            else
            {
                line[n++] = item;             
            }
        }
        if ((comment)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 171; } else;
        line[n] = 0;
        return 0;
    }

    

   

















































 

    static int convert_arc(                        
    int move,                                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_arc";
        int status;
        int first;                                 
        int ijk_flag;                              
        double end_x;
        double end_y;
        double end_z;
#line 1824 "rs274ngc_pre.c"

        ijk_flag =
            ((block->i_flag || block->j_flag) || block->k_flag) ? 1 : 0;
        first = (settings->program_x == 1e-20);

        if (((block->r_flag != 1) && (ijk_flag != 1))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 147; } else;

        if (((block->r_flag == 1) && (ijk_flag == 1))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 101; } else;

        if (settings->feed_mode == 0)
        {
            if ((settings->feed_rate == 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 43; } else;

        }
        else if (settings->feed_mode == 1)
        {
            if ((block->f_number == -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 78; } else;

        }
        if (ijk_flag)
        {
            if (settings->plane == 1)
            {
                if ((block->k_flag)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 92; } else;
                if (block->i_flag == 0)          
                    block->i_number = 0.0;
                else if (block->j_flag == 0)
                    block->j_number = 0.0;
            }
            else if (settings->plane == 2)
            {
                if ((block->i_flag)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 86; } else;
                if (block->j_flag == 0)          
                    block->j_number = 0.0;
                else if (block->k_flag == 0)
                    block->k_number = 0.0;
            }
            else if (settings->plane == 3)
            {
                if ((block->j_flag)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 89; } else;
                if (block->i_flag == 0)          
                    block->i_number = 0.0;
                else if (block->k_flag == 0)
                    block->k_number = 0.0;
            }
            else
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 34; } else;
        }
        else;                                      

        if (settings->plane == 1)     
        {
            if (((block->x_flag == 0) && (block->y_flag == 0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 189; } else;

        }
        else if (settings->plane == 2)
        {
            if (((block->y_flag == 0) && (block->z_flag == 0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 193; } else;

        }
        else if (settings->plane == 3)
        {
            if (((block->x_flag == 0) && (block->z_flag == 0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 190; } else;

        }

        find_ends(block, settings, &end_x, &end_y,
            &end_z











            );
        settings->motion_mode = move;

        if (settings->plane == 1)
        {
            if ((settings->cutter_comp_side == 0) ||
                (settings->cutter_comp_radius == 0.0))
            {
                status =
                    convert_arc2(move, block, settings,
                    &(settings->current_x), &(settings->current_y),
                    &(settings->current_z), end_x, end_y,
                    end_z











                    , block->i_number,
                    block->j_number);
                if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
            else if (first)
            {
                status =
                    convert_arc_comp1(move, block, settings, end_x, end_y,
                    end_z











                    );
                if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
            else
            {
                status =
                    convert_arc_comp2(move, block, settings, end_x, end_y,
                    end_z











                    );

                if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
        }
        else if (settings->plane == 3)
        {
            status =
                convert_arc2 (move, block, settings,
                &(settings->current_z), &(settings->current_x),
                &(settings->current_y), end_z, end_x,
                end_y











                , block->k_number,
                block->i_number);
            if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (settings->plane == 2)
        {
            status =
                convert_arc2 (move, block, settings,
                &(settings->current_y), &(settings->current_z),
                &(settings->current_x), end_y, end_z,
                end_x











                , block->j_number,
                block->k_number);
            if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 34; } else;
        return 0;
    }

    

   















 

    static int convert_arc2(                       
    int move,                                      
    block_pointer block,                           
    setup_pointer settings,                        
    double * current1,                             
    double * current2,                             
    double * current3,                             
    double end1,                                   
    double end2,                                   
    double end3,                                   
#line 2059 "rs274ngc_pre.c"
    double offset1,                                
    double offset2)                                
    {
        static char name[] = "convert_arc2";
        double center1;
        double center2;
        int status;                                
        double tolerance;                          
        int turn;                                  

        tolerance = (settings->length_units == 1) ?
            0.0002 : 0.002;

        if (block->r_flag)
        {
            if ((status = (arc_data_r(move, *current1, *current2, end1, end2, block->r_number, &center1, &center2, &turn))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;

        }
        else
        {
            if ((status = (arc_data_ijk(move, *current1, *current2, end1, end2, offset1, offset2, &center1, &center2, &turn, tolerance))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;

        }

        if (settings->feed_mode == 1)
            inverse_time_rate_arc(*current1, *current2, *current3, center1, center2,
                turn, end1, end2, end3, block, settings);
        ARC_FEED(end1, end2, center1, center2, turn,
            end3
#line 2109 "rs274ngc_pre.c"
            );
        *current1 = end1;
        *current2 = end2;
        *current3 = end3;
#line 2122 "rs274ngc_pre.c"
        return 0;
    }

    

   























 

    static int convert_arc_comp1(                  
    int move,                                      
    block_pointer block,                           
    setup_pointer settings,                        
    double end_x,                                  
    double end_y,                                  
    double end_z                                   
#line 2169 "rs274ngc_pre.c"
    )
    {
        static char name[] = "convert_arc_comp1";
        double center_x;
        double center_y;
        double gamma;                              
        int side;                                  
        int status;                                
        double tolerance;                          
        double tool_radius;
        int turn;                                  

        side = settings->cutter_comp_side;
    
        tool_radius = settings->cutter_comp_radius;
        tolerance = (settings->length_units == 1) ?
            0.0002 : 0.002;

        if ((hypot((end_x - settings->current_x), (end_y - settings->current_y)) <= tool_radius)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 70; } else;



        if (block->r_flag)
        {
            if ((status = (arc_data_comp_r(move, side, tool_radius, settings->current_x, settings->current_y, end_x, end_y, block->r_number, &center_x, &center_y, &turn))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;


        }
        else
        {
            if ((status = (arc_data_comp_ijk(move, side, tool_radius, settings->current_x, settings->current_y, end_x, end_y, block->i_number, block->j_number, &center_x, &center_y, &turn, tolerance))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;



        }

        gamma =
            (((side == 2) && (move == 30)) ||
            ((side == 1) && (move == 20))) ?
            atan2 ((center_y - end_y), (center_x - end_x)) :
        atan2 ((end_y - center_y), (end_x - center_x));

        settings->program_x = end_x;
        settings->program_y = end_y;
    
        end_x = (end_x + (tool_radius * cos(gamma)));
    
        end_y = (end_y + (tool_radius * sin(gamma)));

        if (settings->feed_mode == 1)
            inverse_time_rate_arc(settings->current_x, settings->current_y,
                settings->current_z, center_x, center_y, turn,
                end_x, end_y, end_z, block, settings);
        ARC_FEED(end_x, end_y, center_x, center_y, turn,
            end_z
#line 2245 "rs274ngc_pre.c"
            );
        settings->current_x = end_x;
        settings->current_y = end_y;
        settings->current_z = end_z;
#line 2258 "rs274ngc_pre.c"

        return 0;
    }

    

   


































 

    static int convert_arc_comp2(                  
    int move,                                      
    block_pointer block,                           
    setup_pointer settings,                        
    double end_x,                                  
    double end_y,                                  
    double end_z                                   
#line 2317 "rs274ngc_pre.c"
    )
    {
        static char name[] = "convert_arc_comp2";
        double alpha;                              
        double arc_radius;
        double beta;                               
        double center_x;                           
        double center_y;
        double delta;                              
        double gamma;                              
        double mid_x;
        double mid_y;
        int side;
    
        double small = 0.01;
        double start_x;
        double start_y;
        int status;                                
        double theta;                              
        double tolerance;
        double tool_radius;
        int turn;                                  

    

        start_x = settings->program_x;
        start_y = settings->program_y;
        tolerance = (settings->length_units == 1) ?
            0.0002 : 0.002;

        if (block->r_flag)
        {
            if ((status = (arc_data_r(move, start_x, start_y, end_x, end_y, block->r_number, &center_x, &center_y, &turn))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;

        }
        else
        {
            if ((status = (arc_data_ijk(move, start_x, start_y, end_x, end_y, block->i_number, block->j_number, &center_x, &center_y, &turn, tolerance))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;


        }

    
        side = settings->cutter_comp_side;
    
        tool_radius = settings->cutter_comp_radius;
        arc_radius = hypot((center_x - end_x), (center_y - end_y));
        theta =
            atan2(settings->current_y - start_y, settings->current_x - start_x);
        theta = (side == 2) ? (theta - 1.5707963267948966) : (theta + 1.5707963267948966);
        delta = atan2(center_y - start_y, center_x - start_x);
        alpha = (move == 30) ? (delta - 1.5707963267948966) : (delta + 1.5707963267948966);
        beta = (side == 2) ? (theta - alpha) : (alpha - theta);
        beta = (beta > (1.5 * 3.1415926535897932))  ? (beta - 6.2831853071795864) :
        (beta < -1.5707963267948966) ? (beta + 6.2831853071795864) : beta;

        if (((side == 2)  && (move == 30)) ||
            ((side == 1) && (move == 20)))
        {
            gamma = atan2 ((center_y - end_y), (center_x - end_x));
            if ((arc_radius <= tool_radius)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 167; } else;

        }
        else
        {
            gamma = atan2 ((end_y - center_y), (end_x - center_x));
            delta = (delta + 3.1415926535897932);
        }

        settings->program_x = end_x;
        settings->program_y = end_y;
    
        end_x = (end_x + (tool_radius * cos(gamma)));
    
        end_y = (end_y + (tool_radius * sin(gamma)));

    

        if (((beta < -small) || (beta > (3.1415926535897932 + small)))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 67; } else;

        if (beta > small)                          
        {
            mid_x = (start_x + (tool_radius * cos(delta)));
            mid_y = (start_y + (tool_radius * sin(delta)));
            if (settings->feed_mode == 1)
                inverse_time_rate_arc2(start_x, start_y, (side == 2) ? -1 : 1,
                mid_x, mid_y, center_x, center_y, turn,
                end_x, end_y, end_z, block, settings);
            ARC_FEED(mid_x, mid_y, start_x, start_y, ((side == 2) ? -1 : 1),
                settings->current_z
#line 2428 "rs274ngc_pre.c"
                );
            ARC_FEED(end_x, end_y, center_x, center_y, turn,
                end_z
#line 2452 "rs274ngc_pre.c"
                );
        }
        else                                       
        {
            if (settings->feed_mode == 1)
                inverse_time_rate_arc(settings->current_x, settings->current_y,
                    settings->current_z, center_x, center_y, turn,
                    end_x, end_y, end_z, block, settings);
            ARC_FEED(end_x, end_y, center_x, center_y, turn,
                end_z
#line 2483 "rs274ngc_pre.c"
                );
        }

        settings->current_x = end_x;
        settings->current_y = end_y;
        settings->current_z = end_z;
#line 2498 "rs274ngc_pre.c"

        return 0;
    }

    

   






















































 

    static int convert_axis_offsets(               
    int g_code,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_axis_offsets";
        double * pars;                             

        if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 38; } else;

        pars = settings->parameters;
        if (g_code == 920)
        {
            if (block->x_flag == 1)
            {
                settings->axis_offset_x =
                    (settings->current_x + settings->axis_offset_x - block->x_number);
                settings->current_x = block->x_number;
            }

            if (block->y_flag == 1)
            {
                settings->axis_offset_y =
                    (settings->current_y + settings->axis_offset_y - block->y_number);
                settings->current_y = block->y_number;
            }

            if (block->z_flag == 1)
            {
                settings->axis_offset_z =
                    (settings->current_z + settings->axis_offset_z - block->z_number);
                settings->current_z = block->z_number;
            }

#line 2611 "rs274ngc_pre.c"

#line 2628 "rs274ngc_pre.c"

#line 2645 "rs274ngc_pre.c"

            SET_ORIGIN_OFFSETS(settings->origin_offset_x + settings->axis_offset_x,
                settings->origin_offset_y + settings->axis_offset_y,
                settings->origin_offset_z + settings->axis_offset_z
#line 2670 "rs274ngc_pre.c"
                );
            pars[5211] = settings->axis_offset_x;
            pars[5212] = settings->axis_offset_y;
            pars[5213] = settings->axis_offset_z;
#line 2686 "rs274ngc_pre.c"

        }
        else if ((g_code == 921) || (g_code == 922))
        {
            settings->current_x =
                settings->current_x + settings->axis_offset_x;
            settings->current_y =
                settings->current_y + settings->axis_offset_y;
            settings->current_z =
                settings->current_z + settings->axis_offset_z;
#line 2717 "rs274ngc_pre.c"
            SET_ORIGIN_OFFSETS(settings->origin_offset_x,
                settings->origin_offset_y,
                settings->origin_offset_z
#line 2741 "rs274ngc_pre.c"
                );
            settings->axis_offset_x = 0.0;
            settings->axis_offset_y = 0.0;
            settings->axis_offset_z = 0.0;
#line 2754 "rs274ngc_pre.c"
            if (g_code == 921)
            {
                pars[5211] = 0.0;
                pars[5212] = 0.0;
                pars[5213] = 0.0;
#line 2768 "rs274ngc_pre.c"
            }
        }
        else if (g_code == 923)
        {
            settings->current_x =
                settings->current_x + settings->axis_offset_x - pars[5211];
            settings->current_y =
                settings->current_y + settings->axis_offset_y - pars[5212];
            settings->current_z =
                settings->current_z + settings->axis_offset_z - pars[5213];
#line 2799 "rs274ngc_pre.c"
            settings->axis_offset_x = pars[5211];
            settings->axis_offset_y = pars[5212];
            settings->axis_offset_z = pars[5213];
#line 2814 "rs274ngc_pre.c"
            SET_ORIGIN_OFFSETS(settings->origin_offset_x + settings->axis_offset_x,
                settings->origin_offset_y + settings->axis_offset_y,
                settings->origin_offset_z + settings->axis_offset_z
#line 2838 "rs274ngc_pre.c"
                );
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 28; } else;

        return 0;
    }

    

   


















 

    static int convert_comment(                    
    char * comment)                                
    {
        int m;
        int item;

        for (m = 0; ((item = comment[m]) == ' ') || (item == '\t') ; m++);
        if ((item != 'M') && (item != 'm'))
        {
            COMMENT(comment);
            return 0;
        }
        for (m++; ((item = comment[m]) == ' ') || (item == '\t') ; m++);
        if ((item != 'S') && (item != 's'))
        {
            COMMENT(comment);
            return 0;
        }
        for (m++; ((item = comment[m]) == ' ') || (item == '\t') ; m++);
        if ((item != 'G') && (item != 'g'))
        {
            COMMENT(comment);
            return 0;
        }
        for (m++; ((item = comment[m]) == ' ') || (item == '\t') ; m++);
        if (item != ',')
        {
            COMMENT(comment);
            return 0;
        }
        MESSAGE(comment + m + 1);
        return 0;
    }

    

   




























 

    static int convert_control_mode(               
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_control_mode";
        if (g_code == 610)
        {
            SET_MOTION_CONTROL_MODE(2);
            settings->control_mode = 2;
        }
        else if (g_code == 611)
        {
            SET_MOTION_CONTROL_MODE(1);
            settings->control_mode = 1;
        }
        else if (g_code == 640)
        {
            SET_MOTION_CONTROL_MODE(3);
            settings->control_mode = 3;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 24; } else;
        return 0;
    }

    

   


































































 

    static int convert_coordinate_system(          
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_coordinate_system";
        int origin;
        double x;
        double y;
        double z;
#line 3050 "rs274ngc_pre.c"
        double * parameters;

        parameters = settings->parameters;
        switch(g_code)
        {
            case 540:
                origin = 1;
                break;
            case 550:
                origin = 2;
                break;
            case 560:
                origin = 3;
                break;
            case 570:
                origin = 4;
                break;
            case 580:
                origin = 5;
                break;
            case 590:
                origin = 6;
                break;
            case 591:
                origin = 7;
                break;
            case 592:
                origin = 8;
                break;
            case 593:
                origin = 9;
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 29; } else;
        }

        if (origin == settings->origin_index)      
        {

            COMMENT("interpreter: continuing to use same coordinate system");

            return 0;
        }

        settings->origin_index = origin;
        parameters[5220] = (double)origin;

   

 
        settings->current_x =
            (settings->current_x + settings->origin_offset_x);
        settings->current_y =
            (settings->current_y + settings->origin_offset_y);
        settings->current_z =
            (settings->current_z + settings->origin_offset_z);
#line 3127 "rs274ngc_pre.c"

        x = parameters[5201 + (origin * 20)];
        y = parameters[5202 + (origin * 20)];
        z = parameters[5203 + (origin * 20)];
#line 3140 "rs274ngc_pre.c"

        settings->origin_offset_x = x;
        settings->origin_offset_y = y;
        settings->origin_offset_z = z;
#line 3153 "rs274ngc_pre.c"

        settings->current_x = (settings->current_x - x);
        settings->current_y = (settings->current_y - y);
        settings->current_z = (settings->current_z - z);
#line 3169 "rs274ngc_pre.c"

        SET_ORIGIN_OFFSETS(x + settings->axis_offset_x,
            y + settings->axis_offset_y,
            z + settings->axis_offset_z
#line 3194 "rs274ngc_pre.c"
            );
        return 0;
    }

    

   




















 

    static int convert_cutter_compensation(        
    int g_code,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_cutter_compensation";
        int status;

        if (g_code == 400)
        {
            if ((status = (convert_cutter_compensation_off(settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (g_code == 410)
        {
            if ((status = (convert_cutter_compensation_on(2, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (g_code == 420)
        {
            if ((status = (convert_cutter_compensation_on(1, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 21; } else;

        return 0;
    }

    

   












 

    static int convert_cutter_compensation_off(    
    setup_pointer settings)                        
    {

        COMMENT("interpreter: cutter radius compensation off");

        settings->cutter_comp_side = 0;
        settings->program_x = 1e-20;
        return 0;
    }

    

   















































 

    static int convert_cutter_compensation_on(     
    int side,                                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_cutter_compensation_on";
        double radius;
        int index;

        if ((settings->plane != 1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 53; } else;

        if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 54; } else;

        index =
            (block->d_number != -1) ? block->d_number : settings->current_slot;
        radius = ((settings->tool_table[index].diameter)/2.0);

        if (radius < 0.0)                          
        {
            radius = -radius;
            if (side == 1)
                side = 2;
            else
                side = 1;
        }


        if (side == 1)
            COMMENT("interpreter: cutter radius compensation on right");
        else
            COMMENT("interpreter: cutter radius compensation on left");


        settings->cutter_comp_radius = radius;
        settings->tool_table_index = index;
        settings->cutter_comp_side = side;
        return 0;
    }

    

   

























 

    static int convert_cycle(                      
    int motion,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_cycle";
        CANON_PLANE plane;
        int status;

        plane = settings->plane;
        if (block->r_flag == 0)
        {
            if (settings->motion_mode == motion)
                block->r_number = settings->cycle_r;
            else
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 146; } else;
        }

        if ((block->l_number == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 42; } else;
        if (block->l_number == -1)
            block->l_number = 1;

        if (plane == 1)
        {
            if ((status = (convert_cycle_xy(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (plane == 2)
        {
            if ((status = (convert_cycle_yz(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (plane == 3)
        {
            if ((status = (convert_cycle_zx(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 34; } else;

        settings->cycle_l = block->l_number;
        settings->cycle_r = block->r_number;
        settings->motion_mode = motion;
        return 0;
    }

    

   





















 

    static int convert_cycle_g81(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z)                               
    {
        static char name[] = "convert_cycle_g81";

        cycle_feed(plane, x, y, bottom_z);
        cycle_traverse(plane, x, y, clear_z);

        return 0;
    }

    

   




















 

    static int convert_cycle_g82(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z,                               
    double dwell)                                  
    {
        static char name[] = "convert_cycle_g82";

        cycle_feed(plane, x, y, bottom_z);
        DWELL(dwell);
        cycle_traverse(plane, x, y, clear_z);

        return 0;
    }

    

   



























 


   
 

    static int convert_cycle_g83(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double r,                                      
    double clear_z,                                
    double bottom_z,                               
    double delta)                                  
    {
        static char name[] = "convert_cycle_g83";
        double current_depth;
        double rapid_delta;

        rapid_delta = 0.010;
        if (_setup.length_units == 2)
            rapid_delta = (rapid_delta * 25.4);

        for (current_depth = (r - delta);
            current_depth > bottom_z;
            current_depth = (current_depth - delta))
        {
            cycle_feed(plane, x, y, current_depth);
            cycle_traverse(plane, x, y, clear_z);
            cycle_traverse(plane, x, y, current_depth + rapid_delta);
        }
        cycle_feed(plane, x, y, bottom_z);
        cycle_traverse(plane, x, y, clear_z);

        return 0;
    }

    

   





























 

    static int convert_cycle_g84(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z,                               
    CANON_DIRECTION direction,                     
    CANON_SPEED_FEED_MODE mode)                    
    {
        static char name[] = "convert_cycle_g84";

        if ((direction != 2)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 157; } else;

        START_SPEED_FEED_SYNCH();
        cycle_feed(plane, x, y, bottom_z);
        STOP_SPINDLE_TURNING();
        START_SPINDLE_COUNTERCLOCKWISE();
        cycle_feed(plane, x, y, clear_z);
        if (mode != 1)
            STOP_SPEED_FEED_SYNCH();
        STOP_SPINDLE_TURNING();
        START_SPINDLE_CLOCKWISE();

        return 0;
    }

    

   




















 

    static int convert_cycle_g85(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z)                               
    {
        static char name[] = "convert_cycle_g85";

        cycle_feed(plane, x, y, bottom_z);
        cycle_feed(plane, x, y, clear_z);

        return 0;
    }

    

   


























 

    static int convert_cycle_g86(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z,                               
    double dwell,                                  
    CANON_DIRECTION direction)                     
    {
        static char name[] = "convert_cycle_g86";

        if (((direction != 2) && (direction != 3))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 158; } else;



        cycle_feed(plane, x, y, bottom_z);
        DWELL(dwell);
        STOP_SPINDLE_TURNING();
        cycle_traverse(plane, x, y, clear_z);
        if (direction == 2)
            START_SPINDLE_CLOCKWISE();
        else
            START_SPINDLE_COUNTERCLOCKWISE();

        return 0;
    }

    

   






















































 

    static int convert_cycle_g87(                  
    CANON_PLANE plane,                             
    double x,                                      
    double offset_x,                               
    double y,                                      
    double offset_y,                               
    double r,                                      
    double clear_z,                                
    double middle_z,                               
    double bottom_z,                               
    CANON_DIRECTION direction)                     
    {
        static char name[] = "convert_cycle_g87";

        if (((direction != 2) && (direction != 3))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 159; } else;



        cycle_traverse(plane, offset_x, offset_y, r);
        STOP_SPINDLE_TURNING();
        ORIENT_SPINDLE(0.0, direction);
        cycle_traverse(plane, offset_x, offset_y, bottom_z);
        cycle_traverse(plane, x, y, bottom_z);
        if (direction == 2)
            START_SPINDLE_CLOCKWISE();
        else
            START_SPINDLE_COUNTERCLOCKWISE();
        cycle_feed(plane, x, y, middle_z);
        cycle_feed(plane, x, y, bottom_z);
        STOP_SPINDLE_TURNING();
        ORIENT_SPINDLE(0.0, direction);
        cycle_traverse(plane, offset_x, offset_y, bottom_z);
        cycle_traverse(plane, offset_x, offset_y, clear_z);
        cycle_traverse(plane, x, y, clear_z);
        if (direction == 2)
            START_SPINDLE_CLOCKWISE();
        else
            START_SPINDLE_COUNTERCLOCKWISE();

        return 0;
    }

    

   

























 

    static int convert_cycle_g88(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double bottom_z,                               
    double dwell,                                  
    CANON_DIRECTION direction)                     
    {
        static char name[] = "convert_cycle_g88";

        if (((direction != 2) && (direction != 3))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 160; } else;



        cycle_feed(plane, x, y, bottom_z);
        DWELL(dwell);
        STOP_SPINDLE_TURNING();
        PROGRAM_STOP();                            
        if (direction == 2)
            START_SPINDLE_CLOCKWISE();
        else
            START_SPINDLE_COUNTERCLOCKWISE();

        return 0;
    }

    

   



















 

    static int convert_cycle_g89(                  
    CANON_PLANE plane,                             
    double x,                                      
    double y,                                      
    double clear_z,                                
    double bottom_z,                               
    double dwell)                                  
    {
        static char name[] = "convert_cycle_g89";

        cycle_feed(plane, x, y, bottom_z);
        DWELL(dwell);
        cycle_feed(plane, x, y, clear_z);

        return 0;
    }

    

   



































































































 

#line 4063 "rs274ngc_pre.c"

        static int convert_cycle_xy(               
        int motion,                                
        block_pointer block,                       
        setup_pointer settings)                    
    {
        static char name[] = "convert_cycle_xy";
        double aa;
        double aa_increment;
        double bb;
        double bb_increment;
        double cc;
        double clear_cc;
        double i;
        double j;
        double k;
        double old_cc;
        CANON_PLANE plane;
        double r;
        int repeat;
        CANON_MOTION_MODE save_mode;
        int status;

        plane = 1;
        if (settings->motion_mode != motion)
        {
            if ((block->z_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 195; } else;

        }
        block->z_number =
            block->z_flag == 1 ? block->z_number : settings->cycle_cc;
        old_cc = settings->current_z;

        if (settings->distance_mode == MODE_ABSOLUTE)
        {
            aa_increment = 0.0;
            bb_increment = 0.0;
            r = block->r_number;
            cc = block->z_number;
            aa = block->x_flag == 1 ? block->x_number : settings->current_x;
            bb = block->y_flag == 1 ? block->y_number : settings->current_y;
        }
        else if (settings->distance_mode == MODE_INCREMENTAL)
        {
            aa_increment = block->x_number;
            bb_increment = block->y_number;
            r = (block->r_number + old_cc);
            cc = (r + block->z_number);       
            aa = settings->current_x;
            bb = settings->current_y;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 31; } else;
        if ((r < cc)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 150; } else;

        if (old_cc < r)
        {
            STRAIGHT_TRAVERSE(settings->current_x, settings->current_y, r
#line 4142 "rs274ngc_pre.c"
                );
            old_cc = r;
        }
        clear_cc = (settings->retract_mode == R_PLANE) ? r : old_cc;

        save_mode = GET_EXTERNAL_MOTION_CONTROL_MODE();
        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(2);

        switch(motion)
        {
            case 810:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g81(1, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 820:
                if (((settings->motion_mode != 820) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 73; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g82 (1, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 830:
                if (((settings->motion_mode != 830) && (block->q_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 143; } else;

                block->q_number =
                    block->q_number == -1.0 ? settings->cycle_q : block->q_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g83 (1, aa, bb, r, clear_cc, cc, block->q_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_q = block->q_number;
                break;
            case 840:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g84 (1, aa, bb, clear_cc, cc, settings->spindle_turning, settings->speed_feed_mode))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 850:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g85 (1, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 860:
                if (((settings->motion_mode != 860) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 74; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g86 (1, aa, bb, clear_cc, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 870:
                if (settings->motion_mode != 870)
                {
                    if ((block->i_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 87; } else;
                    if ((block->j_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 90; } else;
                    if ((block->k_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 93; } else;
                }
                i = block->i_flag == 1 ? block->i_number : settings->cycle_i;
                j = block->j_flag == 1 ? block->j_number : settings->cycle_j;
                k = block->k_flag == 1 ? block->k_number : settings->cycle_k;
                settings->cycle_i = i;
                settings->cycle_j = j;
                settings->cycle_k = k;
                if (settings->distance_mode == MODE_INCREMENTAL)
                {
                    k = (cc + k);             
                }
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g87 (1, aa, (aa + i), bb, (bb + j), r, clear_cc, k, cc, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 880:
                if (((settings->motion_mode != 880) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 75; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g88 (1, aa, bb, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 890:
                if (((settings->motion_mode != 890) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 76; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g89 (1, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        }
        settings->current_x = aa;             
        settings->current_y = bb;
        settings->current_z = clear_cc;
        settings->cycle_cc = block->z_number;

        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(save_mode);

        return 0;
    }

    

   












































 

    static int convert_cycle_yz(                   
    int motion,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_cycle_yz";
        double aa;
        double aa_increment;
        double bb;
        double bb_increment;
        double cc;
        double clear_cc;
        double i;
        double j;
        double k;
        double old_cc;
        CANON_PLANE plane;
        double r;
        int repeat;
        CANON_MOTION_MODE save_mode;
        int status;

        plane = 2;
        if (settings->motion_mode != motion)
        {
            if ((block->x_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 191; } else;

        }
        block->x_number =
            block->x_flag == 1 ? block->x_number : settings->cycle_cc;
        old_cc = settings->current_x;

        if (settings->distance_mode == MODE_ABSOLUTE)
        {
            aa_increment = 0.0;
            bb_increment = 0.0;
            r = block->r_number;
            cc = block->x_number;
            aa = block->y_flag == 1 ? block->y_number : settings->current_y;
            bb = block->z_flag == 1 ? block->z_number : settings->current_z;
        }
        else if (settings->distance_mode == MODE_INCREMENTAL)
        {
            aa_increment = block->y_number;
            bb_increment = block->z_number;
            r = (block->r_number + old_cc);
            cc = (r + block->x_number);       
            aa = settings->current_y;
            bb = settings->current_z;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 31; } else;
        if ((r < cc)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 148; } else;

        if (old_cc < r)
        {
            STRAIGHT_TRAVERSE(r, settings->current_y, settings->current_z
#line 4369 "rs274ngc_pre.c"
                );
            old_cc = r;
        }
        clear_cc = (settings->retract_mode == R_PLANE) ? r : old_cc;

        save_mode = GET_EXTERNAL_MOTION_CONTROL_MODE();
        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(2);

        switch(motion)
        {
            case 810:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g81(2, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 820:
                if (((settings->motion_mode != 820) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 73; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g82 (2, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 830:
                if (((settings->motion_mode != 830) && (block->q_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 143; } else;

                block->q_number =
                    block->q_number == -1.0 ? settings->cycle_q : block->q_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g83 (2, aa, bb, r, clear_cc, cc, block->q_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_q = block->q_number;
                break;
            case 840:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g84 (2, aa, bb, clear_cc, cc, settings->spindle_turning, settings->speed_feed_mode))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 850:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g85 (2, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 860:
                if (((settings->motion_mode != 860) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 74; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g86 (2, aa, bb, clear_cc, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 870:
                if (settings->motion_mode != 870)
                {
                    if ((block->i_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 87; } else;
                    if ((block->j_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 90; } else;
                    if ((block->k_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 93; } else;
                }
                i = block->i_flag == 1 ? block->i_number : settings->cycle_i;
                j = block->j_flag == 1 ? block->j_number : settings->cycle_j;
                k = block->k_flag == 1 ? block->k_number : settings->cycle_k;
                settings->cycle_i = i;
                settings->cycle_j = j;
                settings->cycle_k = k;
                if (settings->distance_mode == MODE_INCREMENTAL)
                {
                    i = (cc + i);             
                }
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g87 (2, aa, (aa + j), bb, (bb + k), r, clear_cc, i, cc, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 880:
                if (((settings->motion_mode != 880) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 75; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g88 (2, aa, bb, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 890:
                if (((settings->motion_mode != 890) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 76; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g89 (2, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        }
        settings->current_y = aa;             
        settings->current_z = bb;
        settings->current_x = clear_cc;
        settings->cycle_cc = block->x_number;

        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(save_mode);

        return 0;
    }

    

   




















































 

    static int convert_cycle_zx(                   
    int motion,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_cycle_zx";
        double aa;
        double aa_increment;
        double bb;
        double bb_increment;
        double cc;
        double clear_cc;
        double i;
        double j;
        double k;
        double old_cc;
        CANON_PLANE plane;
        double r;
        int repeat;
        CANON_MOTION_MODE save_mode;
        int status;

        plane = 3;
        if (settings->motion_mode != motion)
        {
            if ((block->y_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 194; } else;

        }
        block->y_number =
            block->y_flag == 1 ? block->y_number : settings->cycle_cc;
        old_cc = settings->current_y;

        if (settings->distance_mode == MODE_ABSOLUTE)
        {
            aa_increment = 0.0;
            bb_increment = 0.0;
            r = block->r_number;
            cc = block->y_number;
            aa = block->z_flag == 1 ? block->z_number : settings->current_z;
            bb = block->x_flag == 1 ? block->x_number : settings->current_x;
        }
        else if (settings->distance_mode == MODE_INCREMENTAL)
        {
            aa_increment = block->z_number;
            bb_increment = block->x_number;
            r = (block->r_number + old_cc);
            cc = (r + block->y_number);       
            aa = settings->current_z;
            bb = settings->current_x;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 31; } else;
        if ((r < cc)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 149; } else;

        if (old_cc < r)
        {
            STRAIGHT_TRAVERSE(settings->current_x, r, settings->current_z
#line 4604 "rs274ngc_pre.c"
                );
            old_cc = r;
        }
        clear_cc = (settings->retract_mode == R_PLANE) ? r : old_cc;

        save_mode = GET_EXTERNAL_MOTION_CONTROL_MODE();
        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(2);

        switch(motion)
        {
            case 810:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g81(3, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 820:
                if (((settings->motion_mode != 820) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 73; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g82 (3, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 830:
                if (((settings->motion_mode != 830) && (block->q_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 143; } else;

                block->q_number =
                    block->q_number == -1.0 ? settings->cycle_q : block->q_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g83 (3, aa, bb, r, clear_cc, cc, block->q_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_q = block->q_number;
                break;
            case 840:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g84 (3, aa, bb, clear_cc, cc, settings->spindle_turning, settings->speed_feed_mode))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 850:
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g85 (3, aa, bb, clear_cc, cc))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }
                    break;
            case 860:
                if (((settings->motion_mode != 860) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 74; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g86 (3, aa, bb, clear_cc, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 870:
                if (settings->motion_mode != 870)
                {
                    if ((block->i_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 87; } else;
                    if ((block->j_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 90; } else;
                    if ((block->k_flag == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 93; } else;
                }
                i = block->i_flag == 1 ? block->i_number : settings->cycle_i;
                j = block->j_flag == 1 ? block->j_number : settings->cycle_j;
                k = block->k_flag == 1 ? block->k_number : settings->cycle_k;
                settings->cycle_i = i;
                settings->cycle_j = j;
                settings->cycle_k = k;
                if (settings->distance_mode == MODE_INCREMENTAL)
                {
                    j = (cc + j);             
                }
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g87 (3, aa, (aa + k), bb, (bb + i), r, clear_cc, j, cc, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    break;
            case 880:
                if (((settings->motion_mode != 880) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 75; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g88 (3, aa, bb, cc, block->p_number, settings->spindle_turning))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            case 890:
                if (((settings->motion_mode != 890) && (block->p_number == -1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 76; } else;

                block->p_number =
                    block->p_number == -1.0 ? settings->cycle_p : block->p_number;
                for (repeat = block->l_number; repeat > 0; repeat--) { aa = (aa + aa_increment); bb = (bb + bb_increment); cycle_traverse(plane, aa, bb, old_cc); if (old_cc != r) cycle_traverse(plane, aa, bb, r); if ((status = (convert_cycle_g89 (3, aa, bb, clear_cc, cc, block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else; old_cc = clear_cc; }

                    settings->cycle_p = block->p_number;
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        }
        settings->current_z = aa;             
        settings->current_x = bb;
        settings->current_y = clear_cc;
        settings->cycle_cc = block->y_number;

        if (save_mode != 2)
            SET_MOTION_CONTROL_MODE(save_mode);

        return 0;
    }

    

   

















 

    static int convert_distance_mode(              
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_distance_mode";
        if (g_code == 900)
        {
            if (settings->distance_mode != MODE_ABSOLUTE)
            {

                COMMENT("interpreter: distance mode changed to absolute");

                settings->distance_mode = MODE_ABSOLUTE;
            }
        }
        else if (g_code == 910)
        {
            if (settings->distance_mode != MODE_INCREMENTAL)
            {

                COMMENT("interpreter: distance mode changed to incremental");

                settings->distance_mode = MODE_INCREMENTAL;
            }
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 25; } else;
        return 0;
    }

    

   








 

    static int convert_dwell(                      
    double time)                                   
    {
        DWELL(time);
        return 0;
    }

    

   

















 

    static int convert_feed_mode(                  
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_feed_mode";
        if (g_code == 930)
        {

            COMMENT("interpreter: feed mode set to inverse time");

            settings->feed_mode = 1;
        }
        else if (g_code == 940)
        {

            COMMENT("interpreter: feed mode set to units per minute");

            settings->feed_mode = 0;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 26; } else;
        return 0;
    }

    

   












 

    static int convert_feed_rate(                  
    block_pointer block,                           
    setup_pointer settings)                        
    {
        SET_FEED_RATE(block->f_number);
        settings->feed_rate = block->f_number;
        return 0;
    }

    

   



















































 

    static int convert_g(                          
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_g";
        int status;

        if (block->g_modes[0] == 40)
        {
            if ((status = (convert_dwell(block->p_number))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[2] != -1)
        {
            if ((status = (convert_set_plane(block->g_modes[2], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[6] != -1)
        {
            if ((status = (convert_length_units(block->g_modes[6], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[7] != -1)
        {
            if ((status = (convert_cutter_compensation(block->g_modes[7], block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[8] != -1)
        {
            if ((status = (convert_tool_length_offset(block->g_modes[8], block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[12] != -1)
        {
            if ((status = (convert_coordinate_system(block->g_modes[12], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[13] != -1)
        {
            if ((status = (convert_control_mode(block->g_modes[13], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[3] != -1)
        {
            if ((status = (convert_distance_mode(block->g_modes[3], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[10] != -1)
        {
            if ((status = (convert_retract_mode(block->g_modes[10], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[0] != -1)
        {
            if ((status = (convert_modal_0(block->g_modes[0], block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->motion_to_be != -1)
        {
            if ((status = (convert_motion(block->motion_to_be, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        return 0;
    }

    

   

























 

    static int convert_home(                       
    int move,                                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_home";
        double end_x;
        double end_y;
        double end_z;
#line 5015 "rs274ngc_pre.c"
        double * parameters;

        parameters = settings->parameters;
        find_ends(block, settings, &end_x, &end_y,
            &end_z











            );

        if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 60; } else;

        STRAIGHT_TRAVERSE(end_x, end_y, end_z
#line 5057 "rs274ngc_pre.c"
            );
        if (move == 280)
        {
            find_relative
                (parameters[5161], parameters[5162], parameters[5163],
#line 5071 "rs274ngc_pre.c"
                &end_x, &end_y, &end_z











                , settings);
        }
        else if (move == 300)
        {
            find_relative
                (parameters[5181], parameters[5182], parameters[5183],
#line 5098 "rs274ngc_pre.c"
                &end_x, &end_y, &end_z











                , settings);
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 19; } else;
        STRAIGHT_TRAVERSE(end_x, end_y, end_z
#line 5136 "rs274ngc_pre.c"
            );
        settings->current_x = end_x;
        settings->current_y = end_y;
        settings->current_z = end_z;
#line 5149 "rs274ngc_pre.c"
        return 0;
    }

    

   





































 

    static int convert_length_units(               
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_length_units";
        if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 39; } else;

        if (g_code == 200)
        {
            USE_LENGTH_UNITS(1);
            if (settings->length_units != 1)
            {
                settings->length_units = 1;
                settings->current_x = (settings->current_x * 0.039370078740157477);
                settings->current_y = (settings->current_y * 0.039370078740157477);
                settings->current_z = (settings->current_z * 0.039370078740157477);
                settings->axis_offset_x =
                    (settings->axis_offset_x * 0.039370078740157477);
                settings->axis_offset_y =
                    (settings->axis_offset_y * 0.039370078740157477);
                settings->axis_offset_z =
                    (settings->axis_offset_z * 0.039370078740157477);
                settings->origin_offset_x =
                    (settings->origin_offset_x * 0.039370078740157477);
                settings->origin_offset_y =
                    (settings->origin_offset_y * 0.039370078740157477);
                settings->origin_offset_z =
                    (settings->origin_offset_z * 0.039370078740157477);
            }
        }
        else if (g_code == 210)
        {
            USE_LENGTH_UNITS(2);
            if (settings->length_units != 2)
            {
                settings->length_units = 2;
                settings->current_x = (settings->current_x * 25.4);
                settings->current_y = (settings->current_y * 25.4);
                settings->current_z = (settings->current_z * 25.4);
                settings->axis_offset_x =
                    (settings->axis_offset_x * 25.4);
                settings->axis_offset_y =
                    (settings->axis_offset_y * 25.4);
                settings->axis_offset_z =
                    (settings->axis_offset_z * 25.4);
                settings->origin_offset_x =
                    (settings->origin_offset_x * 25.4);
                settings->origin_offset_y =
                    (settings->origin_offset_y * 25.4);
                settings->origin_offset_z =
                    (settings->origin_offset_z * 25.4);
            }
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 18; } else;
        return 0;
    }

    

   























 

    static int convert_m(                          
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_m";
        int status;

        if (block->m_modes[6] != -1)
        {
            if ((status = (convert_tool_change(settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }

        if (block->m_modes[7] == 3)
        {
            START_SPINDLE_CLOCKWISE();
            settings->spindle_turning = 2;
        }
        else if (block->m_modes[7] == 4)
        {
            START_SPINDLE_COUNTERCLOCKWISE();
            settings->spindle_turning = 3;
        }
        else if (block->m_modes[7] == 5)
        {
            STOP_SPINDLE_TURNING();
            settings->spindle_turning = 1;
        }

        if (block->m_modes[8] == 7)
        {
            MIST_ON();
            settings->mist = 1;
        }
        else if (block->m_modes[8] == 8)
        {
            FLOOD_ON();
            settings->flood = 1;
        }
        else if (block->m_modes[8] == 9)
        {
            MIST_OFF();
            settings->mist = 0;
            FLOOD_OFF();
            settings->flood = 0;
        }

   














 

        if (block->m_modes[9] == 48)
        {
            ENABLE_FEED_OVERRIDE();
            ENABLE_SPEED_OVERRIDE();
            settings->feed_override = 1;
            settings->speed_override = 1;
        }
        else if (block->m_modes[9] == 49)
        {
            DISABLE_FEED_OVERRIDE();
            DISABLE_SPEED_OVERRIDE();
            settings->feed_override = 0;
            settings->speed_override = 0;
        }

        return 0;
    }

    

   




















 

    static int convert_modal_0(                    
    int code,                                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_modal_0";
        int status;

        if (code == 100)
        {
            if ((status = (convert_setup(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if ((code == 280) || (code == 300))
        {
            if ((status = (convert_home(code, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if ((code == 920)   || (code == 921) ||
            (code == 922) || (code == 923))
        {
            if ((status = (convert_axis_offsets(code, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if ((code == 40) || (code == 530)); 
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 23; } else;
        return 0;
    }

    

   


















 

    static int convert_motion(                     
    int motion,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_motion";
        int status;

        if ((motion == 0) || (motion == 10))
        {
            if ((status = (convert_straight(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if ((motion == 30) || (motion == 20))
        {
            if ((status = (convert_arc(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (motion == 382)
        {
            if ((status = (convert_probe(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else if (motion == 800)
        {

            COMMENT("interpreter: motion mode set to none");

            settings->motion_mode = 800;
        }
        else if ((motion > 800) && (motion < 900))
        {
            if ((status = (convert_cycle(motion, block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 36; } else;

        return 0;
    }

    

   
































 

    static int convert_probe(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_probe";
        double distance;
        double end_x;
        double end_y;
        double end_z;
#line 5528 "rs274ngc_pre.c"

        if ((((block->x_flag == 0) && (block->y_flag == 0)) && (block->z_flag == 0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 192; } else;

        if ((settings->feed_mode == 1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 47; } else;

        if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 48; } else;

        if ((settings->feed_rate == 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 49; } else;
        find_ends(block, settings, &end_x, &end_y,
            &end_z











            );
        if (0
#line 5560 "rs274ngc_pre.c"
            )
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 44; } else;
        distance = sqrt(pow((settings->current_x - end_x), 2) +
            pow((settings->current_y - end_y), 2) +
            pow((settings->current_z - end_z), 2));
        if ((distance < ((settings->length_units == 2) ? 0.254 : 0.01))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 162; } else;

        TURN_PROBE_ON();
        STRAIGHT_PROBE(end_x, end_y, end_z
#line 5590 "rs274ngc_pre.c"
            );
        TURN_PROBE_OFF();
        settings->motion_mode = 382;
        settings->probe_flag = 1;
        return 0;
    }

    

   
















 

    static int convert_retract_mode(               
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_retract_mode";
        if (g_code == 980)
        {

            COMMENT("interpreter: retract mode set to old_z");

            settings->retract_mode = OLD_Z;
        }
        else if (g_code == 990)
        {

            COMMENT("interpreter: retract mode set to r_plane");

            settings->retract_mode = R_PLANE;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 27; } else;
        return 0;
    }

    

   























 

    static int convert_setup(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_setup";
        double x;
        double y;
        double z;
#line 5687 "rs274ngc_pre.c"
        double * parameters;
        int p_int;

        parameters = settings->parameters;
        p_int = (int)(block->p_number + 0.0001);

        if (block->x_flag == 1)
        {
            x = block->x_number;
            parameters[5201 + (p_int * 20)] = x;
        }
        else
            x = parameters[5201 + (p_int * 20)];

        if (block->y_flag == 1)
        {
            y = block->y_number;
            parameters[5202 + (p_int * 20)] = y;
        }
        else
            y = parameters[5202 + (p_int * 20)];
        if (block->z_flag == 1)
        {
            z = block->z_number;
            parameters[5203 + (p_int * 20)] = z;
        }
        else
            z = parameters[5203 + (p_int * 20)];

#line 5725 "rs274ngc_pre.c"

#line 5735 "rs274ngc_pre.c"

#line 5745 "rs274ngc_pre.c"

   

 
        if (p_int == settings->origin_index)       
        {
            settings->current_x =
                (settings->current_x + settings->origin_offset_x);
            settings->current_y =
                (settings->current_y + settings->origin_offset_y);
            settings->current_z =
                (settings->current_z + settings->origin_offset_z);
#line 5778 "rs274ngc_pre.c"

            settings->origin_offset_x = x;
            settings->origin_offset_y = y;
            settings->origin_offset_z = z;
#line 5791 "rs274ngc_pre.c"

            settings->current_x = (settings->current_x - x);
            settings->current_y = (settings->current_y - y);
            settings->current_z = (settings->current_z - z);
#line 5807 "rs274ngc_pre.c"

            SET_ORIGIN_OFFSETS(x + settings->axis_offset_x,
                y + settings->axis_offset_y,
                z + settings->axis_offset_z
#line 5832 "rs274ngc_pre.c"
                );
        }

        else
            COMMENT("interpreter: setting coordinate system origin");

        return 0;
    }

    

   















 

    static int convert_set_plane(                  
    int g_code,                                    
    setup_pointer settings)                        
    {
        static char name[] = "convert_set_plane";
        if (g_code == 170)
        {
            SELECT_PLANE(1);
            settings->plane = 1;
        }
        else if (g_code == 180)
        {
            if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 64; } else;

            SELECT_PLANE(3);
            settings->plane = 3;
        }
        else if (g_code == 190)
        {
            if ((settings->cutter_comp_side != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 65; } else;

            SELECT_PLANE(2);
            settings->plane = 2;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 17; } else;
        return 0;
    }

    

   










 

    static int convert_speed(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        SET_SPINDLE_SPEED(block->s_number);
        settings->speed = block->s_number;
        return 0;
    }

    

   


























































 

    static int convert_stop(                       
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_stop";
        int index;
        char * line;
        int length;

        if (block->m_modes[4] == 0)
        {
            PROGRAM_STOP();
        }
        else if (block->m_modes[4] == 60)
        {
            PALLET_SHUTTLE();
            PROGRAM_STOP();
        }
        else if (block->m_modes[4] == 1)
        {
            OPTIONAL_PROGRAM_STOP();
        }
        else if ((block->m_modes[4] == 2) || (block->m_modes[4] == 30))
        {                                          
    
            settings->current_x = settings->current_x
                + settings->origin_offset_x + settings->axis_offset_x;
            settings->current_y = settings->current_y
                + settings->origin_offset_y + settings->axis_offset_y;
            settings->current_z = settings->current_z
                + settings->origin_offset_z + settings->axis_offset_z;
#line 6032 "rs274ngc_pre.c"

            settings->origin_index = 1;
            settings->parameters[5220] = 1.0;
            settings->origin_offset_x = settings->parameters[5221];
            settings->origin_offset_y = settings->parameters[5222];
            settings->origin_offset_z = settings->parameters[5223];
#line 6050 "rs274ngc_pre.c"

            settings->axis_offset_x = 0;
            settings->axis_offset_x = 0;
            settings->axis_offset_x = 0;
#line 6063 "rs274ngc_pre.c"

            settings->current_x = settings->current_x -
                settings->origin_offset_x;
            settings->current_y = settings->current_y -
                settings->origin_offset_y;
            settings->current_z = settings->current_z -
                settings->origin_offset_z;
#line 6091 "rs274ngc_pre.c"

            SET_ORIGIN_OFFSETS(settings->origin_offset_x,
                settings->origin_offset_y,
                settings->origin_offset_z
#line 6116 "rs274ngc_pre.c"
                );

              if (settings->plane != 1)
            {
                SELECT_PLANE(1);
                settings->plane = 1;
            }

              settings->distance_mode = MODE_ABSOLUTE;

              settings->feed_mode = 0;

              if (settings->feed_override != 1)
            {
                ENABLE_FEED_OVERRIDE();
                settings->feed_override = 1;
            }
            if (settings->speed_override != 1)
            {
                ENABLE_SPEED_OVERRIDE();
                settings->speed_override = 1;
            }

              settings->cutter_comp_side = 0;
            settings->program_x = 1e-20;

              STOP_SPINDLE_TURNING();
            settings->spindle_turning = 1;

              settings->motion_mode = 10;

              if (settings->mist == 1)
            {
                MIST_OFF();
                settings->mist = 0;
            }
            if (settings->flood == 1)
            {
                FLOOD_OFF();
                settings->flood = 0;
            }

            if (block->m_modes[4] == 30)
                PALLET_SHUTTLE();
            PROGRAM_END();
            if (_setup.percent_flag == 1)
            {
                if ((_setup . file_pointer == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 170; } else;
                line = _setup.linetext;
                for(; ;)                           
                {
                    if (fgets(line, 256, _setup.file_pointer) == 0)
                    {
                        COMMENT
                            ("interpreter: percent sign missing from end of file");
                        break;
                    }
                    length = strlen(line);
                    if (length == (256 - 1))
                    {                             
                        for(;fgetc(_setup.file_pointer) != '\n';);
                        continue;
                    }
                    for(index = (length -1); 
                        (index >= 0) && (((* __rt_ctype_table())[line[index]] & 1));
                        index--);
                    if (line[index] == '%')       
                    {
                        for(index--; (index >= 0)&&(((* __rt_ctype_table())[line[index]] & 1)); index--);
                        if (index == -1)          
                            break;
                    }
                }
            }
            return 1;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 30; } else;
        return 0;
    }

    

   





































 

    static int convert_straight(                   
    int move,                                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_straight";
        double end_x;
        double end_y;
        double end_z;
#line 6257 "rs274ngc_pre.c"
        int status;

        if (move == 10)
        {
            if (settings->feed_mode == 0)
            {
                if ((settings->feed_rate == 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 41; } else;

            }
            else if (settings->feed_mode == 1)
            {
                if ((block->f_number == -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 79; } else;

            }
        }

        settings->motion_mode = move;
        find_ends(block, settings, &end_x, &end_y,
            &end_z











            );
    
        if ((settings->cutter_comp_side != 0) &&
            (settings->cutter_comp_radius > 0.0))  
        {
            if ((block->g_modes[0] == 530)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 62; } else;

            if (settings->program_x == 1e-20)
            {
                status =
                    convert_straight_comp1(move, block, settings, end_x, end_y,
                    end_z











                    );
                if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
            else
            {
                status =
                    convert_straight_comp2 (move, block, settings, end_x, end_y,
                    end_z











                    );
                if ((status = (status)) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
        }
        else if (move == 0)
        {
            STRAIGHT_TRAVERSE(end_x, end_y, end_z
#line 6357 "rs274ngc_pre.c"
                );
            settings->current_x = end_x;
            settings->current_y = end_y;
        }
        else if (move == 10)
        {
            if (settings->feed_mode == 1)
                inverse_time_rate_straight
                    (end_x, end_y, end_z











                    , block, settings);
            STRAIGHT_FEED(end_x, end_y, end_z
#line 6400 "rs274ngc_pre.c"
                );
            settings->current_x = end_x;
            settings->current_y = end_y;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 16; } else;

        settings->current_z = end_z;
#line 6417 "rs274ngc_pre.c"
        return 0;
    }

    

   































 

    static int convert_straight_comp1(             
    int move,                                      
    block_pointer block,                           
    setup_pointer settings,                        
    double px,                                     
    double py,                                     
    double end_z                                   
#line 6472 "rs274ngc_pre.c"
    )
    {
        static char name[] = "convert_straight_comp1";
        double alpha;
        double cx;                                 
        double cy;                                 
        double distance;
        double radius;
        int side;
        double theta;

        side = settings->cutter_comp_side;
        cx = settings->current_x;
        cy = settings->current_y;

    
        radius = settings->cutter_comp_radius;
        distance = hypot((px - cx), (py -cy));

        if (((side != 2) && (side != 1))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 35; } else;
        if ((distance <= radius)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 70; } else;

        theta = acos(radius/distance);
        alpha = (side == 2) ? (atan2((cy - py), (cx - px)) - theta) :
        (atan2((cy - py), (cx - px)) + theta);
        cx = (px + (radius * cos(alpha)));    
        cy = (py + (radius * sin(alpha)));
        if (move == 0)
            STRAIGHT_TRAVERSE(cx, cy, end_z
#line 6522 "rs274ngc_pre.c"
                );
        else if (move == 10)
        {
            if (settings->feed_mode == 1)
                inverse_time_rate_straight
                    (cx, cy, end_z











                    , block, settings);
            STRAIGHT_FEED(cx, cy, end_z
#line 6562 "rs274ngc_pre.c"
                );
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 16; } else;

        settings->current_x = cx;
        settings->current_y = cy;
        settings->program_x = px;
        settings->program_y = py;
        return 0;
    }

    

   



































































 

    static int convert_straight_comp2(             
    int move,                                      
    block_pointer block,                           
    setup_pointer settings,                        
    double px,                                     
    double py,                                     
    double end_z                                   
#line 6662 "rs274ngc_pre.c"
    )
    {
        static char name[] = "convert_straight_comp2";
        double alpha;
        double beta;
        double end_x;                              
        double end_y;                              
        double gamma;
        double mid_x;                              
        double mid_y;                              
        double radius;
        int side;
    
        double small = 0.01;
        double start_x, start_y;                   
        double theta;

        start_x = settings->program_x;
        start_y = settings->program_y;
        if ((py == start_y) && (px == start_x))   
        {
            end_x = settings->current_x;
            end_y = settings->current_y;
            if (move == 0)
                STRAIGHT_TRAVERSE(end_x, end_y, end_z
#line 6708 "rs274ngc_pre.c"
                    );
            else if (move == 10)
            {
                if (settings->feed_mode == 1)
                    inverse_time_rate_straight
                        (end_x, end_y, end_z











                        , block, settings);
                STRAIGHT_FEED(end_x, end_y, end_z
#line 6748 "rs274ngc_pre.c"
                    );
            }
            else
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 16; } else;
        }
        else
        {
            side = settings->cutter_comp_side;
    
            radius = settings->cutter_comp_radius;
            theta = atan2(settings->current_y - start_y,
                settings->current_x - start_x);
            alpha = atan2(py - start_y, px - start_x);

            if (side == 2)
            {
                if (theta < alpha)
                    theta = (theta + 6.2831853071795864);
                beta = ((theta - alpha) - 1.5707963267948966);
                gamma = 1.5707963267948966;
            }
            else if (side == 1)
            {
                if (alpha < theta)
                    alpha = (alpha + 6.2831853071795864);
                beta = ((alpha - theta) - 1.5707963267948966);
                gamma = -1.5707963267948966;
            }
            else
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 35; } else;
            end_x = (px + (radius * cos(alpha + gamma)));
            end_y = (py + (radius * sin(alpha + gamma)));
            mid_x = (start_x + (radius * cos(alpha + gamma)));
            mid_y = (start_y + (radius * sin(alpha + gamma)));

            if (((beta < -small) || (beta > (3.1415926535897932 + small)))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 67; } else;

            if (move == 0)
                STRAIGHT_TRAVERSE(end_x, end_y, end_z
#line 6808 "rs274ngc_pre.c"
                    );
            else if (move == 10)
            {
                if (beta > small)                  
                {
                    if (settings->feed_mode == 1)
                        inverse_time_rate_as(start_x, start_y, (side == 2) ? -1 : 1,
                        mid_x, mid_y, end_x, end_y,
                        end_z











                        ,
                        block, settings);
                    ARC_FEED(mid_x,mid_y,start_x, start_y,((side == 2) ? -1 : 1),
                        settings->current_z
#line 6853 "rs274ngc_pre.c"
                        );
                    STRAIGHT_FEED(end_x, end_y, end_z
#line 6876 "rs274ngc_pre.c"
                        );
                }
                else
                {
                    if (settings->feed_mode == 1)
                        inverse_time_rate_straight
                            (end_x,end_y,end_z











                            , block, settings);
                    STRAIGHT_FEED(end_x, end_y, end_z
#line 6917 "rs274ngc_pre.c"
                        );
                }
            }
            else
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 16; } else;
        }

        settings->current_x = end_x;
        settings->current_y = end_y;
        settings->program_x = px;
        settings->program_y = py;
        return 0;
    }

    

   






















































 

    static int convert_tool_change(                
    setup_pointer settings)                        
    {
        static char name[] = "convert_tool_change";

        CHANGE_TOOL(settings->selected_tool_slot);
        settings->current_slot = settings->selected_tool_slot;
        settings->spindle_turning = 1;

        return 0;
    }

    

   


























 

    static int convert_tool_length_offset(         
    int g_code,                                    
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_tool_length_offset";
        int index;
        double offset;

        if (g_code == 490)
        {
            USE_TOOL_LENGTH_OFFSET(0.0);
            settings->current_z = (settings->current_z +
                settings->tool_length_offset);
            settings->tool_length_offset = 0.0;
            settings->length_offset_index = 0;
        }
        else if (g_code == 430)
        {
            index = block->h_number;
            if ((index == -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 137; } else;
            offset = settings->tool_table[index].length;
            USE_TOOL_LENGTH_OFFSET(offset);
            settings->current_z =
                (settings->current_z + settings->tool_length_offset - offset);
            settings->tool_length_offset = offset;
            settings->length_offset_index = index;
        }
        else
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 22; } else;
        return 0;
    }

    

   





















 

    static int convert_tool_select(                
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "convert_tool_select";

        if ((block->t_number > settings->tool_max)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 155; } else;

        SELECT_TOOL(block->t_number);
        settings->selected_tool_slot = block->t_number;
        return 0;
    }

    

   




















 

    static int cycle_feed(                         
    CANON_PLANE plane,                             
    double end1,                                   
    double end2,                                   
    double end3)                                   
    {
        static char name[] = "cycle_feed";

        if (plane == 1)
            STRAIGHT_FEED(end1, end2, end3
#line 7161 "rs274ngc_pre.c"
                );
        else if (plane == 2)
            STRAIGHT_FEED(end3, end1, end2
#line 7185 "rs274ngc_pre.c"
                    );
        else                                       
            STRAIGHT_FEED(end2, end3, end1
#line 7209 "rs274ngc_pre.c"
                );

        return 0;
    }

    

   




















 

    static int cycle_traverse(                     
    CANON_PLANE plane,                             
    double end1,                                   
    double end2,                                   
    double end3)                                   
    {
        static char name[] = "cycle_traverse";
        if (plane == 1)
            STRAIGHT_TRAVERSE(end1, end2, end3
#line 7269 "rs274ngc_pre.c"
                );
        else if (plane == 2)
            STRAIGHT_TRAVERSE(end3, end1, end2
#line 7293 "rs274ngc_pre.c"
                    );
        else                                       
            STRAIGHT_TRAVERSE(end2, end3, end1
#line 7317 "rs274ngc_pre.c"
                );
        return 0;
    }

    

   































 

    static int enhance_block(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "enhance_block";
        int axis_flag;
        int mode_zero_covets_axes;

        axis_flag = ((block->x_flag == 1) ||
            (block->y_flag == 1) ||
#line 7376 "rs274ngc_pre.c"
            (block->z_flag == 1));
        mode_zero_covets_axes = ((block->g_modes[0] == 100) ||
            (block->g_modes[0] == 280) ||
            (block->g_modes[0] == 300) ||
            (block->g_modes[0] == 920));

        if (block->g_modes[1] != -1)
        {
            if (block->g_modes[1] == 800)
            {
                if ((axis_flag && (! mode_zero_covets_axes))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 56; } else;

                if (((! axis_flag) && (block->g_modes[0] == 920))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 5; } else;

            }
            else
            {
                if (mode_zero_covets_axes) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 63; } else;

                if ((! axis_flag)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 6; } else;
            }
            block->motion_to_be = block->g_modes[1];
        }
        else if (mode_zero_covets_axes)
        {                                          
            if (((! axis_flag) && (block->g_modes[0] == 920))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 5; } else;

        }
        else if (axis_flag)
        {
            if (((settings->motion_mode == -1) || (settings->motion_mode == 800))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 57; } else;

            block->motion_to_be = settings->motion_mode;
        }
        return 0;
    }

    

   













 

    static int execute_binary(
    double * left,
    int operation,
    double * right)
    {
        static char name[] = "execute_binary";
        int status;

        if (operation < 5)
            if ((status = (execute_binary1(left, operation, right))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        else
            if ((status = (execute_binary2(left, operation, right))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        return 0;
    }

    

   
















 

    static int execute_binary1(                    
    double * left,                                 
    int operation,                                 
    double * right)                                
    {
        static char name[] = "execute_binary1";
        switch (operation)
        {
            case 1:
                if ((*right == 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 10; } else;
                *left = (*left / *right);
                break;
            case 2:                           
                *left = fmod(*left, *right);
                if (*left < 0.0)
                {
                    *left = (*left + fabs(*right));
                }
                break;
            case 3:
                if (((*left < 0.0) && (floor(*right) != *right))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 11; } else;

                *left = pow(*left, *right);
                break;
            case 4:
                *left = (*left * *right);
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 37; } else;
        }
        return 0;
    }

    

   


















 

    static int execute_binary2(                    
    double * left,                                 
    int operation,                                 
    double * right)                                
    {
        static char name[] = "execute_binary2";
        switch (operation)
        {
            case 5:
                *left = ((*left == 0.0) || (*right == 0.0)) ? 0.0 : 1.0;
                break;
            case 6:
                *left = (((*left == 0.0) && (*right != 0.0)) ||
                    ((*left != 0.0) && (*right == 0.0))) ? 1.0 : 0.0;
                break;
            case 7:
                *left = (*left - *right);
                break;
            case 8:
                *left = ((*left != 0.0) || (*right != 0.0)) ? 1.0 : 0.0;
                break;
            case 9:
                *left = (*left + *right);
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 37; } else;
        }
        return 0;
    }

    

   











































 

    static int execute_block(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "execute_block";
        int status;

        if (block->comment[0] != 0)
        {
            if ((status = (convert_comment(block->comment))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->g_modes[5] != -1)
        {
            if ((status = (convert_feed_mode(block->g_modes[5], settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->f_number > -1.0)
        {
    
            if (settings->feed_mode == 1);
            else
            {
                if ((status = (convert_feed_rate(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
        }
        if (block->s_number > -1.0)
        {
            if ((status = (convert_speed(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if (block->t_number != -1)
        {
            if ((status = (convert_tool_select(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        if ((status = (convert_m(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (convert_g(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if (block->m_modes[4] != -1)             
        {
            status = convert_stop(block, settings);
            if (status == 1)
                return 1;
            else if (status != 0)
                if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else return status;
        }
        return ((settings->probe_flag == 1) ? 2: 0);
    }

    

   

























 

    static int execute_unary(                      
    double * double_ptr,                           
    int operation)                                 
    {
        static char name[] = "execute_unary";
        switch (operation)
        {
            case 1:
                if (*double_ptr < 0.0)
                    *double_ptr = (-1.0 * *double_ptr);
                break;
            case 2:
                if (((*double_ptr < -1.0) || (*double_ptr > 1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 8; } else;

                *double_ptr = acos(*double_ptr);
                *double_ptr = ((*double_ptr * 180.0)/ 3.1415926535897932);
                break;
            case 3:
                if (((*double_ptr < -1.0) || (*double_ptr > 1.0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 9; } else;

                *double_ptr = asin(*double_ptr);
                *double_ptr = ((*double_ptr * 180.0)/ 3.1415926535897932);
                break;
            case 5:
                *double_ptr = cos((*double_ptr * 3.1415926535897932)/180.0);
                break;
            case 6:
                *double_ptr = exp(*double_ptr);
                break;
            case 7:
                *double_ptr = floor(*double_ptr);
                break;
            case 8:
                *double_ptr = ceil(*double_ptr);
                break;
            case 9:
                if ((*double_ptr <= 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 196; } else;
                *double_ptr = log(*double_ptr);
                break;
            case 10:
                *double_ptr = (double)
                    ((int) (*double_ptr + ((*double_ptr < 0.0) ? -0.5 : 0.5)));
                break;
            case 11:
                *double_ptr = sin((*double_ptr * 3.1415926535897932)/180.0);
                break;
            case 12:
                if ((*double_ptr < 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 121; } else;
                *double_ptr = sqrt(*double_ptr);
                break;
            case 13:
                *double_ptr = tan((*double_ptr * 3.1415926535897932)/180.0);
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 37; } else;
        }
        return 0;
    }

    

   






























 

    static double find_arc_length(                 
    double x1,                                     
    double y1,                                     
    double z1,                                     
    double center_x,                               
    double center_y,                               
    int turn,                                      
    double x2,                                     
    double y2,                                     
    double z2)                                     
    {
        double radius;
        double theta;                              

        radius = hypot((center_x - x1), (center_y - y1));
        theta = find_turn(x1, y1, center_x, center_y, turn, x2, y2);
        if (z2 == z1)
            return (radius * fabs(theta));
        else
            return hypot((radius * theta), (z2 - z1));
    }

    

   



































 

    static int find_ends(                          
    block_pointer block,                           
    setup_pointer settings,                        
    double * px,                                   
    double * py,                                   
    double * pz                                    
#line 7847 "rs274ngc_pre.c"
    )
    {
        int mode;
        int middle;
        int comp;

        mode = settings->distance_mode;
        middle = (settings->program_x != 1e-20);
        comp = (settings->cutter_comp_side != 0);

        if (block->g_modes[0] == 530)             
        {

            COMMENT("interpreter: offsets temporarily suspended");

            *px = (block->x_flag == 1) ? (block->x_number -
                (settings->origin_offset_x + settings->axis_offset_x)) :
            settings->current_x;
            *py = (block->y_flag == 1) ? (block->y_number -
                (settings->origin_offset_y + settings->axis_offset_y)) :
            settings->current_y;
            *pz = (block->z_flag == 1) ? (block->z_number -
                (settings->tool_length_offset + settings->origin_offset_z
                + settings->axis_offset_z)) : settings->current_z;
#line 7905 "rs274ngc_pre.c"
        }
        else if (mode == MODE_ABSOLUTE)
        {
            *px = (block->x_flag == 1) ? block->x_number     :
            (comp && middle)     ? settings->program_x :
            settings->current_x ;

            *py = (block->y_flag == 1) ? block->y_number     :
            (comp && middle)     ? settings->program_y :
            settings->current_y ;

            *pz = (block->z_flag == 1) ? block->z_number     :
            settings->current_z ;
#line 7939 "rs274ngc_pre.c"
        }
        else                                       
        {
            *px = (block->x_flag == 1)
                ? ((comp && middle) ? (block->x_number + settings->program_x)
                : (block->x_number + settings->current_x))
                : ((comp && middle) ? settings->program_x
                : settings->current_x);

            *py = (block->y_flag == 1)
                ? ((comp && middle) ? (block->y_number + settings->program_y)
                : (block->y_number + settings->current_y))
                : ((comp && middle) ? settings->program_y
                : settings->current_y);

            *pz = (block->z_flag == 1) ?
                (settings->current_z + block->z_number) : settings->current_z;
#line 7977 "rs274ngc_pre.c"
        }
        return 0;
    }

    

   

















 

    static int find_relative(                      
    double x1,                                     
    double y1,                                     
    double z1,                                     
#line 8016 "rs274ngc_pre.c"
    double * x2,                                   
    double * y2,                                   
    double * z2,                                   
#line 8028 "rs274ngc_pre.c"
    setup_pointer settings)                        
    {
        *x2 = (x1 - (settings->origin_offset_x + settings->axis_offset_x));
        *y2 = (y1 - (settings->origin_offset_y + settings->axis_offset_y));
        *z2 = (z1 - (settings->tool_length_offset +
            settings->origin_offset_z + settings->axis_offset_z));
#line 8055 "rs274ngc_pre.c"
        return 0;
    }

    

   




























 

    static double find_straight_length(            
    double x2,                                     
    double y2,                                     
    double z2,                                     
#line 8104 "rs274ngc_pre.c"
    double x1,                                     
    double y1,                                     
    double z1                                      
#line 8116 "rs274ngc_pre.c"
    )
    {
        if ((x1 != x2) || (y1 != y2) || (z1 != z2) ||
            (1
#line 8129 "rs274ngc_pre.c"
            ))                                     
            return sqrt(pow((x2 - x1),2) + pow((y2 - y1),2) + pow((z2 - z1),2));
        else
            return sqrt(0 +
#line 8142 "rs274ngc_pre.c"
                0);
    }

    

   









 

    static double find_turn(                       
    double x1,                                     
    double y1,                                     
    double center_x,                               
    double center_y,                               
    int turn,                                      
    double x2,                                     
    double y2)                                     
    {
        double alpha;                              
        double beta;                               
        double theta;                              

        if (turn == 0)
            return 0.0;
        alpha = atan2((y1 - center_y), (x1 - center_x));
        beta = atan2((y2 - center_y), (x2 - center_x));
        if (turn > 0)
        {
            if (beta <= alpha)
                beta = (beta + 6.2831853071795864);
            theta = ((beta - alpha) + ((turn - 1) * 6.2831853071795864));
        }
        else                                       
        {
            if (alpha <= beta)
                alpha = (alpha + 6.2831853071795864);
            theta = ((beta - alpha) + ((turn + 1) * 6.2831853071795864));
        }
        return (theta);
    }

    

   

































 

    static int init_block(                         
    block_pointer block)                           
    {
        int n;
#line 8242 "rs274ngc_pre.c"
        block->comment[0] = 0;
        block->d_number = -1;
        block->f_number = -1.0;
        for (n = 0; n < 14; n++)
        {
            block->g_modes[n] = -1;
        }
        block->h_number = -1;
        block->i_flag = 0;
        block->j_flag = 0;
        block->k_flag = 0;
        block->l_number = -1;
        block->line_number = -1;
        block->motion_to_be = -1;
        block->m_count = 0;
        for (n = 0; n < 10; n++)
        {
            block->m_modes[n] = -1;
        }
        block->p_number = -1.0;
        block->q_number = -1.0;
        block->r_flag = 0;
        block->s_number = -1.0;
        block->t_number = -1;
        block->x_flag = 0;
        block->y_flag = 0;
        block->z_flag = 0;

        return 0;
    }

    

   














 

    static int inverse_time_rate_arc(              
    double x1,                                     
    double y1,                                     
    double z1,                                     
    double cx,                                     
    double cy,                                     
    int turn,                                      
    double x2,                                     
    double y2,                                     
    double z2,                                     
    block_pointer block,                           
    setup_pointer settings)                        
    {
        double length;
        double rate;

        length = find_arc_length (x1, y1, z1, cx, cy, turn, x2, y2, z2);
        rate = ((0.1) > ((length * block->f_number)) ? (0.1) : ((length * block->f_number)));
        SET_FEED_RATE (rate);
        settings->feed_rate = rate;

        return 0;
    }

    

   

















 

    static int inverse_time_rate_arc2(             
    double start_x,                                
    double start_y,                                
    int turn1,                                     
    double mid_x,                                  
    double mid_y,                                  
    double cx,                                     
    double cy,                                     
    int turn2,                                     
    double end_x,                                  
    double end_y,                                  
    double end_z,                                  
    block_pointer block,                           
    setup_pointer settings)                        
    {
        double length;
        double rate;

        length = (find_arc_length (settings->current_x, settings->current_y,
            settings->current_z, start_x, start_y,
            turn1, mid_x, mid_y, settings->current_z) +
            find_arc_length(mid_x, mid_y, settings->current_z,
            cx, cy, turn2, end_x, end_y, end_z));
        rate = ((0.1) > ((length * block->f_number)) ? (0.1) : ((length * block->f_number)));
        SET_FEED_RATE (rate);
        settings->feed_rate = rate;

        return 0;
    }

    

   


















 

    static int inverse_time_rate_as(               
    double start_x,                                
    double start_y,                                
    int turn,                                      
    double mid_x,                                  
    double mid_y,                                  
    double end_x,                                  
    double end_y,                                  
    double end_z,                                  
#line 8409 "rs274ngc_pre.c"
    block_pointer block,                           
    setup_pointer settings)                        
    {
        double length;
        double rate;

        length = (find_arc_length (settings->current_x, settings->current_y,
            settings->current_z, start_x, start_y,
            turn, mid_x, mid_y, settings->current_z) +
            find_straight_length(end_x, end_y,
            end_z











            , mid_x, mid_y,
            settings->current_z











            ));
        rate = ((0.1) > ((length * block->f_number)) ? (0.1) : ((length * block->f_number)));
        SET_FEED_RATE (rate);
        settings->feed_rate = rate;

        return 0;
    }

    

   













 

    static int inverse_time_rate_straight(         
    double end_x,                                  
    double end_y,                                  
    double end_z,                                  
#line 8483 "rs274ngc_pre.c"
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "inverse_time_rate_straight";
        double length;
        double rate;

        length = find_straight_length
            (end_x, end_y, end_z











            , settings->current_x,
            settings->current_y, settings->current_z












            );
        rate = ((0.1) > ((length * block->f_number)) ? (0.1) : ((length * block->f_number)));
        SET_FEED_RATE (rate);
        settings->feed_rate = rate;

        return 0;
    }

    

   
















 

    static int parse_line(                         
    char * line,                                   
    block_pointer block,                           
    setup_pointer settings)                        
    {
        static char name[] = "parse_line";
        int status;

        if ((status = (init_block (block))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (read_items(block, line, settings->parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (enhance_block(block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (check_items (block, settings))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        return 0;
    }

    

   










 

    static int precedence(                         
    int an_operator)
    {
        if (an_operator == 10)
            return 1;
        else if (an_operator == 3)
            return 4;
        else if (an_operator >= 5)
            return 2;
        else
            return 3;
    }

    

   


































 

    static int read_a(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_a";
        double value;
        int status;

        if ((line[*counter] != 'a')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);




        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
#line 8653 "rs274ngc_pre.c"
        return 0;
    }

    

   






























 

    static int read_atan(                          
    char * line,                                   
    int * counter,                                 
    double * double_ptr,                           
    double * parameters)                           
    {
        static char name[] = "read_atan";
        double argument2;
        int status;

        if ((line [*counter] != '/')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 156; } else;
        *counter = (*counter + 1);
        if ((line[*counter] != '[')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 96; } else;

        if ((status = (read_real_expression (line, counter, &argument2, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
    
        *double_ptr = atan2(*double_ptr, argument2);
    
        *double_ptr = ((*double_ptr * 180.0)/3.1415926535897932);
        return 0;
    }

    

   


































 

    static int read_b(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_b";
        double value;
        int status;

        if ((line[*counter] != 'b')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);




        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
#line 8777 "rs274ngc_pre.c"
        return 0;
    }

    

   


































 

    static int read_c(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_c";
        double value;
        int status;

        if ((line[*counter] != 'c')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);




        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
#line 8844 "rs274ngc_pre.c"
        return 0;
    }

    

   





























 

    static int read_comment(                       
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_comment";
        int n;

        if ((line[*counter] != '(')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        (*counter)++;
        for (n = 0; line[*counter] != ')' ; (*counter)++, n++)
        {
            block->comment[n] = line[*counter];
        }
        block->comment[n] = 0;
        (*counter)++;
        return 0;
    }

    

   




























 

    static int read_d(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_d";
        int value;
        int status;

        if ((line[*counter] != 'd')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->d_number > -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 105; } else;
        if ((status = (read_integer_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 122; } else;
        if ((value > _setup . tool_max)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 166; } else;
        block->d_number = value;
        return 0;
    }

    

   



























 

    static int read_f(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_f";
        double value;
        int status;

        if ((line[*counter] != 'f')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->f_number > -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 106; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 123; } else;
        block->f_number = value;
        return 0;
    }

    

   












































 

    static int read_g(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_g";
        double value_read;
        int value;
        int mode;
        int status;

        if ((line[*counter] != 'g')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_real_value(line, counter, &value_read, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        value_read = (10.0 * value_read);
        value = (int)floor(value_read);

        if ((value_read - value) > 0.999)
            value = (int)ceil(value_read);
        else if ((value_read - value) > 0.001)
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 84; } else;

        if ((value > 999)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 84; } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 124; } else;
        mode = _gees[value];
        if ((mode == -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 173; } else;
        if ((block->g_modes[mode] != -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 168; } else;

        block->g_modes[mode] = value;
        return 0;
    }

    

   

























 

    static int read_h(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_h";
        int value;
        int status;

        if ((line[*counter] != 'h')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->h_number > -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 107; } else;
        if ((status = (read_integer_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 125; } else;
        if ((value > _setup . tool_max)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 164; } else;
        block->h_number = value;
        return 0;
    }

    

   




























 

    static int read_i(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_i";
        double value;
        int status;

        if ((line[*counter] != 'i')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->i_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 108; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->i_flag = 1;
        block->i_number = value;
        return 0;
    }

    

   


















 

    static int read_integer_unsigned(              
    char * line,                                   
    int * counter,                                 
    int * integer_ptr)                             
    {
        static char name[] = "read_integer_unsigned";
        int n;
        char c;

        for (n = *counter; ; n++)
        {
            c = line[n];
            if ((c < 48) || (c > 57))
                break;
        }
        if ((n == *counter)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 13; } else;
        if (sscanf(line + *counter, "%d", integer_ptr) == 0)
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 161; } else;
        *counter = n;
        return 0;
    }

    

   





























 

    static int read_integer_value(                 
    char * line,                                   
    int * counter,                                 
    int * integer_ptr,                             
    double * parameters)                           
    {
        static char name[] = "read_integer_value";
        double float_value;
        int status;

        if ((status = (read_real_value(line, counter, &float_value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        *integer_ptr = (int)floor(float_value);
        if ((float_value - *integer_ptr) > 0.9999)
        {
            *integer_ptr = (int)ceil(float_value);
        }
        else if ((float_value - *integer_ptr) > 0.0001)
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 135; } else;
        return 0;
    }

    

   













 

    static int read_items(                         
    block_pointer block,                           
    char * line,                                   
    double * parameters)                           
    {
        static char name[] = "read_items";
        int counter;
        int length;
        int status;

        length = strlen(line);
        counter = 0;

        if (line[counter] == '/')                  
            counter++;
        if (line[counter] == 'n')
        {
            if ((status = (read_line_number(line, &counter, block))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        for ( ; counter < length; )
        {
            if ((status = (read_one_item (line, &counter, block, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        return 0;
    }

    

   




























 

    static int read_j(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_j";
        double value;
        int status;

        if ((line[*counter] != 'j')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->j_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 109; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->j_flag = 1;
        block->j_number = value;
        return 0;
    }

    

   




























 

    static int read_k(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_k";
        double value;
        int status;

        if ((line[*counter] != 'k')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->k_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 110; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->k_flag = 1;
        block->k_number = value;
        return 0;
    }

    

   


























 

    static int read_l(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_l";
        int value;
        int status;

        if ((line[*counter] != 'l')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->l_number > -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 111; } else;
        if ((status = (read_integer_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 126; } else;
        block->l_number = value;
        return 0;
    }

    

   
























 

    static int read_line_number(                   
    char * line,                                   
    int * counter,                                 
    block_pointer block)                           
    {
        static char name[] = "read_line_number";
        int value;
        int status;

        if ((line[*counter] != 'n')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_integer_unsigned(line, counter, &value))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value > 99999)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 98; } else;
        block->line_number = value;
        return 0;
    }

    

   





























 

    static int read_m(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_m";
        int value;
        int mode;
        int status;

        if ((line[*counter] != 'm')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_integer_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 127; } else;
        if ((value > 99)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 100; } else;
        mode = _ems[value];
        if ((mode == -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 174; } else;
        if ((block->m_modes[mode] != -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 169; } else;

        block->m_modes[mode] = value;
        block->m_count++;
        return 0;
    }

    

   








































 

    static int read_one_item(                      
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_one_item";
        int status;
        read_function_pointer function_pointer;
        char letter;

        letter = line[*counter];              
        if (((letter < 0) || (letter > 'z'))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 12; } else;
        function_pointer = _readers[letter];
        if ((function_pointer == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 12; } else;
        if ((status = (function_pointer(line, counter, block, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        return 0;
    }

    

   
























 

    static int read_operation(                     
    char * line,                                   
    int * counter,                                 
    int * operation)                               
    {
        static char name[] = "read_operation";
        char c;

        c = line[*counter];
        *counter = (*counter + 1);
        switch(c)
        {
            case '+':
                *operation = 9;
                break;
            case '-':
                *operation = 7;
                break;
            case '/':
                *operation = 1;
                break;
            case '*':
                if(line[*counter] == '*')
                {
                    *operation = 3;
                    *counter = (*counter + 1);
                }
                else
                    *operation = 4;
                break;
            case ']':
                *operation = 10;
                break;
            case 'a':
                if((line[*counter] == 'n') && (line[(*counter)+1] == 'd'))
                {
                    *operation = 5;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 176; } else;
                break;
            case 'm':
                if((line[*counter] == 'o') && (line[(*counter)+1] == 'd'))
                {
                    *operation = 2;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 177; } else;
                break;
            case 'o':
                if(line[*counter] == 'r')
                {
                    *operation = 8;
                    *counter = (*counter + 1);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 178; } else;
                break;
            case 'x':
                if((line[*counter] == 'o') && (line[(*counter)+1] == 'r'))
                {
                    *operation = 6;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 179; } else;
                break;
            case 0:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 172; } else;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 175; } else;
        }
        return 0;
    }

    

   




























 

    static int read_operation_unary(               
    char * line,                                   
    int * counter,                                 
    int * operation)                               
    {
        static char name[] = "read_operation_unary";
        char c;

        c = line[*counter];
        *counter = (*counter + 1);
        switch (c)
        {
            case 'a':
                if((line[*counter] == 'b') && (line[(*counter)+1] == 's'))
                {
                    *operation = 1;
                    *counter = (*counter + 2);
                }
                else if(strncmp((line + *counter), "cos", 3) == 0)
                {
                    *operation = 2;
                    *counter = (*counter + 3);
                }
                else if(strncmp((line + *counter), "sin", 3) == 0)
                {
                    *operation = 3;
                    *counter = (*counter + 3);
                }
                else if(strncmp((line + *counter), "tan", 3) == 0)
                {
                    *operation = 4;
                    *counter = (*counter + 3);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 180; } else;
                break;
            case 'c':
                if((line[*counter] == 'o') && (line[(*counter)+1] == 's'))
                {
                    *operation = 5;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 181; } else;
                break;
            case 'e':
                if((line[*counter] == 'x') && (line[(*counter)+1] == 'p'))
                {
                    *operation = 6;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 182; } else;
                break;
            case 'f':
                if((line[*counter] == 'i') && (line[(*counter)+1] == 'x'))
                {
                    *operation = 7;
                    *counter = (*counter + 2);
                }
                else if((line[*counter] == 'u') && (line[(*counter)+1] == 'p'))
                {
                    *operation = 8;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 183; } else;
                break;
            case 'l':
                if(line[*counter] == 'n')
                {
                    *operation = 9;
                    *counter = (*counter + 1);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 184; } else;
                break;
            case 'r':
                if(strncmp((line + *counter), "ound", 4) == 0)
                {
                    *operation = 10;
                    *counter = (*counter + 4);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 185; } else;
                break;
            case 's':
                if((line[*counter] == 'i') && (line[(*counter)+1] == 'n'))
                {
                    *operation = 11;
                    *counter = (*counter + 2);
                }
                else if(strncmp((line + *counter), "qrt", 3) == 0)
                {
                    *operation = 12;
                    *counter = (*counter + 3);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 186; } else;
                break;
            case 't':
                if((line[*counter] == 'a') && (line[(*counter)+1] == 'n'))
                {
                    *operation = 13;
                    *counter = (*counter + 2);
                }
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 187; } else;
                break;
            default:
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 188; } else;
        }
        return 0;
    }

    

   



























 

    static int read_p(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_p";
        double value;
        int status;

        if ((line[*counter] != 'p')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->p_number > -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 112; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 129; } else;
        block->p_number = value;
        return 0;
    }

    

   
































 

    static int read_parameter(                     
    char * line,                                   
    int * counter,                                 
    double * double_ptr,                           
    double * parameters)                           
    {
        static char name[] = "read_parameter";
        int index;
        int status;

        if ((line[*counter] != '#')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_integer_value(line, counter, &index, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if (((index < 1) || (index >= 5400))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 142; } else;

        *double_ptr = parameters[index];
        return 0;
    }

    

   






























































 

    static int read_parameter_setting(             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_parameter_setting";
        int index;
        double value;
        int status;

        if ((line[*counter] != '#')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_integer_value(line, counter, &index, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if (((index < 1) || (index >= 5400))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 142; } else;

        if ((line[*counter] != '=')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 77; } else;
        *counter = (*counter + 1);
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        _setup.parameter_numbers[_setup.parameter_occurrence] = index;
        _setup.parameter_values[_setup.parameter_occurrence] = value;
        _setup.parameter_occurrence++;
        return 0;
    }

    

   


























 

    static int read_q(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_q";
        double value;
        int status;

        if ((line[*counter] != 'q')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->q_number > -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 113; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value <= 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 128; } else;
        block->q_number = value;
        return 0;
    }

    

   






























 

    static int read_r(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_r";
        double value;
        int status;

        if ((line[*counter] != 'r')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->r_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 114; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->r_flag = 1;
        block->r_number = value;
        return 0;
    }

    

   































































































































































































 

#line 10437 "rs274ngc_pre.c"

    

   















 



    static int read_real_expression(               
    char * line,                                   
    int * counter,                                 
    double * value,                                
    double * parameters)                           
    {
        static char name[] = "read_real_expression";
        double values[5];
        int operators[5];
        int stack_index;
        int status;

        if ((line[*counter] != '[')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((status = (read_real_value(line, counter, values, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((status = (read_operation(line, counter, operators))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        stack_index = 1;
        for(; operators[0] != 10 ;)
        {
            if ((status = (read_real_value(line, counter, values+stack_index, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            if ((status = (read_operation(line, counter, operators+stack_index))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            if (precedence(operators[stack_index]) >
                precedence(operators[stack_index - 1]))
                stack_index++;
            else                                   
            {
                for (;precedence(operators[stack_index]) <=
                    precedence(operators[stack_index - 1]); )
                {
                    if ((status = (execute_binary((values + stack_index - 1), operators[stack_index -1], (values + stack_index)))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;


                    operators[stack_index - 1] = operators[stack_index];
                    if ((stack_index > 1) &&
                        (precedence(operators[stack_index - 1]) <=
                        precedence(operators[stack_index - 2])))
                        stack_index--;
                    else
                        break;
                }
            }
        }
        *value = values[0];
        return 0;
    }

    

   
































 

    static int read_real_number(                   
    char * line,                                   
    int * counter,                                 
    double * double_ptr)                           
    {
        static char name[] = "read_real_number";
        char c;                                    
        int flag_digit;                            
        int flag_point;                            
        int n;                                     

        n = *counter;
        flag_point = 0;
        flag_digit = 0;

    
        c = line[n];
        if (c == '+')
        {
            *counter = (*counter + 1);        
            n++;
        }
        else if (c == '-')
        {
            n++;
        }
        else if ((c != '.') && ((c < 48) || (c > 57)))
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 14; } else;

    
        for (; (c = line[n]) != (char) 0; n++)
        {
            if (( 47 < c) && ( c < 58))
            {
                flag_digit = 1;
            }
            else if (c == '.')
            {
                if (flag_point == 0)
                {
                    flag_point = 1;
                }
                else
                    break;                         
            }
            else
                break;
        }

        if ((flag_digit == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 134; } else;
        line[n] = (char) 0;                
        if (sscanf(line + *counter, "%lf", double_ptr) == 0)
        {
            line[n] = c;
            if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 161; } else;
        }
        else
        {
            line[n] = c;
            *counter = n;
        }
        return 0;
    }

    

   










































 

    static int read_real_value(                    
    char * line,                                   
    int * counter,                                 
    double * double_ptr,                           
    double * parameters)                           
    {
        static char name[] = "read_real_value";
        char c;
        int status;

        c = line[*counter];
        if ((c == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 133; } else;
        if (c == '[')
            if ((status = (read_real_expression (line, counter, double_ptr, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        else if (c == '#')
            if ((status = (read_parameter(line, counter, double_ptr, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        else if ((c >= 'a') && (c <= 'z'))
            if ((status = (read_unary(line, counter, double_ptr, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        else
            if ((status = (read_real_number(line, counter, double_ptr))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;

        return 0;
    }

    

   



























 

#line 10735 "rs274ngc_pre.c"

    

   


























 

#line 10796 "rs274ngc_pre.c"

    

   


























 

    static int read_s(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_s";
        double value;
        int status;

        if ((line[*counter] != 's')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->s_number > -1.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 115; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0.0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 130; } else;
        block->s_number = value;
        return 0;
    }

    

   


























 

    static int read_t(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_t";
        int value;
        int status;

        if ((line[*counter] != 't')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->t_number > -1)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 116; } else;
        if ((status = (read_integer_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((value < 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 131; } else;
        block->t_number = value;
        return 0;
    }

    

   




























































 

    static int read_text(                          
    const char * command,                          
    FILE * inport,                                 
    char * raw_line,                               
    char * line,                                   
    int * length)                                  
    {
        static char name[] = "read_text";
        int status;                                
        int index;

        if (command == 0)
        {
            if(fgets(raw_line, 256, inport) == 0)
            {
                if (_setup.percent_flag == 1)
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 80; } else;
                else
                    if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 81; } else;
            }
            if (strlen(raw_line) == (256 - 1))
            {                                     
                for(;fgetc(inport) != '\n';)    
                {
                }
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 66; } else;
            }
   
            for(index = (strlen(raw_line) -1);
                (index >= 0) && (((* __rt_ctype_table())[raw_line[index]] & 1));
                index--)
            {                                     
                raw_line[index] = 0;
            }
            strcpy(line, raw_line);
            if ((status = (close_and_downcase(line))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            if ((line[0] == '%') && (line[1] == 0) && (_setup.percent_flag == 1))
                return 3;
        }
        else
        {
            if ((strlen(command) >= 256)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 66; } else;
            strcpy(raw_line, command);
            strcpy(line, command);
            if ((status = (close_and_downcase(line))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        }
        _setup.sequence_number++;
        _setup.parameter_occurrence = 0;      
        if ((line[0] == 0) || ((line[0] == '/') && (line[1] == 0)))
            *length = 0;
        else
            *length = strlen(line);

        return ((line[0] == '/')? 2 : 0);
    }

    

   
























 

    static int read_unary(                         
    char * line,                                   
    int * counter,                                 
    double * double_ptr,                           
    double * parameters)                           
    {
        static char name[] = "read_unary";
        int operation;
        int status;

        if ((status = (read_operation_unary (line, counter, &operation))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        if ((line[*counter] != '[')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 97; } else;

        if ((status = (read_real_expression (line, counter, double_ptr, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;

        if (operation == 4)
            if ((status = (read_atan(line, counter, double_ptr, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        else
            if ((status = (execute_unary(double_ptr, operation))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        return 0;
    }

    

   




























 

    static int read_x(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_x";
        double value;
        int status;

        if ((line[*counter] != 'x')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->x_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 117; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->x_flag = 1;
        block->x_number = value;
        return 0;
    }

    

   




























 

    static int read_y(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_y";
        double value;
        int status;

        if ((line[*counter] != 'y')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->y_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 118; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->y_flag = 1;
        block->y_number = value;
        return 0;
    }

    

   




























 

    static int read_z(                             
    char * line,                                   
    int * counter,                                 
    block_pointer block,                           
    double * parameters)                           
    {
        static char name[] = "read_z";
        double value;
        int status;

        if ((line[*counter] != 'z')) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 32; } else;
        *counter = (*counter + 1);
        if ((block->z_flag != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 119; } else;
        if ((status = (read_real_value(line, counter, &value, parameters))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        block->z_flag = 1;
        block->z_number = value;
        return 0;
    }

    

   









 

    static int set_probe_data(                     
    setup_pointer settings)                        
    {
        static char name[] = "set_probe_data";

        settings->current_x = GET_EXTERNAL_POSITION_X();
        settings->current_y = GET_EXTERNAL_POSITION_Y();
        settings->current_z = GET_EXTERNAL_POSITION_Z();
#line 11259 "rs274ngc_pre.c"
        settings->parameters[5061] = GET_EXTERNAL_PROBE_POSITION_X();
        settings->parameters[5062] = GET_EXTERNAL_PROBE_POSITION_Y();
        settings->parameters[5063] = GET_EXTERNAL_PROBE_POSITION_Z();
#line 11274 "rs274ngc_pre.c"
        settings->parameters[5067] = GET_EXTERNAL_PROBE_VALUE();
        return 0;
    }

    
   








































 

    static int write_g_codes(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        int * gez;

        gez = settings->active_g_codes;
        gez[0] = settings->sequence_number;
        gez[1] = settings->motion_mode;
        gez[2] = ((block == 0) ? -1 : block->g_modes[0]);
        gez[3] =
            (settings->plane == 1) ? 170 :
        (settings->plane == 3) ? 180 : 190;
        gez[4] =
            (settings->cutter_comp_side == 1) ? 420 :
        (settings->cutter_comp_side == 2) ? 410 : 400;
        gez[5] =
            (settings->length_units == 1) ? 200 : 210;
        gez[6] =
            (settings->distance_mode == MODE_ABSOLUTE) ? 900 : 910;
        gez[7] =
            (settings->feed_mode == 1) ? 930 : 940;
        gez[8] =
            (settings->origin_index < 7) ? (530 + (10 * settings->origin_index)) :
        (584 + settings->origin_index);
        gez[9] =
            (settings->tool_length_offset == 0.0) ? 490 : 430;
        gez[10] =
            (settings->retract_mode == OLD_Z) ? 980 : 990;
        gez[11] =
            (settings->control_mode == 3) ? 640 :
        (settings->control_mode == 2) ? 610 : 611;

        return 0;
    }

    

   













 

    static int write_m_codes(                      
    block_pointer block,                           
    setup_pointer settings)                        
    {
        int * emz;

        emz = settings->active_m_codes;
        emz[0] = settings->sequence_number;   
        emz[1] =
            (block == 0) ? -1 : block->m_modes[4]; 
        emz[2] =
    
            (settings->spindle_turning == 1) ? 5 :
        (settings->spindle_turning == 2) ? 3 : 4;
        emz[3] =                              
            (block == 0) ? -1 : block->m_modes[6];
        emz[4] =                              
            (settings->mist == 1) ? 7 :
        (settings->flood == 1) ? -1 : 9;
        emz[5] =                              
            (settings->flood == 1) ? 8 : -1;
        emz[6] =                              
            (settings->feed_override == 1) ? 48 : 49;

        return 0;
    }

    

   











 

    static int write_settings(                     
    setup_pointer settings)                        
    {
        double * vals;

        vals = settings->active_settings;
        vals[0] = settings->sequence_number;  
        vals[1] = settings->feed_rate;        
        vals[2] = settings->speed;            

        return 0;
    }

    
    

   





 

    

   









 

    int rs274ngc_close()
    {
        if (_setup.file_pointer != 0)
        {
            fclose(_setup.file_pointer);
            _setup.file_pointer = 0;
        }
        rs274ngc_reset();

        return 0;
    }

    

   

















 

    int rs274ngc_execute()                         
    {
        static char name[] = "rs274ngc_execute";
        int status;
        int n;

        for (n = 0; n < _setup.parameter_occurrence; n++)
        {                                         
            _setup.parameters[_setup.parameter_numbers[n]]
                = _setup.parameter_values[n];
        }
        if (_setup.line_length != 0)             
        {
            status = execute_block (&(_setup.block1), &_setup);
            write_g_codes(&(_setup.block1), &_setup);
            write_m_codes(&(_setup.block1), &_setup);
            write_settings(&_setup);
            if ((status != 0) &&
                (status != 2) &&
                (status != 1))
                if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else return status;
        }
        else                                       
            status = 0;
        return status;
    }

    

   












 

    int rs274ngc_exit()                            
    {
        char file_name[256];

        GET_EXTERNAL_PARAMETER_FILE_NAME(file_name, (256 - 1));
        rs274ngc_save_parameters
            (((file_name[0] == 0) ? "rs274ngc.var" : file_name),
            _setup.parameters);
        rs274ngc_reset();

        return 0;
    }

    

   






















 

    int rs274ngc_init()                            
    {
        static char name[] = "rs274ngc_init";
        int k;                                    
        int status;
        char filename[256];
        double * pars;                            

        INIT_CANON();
        _setup.length_units = GET_EXTERNAL_LENGTH_UNIT_TYPE();
        USE_LENGTH_UNITS(_setup.length_units);
        GET_EXTERNAL_PARAMETER_FILE_NAME(filename, 256);
        if (filename[0] == 0)
            strcpy(filename, "rs274ngc.var");
        if ((status = (rs274ngc_restore_parameters(filename))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
        pars = _setup.parameters;
        _setup.origin_index = (int)(pars[5220] + 0.0001);
        if (((_setup . origin_index < 1) || (_setup . origin_index > 9))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 68; } else;

        k = (5200 + (_setup.origin_index * 20));
        SET_ORIGIN_OFFSETS((pars[k + 1] + pars[5211]),
            (pars[k + 2] + pars[5212]),
            (pars[k + 3] + pars[5213])
#line 11619 "rs274ngc_pre.c"
            );
        SET_FEED_REFERENCE(2);



   




   
   
   
        _setup.axis_offset_x = pars[5211];
        _setup.axis_offset_y = pars[5212];
        _setup.axis_offset_z = pars[5213];



   




   
        _setup.blocktext[0] = 0;



   




   
   
   
   
        _setup.cutter_comp_side = 0;
   
        _setup.distance_mode = MODE_ABSOLUTE;
        _setup.feed_mode = 0;
        _setup.feed_override = 1;
   
        _setup.filename[0] = 0;
        _setup.file_pointer = 0;
   
        _setup.length_offset_index = 1;
   
        _setup.line_length = 0;
        _setup.linetext[0] = 0;
   
        _setup.motion_mode = 800;
   
        _setup.origin_offset_x = pars[k + 1];
        _setup.origin_offset_y = pars[k + 2];
        _setup.origin_offset_z = pars[k + 3];
   
   
   
   
   
   
        _setup.probe_flag = 0;
        _setup.program_x = 1e-20;           
        _setup.program_y = 1e-20;           
   
   
        _setup.sequence_number = 0;           
   
        _setup.speed_feed_mode = 2;
        _setup.speed_override = 1;
   
   
   
        _setup.tool_length_offset = 0.0;
   
   
        _setup.tool_table_index = 1;
   

        write_g_codes((block_pointer)0, &_setup);
        write_m_codes((block_pointer)0, &_setup);
        write_settings(&_setup);

   
        rs274ngc_synch();

        return 0;
    }

    

   



















 

    int rs274ngc_load_tool_table()                 
    {














		_setup.tool_table[0].id = 0;
		_setup.tool_table[0].length = 0;
		_setup.tool_table[0].diameter = 0;
        return 0;
    }

    

   









































 

    int rs274ngc_open(                             
    const char * filename)                         
    {
        static char name[] = "rs274ngc_open";
        char * line;
        int index;
        int length;

        if ((_setup . file_pointer != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 4; } else;
        if ((strlen(filename) > (256 - 1))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 82; } else;
        _setup.file_pointer = fopen(filename, "r");
        if ((_setup . file_pointer == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 170; } else;
        line = _setup.linetext;
        for(index = -1; index == -1;)         
        {
            if ((fgets(line, 256, _setup . file_pointer) == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 80; } else;

            length = strlen(line);
            if (length == (256 - 1))
            {                                     
   
                for(;fgetc(_setup.file_pointer) != '\n';);
                if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 66; } else;
            }
            for(index = (length -1);         
                (index >= 0) && (((* __rt_ctype_table())[line[index]] & 1));
                index--);
        }
        if(line[index] == '%')
        {
            for(index--; (index >= 0) && (((* __rt_ctype_table())[line[index]] & 1)); index--);
            if (index == -1)
                _setup.percent_flag = 1;
            else
            {
                fseek(_setup.file_pointer, 0, 0);
                _setup.percent_flag = 0;
            }
        }
        else
        {
            fseek(_setup.file_pointer, 0, 0);
            _setup.percent_flag = 0;
        }
        strcpy(_setup.filename, filename);
        _setup.sequence_number = 0;
        rs274ngc_reset();
        return 0;
    }

    

   


























 

    int rs274ngc_read(                             
    const char * command)                          
    {
        static char name[] = "rs274ngc_read";
        int status;
        int read_status;

        if (_setup.probe_flag == 1)
        {
            if ((GET_EXTERNAL_QUEUE_EMPTY() == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 145; } else;

            set_probe_data(&_setup);
            _setup.probe_flag = 0;
        }
        if (((command == 0) && (_setup . file_pointer == 0))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 83; } else;

        read_status = read_text(command, _setup.file_pointer, _setup.linetext,
            _setup.blocktext, &_setup.line_length);
        if ((read_status == 2) ||
            (read_status == 0))
        {
            if (_setup.line_length != 0)
            {
                if ((status = (parse_line(_setup . blocktext, &(_setup . block1), &_setup))) != 0) { if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return status; } else {return status;} } else;
            }
        }
        else if (read_status == 3);
        else
            if (_setup . stack_index < 49) { strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return read_status; } else return read_status;
        return read_status;
    }

    

   


























 

    int rs274ngc_reset()
    {
        _setup.linetext[0] = 0;
        _setup.blocktext[0] = 0;
        _setup.line_length = 0;

        return 0;
    }

    

   

































 
    int rs274ngc_restore_parameters(               
    const char * filename)                         
    {







        double * pars;                            
        int k;





        pars = _setup.parameters;







































        for (; k < 5400; k++)
        {
            pars[k] = 0;
        }
		pars[5220]=1.0;
        return 0;
    }

    

   






























 
    int rs274ngc_save_parameters(                  
    const char * filename,                         
    const double parameters[])                     
    {
        static char name[] = "rs274ngc_save_parameters";
        FILE * infile;
        FILE * outfile;
        char line[256];
        int variable;
        double value;
        int required;                             
        int index;                                
        int k;

   
        strcpy(line, filename);
        strcat(line, ".bak");
        if ((rename(filename, line) != 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 40; } else;

   
        infile = fopen(line, "r");
        if ((infile == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 45; } else;

   
        outfile = fopen(filename, "w");
        if ((outfile == 0)) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 46; } else;

        k = 0;
        index = 0;
        required = _required_parameters[index++];
        while (feof(infile) == 0)
        {
            if (fgets(line, 256, infile) == 0)
            {
                break;
            }
   
            if (sscanf(line, "%d %f", &variable, &value) == 2)
            {
                if (((variable <= 0) || (variable >= 5400))) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 142; } else;

                for (; k < 5400; k++)
                {
                    if (k > variable)
                        if (1) { _setup . stack_index = 0; strcpy(_setup . stack[_setup . stack_index++], name); _setup . stack[_setup . stack_index][0] = 0; return 141; } else;
                    else if (k == variable)
                    {
                        sprintf(line, "%d\t%f\r\n", k, parameters[k]);
                        fputs(line, outfile);
                        if (k == required)
                            required = _required_parameters[index++];
                        k++;
                        break;
                    }
                    else if (k == required)       
                    {
                        sprintf(line, "%d\t%f\r\n", k, parameters[k]);
                        fputs(line, outfile);
                        required = _required_parameters[index++];
                    }
                }
            }
        }
        fclose(infile);
        for (; k < 5400; k++)
        {
            if (k == required)
            {
                sprintf(line, "%d\t%f\r\n", k, parameters[k]);
                fputs(line, outfile);
                required = _required_parameters[index++];
            }
        }
        fclose(outfile);

        return 0;
    }

    

   














 

    int rs274ngc_synch()                           
    {
        _setup.control_mode = GET_EXTERNAL_MOTION_CONTROL_MODE();
#line 12203 "rs274ngc_pre.c"
        _setup.current_slot = GET_EXTERNAL_TOOL_SLOT();
        _setup.current_x = GET_EXTERNAL_POSITION_X();
        _setup.current_y = GET_EXTERNAL_POSITION_Y();
        _setup.current_z = GET_EXTERNAL_POSITION_Z();
        _setup.feed_rate = GET_EXTERNAL_FEED_RATE();
        _setup.flood = (GET_EXTERNAL_FLOOD() != 0) ? 1 : 0;
        _setup.length_units = GET_EXTERNAL_LENGTH_UNIT_TYPE();
        _setup.mist = (GET_EXTERNAL_MIST() != 0) ? 1 : 0;
        _setup.plane = GET_EXTERNAL_PLANE();
        _setup.selected_tool_slot = GET_EXTERNAL_TOOL_SLOT();
        _setup.speed = GET_EXTERNAL_SPEED();
        _setup.spindle_turning = GET_EXTERNAL_SPINDLE();
        _setup.tool_max = GET_EXTERNAL_TOOL_MAX();
        _setup.traverse_rate = GET_EXTERNAL_TRAVERSE_RATE();

 

        return 0;
    }

    
    

   




 

    

   









 

    void rs274ngc_active_g_codes(                  
    int * codes)                                   
    {
        int n;

        for (n = 0; n < 12; n++)
        {
            codes[n] = _setup.active_g_codes[n];
        }
    }

    

   









 

    void rs274ngc_active_m_codes(                  
    int * codes)                                   
    {
        int n;

        for (n = 0; n < 7; n++)
        {
            codes[n] = _setup.active_m_codes[n];
        }
    }

    

   









 

    void rs274ngc_active_settings(                 
    double * settings)                             
    {
        int n;

        for (n = 0; n < 3; n++)
        {
            settings[n] = _setup.active_settings[n];
        }
    }

    

   














 
    void rs274ngc_error_text(                      
    int error_code,                                
    char * error_text,                             
    unsigned int max_size)                                  
    {
        if (((error_code >= 3) &&
            (error_code <= 197)) &&
            (strlen(_rs274ngc_errors[error_code]) < max_size))
        {
            strcpy(error_text, _rs274ngc_errors[error_code]);
        }
        else
            error_text[0] = 0;
    }

    

   











 

    void rs274ngc_file_name(                       
    char * file_name,                              
    unsigned int max_size)                                  
    {
        if (strlen(_setup.filename) < max_size)
            strcpy(file_name, _setup.filename);
        else
            file_name[0] = 0;
    }

    

   







 

    int rs274ngc_line_length()
    {
        return _setup.line_length;
    }

    

   











 

    void rs274ngc_line_text(                       
    char * line_text,                              
    int max_size)                                  
    {
        int n;
        char * the_text;

        the_text = _setup.linetext;
        for (n = 0; n < (max_size - 1); n++)
        {
            if (the_text[n] != 0)
                line_text[n] = the_text[n];
            else
                break;
        }
        line_text[n] = 0;
    }

    

   









 

    int rs274ngc_sequence_number()
    {
        return _setup.sequence_number;
    }

    

   



















 

    void rs274ngc_stack_name(                      
    int stack_index,                               
    char * function_name,                          
    int max_size)                                  
    {
        int n;
        char * the_name;

        if ((stack_index > -1) && (stack_index < 20))
        {
            the_name = _setup.stack[stack_index];
            for (n = 0; n < (max_size - 1); n++)
            {
                if (the_name[n] != 0)
                    function_name[n] = the_name[n];
                else
                    break;
            }
            function_name[n] = 0;
        }
        else
            function_name[0] = 0;
    }

    
    
    
