
/* MBoard.I */

#include "types.h"
#include "mboard.h"

/* Functions */

/* MDoIndices() */

#define M_DO_FLIPS(Me,Opp,Dir)\
\
   if (Move[Dir].Disk Opp) {\
      Square = Move + Dir;\
      SP2    = SP;\
      do {\
         *++SP2  = Square;\
         Square += Dir;\
      } while (Square->Disk Opp);\
      if (Square->Disk Me) SP = SP2;\
   }

inline static int MDoIndices(MSQUARE *Move) {

   MSQUARE **SP, **SP2;
   MSQUARE  *Square;

   SP = MBoard->FlipSP;

   if (MBoard->Colour > 0) {

      M_DO_FLIPS(>0,<0,-10)
      M_DO_FLIPS(>0,<0, -9)
      M_DO_FLIPS(>0,<0, -8)
      M_DO_FLIPS(>0,<0, -1)
      M_DO_FLIPS(>0,<0, +1)
      M_DO_FLIPS(>0,<0, +8)
      M_DO_FLIPS(>0,<0, +9)
      M_DO_FLIPS(>0,<0,+10)

      if (SP == MBoard->FlipSP) return FALSE;

      MBoard->FlipSP = SP;
      Square         = *SP;
      do {
         *Square->Index[0].Index += Square->Index[0].Inc2;
         *Square->Index[1].Index += Square->Index[1].Inc2;
         *Square->Index[2].Index += Square->Index[2].Inc2;
         *Square->Index[3].Index += Square->Index[3].Inc2;
      } while ((Square = *--SP) != NULL);

      *Move->Index[0].Index += Move->Index[0].Inc1;
      *Move->Index[1].Index += Move->Index[1].Inc1;
      *Move->Index[2].Index += Move->Index[2].Inc1;
      *Move->Index[3].Index += Move->Index[3].Inc1;

   } else {

      M_DO_FLIPS(<0,>0,-10)
      M_DO_FLIPS(<0,>0, -9)
      M_DO_FLIPS(<0,>0, -8)
      M_DO_FLIPS(<0,>0, -1)
      M_DO_FLIPS(<0,>0, +1)
      M_DO_FLIPS(<0,>0, +8)
      M_DO_FLIPS(<0,>0, +9)
      M_DO_FLIPS(<0,>0,+10)

      if (SP == MBoard->FlipSP) return FALSE;

      MBoard->FlipSP = SP;
      Square         = *SP;
      do {
         *Square->Index[0].Index -= Square->Index[0].Inc2;
         *Square->Index[1].Index -= Square->Index[1].Inc2;
         *Square->Index[2].Index -= Square->Index[2].Inc2;
         *Square->Index[3].Index -= Square->Index[3].Inc2;
      } while ((Square = *--SP) != NULL);

      *Move->Index[0].Index -= Move->Index[0].Inc1;
      *Move->Index[1].Index -= Move->Index[1].Inc1;
      *Move->Index[2].Index -= Move->Index[2].Inc1;
      *Move->Index[3].Index -= Move->Index[3].Inc1;
   }

   MBoard->Colour = -MBoard->Colour;

   return TRUE;
}

/* MUndoIndices() */

inline static void MUndoIndices(const MSQUARE *Move) {

   MSQUARE **SP;
   MSQUARE  *Square;

   SP     = MBoard->FlipSP;
   Square = *SP;

   if (MBoard->Colour > 0) {

      do {
         *Square->Index[0].Index += Square->Index[0].Inc2;
         *Square->Index[1].Index += Square->Index[1].Inc2;
         *Square->Index[2].Index += Square->Index[2].Inc2;
         *Square->Index[3].Index += Square->Index[3].Inc2;
      } while ((Square = *--SP) != NULL);

      MBoard->FlipSP = SP;

      *Move->Index[0].Index += Move->Index[0].Inc1;
      *Move->Index[1].Index += Move->Index[1].Inc1;
      *Move->Index[2].Index += Move->Index[2].Inc1;
      *Move->Index[3].Index += Move->Index[3].Inc1;

   } else {

      do {
         *Square->Index[0].Index -= Square->Index[0].Inc2;
         *Square->Index[1].Index -= Square->Index[1].Inc2;
         *Square->Index[2].Index -= Square->Index[2].Inc2;
         *Square->Index[3].Index -= Square->Index[3].Inc2;
      } while ((Square = *--SP) != NULL);

      MBoard->FlipSP = SP;

      *Move->Index[0].Index -= Move->Index[0].Inc1;
      *Move->Index[1].Index -= Move->Index[1].Inc1;
      *Move->Index[2].Index -= Move->Index[2].Inc1;
      *Move->Index[3].Index -= Move->Index[3].Inc1;
   }

   MBoard->Colour = -MBoard->Colour;
}

/* End of MBoard.I */

