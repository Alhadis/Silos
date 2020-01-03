# 1 "lab8app.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "lab8app.c"






# 1 "clib.h" 1



void print(char *string, int length);
void printNewLine(void);
void printChar(char c);
void printString(char *string);


void printInt(int val);
void printLong(long val);
void printUInt(unsigned val);
void printULong(unsigned long val);


void printByte(char val);
void printWord(int val);
void printDWord(long val);


void exit(unsigned char code);


void signalEOI(void);
# 8 "lab8app.c" 2
# 1 "yakk.h" 1
       
# 12 "yakk.h"
typedef struct event_obj
{
 unsigned int flags;
} YKEVENT;

typedef int YKSEM;
typedef struct taskblock* TCBptr;
typedef struct taskblock
{
 int *stack_pointer;
 int first_time_running;
 int priority;
 int delay_counter;
 TCBptr next_task;
 TCBptr prev_task;
 YKSEM *pendedSemaphore;
 struct message_queue *pendedMessageQueue;
 YKEVENT *pendedEvent;
 unsigned eventMask;
 int waitMode;
} TCB;

typedef struct message_queue
{
 void** queue_address;
 unsigned int tick;
 unsigned int length;
 unsigned int head;
 unsigned int tail;
 unsigned int empty;
} YKQ;




extern int GlobalFlag;
extern unsigned int YKTickNum;
extern unsigned YKCtxSwCount;
extern unsigned int YKIdleCount;
extern unsigned int YKISRDepth;


extern char in_main_stack;

extern int semaphores[15];


void YKInitialize();
void YKEnterMutex();
void YKExitMutex();
void YKIdleTask();
void YKNewTask(void (* task)(void), void *taskStack, unsigned char priority);
void YKRun();
void YKScheduler();

void YKDelayTask(int delay_count);
void YKEnterISR();
void YKExitISR();
void YKTickHandler();


YKSEM* YKSemCreate(int initialValue);
void YKSemPend(YKSEM *semaphore);
void YKSemPost(YKSEM *semaphore);


YKQ *YKQCreate(void **start, unsigned size);
void *YKQPend(YKQ *queue);
int YKQPost(YKQ *queue, void *msg);


YKEVENT *YKEventCreate(unsigned initialValue);
unsigned YKEventPend(YKEVENT *event, unsigned eventMask, int waitMode);
void YKEventSet(YKEVENT *event, unsigned eventMask);
void YKEventReset(YKEVENT *event, unsigned eventMask);





void YKDispatcher(void *new_task_sp);


void addToReadyList(TCBptr tcb);
void addToDelayedList(TCBptr tcb);
TCBptr removeFromReadyList(int priority);
TCBptr removeFromDelayedList(int priority);


void YKDumpReadyList();
void YKDumpDelayedList();
void printLists();
void YKBreakPoint();
void YKBreakPoint2();
void printTCB(TCBptr tcb);
# 9 "lab8app.c" 2
# 1 "lab8defs.h" 1
# 10 "lab8defs.h"
struct piece
{
    unsigned type;
    unsigned id;
    unsigned orientation;
    unsigned col;
};

struct move
{
    unsigned type;
    unsigned id;
    unsigned direction;
};
# 10 "lab8app.c" 2
# 1 "simptris.h" 1


void SlidePiece(int ID, int direction);
void RotatePiece(int ID, int direction);
void SeedSimptris(long seed);
void StartSimptris(void);
# 11 "lab8app.c" 2


long seed = 73706;
# 32 "lab8app.c"
unsigned board[6];
int colheights[6];
unsigned destination_location;
unsigned destination_orientation;


unsigned shifter = 0;

char right_side_flat = 1;
char left_side_flat = 1;

unsigned next = 0;




struct piece pieceArray[1024];
void *pieceQ[24];
YKQ *pieceQPtr;

struct move moveArray[1024];
void *moveQ[511];
YKQ *moveQPtr;

YKSEM *RCSemPtr;

int PlacementTaskStack[2048];
int CommunicateTaskStack[2048];
int STaskStack[2048];







void placeMove(int id_par, int type_par, int direction_par) {

 if(next >= 1024)
   next = 0;
 moveArray[next].type = type_par;
 moveArray[next].id = id_par;
 moveArray[next].direction = direction_par;
 YKQPost(moveQPtr, (void*)&moveArray[next++]);
}




void handleStraightPiece(struct piece* newPiece) {



 if (colheights[1] >= colheights[4] ) {
  if (right_side_flat) {
   destination_location = 4;
  } else {
   destination_location = 1;
  }
 } else {
  if (left_side_flat) {
   destination_location = 1;
  } else {
   destination_location = 4;
  }
 }


 while(newPiece->col != destination_location){
  if(newPiece->col > destination_location){
   placeMove(newPiece->id, 0, 0);
   newPiece->col--;
  }
  else if(newPiece->col < destination_location){
   placeMove(newPiece->id, 0, 1);
   newPiece->col++;
  }
 }

 if(newPiece->orientation == 1){
  placeMove(newPiece->id, 1, 0);
   }
}



void handleCornerPiece(struct piece* newPiece) {




 if(!right_side_flat){
  destination_location = 3;
  destination_orientation = 3;
 } else if (!left_side_flat){
  destination_location = 2;
  destination_orientation = 2;
 } else {
  if(colheights[1] >= colheights[4] ){

   destination_location = 5;
   destination_orientation = 1;
  } else {

   destination_location = 0;
   destination_orientation = 0;
  }
 }



 if(newPiece->col == 5){
  placeMove(newPiece->id, 0, 0);
  newPiece->col--;
 }
 else if(newPiece->col == 0){
  placeMove(newPiece->id, 0, 1);
  newPiece->col++;
 }


 while(newPiece->orientation != destination_orientation){
  if(newPiece->orientation < destination_orientation){
   if(newPiece->orientation == 0 && destination_orientation == 3){
    placeMove(newPiece->id, 1, 1);
    newPiece->orientation = 3;
   } else {
    placeMove(newPiece->id, 1, 0);
    newPiece->orientation++;
   }
  }
  else if(newPiece->orientation > destination_orientation){
   if(newPiece->orientation == 3 && destination_orientation == 0){
    placeMove(newPiece->id, 1, 0);
    newPiece->orientation = 0;
   } else {
    placeMove(newPiece->id, 1, 1);
    newPiece->orientation--;
   }
  }
 }


 while(newPiece->col != destination_location){
  if(newPiece->col > destination_location){
   placeMove(newPiece->id, 0, 0);
   newPiece->col--;
  }
  else if(newPiece->col < destination_location){
   placeMove(newPiece->id, 0, 1);
   newPiece->col++;
  }
 }

 YKEnterMutex();

 if(destination_location > 2){
  if (right_side_flat) {
   right_side_flat = 0;
  }
  else {
   right_side_flat = 1;
  }

 } else {
  if (left_side_flat) {
   left_side_flat = 0;
  } else {
   left_side_flat = 1;
  }
 }
 YKExitMutex();

}





void PlacementTask(void) {
 struct piece* newPiece;
 unsigned i_counter;
 unsigned j_counter;

 while(1){
  newPiece = (struct piece*) YKQPend(pieceQPtr);

  for(i_counter = 0; i_counter < 6; i_counter++) {
   colheights[i_counter] = 0;
   shifter = 0x01;
   for(j_counter = 0; j_counter < 16; j_counter++) {
    if (board[i_counter] & shifter) {
     colheights[i_counter] = 16 - j_counter;
     break;
    }
    shifter = shifter << 1;
   }
  }


  if(newPiece->type == 1){
   handleStraightPiece(newPiece);
  }
  else {
   handleCornerPiece(newPiece);
  }
 }
}


void CommunicateTask(void)
{
 struct move* move;
 while(1){

  move = (struct move*) YKQPend(moveQPtr);
  YKSemPend(RCSemPtr);


  if(move->type == 0){
   SlidePiece(move->id, move->direction);
  } else {
   RotatePiece(move->id, move->direction);
  }

 }

}



void STask(void)
{
    unsigned max, switchCount, idleCount;
    int tmp;

    YKDelayTask(1);
    printString("Welcome to the YAK kernel\r\n");
    printString("Determining CPU capacity\r\n");
    YKDelayTask(1);
    YKIdleCount = 0;
    YKDelayTask(5);
    max = YKIdleCount / 25;
    YKIdleCount = 0;

 SeedSimptris(seed);
    StartSimptris();

    YKNewTask(PlacementTask, (void *) &PlacementTaskStack[2048], 2);
    YKNewTask(CommunicateTask, (void *) &CommunicateTaskStack[2048], 1);



    while (1)
    {
        YKDelayTask(20);

        YKEnterMutex();
        switchCount = YKCtxSwCount;
        idleCount = YKIdleCount;
        YKExitMutex();

        printString("<<<<< Context switches: ");
        printInt((int)switchCount);
        printString(", CPU usage: ");
        tmp = (int) (idleCount/max);
        printInt(100-tmp);
        printString("% >>>>>\r\n");

        YKEnterMutex();
        YKCtxSwCount = 0;
        YKIdleCount = 0;
        YKExitMutex();
    }
}


void main(void)
{
    YKInitialize();

    YKNewTask(STask, (void *) &STaskStack[2048], 0);

 pieceQPtr = YKQCreate(pieceQ, 24);
 moveQPtr = YKQCreate(moveQ, 511);
 RCSemPtr = YKSemCreate(1);

    YKRun();
}
