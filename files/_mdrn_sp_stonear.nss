#include "x2_inc_toollib"
#include "x0_i0_position"

//By OldManWhistler for the DMFI Control Wand
int GetAreaXAxis(object oArea)
{

    location locTile;
    int iX = 0;
    int iY = 0;
    vector vTile = Vector(0.0, 0.0, 0.0);

    for (iX = 0; iX < 32; ++iX)
    {
        vTile.x = IntToFloat(iX);
        locTile = Location(oArea, vTile, 0.0);
        int iRes = GetTileMainLight1Color(locTile);
        if (iRes > 32 || iRes < 0)
            return(iX);
    }

    return 32;
}

int GetAreaYAxis(object oArea)
{
    location locTile;
    int iX = 0;
    int iY = 0;
    vector  vTile = Vector(0.0, 0.0, 0.0);

    for (iY = 0; iY < 32; ++iY)
    {
        vTile.y = IntToFloat(iY);
        locTile = Location(oArea, vTile, 0.0);
        int iRes = GetTileMainLight1Color(locTile);
        if (iRes > 32 || iRes < 0)
            return(iY);
    }

    return 32;
}


void TilesetMagic(object oUser, int nEffect, int nType)
{
int iXAxis = GetAreaXAxis(GetArea(oUser));
int iYAxis = GetAreaYAxis(GetArea(oUser));
int nBase = GetLocalInt(GetModule(), "dmfi_tileset");

// nType definitions:
// 0 fill
// 1 flood
// 2 groundcover

// nBase definitions:
// 0 default
// 1 Sewer and City - raise the fill effect to -0.1


float ZEffectAdjust = 0.0;
float ZTypeAdjust = 0.1; //default is groundcover
float ZTileAdjust = 0.0;
float ZFinalAxis;

/*
if (nEffect == X2_TL_GROUNDTILE_ICE)
    ZEffectAdjust = -1.0;  // lower the effect based on trial and error
*/
if (nEffect == X2_TL_GROUNDTILE_SEWER_WATER)
    ZEffectAdjust = 0.8;

//now sep based on nType
if (nType == 0)  //fill
    ZTypeAdjust=-2.0;
else if (nType ==1)
    ZTypeAdjust = 2.0;

ZFinalAxis = ZEffectAdjust + ZTypeAdjust + ZTileAdjust;

//special case for filling of water and sewer regions
//if ((nBase==1) && (nType==0))
    ZFinalAxis = -0.05;

TLResetAreaGroundTiles(GetArea(oUser), iXAxis, iYAxis);
TLChangeAreaGroundTiles(GetArea(oUser), nEffect , iXAxis, iYAxis, ZFinalAxis);
}
void main()
{
    object oUser = OBJECT_SELF;
    int nSet = GetLocalInt(oUser, "nMdrnAreaSet");
    if (nSet == 0)
    {
        SetLocalInt(oUser, "nMdrnAreaSet", 1);


        TilesetMagic(oUser, X2_TL_GROUNDTILE_CAVEFLOOR, 2);
    }
}
