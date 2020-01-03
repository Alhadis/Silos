# 1 "palette_tv.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "palette_tv.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 39 "myLib.h"
extern unsigned short *videoBuffer;
# 63 "myLib.h"
void setPixel(int x, int y, unsigned short color);
void setPixel4(int x, int y, unsigned char colorIndex);
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
void drawRect3(int x, int y, int width, int height, unsigned short color);
void drawRect4(int x, int y, int width, int height, unsigned char colorIndex);
void drawRectInBounds3(int x, int y, int width, int height, unsigned short color);
void drawBackgroundImage3(const unsigned short * image);
void drawBackgroundImage4(volatile const unsigned short* image);
void drawImage3(const unsigned short* image, int x, int y, int width, int height);
void drawImage4(volatile const unsigned short* image, int x, int y, int width, int height);
void loadPalette(volatile const unsigned short* palette);
void fillScreen(unsigned short color);
void fillScreen4(unsigned char colorIndex);
void flipPage();
void waitForVBlank();
# 94 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 104 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 232 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 289 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 2 "palette_tv.c" 2
# 1 "main.h" 1
enum{HUB_BILL_IDLE_LEFT, HUB_BILL_IDLE_RIGHT, HUB_BILL_LEFT, HUB_BILL_RIGHT, HUB_BILL_IDLE, VIRUS_COVER, A_BUTTON};
enum {GAME, SPLASH, INSTRUCTIONS, WIN, LOSE, PAUSE, TV, VIRUS, ANIMATION};


typedef struct {
    int x;
    int y;
    int dX;
    int worldX;
    int worldY;
    int aniState;
    int aState;
    int prevAniState;
    int currFrame;
    int moveSpeed;
} HUBBILL;

void init();
void goToGame();
void goToSplash();
void goToWin();
void goToLose();
void goToPause();
void updateGame();
void updateSplash();
void updateWin();
void updateLose();
void updatePause();
void hideSprites();
void goToTV();
void updateTV();
void updateHubBill(HUBBILL * b);
void drawHubBill(HUBBILL * b);
void goToInstructions();
void updateInstructions();
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void pauseSound();
void unpauseSound();
void stopSound();
void updateVirus();
void goToVirus();
void setupInterrupts();
void interruptHandler();
void goToAnimation();
void updateAnimation();

extern void initVirus();
extern void vUpdate();
# 3 "palette_tv.c" 2
# 1 "palette_tv.h" 1
enum{BILL_IDLE_LEFT, BILL_IDLE_RIGHT, BILL_LEFT, BILL_RIGHT, BILL_JUMP_LEFT, BILL_JUMP_RIGHT,BILL_IDLE};
enum{PLAYER, TIME, STRUCTURE = TIME + 3};
enum{TVInstructions, TVLose, TVWin, TVGame, TVPause};


typedef struct {
    int x;
    int y;
    int dX;
    int dY;
    int prevDY;
    int aniState;
    int aState;
    int prevAniState;
    int currFrame;
    int jumpSpeed;
    int moveSpeed;
    float grav;
    int canJump;
    int jumping;
    int collided;
    int train;
    int active;
} BILL;

typedef struct {
    int active;
    int x;
    int y;
    int col;
} PLATFORM;

typedef struct {
    int y;
} DEATHZONE;

void pTUpdate();
void initTV();
void drawBill(BILL * b);
void updateBill(BILL * b);
void setTimer();
void changeCamera(int yOff);
void initPaletteTV();
void drawPlatforms();
void checkCollisionBillPlatform(BILL *b, PLATFORM * p);
void goToTVInstructions();
void updateTVInstructions();
void goToTVGame();
void updateTVGame();
void goToTVPause();
void updateTVPause();
void goToTVLose();
void updateTVLose();
void goToTVWin();
void updateTVWin();
# 4 "palette_tv.c" 2
# 1 "sprites.h" 1
# 21 "sprites.h"
extern const unsigned short spritesTiles[16384];


extern const unsigned short spritesPal[12];
# 5 "palette_tv.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[96];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[16];
# 6 "palette_tv.c" 2
# 1 "tvInstructions.h" 1
# 22 "tvInstructions.h"
extern const unsigned short tvInstructionsTiles[4128];


extern const unsigned short tvInstructionsMap[1024];


extern const unsigned short tvInstructionsPal[256];
# 7 "palette_tv.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[2992];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[16];
# 8 "palette_tv.c" 2
# 1 "palette_win.h" 1
# 22 "palette_win.h"
extern const unsigned short palette_winTiles[3600];


extern const unsigned short palette_winMap[1024];


extern const unsigned short palette_winPal[16];
# 9 "palette_tv.c" 2
# 1 "palette_lose.h" 1
# 22 "palette_lose.h"
extern const unsigned short palette_loseTiles[2784];


extern const unsigned short palette_loseMap[1024];


extern const unsigned short palette_losePal[16];
# 10 "palette_tv.c" 2
# 1 "Bill_Jump_Sound.h" 1
# 20 "Bill_Jump_Sound.h"
extern const unsigned char Bill_Jump_Sound[267786];
# 11 "palette_tv.c" 2
# 1 "tvMusic.h" 1
# 20 "tvMusic.h"
extern const unsigned char tvMusic_c1[2313961];
extern const unsigned char tvMusic_c2[2313961];
# 12 "palette_tv.c" 2
# 1 "Jump.h" 1
# 20 "Jump.h"
extern const unsigned char Jump[8251];
# 13 "palette_tv.c" 2
# 1 "hubMusic.h" 1
# 20 "hubMusic.h"
extern const unsigned char hubMusic[2831040];
# 14 "palette_tv.c" 2

extern int state;

extern OBJ_ATTR shadowOAM[128];

extern int tvOpen;

int pTVState;
int totalYOff;

int dead;


int timer = 0;
int maxTime;

int bg0;
int bg1;
int bg2;
int bg3;

int platformMove;

BILL bill;
PLATFORM platforms[22];
int platformCount = 22;
int platformX[22] = {64,64,64,120,208,208,136,64,0,64, 120, 200, 144, 144 ,72, 0, 0, 0, 80, 144, 144, 144};
int platformY[22] = {136, 112, 88, 72, 48, 24, 24, 8, -16, -40, -40, -64, -88, -112, -120, -128, -152, -176, -184, -208, -232, -256};
int platformCol[22] = {1, 0, 1, 0, 2, 0, 2, 3, 3, 1, 0, 3, 3, 2, 3, 0, 0, 2, 0, 2, 1, 0};
DEATHZONE dZ;

void initTV() {
    stopSound();
    DMANow(3, spritesPal, ((unsigned short*)(0x5000200)), 16);
    DMANow(3, spritesTiles, &((charblock *)0x6000000)[4], 32768/2);
    goToTVInstructions();
}

void pTUpdate() {
    switch(pTVState) {
        case TVInstructions:
            updateTVInstructions();
            break;
        case TVGame:
            updateTVGame();
            break;
        case TVPause:
            updateTVPause();
            break;
        case TVWin:
            updateTVWin();
            break;
        case TVLose:
            updateTVLose();
            break;
    }
}

void goToTVInstructions() {
    initPaletteTV();
    pTVState = TVInstructions;
    *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 31 << 8;
    loadPalette(tvInstructionsPal);
    DMANow(3, tvInstructionsMap, &((screenblock *)0x6000000)[31],2048/2);
    DMANow(3, tvInstructionsTiles, &((charblock *)0x6000000)[0], 8256/2);
}
void updateTVInstructions() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToTVGame();
        playSoundB(tvMusic_c1, 2313961, 11025, 1);
    }
}
void goToTVGame() {
    pTVState = TVGame;

    *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 31 << 8;
    loadPalette(backgroundPal);
    if (bg0 == 1) {
        u16 temp = ((u16 *)0x5000000)[0];
        ((u16 *)0x5000000)[0] = ((u16 *)0x5000000)[1];
        ((u16 *)0x5000000)[1]= ((u16 *)0x5000000)[2];
        ((u16 *)0x5000000)[2] = ((u16 *)0x5000000)[3];
        ((u16 *)0x5000000)[3] = temp;
    } else if (bg0 == 2) {
        u16 temp = ((u16 *)0x5000000)[0];
        u16 temp2 = ((u16 *)0x5000000)[1];
        ((u16 *)0x5000000)[0] = ((u16 *)0x5000000)[2];
        ((u16 *)0x5000000)[1]= ((u16 *)0x5000000)[3];
        ((u16 *)0x5000000)[2] = temp;
        ((u16 *)0x5000000)[3] = temp2;
    } else if (bg0 == 3) {
         u16 temp = ((u16 *)0x5000000)[3];
        ((u16 *)0x5000000)[3] = ((u16 *)0x5000000)[2];
        ((u16 *)0x5000000)[2] = ((u16 *)0x5000000)[1];
        ((u16 *)0x5000000)[1] = ((u16 *)0x5000000)[0];
        ((u16 *)0x5000000)[0] = temp;
    }
    DMANow(3, backgroundMap, &((screenblock *)0x6000000)[31],2048/2);
    DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 192/2);
    drawPlatforms();
}
void updateTVGame() {
    updateBill(&bill);
    drawBill(&bill);
    if (timer % 1000 == 0) {
        setTimer();
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    timer++;
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
# 142 "palette_tv.c"
        u16 temp = ((u16 *)0x5000000)[3];
        ((u16 *)0x5000000)[3] = ((u16 *)0x5000000)[2];
        ((u16 *)0x5000000)[2] = ((u16 *)0x5000000)[1];
        ((u16 *)0x5000000)[1] = ((u16 *)0x5000000)[0];
        ((u16 *)0x5000000)[0] = temp;
        bg0 = bg3;
        bg1--;
        if (bg1 == -1) {
            bg1 = 3;
        }
        bg2--;
        if (bg2 == -1) {
            bg2 = 3;
        }
        bg3--;
        if (bg3 == -1) {
            bg3 = 3;
        }
    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSound();
        goToTVPause();
    }
    if (maxTime - timer == 0) {
        stopSound();
        goToTVLose();
    }
    if (bill.y - totalYOff < -270) {
        stopSound();
        goToTVWin();
    }
}
void goToTVPause() {
    pTVState = TVPause;
    *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 31 << 8;
    loadPalette(pausePal);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[31],2048/2);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 5984/2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
void updateTVPause() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        unpauseSound();
        goToTVGame();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        pTVState = TVInstructions;
        stopSound();
        playSoundB(hubMusic, 2831040, 11025, 1);
        goToGame();
    }
}
void goToTVWin() {
    pTVState = TVWin;
    *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 31 << 8;
    loadPalette(palette_winPal);
    DMANow(3, palette_winMap, &((screenblock *)0x6000000)[31],2048/2);
    DMANow(3, palette_winTiles, &((charblock *)0x6000000)[0], 7200/2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    tvOpen = 1;
}
void updateTVWin() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundB(hubMusic, 2831040, 11025, 1);
        goToGame();
    }
}
void goToTVLose() {
    pTVState = TVLose;
    *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 31 << 8;
    loadPalette(palette_losePal);
    DMANow(3, palette_loseMap, &((screenblock *)0x6000000)[31],2048/2);
    DMANow(3, palette_loseTiles, &((charblock *)0x6000000)[0], 5568/2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
void updateTVLose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundB(hubMusic, 2831040, 11025, 1);
        goToGame();
    }
}

void updateBill(BILL * b) {
    b->prevDY = b->dY;


    volatile int key_right = 0;
    volatile int key_left = 0;
    volatile int key_jump = 0;

    if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
        key_right = 1;
    }
    if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
        key_left = -1;
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        key_jump = 1;
    }


    int move = key_left + key_right;
    b->dX = move * b->moveSpeed;
    if(b->dY < 10 && timer % 120 == 0) {
        b->dY += b->grav;
    }


    if (b->x + b->dX <= 0) {
        b->dX = 0;
        b->x = 0;
    } else if (b->x + b->dX > 239 - 16) {
        b->dX = 0;
        b->x = 239 - 16;
    }
    if (b->y + b->dY < 0) {
        if (totalYOff -b->dY < 500) {
            changeCamera(-b->dY);
            totalYOff -= b->dY;
        } else {
            b->dY = 0;
            b->y = 0;
        }
    } else if (b->y + b->dY > 159 - 24) {
        if (totalYOff -b->dY > 0) {
            changeCamera(-b->dY);
            totalYOff -= b->dY;
        }
    }
    if (b->dY + b->y >= dZ.y - 23) {

        b->jumping = 0;
        b->dY = 0;
        b->y = dZ.y - 23;
        ((volatile DMA_CONTROLLER *) 0x40000B0)[1].cnt = 0;
        *(volatile unsigned short*)0x4000102 = 0;
    }


    for (int i = 0; i < platformCount; i++) {
        PLATFORM * pl = &platforms[i];
        if (pl->active) {
            checkCollisionBillPlatform(b, pl);
        }
    }


    if (!b->jumping && key_jump) {
        b->dY = -b->jumpSpeed;
        b->y += b->dY;
        b->jumping = 1;
        playSoundA(Jump,8251,11025, 0);
    }

    if (b->aniState != BILL_IDLE) {
        b->prevAniState = b->aniState;
    }
    b->aniState = BILL_IDLE;
    if (b->dY == 0) {
        if (b->dX > 0) {
            b->aniState = BILL_RIGHT;
            b->aState = BILL_RIGHT;
        } else if (b->dX < 0) {
            b->aniState = BILL_LEFT;
            b->aState = BILL_LEFT;
        }
    } else {
        if (b->dX > 0) {
            b->aniState = BILL_JUMP_RIGHT;
            b->aState = BILL_IDLE_RIGHT;
            b->currFrame = 1;
        } else if (b->dX < 0) {
            b->aniState = BILL_JUMP_LEFT;
            b->aState = BILL_IDLE_LEFT;
            b->currFrame = 1;
        }
        b->collided = 0;
    }
    if (b->aniState == BILL_IDLE) {
        b->currFrame = 0;
        if ((b->prevAniState == BILL_LEFT) || (b->prevAniState == BILL_JUMP_LEFT)) {
            b->aState = BILL_IDLE_LEFT;
        } else if ((b->prevAniState == BILL_RIGHT) || (b->prevAniState == BILL_JUMP_RIGHT)) {
            b->aState = BILL_IDLE_RIGHT;
        }
    }
    if (timer % 200 == 0 && (b->aniState == BILL_RIGHT || b->aniState == BILL_LEFT) && !b->jumping) {
        b->currFrame++;
        if (b->currFrame == 8) {
            b->currFrame = 0;
        }
    }
    if (timer % 50 == 0) {
        b->x = b->x + b->dX;
    }
    if (timer % 95 == 0) {
            b->y = b->y + b->dY;
    }
}

void drawBill(BILL * b) {
        shadowOAM[PLAYER].attr0 = b->y | (2 << 14);
        shadowOAM[PLAYER].attr1 = b->x | (2 << 14);
        shadowOAM[PLAYER].attr2 = (b->currFrame * 4)*32+(b->aState * 2);
}

void checkCollisionBillPlatform(BILL * b, PLATFORM * p) {
    if (!(((p->x >= 0 && p->x < 60) && (bg0 == p->col)) || ((p->x >= 60 && p->x < 120) && (bg1 == p->col)) || ((p->x >= 120 && p->x < 180) && (bg2 == p->col)) || ((p->x >= 180) && (bg3 == p->col)))) {
        if(b->y + b->dY + 24 >= p->y && b->y + 24 <= p->y && b->x < p->x + 32 && b->x + 16 > p->x && b->dY > 0) {
        b->dY = 0;
        b->y = p->y - 24;
        b->jumping = 0;
        b->collided = 1;

    }
    }
}
void drawPlatforms() {
    for (int i = 0; i < platformCount; i++) {
        PLATFORM * p = &platforms[i];
        if (p->y < 0 || p->y > 159) {
            shadowOAM[STRUCTURE + i].attr0 = (2 << 8);
            p->active = 0;
        } else {
            shadowOAM[STRUCTURE + i].attr0 = p->y | (1 << 14);
            shadowOAM[STRUCTURE + i].attr1 = p->x | (1 << 14);
            shadowOAM[STRUCTURE + i].attr2 = (p->col)*32+(8);
            p->active = 1;
        }
    }

}

void initPaletteTV() {
    bg0 = 0;
    bg1 = 1;
    bg2 = 2;
    bg3 = 3;

    maxTime = 300000;
    dead = 0;
    totalYOff = 0;
    dZ.y = 159;
    timer = 0;

    bill.x = 0;
    bill.y = 159 - 32;
    bill.dX = 0;
    bill.dY = 0;
    bill.grav = 1;
    bill.jumpSpeed = 6;
    bill.moveSpeed = 2;
    bill.jumping = 0;
    bill.collided = 1;

    for (int i = 0; i < platformCount; i++) {
        PLATFORM p;
        p.x = platformX[i];
        p.y = platformY[i];
        p.col = platformCol[i];
        p.active = 1;
        platforms[i] = p;
    }
}
void changeCamera(int yOff) {
    bill.y += yOff;
    dZ.y += yOff;
    for (int i = 0; i < platformCount; i++) {
        platforms[i].y += yOff;
    }
    drawPlatforms();
}

void setTimer() {
    int num;
    int time = maxTime - timer;
    time /= 1000;
    for (int i = 0; i < 3; i++) {
        num = time % 10;
        time /= 10;
        shadowOAM[TIME + i].attr0 = 2;
        shadowOAM[TIME + i].attr1 = 12 - (i * 6);
        shadowOAM[TIME + i].attr2 = (num)*32+(12);
    }
}
