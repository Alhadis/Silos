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






typedef struct taskblock *TCBptr;
typedef struct taskblock
{
    void *stackptr;
    int state;
    int priority;
    int delay;
    TCBptr next;
    TCBptr prev;
 unsigned eventMask;
 unsigned eventMode;
} TCB;

typedef struct semaphore *SEMptr;
typedef struct semaphore{
 int value;
 TCBptr waitList;
} YKSEM;

typedef struct YKqueue *YKQptr;
typedef struct YKqueue{
 int size;
 int items;
 int head;
 int tail;
 void** base;
 TCBptr waitList;
} YKQ;

typedef struct WhyKayEvent *Eventptr;
typedef struct WhyKayEvent {
 unsigned eventGroup;
 TCBptr waitList;
} YKEVENT;

extern unsigned int YKIdleCount;
extern unsigned int YKCtxSwCount;
extern unsigned int YKTickNum;





void YKInitialize();

void YKEnterMutex(void);

void YKExitMutex(void);

void YKScheduler(int save);

void YKDispatcher(int save);

void YKIdleTask();

void YKNewTask(void (* task)(void), void *taskStack, unsigned char priority);

void YKDelayTask(unsigned count);

void YKTickHandler(void);

void YKRun(void);

void YKEnterISR(void);

void YKExitISR(void);

YKSEM* YKSemCreate(int);

void YKSemPend(YKSEM*);

void YKSemPost(YKSEM*);

void printLists(void);

YKQ *YKQCreate(void **start, unsigned size);

void *YKQPend(YKQ *queue);

int YKQPost(YKQ *queue, void *msg);

YKEVENT *YKEventCreate(unsigned initialValue);

unsigned YKEventPend(YKEVENT *event, unsigned eventMask, int waitMode);

void YKEventSet(YKEVENT *event, unsigned eventMask);

void YKEventReset(YKEVENT *event, unsigned eventMask);
# 3 "lab8app.c" 2
# 1 "simptris.h" 1
void SlidePiece(int ID, int direction);
void RotatePiece(int ID, int direction);
void SeedSimptris(long seed);
void StartSimptris(void);
# 4 "lab8app.c" 2
# 28 "lab8app.c"
extern unsigned NewPieceID;
extern unsigned NewPieceType;
extern unsigned NewPieceOrientation;
extern unsigned NewPieceColumn;
extern unsigned TouchdownID;

YKSEM* semPtr;

void *pieceQ[10];
YKQ* pieceQPtr;

void *moveQ[10];
YKQ* moveQPtr;

int PTaskStk[4096];
int MTaskStk[4096];
int STaskStk[4096];

typedef struct pieceInfo {
    unsigned ID;
    unsigned type;
    unsigned orient;
    unsigned column;
} PIECE;

typedef struct moveInfo {
    int move;
    unsigned id;
} MOVE;

PIECE pieces[10];
static int availablePieces;

MOVE moves[10];
static int availableMoves;

int zone1Flat = 1;
int zone2Flat = 1;
int zone1Count = 0;
int zone2Count = 0;



void recievedInterrupt(void)
{
    YKSemPost(semPtr);
}

void newPieceInterrupt(void)
{
    if (availablePieces <= 0)
 {
        printString("not enough pieces\r\n");
        exit (0xff);
    }
    availablePieces--;
    pieces[availablePieces].ID = NewPieceID;
    pieces[availablePieces].type = NewPieceType;
    pieces[availablePieces].orient = NewPieceOrientation;
    pieces[availablePieces].column = NewPieceColumn;
    YKQPost(pieceQPtr, (void*) &(pieces[availablePieces]));
}

void setGameOver(void)
{
    printString("GAME OVER!");
    exit(0xff);
}




void move(unsigned id, int move)
{
    if (availableMoves <= 0)
 {
        printString("no moves\r\n");
        exit(0xff);
    }
    availableMoves--;
    moves[availableMoves].id = id;
    moves[availableMoves].move = move;

    YKQPost(moveQPtr, (void*) &(moves[availableMoves]));
}


void cornerPieceZone1(PIECE* input)
{
 unsigned id = input->ID;
 unsigned type = input->type;
 unsigned orientation = input->orient;
 unsigned column = input->column;
 unsigned tempColumn;
 if (!zone1Flat)
 {

  if (orientation == 1)
  {
   move(id, 2);
  }
  else if (orientation == 3)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
  }
  else if (orientation == 0)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
   move(id, 3);
  }
  tempColumn = column;
  while (tempColumn != 2)
  {
   if (tempColumn > 2)
   {
    move(id, 0);
    tempColumn--;
   }
   else
   {
    move(id, 1);
    tempColumn++;
   }
  }
  zone1Flat = 1;
  zone1Count += 2;
 }
 else if (!zone2Flat)
 {

  if (orientation == 1)
  {
   move(id, 2);
  }
  else if (orientation == 3)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
  }
  else if (orientation == 0)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
   move(id, 3);
  }

  tempColumn = column;
  while (tempColumn != 5)
  {
   move(id, 1);
   tempColumn++;
  }
  zone2Flat = 1;
  zone2Count += 2;
 }
 else
 {
  if (orientation == 1)
  {
   if (column == 5)
   {
    move(id, 0);
    column--;
   }
   move(id, 3);
  }
  else if (orientation == 2)
  {
   if (column == 5)
   {
    move(id, 0);
    column--;
   }
   move(id, 3);
   move(id, 3);
  }
  else if (orientation == 3)
  {
   move(id, 2);
  }
  tempColumn = column;
  while (tempColumn != 0){
   move(id, 0);
   tempColumn--;
  }
  zone1Flat = 0;
 }
}

void cornerPieceZone2(PIECE* input)
{
 unsigned id = input->ID;
 unsigned type = input->type;
 unsigned orientation = input->orient;
 unsigned column = input->column;
 unsigned tempColumn;
 if (!zone2Flat)
 {
  if (orientation == 1)
  {
   move(id, 2);
  }
  else if (orientation == 3)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
  }
  else if (orientation == 0)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
   move(id, 3);
  }
  tempColumn = column;
  while (tempColumn != 5)
  {
   move(id, 1);
   tempColumn++;
  }
  zone2Flat = 1;
  zone2Count += 2;
 }
 else if (!zone1Flat)
 {
  if (orientation == 1)
  {
   move(id, 2);
  }
  else if (orientation == 3)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
  }
  else if (orientation == 0)
  {
   if (column == 0)
   {
    move(id, 1);
    column++;
   }
   move(id, 3);
   move(id, 3);
  }
  tempColumn = column;
  while (tempColumn != 2)
  {
   if (tempColumn > 2)
   {
    move(id, 0);
    tempColumn--;
   }
   else
   {
    move(id, 1);
    tempColumn++;
   }
  }
  zone1Flat = 1;
  zone1Count += 2;
 }
 else
 {
  if (orientation == 1)
  {
   if (column == 5)
   {
    move(id, 0);
    column--;
   }
   move(id, 3);
  }
  else if (orientation == 2)
  {
   if (column == 5)
   {
    move(id, 0);
    column--;
   }
   move(id, 3);
   move(id, 3);
  }
  else if (orientation == 3)
  {
   move(id, 2);
  }

  tempColumn = column;
  while (tempColumn != 3)
  {
   if (tempColumn > 3)
   {
    move(id, 0);
    tempColumn--;
   }
   else
   {
    move(id, 1);
    tempColumn++;
   }
  }
  zone2Flat = 0;
 }
}

void cornerPiece(PIECE* input)
{
 if (zone1Count < zone2Count)
  cornerPieceZone1(input);
 else
  cornerPieceZone2(input);
}


void straightPieceZone1(PIECE* input){
 unsigned id = input->ID;
 unsigned type = input->type;
 unsigned orientation = input->orient;
 unsigned column = input->column;
 unsigned tempColumn;

 if (orientation == 1)
 {
  if (column == 0)
  {
   move(id, 1);
   column++;
  }
  if (column == 5)
  {
   move(id, 0);
   column--;
  }
  move(id, 3);
 }
 if (zone1Flat)
 {
  tempColumn = column;
  while (tempColumn != 1)
  {
   move(id, 0);
   tempColumn--;
  }
  zone1Count++;
 }
 else
 {
  tempColumn = column;
  while (tempColumn != 4)
  {
   move(id, 1);
   tempColumn++;
  }
  zone2Count++;
 }
}

void straightPieceZone2(PIECE* input){
 unsigned id = input->ID;
 unsigned type = input->type;
 unsigned orientation = input->orient;
 unsigned column = input->column;
 unsigned tempColumn;
 if (orientation == 1)
 {
  if (column == 0)
  {
   move(id, 1);
   column++;
  }
  if (column == 5)
  {
   move(id, 0);
   column--;
  }
  move(id, 3);
 }
 if (zone2Flat)
 {
  tempColumn = column;
  while (tempColumn != 4)
  {
   move(id, 1);
   tempColumn++;
  }
  zone2Count++;
 }
 else
 {
  tempColumn = column;
  while (tempColumn != 1)
  {
   move(id, 0);
   tempColumn--;
  }
  zone1Count++;
 }
}

void straightPeice(PIECE* input)
{
 if (zone1Count < zone2Count)
  straightPieceZone1(input);
 else
  straightPieceZone2(input);
}





void PTask()
{
    PIECE* temp;
    int id, col, orientation, type;
    while(1)
 {
        temp = (PIECE*)YKQPend(pieceQPtr);
        availablePieces++;

        if (temp->type)
   straightPeice(temp);
        else
            cornerPiece(temp);
    }
}


void MTask()
{
    MOVE* temp;
    while(1)
 {
        temp = (MOVE*)YKQPend(moveQPtr);
        availableMoves++;
  if (temp->move == 0)
   SlidePiece(temp->id, 0);
  else if (temp->move == 1)
   SlidePiece(temp->id, 1);
  else if (temp->move == 2)
   RotatePiece(temp->id, 0);
  else
   RotatePiece(temp->id, 1);
        YKSemPend(semPtr);
    }
}

void STask()
{
    unsigned idleCount, max;
    int switchCount, tmp;

    YKDelayTask(1);
    printString("Welcome to the YAK kernel\r\n");
    printString("Determining CPU capacity\r\n");
    YKDelayTask(1);
    YKIdleCount = 0;
    YKDelayTask(5);
    max = YKIdleCount / 25;
    YKIdleCount = 0;


    StartSimptris();

    YKNewTask(PTask, (void*) &PTaskStk[4096], 20);
    YKNewTask(MTask, (void*) &MTaskStk[4096], 10);


    while(1)
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
        printString("% >\r\n");

        YKEnterMutex();
        YKCtxSwCount = 0;
        YKIdleCount = 0;
        YKExitMutex();
    }


}

void main(void)
{
    YKInitialize();

    YKNewTask(STask, (void *) &STaskStk[4096], 30);
    semPtr = YKSemCreate(0);
    pieceQPtr = YKQCreate(pieceQ, 10);
    moveQPtr = YKQCreate(moveQ, 10);
    availablePieces = 10;
    availableMoves = 10;

 SeedSimptris(87245);
    YKRun();
}
