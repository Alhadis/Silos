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
# 2 "lab8app.c" 2
# 1 "yakk.h" 1
# 1 "linkedList.h" 1
# 1 "yaku.h" 1
# 2 "linkedList.h" 2
# 1 "queue.h" 1


typedef struct
{
 void** qStart;
 void** qEnd;
 void** qArray;
 int qMaxSize;

} YKQ;

int qIsEmpty(YKQ* queue);
int qIsFull(YKQ* queue);
void** qNextInsertSpot(YKQ* queue);
void** qNextRemoveSpot(YKQ* queue);
void qInsert(YKQ* queue, void* elementPtr);
void* qRemove(YKQ* queue);
# 3 "linkedList.h" 2






struct context_type
{
 unsigned sp;
 unsigned int ip;

 unsigned int ax;
 unsigned int bx;
 unsigned int cx;
 unsigned int dx;
 unsigned int si;
 unsigned int di;
 unsigned int bp;
 unsigned int es;
 unsigned int ds;
 unsigned int cs;
 unsigned int flags;
};

typedef struct {
 int value;
} YKSEM;

typedef unsigned YKEVENT;


typedef struct taskblock *TCBptr;

typedef struct taskblock
{
 struct context_type context;
 void *stackptr;
 unsigned priority;
 int delay;
 TCBptr next;
 TCBptr prev;
 unsigned ID;
 YKSEM* pendingSem;
 YKQ* pendingQueue;
 YKEVENT* pendingEventGroup;
 unsigned pendingEventFlags;
 int eventWaitMode;
} TCB;


extern TCBptr YKRdyList;
extern TCBptr YKSuspList;

TCBptr createTCB(void *stackptr, int priority, struct context_type context);

void insertTCBIntoRdyList(TCBptr tcb);

void removeFirstTCBFromRdyList();





void moveTCBToRdyList(TCBptr tmp);



void printTCBs();
void printLists();
# 2 "yakk.h" 2
# 17 "yakk.h"
extern unsigned int YKCtxSwCount;
extern unsigned int YKIdleCount;
extern unsigned int YKTickNum;
extern unsigned int running_flag;
extern TCBptr lastRunningTask;
# 30 "yakk.h"
void YKIdleTask();
static int IdleStk[256];


void YKInitialize(void);

void YKEnterMutex(void);

void YKExitMutex(void);

void YKIdleTask(void);

void YKNewTask(void (* task)(void), void *taskStack, unsigned char priority);

void YKRun(void);

void YKDelayTask(unsigned count);

void YKEnterISR(void);

void YKExitISR(void);

void YKScheduler(void);

void YKDispatcher(void);

void YKFirstDispatcher(void);

void YKTickHandler(void);

YKSEM* YKSemCreate(int initialValue);

void YKSemPend(YKSEM *semaphore);

void YKSemPost(YKSEM *semaphore);

YKQ* YKQCreate(void **start, unsigned size);

void *YKQPend(YKQ *queue);

int YKQPost(YKQ *queue, void *msg);

YKEVENT *YKEventCreate(unsigned initialValue);

unsigned YKEventPend(YKEVENT* event, unsigned eventMask, int waitMode);

void YKEventSet(YKEVENT* event, unsigned eventMask);

void YKEventReset(YKEVENT* event, unsigned eventMask);
# 3 "lab8app.c" 2
# 1 "lab8defs.h" 1
# 38 "lab8defs.h"
struct newPiece
{
    int id;
    int orientation;
    int type;
    int column;
};

struct move
{
  int pieceID;
  int moveType;
  int direction;
};
# 4 "lab8app.c" 2
# 1 "simptris.h" 1


void SlidePiece(int ID, int direction);
void RotatePiece(int ID, int direction);
void SeedSimptris(long seed);
void StartSimptris(void);
# 5 "lab8app.c" 2





int PlacementTaskStk[512];
int CommunicationTaskStk[512];
int StatTaskStk[512];


static unsigned binLlower;
static unsigned binLflat;
static unsigned binRflat;




static int numSlides;
static int numRotations;
unsigned binLHighestRow = 0;
unsigned binRHighestRow = 0;


struct newPiece newPieceArray[5];
struct move moveArray[25];

void* newPieceQ[5];
YKQ* newPieceQPtr;
void* moveQ[25];
YKQ* moveQPtr;

YKSEM *CmdRcvdSemPtr;

static int nextMove = 0;

void sendMoveCmd()
{
  if (YKQPost(moveQPtr, (void*) &(moveArray[nextMove])) == 0)
    printString("\n*****new move made queue overflow!!*****\n");
  else if (++nextMove >= 25)
    nextMove = 0;
}


void rotatePieceClockwise(int pieceID)
{
  moveArray[nextMove].pieceID = pieceID;
  moveArray[nextMove].moveType = 1;
  moveArray[nextMove].direction = 1;
  sendMoveCmd();
}


void rotatePieceCounterClockwise(int pieceID)
{
  moveArray[nextMove].pieceID = pieceID;
  moveArray[nextMove].moveType = 1;
  moveArray[nextMove].direction = 0;
  sendMoveCmd();
}


void slidePieceLeft(int pieceID)
{
  moveArray[nextMove].pieceID = pieceID;
  moveArray[nextMove].moveType = 0;
  moveArray[nextMove].direction = 0;
  sendMoveCmd();
}


void slidePieceRight(int pieceID)
{
  moveArray[nextMove].pieceID = pieceID;
  moveArray[nextMove].moveType = 0;
  moveArray[nextMove].direction = 1;
  sendMoveCmd();
}

void rotatePieceToTR(struct newPiece* piecePtr)
{
  switch (piecePtr->orientation)
  {
    case 0:
      numRotations += 2;
      break;
    case 1:
      numRotations--;
      break;
    case 2:

      break;
    case 3:
      numRotations++;
      break;
  }
}

void rotatePieceToBL(struct newPiece* piecePtr)
{
  switch (piecePtr->orientation)
  {
    case 0:

      break;
    case 1:
      numRotations++;
      break;
    case 2:
      numRotations += 2;
      break;
    case 3:
      numRotations--;
      break;
    default:

      break;
  }
}

void placeCornerPieceInLeftBin(struct newPiece* piecePtr)
{
  if (binLflat)
  {

    rotatePieceToBL(piecePtr);
    numSlides -= (piecePtr->column);
    binLflat = 0;
  }
  else
  {
    rotatePieceToTR(piecePtr);
    numSlides -= (piecePtr->column - 2);
    binLflat = 1;
  }
}

void placeCornerPieceInRightBin(struct newPiece* piecePtr)
{
  if (binRflat)
  {


    rotatePieceToBL(piecePtr);

    numSlides -= (piecePtr->column - 3);

    binRflat = 0;
  }
  else
  {

    rotatePieceToTR(piecePtr);
    numSlides -= (piecePtr->column - 5);

    binRflat = 1;
  }
}

void placeCornerPiece(struct newPiece* piecePtr)
{

  if ((binLHighestRow < binRHighestRow))
  {
    placeCornerPieceInLeftBin(piecePtr);

    binLHighestRow += 2;
  }
  else
  {
    placeCornerPieceInRightBin(piecePtr);

    binRHighestRow += 2;
  }
}

void sendRotateCommands(struct newPiece* piecePtr)
{
  while (numRotations != 0)
  {
    if (numRotations < 0)
    {
      rotatePieceCounterClockwise(piecePtr->id);
      numRotations++;
    }
    else
    {
      rotatePieceClockwise(piecePtr->id);
      numRotations--;
    }
  }
}

void sendMoveCommands(struct newPiece* piecePtr)
{
  int curCol;
  curCol = piecePtr->column;
  while (numSlides != 0)
  {
    if ((curCol == 1 && numSlides < 0) || (curCol == 4 && numSlides > 0))
    {
      sendRotateCommands(piecePtr);
    }

    if (numSlides < 0)
    {
      slidePieceLeft(piecePtr->id);
      numSlides++;
    }
    else
    {
      slidePieceRight(piecePtr->id);
      numSlides--;
    }
  }

  if (numRotations != 0)
  {
    if (curCol == 0)
    {
      slidePieceRight(piecePtr->id);
      sendRotateCommands(piecePtr);
      slidePieceLeft(piecePtr->id);
    }
    else if (curCol == 5)
    {
      slidePieceLeft(piecePtr->id);
      sendRotateCommands(piecePtr);
      slidePieceRight(piecePtr->id);
    }
  }
}

void PlacementTask()
{

  struct newPiece* piecePtr;
  static int i;

  while(1)
  {
    YKEnterMutex();
    piecePtr = (struct newPiece *) YKQPend(newPieceQPtr);
    YKExitMutex();


    numSlides = 0;
    numRotations = 0;


    switch (piecePtr->type){
      case 0:
        placeCornerPiece(piecePtr);
        break;
      case 1:

        if(piecePtr->orientation == 1)
        {
          numRotations++;
        }

        if ((binLHighestRow < binRHighestRow))
        {
          numSlides -= (piecePtr->column - 1);

          binLHighestRow ++;
        }
        else
        {
          numSlides -= (piecePtr->column - 4);

          binRHighestRow ++;
        }
        break;
    }

    sendMoveCommands(piecePtr);
  }
}

void CommunicationTask()
{
  struct move* movePtr;
  while (1)
  {

    YKEnterMutex();

    movePtr = (struct move *) YKQPend(moveQPtr);

    YKExitMutex();

    YKSemPend(CmdRcvdSemPtr);



    YKEnterMutex();
    switch (movePtr->moveType)
    {
      case 0:

        SlidePiece(movePtr->pieceID, movePtr->direction);

        break;
      case 1:

        RotatePiece(movePtr->pieceID, movePtr->direction);
        break;
      default:
        printString("\n****ILLEGAL MOVE TYPE*****\n");
        break;
    }
    YKExitMutex();
  }
}

void StatTask()
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

  YKNewTask(PlacementTask, (void *) &PlacementTaskStk[512], 4);
  YKNewTask(CommunicationTask, (void *) &CommunicationTaskStk[512], 2);

  StartSimptris();

  while (1)
  {
      YKDelayTask(20);

      YKEnterMutex();
      switchCount = YKCtxSwCount;
      idleCount = YKIdleCount;
      YKExitMutex();

      printString("<CS: ");
      printInt((int)switchCount);
      printString(", CPU: ");
      tmp = (int) (idleCount/max);
      printInt(100-tmp);
      printString("%>\r\n");

      YKEnterMutex();
      YKCtxSwCount = 0;
      YKIdleCount = 0;
      YKExitMutex();
  }
}

int main()
{
  YKInitialize();

  YKNewTask(StatTask, (void *) &StatTaskStk[512], 0);

  newPieceQPtr = YKQCreate(newPieceQ, 5);
  moveQPtr = YKQCreate(moveQ, 25);

  CmdRcvdSemPtr = YKSemCreate(1);

  SeedSimptris(0);

  YKRun();
}
