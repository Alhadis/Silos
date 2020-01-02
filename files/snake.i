# 1 "snake.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "snake.c" 2
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 1 3



# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3






# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\features.h" 1 3
# 10 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 18 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long int wchar_t;
# 122 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 168 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __int24 int24_t;
# 204 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 21 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\stdlib.h" 2 3


int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));

__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);

typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);





size_t __ctype_get_mb_cur_max(void);
# 1 "snake.c" 2

# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\time.h" 1 3
# 33 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\time.h" 3
# 1 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 76 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long time_t;
# 293 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef void * timer_t;




typedef int clockid_t;




typedef long clock_t;
# 313 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
struct timespec { time_t tv_sec; long tv_nsec; };





typedef int pid_t;
# 411 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 33 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\time.h" 2 3







struct tm {
 int tm_sec;
 int tm_min;
 int tm_hour;
 int tm_mday;
 int tm_mon;
 int tm_year;
 int tm_wday;
 int tm_yday;
 int tm_isdst;
 long __tm_gmtoff;
 const char *__tm_zone;
};

clock_t clock (void);
time_t time (time_t *);
double difftime (time_t, time_t);
time_t mktime (struct tm *);
size_t strftime (char *restrict, size_t, const char *restrict, const struct tm *restrict);
struct tm *gmtime (const time_t *);
struct tm *localtime (const time_t *);
char *asctime (const struct tm *);
char *ctime (const time_t *);
int timespec_get(struct timespec *, int);
# 73 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\time.h" 3
size_t strftime_l (char * restrict, size_t, const char * restrict, const struct tm * restrict, locale_t);

struct tm *gmtime_r (const time_t *restrict, struct tm *restrict);
struct tm *localtime_r (const time_t *restrict, struct tm *restrict);
char *asctime_r (const struct tm *restrict, char *restrict);
char *ctime_r (const time_t *, char *);

void tzset (void);

struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 102 "C:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\c99\\time.h" 3
int nanosleep (const struct timespec *, struct timespec *);
int clock_getres (clockid_t, struct timespec *);
int clock_gettime (clockid_t, struct timespec *);
int clock_settime (clockid_t, const struct timespec *);
int clock_nanosleep (clockid_t, int, const struct timespec *, struct timespec *);
int clock_getcpuclockid (pid_t, clockid_t *);

struct sigevent;
int timer_create (clockid_t, struct sigevent *restrict, timer_t *restrict);
int timer_delete (timer_t);
int timer_settime (timer_t, int, const struct itimerspec *restrict, struct itimerspec *restrict);
int timer_gettime (timer_t, struct itimerspec *);
int timer_getoverrun (timer_t);

extern char *tzname[2];





char *strptime (const char *restrict, const char *restrict, struct tm *restrict);
extern int daylight;
extern long timezone;
extern int getdate_err;
struct tm *getdate (const char *);
# 2 "snake.c" 2

# 1 "./snake.h" 1
# 15 "./snake.h"
unsigned char map[16][16];
void printError();
void updateCar();
void updateMap();
void initMap();
void move(int direct);
void updatePlayer();
unsigned char *endSnake;
unsigned char error;
# 3 "snake.c" 2

unsigned char map[16][16]={
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},

 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},

 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},

 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
 {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,},
};

unsigned char player[2]={4,15};
int car[6][2];
unsigned char error=0;

void printError(){
 int i,j=0;

 for(j=0;j<16;++j){
  for(i=0;i<16;++i){
   if(i==j||i==15-j)
    map[j][i]=1;
   else
    map[j][i]=0;
  }
 }
}


void updateCar(){
 int i,j;
 for(j=0;j<6;++j){
  int num=(j%2==0)?1:-1;
  car[j][0]+=num;
  car[j][1]+=num;
  if(j%2==0){
   if(car[j][1]>15){
    car[j][0]=0;
    car[j][1]=-2;
   }
  }
  else{
   if(car[j][1]<0){
    car[j][0]=15;
    car[j][1]=17;
   }
  }
 }
}

void updateMap(){
 int i,j;
    if(error!=1)
        updateCar();
 if(error==1){
  printError();
  return;
 }
 for(j=0;j<16;++j){
  for(i=0;i<16;++i){
   map[j][i]=0;
  }
 }
 for(j=0;j<6;++j){
  for(i=0;i<3;++i){
   if(j%2==0){
    if(car[j][0]-i<=15){
     map[2+2*j][car[j][0]-i]=1;
     if(player[1]==2+2*j && player[0]==car[j][0]-i)
      error=1;
    }
   }
   else{
    if(car[j][0]+i>=0){
     map[2+2*j][car[j][0]+i]=1;
     if(player[1]==2+2*j && player[0]==car[j][0]+i)
      error=1;
    }
   }
  }

 }
 map[player[1]][player[0]]=1;
}

void updatePlayer(){
    map[player[1]][player[0]]=1;
}

void initMap(){
 int i,j;
    error=0;
    player[1]=15;
    player[0]=4;
 srand(time(((void*)0)));
    for(j=0;j<16;++j)
        for(i=0;i<16;++i)
            map[j][i]=0;
 map[player[1]][player[0]]=1;
 for(j=0;j<6;++j){
  int num=(j%2==0)?1:-1;
  car[j][0]=rand()%12+2;
  car[j][1]=car[j][0]+num*2;
  for(i=0;i<3;++i){
   map[2+j*2][car[j][0]+num*i]=1;

  }
 }
}

void move(int direct){
    map[player[1]][player[0]]=0;
 switch(direct){
  case 0:
   player[1]-=1;
   break;
  case 1:
   player[1]+=1;
   break;
  case 2:
   player[0]-=1;
   break;
  default:
   player[0]+=1;
   break;
 }
    map[player[1]][player[0]]=1;
    int i,j;
    for(j=0;j<6;++j){
        for(i=0;i<3;++i){
            if(j%2==0){
    if(car[j][0]-i<=15){
     map[2+2*j][car[j][0]-i]=1;
     if(player[1]==2+2*j && player[0]==car[j][0]-i)
      error=1;
    }
   }
   else{
    if(car[j][0]+i>=0){
     map[2+2*j][car[j][0]+i]=1;
     if(player[1]==2+2*j && player[0]==car[j][0]+i)
      error=1;
    }
   }
        }
    }

}
