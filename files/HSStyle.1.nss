/*
 *  --------------------------
 *       Configurations
 *  --------------------------
 */


/* Fonts */
@primaryFontName:               .SFUIText-Light;
@primaryFontNameLight:          .SFUIText-Light;
@primaryFontNameSemibold:       .SFUIText-Semibold;
@primaryFontNameBold:           boldSystem;     /*.SFUIText-Bold*/
@primaryFontNameMedium:         .SFUIText-Medium;
@primaryFontNameRegular:        system;         /*.SFUIText*/

@secondaryFontName:             .SFUIText-Light;

@primaryIconFontName:           homestylermainicons;

@primaryBorderWidth:    1;
@defaultSeperatorWidth: 1;


/* Active Colours */
@whiteBackground:   #FFFFFF;
@lightBlue:         #007fea;
@lightBlue1:        #5286ef;
@lightBlue2:        #5179bb;
@mustard:           #dcbe14;
@orange:            #F69B1E;
@darkOrange:        #ee902c;
@darkGreen:         #95CB7C;
@darkYellow:        #E2C420;
@darkBlue:          #42bcFF;
@darkerBlue:        #2c58b2;
@lighterBlue:       #6dc6d0;
@darkGray:          #474747;
@darkerGray:        #303030;
@lightGray:         #979797;
@separationGray:    #ececec;
@gray:              #828282;
@dimGray:           #656565;
@lighterGray:       #717171;
@iconGray:          #c1c1c1;
@heartRed:          #e66464;
@brownRed:          #e8675a;
@commentGray:       #BFBFBF;
@backgroundGray:    #F4F4F4;
@darkBorderGray:    #a2a2a2;
@borderGray:        #D6D6D6;
@iconGray:          #9b9c9d;
@strokeGray:        #e7e7e7;
@torquise:          #6ec5cf;
@darkTorquise:      #49B4C0;
@lightTorquise:     #60b3bd;
@borderTorquise:    #7bd1db;
@fadedRed:          #e7675b;
@oceanBlue:         #007fea;
@black:             #000000;
@white:             #FFFFFF;
@grey2:             #8f8f8f;
@facebookBlue:      #3B5998;
@menuGreen:         #1E5902;
@menuPurple:        #AD83B8;
@menuPalePink:      #C5B286;
@errorRed:          #DD0000;

@lighterGray:            #D3D3D3;
@highlightStateButton:   #6ec5cf;

@linkableText:      #007FEA;


@greyishBrown:      #454545;
@lightGreyishBrown: #545454;
@warmGray:          #808080;
@lightWarmGray:     #9B9B9B;
@sunflowerYellow:   #FFCC00;


/*
 *  --------------------------
 *  White Label
 *	The markers below marked with Begin and End of the white label section
 *	should not be modified. The build script replaces the content between the markers.
 *  --------------------------
*/

/* Begin - White Label */

@clrHeartButtonUnpressed:                   #979797;    /* The unliked state of heart buttons throughout the application */
@clrHeartButtonPressed:                     #e66464;    /* The liked state of heart buttons throughout the application */

@clrFindFriendsButtonBackgroundColor:       #007fea;    /* My Profile: color for the find friends button background */
@clrFindFriendsButtonTextColor:             #FFFFFF;    /* My Profile: color for the find friends button text */
@clrEditProfileButtonBackgroundColor:       #6ec5cf;    /* My Profile: color for the edit profile button background */
@clrEditProfileButtonTextColor:             #FFFFFF;    /* My Profile: color for the edit profile button text */

@clrRedesignButtonTextColor:                #FFFFFF;    /* Selected Gallery 3D: Redesign button text color */
@clrRedesignButtonBackgroundColor:          #6ec5cf;    /* Selected Gallery 3D: Redesign button background color */
@clrRedesignButtonIconColor:                #FFFFFF;    /* Selected Gallery 3D: Redesign button icon color */

@clrMenusBackgroundColor:                   #FFFFFF;    /* The backgound color for menus throuhout the application */
@clrMenusNotClickableTextColor:             #000000;    /* The color for menu texts that are not clickable throuhout the application */
@clrMenusClickableTextColor:                #474747;    /* The color for menu texts that are clickable throuhout the application */
@clrMenusHighlightedTextColor:              #6ec5cf;    /* The highlighted color for menu texts that are clickable throuhout the application */
@clrMenusIconColor:                         nui_ignore; /* The color for menu icons throuhout the application */
@clrMenusHighlightedIconColor:              nui_ignore; /* The highlighted color for menu icons throuhout the application */
@clrMenusSelectionColor:                    nui_ignore; /* The selected state color for menu icons throuhout the application */

@clrDialogsBackgroundColor:                 nui_ignore; /* The background color for dialogs throughout the application */
@clrDialogsNotClickableTextColor:           nui_ignore; /* The color for unclickable texts in dialogs throughout the application */
@clrDialogsClickableTextColor:              nui_ignore; /* The color for clickable texts in dialogs throughout the application */
@clrDialogsHighlightedTextColor:            nui_ignore; /* The highlighted color for clickable texts in dialogs throughout the application */
@clrDialogsIconColor:                       nui_ignore; /* The color for icons in dialogs throughout the application */
@clrDialogsHighlightedIconColor:            nui_ignore; /* The highlighted color for icons in dialogs throughout the application */
@clrDialogsSelectionColor:                  nui_ignore; /* The background color for dialog buttons (when in highlighted/selected state) throughout the application */

@clrTopBarBackgroundColor:                  nui_ignore; /* The background color for top bars throughout the application */
@clrTopBarNotClickableTextColor:            nui_ignore; /* The color for unclickable texts in top bars throughout the application */
@clrTopBarClickableTextColor:               nui_ignore; /* The color for clickable texts in top bars throughout the application */
@clrTopBarHighlightedTextColor:             nui_ignore; /* The highlighted color for clickable texts in top bars throughout the application */
@clrTopBarIconColor:                        nui_ignore; /* The color for icons in top bars throughout the application */
@clrTopBarHighlightedIconColor:             nui_ignore; /* The highlighted color for icons in top bars throughout the application */

@clrGalleriesBackgroundColor:               nui_ignore; /* Background color for all galleries */
@clrGalleryCellsBackgroundColor:            nui_ignore; /* Background color for all gallery cells */
@clrGalleryCellsTextLabel:                  nui_ignore; /* Color for all gallery cells major text label (header, or only text label if any) */
@clrGalleryCellsSecondaryTextLabel:         nui_ignore; /* Color for all gallery cells secondary text label, if exists */

/* End - White Label */


/*
 *  --------------------------
 *  Generic
 *  All items declared here will dominate
 *  unless overriden by a class
 *  --------------------------
 */

Button
{
    font-name: @primaryFontName;
    font-color: @darkGray;
}

Button_Title
{
    font-name: @primaryFontName;
    font-size: 17;
    font-color: @black;
}

Label
{
    font-name: @primaryFontName;
    font-color: @darkGray;
}

Text_Title
{
    font-name: @primaryFontNameSemibold;
    font-size: 17;
    font-color: @black;
}

Text_Heading1
{
    font-name: @primaryFontNameSemibold;
    font-size: 17;
    font-color: @greyishBrown;
}

Text_Heading1_Lighter
{
    font-name: @primaryFontNameSemibold;
    font-size: 17;
    font-color: @lightGreyishBrown;
}

Text_Heading2
{
    font-name: @primaryFontNameSemibold;
    font-size: 16;
    font-color: @greyishBrown;
}

Text_Heading3
{
    font-name: @primaryFontNameRegular;
    font-size: 15;
    font-color: @greyishBrown;
}

Text_Heading3_Medium
{
    font-name: @primaryFontNameMedium;
    font-size: 15;
    font-color: @greyishBrown;
}

Text_Heading4
{
    font-name: @primaryFontNameRegular;
    font-size: 14;
    font-color: @greyishBrown;
}

Text_Body1
{
    font-name: @primaryFontNameRegular;
    font-size: 16;
    font-color: @warmGray;
}

Text_Body1_greyishBrown
{
    font-name: @primaryFontNameRegular;
    font-size: 16;
    font-color: @greyishBrown;
}

Text_Body1_Yellow
{
    font-name: @primaryFontNameRegular;
    font-size: 16;
    font-color: @sunflowerYellow;
}

Text_Body2
{
    font-name: @primaryFontNameRegular;
    font-size: 15;
    font-color: @warmGray;
}

Text_Body3
{
    font-name: @primaryFontNameRegular;
    font-size: 14;
    font-color: @warmGray;
}

Text_Body3_Light
{
    font-name: @primaryFontNameLight;
    font-size: 14;
    font-color: @warmGray;
}

Text_Body4
{
    font-name: @primaryFontNameRegular;
    font-size: 12;
    font-color: @warmGray;
}

Text_Body4_Lighter
{
    font-name: @primaryFontNameRegular;
    font-size: 12;
    font-color: @lightWarmGray;
}

Text_Body4_Yellow
{
    font-name: @primaryFontNameRegular;
    font-size: 12;
    font-color: @sunflowerYellow;
}


Homepage_Text
{
    font-name: @primaryFontNameRegular;
    font-size: 20;
    font-color: @white;
}

FollowButton
{
    border-color: @sunflowerYellow;
    border-width: 1;
    corner-radius: 4;
    font-name: @primaryFontNameSemibold;
    font-size: 15;
    font-color: @sunflowerYellow;
}

Community_SignInButton
{
    background-color: @sunflowerYellow;
    corner-radius: 5;
    font-name: @primaryFontNameBold;
    font-size: 16;
    font-color: @white;
}

DesignButton
{
    background-color: @sunflowerYellow;
    corner-radius: 5;
    font-name: @primaryFontNameBold;
    font-size: 16;
    font-color: @white;
}

AbortNUILabel
{
    font-color:        nui_abort;
}

WhiteLabel
{
    font-color:         @whiteBackground;
}

LinkButton
{
    font-color:         @lightBlue;
    font-size:          14;
}


TitleAddWishListLabel
{
font-color:         #000000;
font-size:          16;
}

LinkWishListButton
{
font-color:         #004c97;
font-size:          16;
}

LinkButtonWishListIcon
{
font-name:          @primaryIconFontName;
font-color:         #004c97;
font-size:          11;
}

General_LightBlue
{
    background-color:               @oceanBlue;
}


ReadMoreButton
{
    font-color:         @oceanBlue;
}

VerticalSeperator
{
    font-color:         @lighterGray;
    width:              @defaultSeperatorWidth;
}

Separator
{
    background-color:   @lighterGray;
}

webView
{
    background-color:   @backgroundGray;
}


HorizontalSeperator
{
    background-color:   @lightGray;
}

PlainFontIcon
{
    font-name:          @primaryIconFontName;
}

General_TorquiseButton
{
    background-color: @torquise;
    font-color:       @white;
}

General_LightBlueButton
{
    background-color: @lightBlue;
    font-color:       @white;
}

General_BorderView
{
    border-color:       @borderGray;
    border-width:       1;
    corner-radius:      3;
}

General_EmptyNui
{
}

General_LightBlue
{
    background-color:               @oceanBlue;
}

General_WhiteLabel_Bg_Color
{
    background-color:               @torquise;
}

General_WhiteLabel_Text_Color

{
    font-color:             #C2C1C1;
    font-color-selected:    @torquise;
}


/* Menus */

General_MenusIcon
{
    font-color:             @clrMenusIconColor;
    font-color-highlighted: @clrMenusHighlightedIconColor;
    font-color-selected:    @clrMenusSelectionColor;
    font-size:              18;
}

General_MenusButtonSelectionBackground
{
    background-color-highlighted:   @clrMenusSelectionColor;
    background-color-selected:      @clrMenusSelectionColor;
}

General_MenusSelectionBackground
{
    background-color: @clrMenusSelectionColor;
}

General_MenusClickableTextColor
{
    font-color:             @clrMenusClickableTextColor;
    font-color-highlighted: @clrMenusHighlightedTextColor;
    font-color-selected:    @clrMenusSelectionColor;
}

General_MenusNotClickableTextColor
{
    font-color:             @clrMenusNotClickableTextColor;
}

General_MenusBackgroundColor
{
    background-color:             @clrMenusBackgroundColor;
}



/* Dialogs */

General_DialogsIcon
{
    font-color:             @clrDialogsIconColor;
    font-color-disabled:    @clrDialogsIconColor;
    font-color-highlighted: @clrDialogsHighlightedIconColor;
    font-color-selected:    @clrDialogsHighlightedIconColor;
}

General_DialogsButtonSelectionBackground
{
    background-color-highlighted:   @clrDialogsSelectionColor;
    background-color-selected:      @clrDialogsSelectionColor;
}

General_DialogsSelectionBackground
{
    background-color: @clrDialogsSelectionColor;
}

General_DialogsClickableTextColor
{
    font-color:             @clrDialogsClickableTextColor;
    font-color-highlighted: @clrDialogsHighlightedTextColor;
}

General_DialogsNotClickableTextColor
{
    font-color:             @clrDialogsNotClickableTextColor;
    font-color-highlighted: @clrDialogsNotClickableTextColor;
    font-color-selected:    @clrDialogsNotClickableTextColor;
}

General_DialogsBackgroundColor
{
    background-color:             @clrDialogsBackgroundColor;
}




/* Top Bar */


General_TopBarIcon
{
    font-color:             @clrTopBarIconColor;
    font-color-disabled:    @clrTopBarIconColor;
    font-color-highlighted: @clrTopBarHighlightedIconColor;
    font-color-selected:    @clrTopBarHighlightedIconColor;
}

General_TopBarClickableTextColor
{
    font-color:             @clrTopBarClickableTextColor;
    font-color-highlighted: @clrTopBarHighlightedTextColor;
}

General_TopBarNotClickableTextColor
{
    font-color:             @clrTopBarNotClickableTextColor;
}

General_TopBarBackgroundColor
{
    background-color:             @clrTopBarBackgroundColor;
}


/* Gallery Backgrounds */

GalleryItemCard
{
    border-color: #EBEBEB;
    border-width: 0.5;
    corner-radius: 6;
}

General_GalleriesBackgroundColor
{
    background-color:             @clrGalleriesBackgroundColor;
}

/* Cell Backgrounds */

General_CellBackground
{
    background-color:               @clrGalleryCellsBackgroundColor;
}

/* Gallery Labels */

General_GalleryTextLabel
{
    font-color:                     @clrGalleryCellsTextLabel;
}

General_GallerySecondaryTextLabel
{
    font-color:                     @clrGalleryCellsSecondaryTextLabel;
}

General_GalleryArticleGrayText
{
font-color:                     @darkGray;
}

/*
*  --------------------------
*  Home Screen View Controller
*  --------------------------
*/

Home_Screen_General_Icon
{
font-name: @primaryIconFontName;
font-size: 25;
font-color:             @white;
font-color-disabled:    @clrTopBarIconColor;
font-color-highlighted: @clrTopBarHighlightedIconColor;
font-color-selected:    @clrTopBarHighlightedIconColor;
}


Home_Screen_TopBarIcon
{
font-color:             @white;
font-color-disabled:    @clrTopBarIconColor;
font-color-highlighted: @clrTopBarHighlightedIconColor;
font-color-selected:    @clrTopBarHighlightedIconColor;
}

Home_Screen_TopBarClickableTextColor
{
font-color:             @white;
font-color-highlighted: @clrTopBarHighlightedTextColor;
}


/*
 *  --------------------------
 *  Top Bar
 *  --------------------------
 */

menuButton
{
    font-name:              @primaryIconFontName;
    font-size:              25;
    font-color:             @clrTopBarIconColor;
    font-color-selected:    @clrTopBarIconColor;
    width:                  59;
    height:                 52;
    padding:                0 0 0 0;

}

menuBackground
{
    background-color:   @clrMenusBackgroundColor;
}

topBarVerticalSeperator
{
    width:              1;
    font-color:         #b2b2b2;
}

backButton
{
    font-name:      @primaryIconFontName;
    font-color:     @clrTopBarIconColor;
}

topBar_HelpIcon
{
    font-name:      @primaryIconFontName;
    font-size:      18;
    font-color:     @black;
}

topBar_ScrollUpIcon
{
    font-name:      @primaryIconFontName;
    font-color:     @clrTopBarIconColor;
}

/*
 *  --------------------------
 *  Fullscreen View Controller
 *  --------------------------
 */

Fullscreen_redesignButton
{
    background-color:           @clrRedesignButtonBackgroundColor;
}

Fullscreen_redesignButtonLabel
{
    font-size: 18;
    font-color: @clrRedesignButtonTextColor;
}

Fullscreen_redesignButtonLabelIcon
{
    font-size: 18;
    font-name:  @primaryIconFontName;
    font-color: @clrRedesignButtonIconColor;
}

Fullscreen_bottomPanelView
{
    background-color: @whiteBackground;
}

Fullscreen_bottomPanelTextHeadline
{
    font-name:      @primaryIconFontName;
    font-color:     @darkGray;
    text-transform: uppercase;
}

Fullscreen_bottomPanelText
{
    font-color: @darkGray;
}

Fullscreen_bottomPanelTextName
{
    font-color: @lightBlue;
}

Fullscreen_shareButton
{
    font-name:  @primaryIconFontName;
    font-color: @lightGray;
}

Fullscreen_productListButton
{
    font-name:  @primaryIconFontName;
    font-size:  15;
    font-color: @lightBlue;
}

Fullscreen_heartIconLiked
{
    font-name: @primaryIconFontName;
    font-color: @clrHeartButtonPressed;
}

Fullscreen_heartIcon
{
    font-name: @primaryIconFontName;
    font-color: @clrHeartButtonUnpressed;
}

Fullscreen_commentIcon
{
    font-name: @primaryIconFontName;
    font-color: @torquise;
}

Fullscreen_productTagIcon
{
    font-name: @primaryIconFontName;
    font-color: @lightBlue;
}

Fullscreen_numbersText
{
    font-name: @primaryFontName;
    font-size: 12;
    font-color: @darkGray;
}

/*
 *  --------------------------
 *  Catalog
 *  --------------------------
 */

Product_catalog_rootView
{
    background-color:   @backgroundGray;
}

Product_catalog_menuView
{
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
    background-color:   @white;
}

roundImageColor
{
    background-color: @lightBlue;
}

catalogCategoryTitle
{
    font-name:                  @primaryFontName;
    font-color:                 @darkGray;
    font-color-selected:        @torquise;
    font-color-highlighted:     @torquise;
}

CatalogCategoryIcon
{
    font-size: 20;
    font-color: @darkGray;
    font-color-selected: @torquise;
    font-color-highlighted: @torquise;
}

catalogCategory_CategoriesListTitle
{

}

/*
 *  --------------------------
 *  Selected Gallery View Controller
 *  --------------------------
 */

SelectedGallery_shareButton
{
    font-name: @primaryIconFontName;
    font-color: @darkGray;
}

SelectedGallery_shareButtonOnImage
{
    font-color: @white;
}

SelectedGallery_BaseView
{
    border-color: @borderGray;
    border-width: @primaryBorderWidth;
}

SelectedGallery_ArticleTitle
{
    font-name:      @secondaryFontName;
    text-transform: uppercase;
}

SelectedGallery_ArticleDesc
{
    font-name:      @primaryFontName;
    font-size:      14;
}

SelectedGallery_articleOverlayBase
{
    background-color:   RGBA(255,255,255,230);
}

/*
 *  --------------------------
 *  Gallery Stream View Controller
 *  --------------------------
 */
 
GalleryStream_DropDownIcon
{
    font-name:  @primaryIconFontName;
    font-color: @lightBlue;
}
 
GalleryStream_IconButton
{
    font-name:  @primaryIconFontName;
    font-color: @darkGray;
}

GalleryStream_IconButton3DDesigns
{
    font-color-selected: @darkYellow;
}

GalleryStream_IconButton2DDesigns
{
    font-color-selected: @orange;
}

GalleryStream_IconButtonArticles
{
    font-color-selected: @darkGreen;
}

GalleryStream_blueText
{
     font-color: @lightBlue;
     font-size:  15;
}

GalleryStream_SecondMenuView
{
    background-color: #F4F4F4;
}

/*
 *  --------------------------
 *  Gallery Home View Controller
 *  --------------------------
 */
 
GalleryHome_MainButton
{
    font-name: @primaryFontNameRegular;
    font-size: 20;
}

GalleryHome_MainIcons
{
    font-name: @primaryIconFontName;
    font-color: @white;
    font-size: 30;
}

GalleryHome_HelpIcon
{
    font-color: @white;
}

/*
 *  --------------------------
 *  Gallery Menu View Controller
 *  --------------------------
 */

GalleryMenu_SignInLabel
{
    font-name: @primaryFontName;
    font-color: @clrMenusNotClickableTextColor;
    font-size: 14;
}

GalleryMenu_GeneralMenuButton
{
    font-name:              @secondaryFontName;
    font-name-selected:     @secondaryFontName;
    font-color:             #4f4f4f;
    font-color-selected:    nui_abort;
    font-color-highlighted: nui_abort;
    font-size:              13;
    text-shadow-color:      clear;

}

GalleryMenu_MyHomestylerIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_CreateNewDesignIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_3DDesignStreamIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_CatalogIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_PhotoGalleryIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_HomestylerMagazineIcon
{
    font-name: @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_ProfessionalIndexIcon
{
    font-name:                  @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_SendYourFeedbackIcon
{
    font-name:                  @primaryIconFontName;
    font-color:                 #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

GalleryMenu_SettingsIcon
{
    font-name: @primaryIconFontName;
    font-color: #5f5f5f;
    font-color-highlighted:     nui_abort;
    title-insets: 0 0 0 34;
}

MessageCenter_Bubble_label
{
    font-name: @primaryFontNameSemibold;
    font-size: 12;
    font-color: #f6f6f6;
}

/*
 *  --------------------------
 *  Redesign Tool
 *  --------------------------
 */

RedesignTool_Menu
{
    font-name:  @primaryFontName;
    font-color: #5f5f5f;
    font-size:  20;
}

RedesignTool_CatalogIcon
{
    font-name: @primaryIconFontName;
    font-color: #5f5f5f;
    font-size:  20;
}

RedesignTool_CatalogText
{
    font-color: @darkGray;
    font-size:  14;
}

RedesignTool_MenuIcon
{
    font-name: @primaryIconFontName;
    font-color: @darkGray;
}

RedesignTool_MenuIconRealScale
{
    font-name: @primaryIconFontName;
    font-size: 18;
    font-color: @darkGray;
}

RedesignTool_MenuIconDelete
{
    font-name: @primaryIconFontName;
    font-size: 18;
    font-color: @darkGray;
}

RedesignTool_MenuIconSave
{
    font-name: @primaryIconFontName;
    font-size: 18;
    font-color: @darkGray;
}

redesignToolTitles
{
    font-size: 10;
    font-color:@darkGray;
}

SwitchButton_Pressed
{
    font-color:         @commentGray;
    font-size:          14;
}

SwitchButton_Icon
{
    font-name: @primaryIconFontName;
    font-size: 16;
    font-color: @lightGray;
    title-insets: 0 0 0 10;
}

RedesignTool_ConcealDoneIcon
{
    font-name: @primaryIconFontName;
    font-color: @lightBlue;
    font-size: 12;
}

RedesignTool_ConcealCancelIcon
{
    font-name: @primaryIconFontName;
    font-color: @lightBlue;
    font-size: 12;
}

RedesignTool_UndoRedoIcon
{
    font-name: @primaryIconFontName;
    font-color: @lightBlue;
    font-color-disabled: @gray;
}

RedesignTool_2D3DIcons
{
    font-color:             @lightGray;
    font-color-highlighted: @lightBlue;
    font-color-selected:    @lightBlue;
    font-size:              14;
}

RedesignTool_Arrows
{
    font-name:              @primaryIconFontName;
    font-color:             @torquise;
    font-size:              18;
}

RedesignTool_TagViewIcon
{
    font-name: @primaryIconFontName;
    font-size: 20;
    font-color: @grey2;
    font-color-disabled:        @lighterGray;
    title-insets: 7 0 0 34;
}

RedesignTool_TagViewLabel
{
    font-name: @primaryFontNameRegular;
    font-size: 16;
    font-color: @grey2;
    font-color-disabled:        @lighterGray;
    title-insets: 7 0 0 74;
}

RedesignTool_SaveDesignButtonOther
{
    font-name:                      @primaryFontNameRegular;
    font-size:                      14;
    font-color:                     @darkGray;
    background-color:               @lighterGray;
}

RedesignTool_SaveDesignButtonYes
{
    font-name:                      @primaryFontNameRegular;
    font-size:                      14;
    font-color:                     @white;
    background-color:               @torquise;
}

RedesignTool_SaveDesignTitle
{
    font-name:          @primaryFontNameRegular;
    font-size:          17;
    font-color:         @lightGray;
}

/*Part of white label feature*/
RedesignTool_ClickableText
{
    font-color-highlighted: nui_abort;
}

RedesignTool_GeneralIcon
{
    font-name:              @primaryIconFontName;
    font-color-highlighted: nui_abort;
}

RedesignTool_BrightnessIconFonr
{
    font-name:              @primaryIconFontName;
    font-color:             @darkGray;
}

/*
 *  --------------------------
 *  Product Tag
 *  --------------------------
 */
ProductTagView
{
    background-color: @whiteBackground;
}


/*
 *  --------------------------
 *  Discussion View Controller
 *  --------------------------
 */

Discussion_CommentTopBar
{
    background-color: @whiteBackground;
}

Discussion_CommentTopBarIcon
{
    font-name: @primaryIconFontName;
    font-color: @torquise;
}

Discussion_CloseButtonIcon
{
    font-name: @primaryIconFontName;
    font-color: @darkGray;
}

/*
 *  --------------------------
 *  Product List View Controller
 *  --------------------------
 */

ProductList_BaseView
{
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
    background-color:   @whiteBackground;
}

ProductList_HeaderView
{
    background-color:   @whiteBackground;
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
}

ProductList_ShareButton
{
    font-name:  @primaryIconFontName;
    font-color: @darkGray;
}

ProductList_ProductImage
{
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
}

ProductList_CloseButton
{
    font-size: 14;
}

ProductList_GoToWebsiteButton
{
    font-color: @torquise;
    font-color-highlighted: nui_abort;
}

/*
 *  --------------------------
 *  CommentCell XIB's
 *  --------------------------
 */
 
CommentCell_WriteCommentIcon
{
    font-color:     @torquise;
    font-name:      @primaryIconFontName;
    font-size:      17;
}

CommentCell_WriteCommentButton
{
    font-color:                     @torquise;
    font-size:                      14;
    text-transform:                 underline;
    text-transform-selected:        none;
    text-transform-highlighted:     none;
}

CommentCell_InputTextView
{
    background-color:   @whiteBackground;
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
}

CommentCell_PostButton
{
    background-color: @torquise;
}

CommentCell_Name
{
    font-color: @torquise;
    font-size: 15;
}

CommentCell_CellBase
{
    background-color: @whiteBackground;
}

CommentCell_ReplyButton
{
    font-color:                     @torquise;
    text-transform:                 underline;
    text-transform-selected:        none;
    text-transform-highlighted:     none;
}

CommentCell_ReplyButtonIcon
{
    font-color:     @torquise;
    font-name:      @primaryIconFontName;
    font-size:      15;
}

CommentCell_PostButton
{
    background-color: @torquise;
    font-color:       @white;
}

/*
 *  --------------------------
 *  New Design Popup View Controller
 *  --------------------------
 */
newDesignPopup_Text
{
    font-size:      15;
    text-transform: uppercase;
}

newDesignPopup_Icons
{
    font-color:                 @torquise;
    font-name:                  @primaryIconFontName;
}

NewDesignPopup_Seperator
{
    background-color: @lighterGray;
}

newDesignPopup_BottomHelpText
{
    font-size:                  13;
    font-color:                 @lightBlue;
}

/*
 *  --------------------------
 *  Profile Page
 *  --------------------------
 */

ProfileLikesToast_Text
{
    font-name: @primaryFontNameRegular;
    font-size: 15;
    font-color: #B34C2C;
}

ProfileLikesToast_Text_NoLikes
{
    font-name: @primaryFontNameSemibold;
    font-size: 16;
    font-color: #799AA8;
}

ProfileLikesToast_OKButton
{
    background-color: @sunflowerYellow;
    background-color-highlighted: #FCC106;
    corner-radius: 15;
    font-name: @primaryFontNameRegular;
    font-size: 17;
    font-color: #B34C2C;
}

ProfileLikesToast_OKButton_NoLikes
{
    background-color: #799AA8;
    background-color-highlighted: #98B9C7;
    corner-radius: 15;
    font-name: @primaryFontNameBold;
    font-size: 17;
    font-color: @white;
}

EditDesign_EditIcon
{
    font-name:                      @primaryIconFontName;
    font-size:                      26;
    font-color:                     @lightBlue;
    title-insets:                   0 0 0 6;
}

ProfileMenuView
{
    background-color:               @whiteBackground;
    border-color:                   @borderGray;
    border-width:                   @primaryBorderWidth;
}

Profile_Section_Title
{
    font-color:                     @lightBlue;
    font-color-highlighted:         @torquise;
}

Profile_NameLabel
{
    font-size:                      24;
    font-color:                     @black;
}

Profile_Section_Title_Count
{
    font-color-highlighted:         @torquise;
}

Profile_NavBarBottomBorder
{
    background-color:               @borderGray;
}

Profile_EditProfileButton
{
    background-color:               @clrEditProfileButtonBackgroundColor;
    font-color:                     @clrEditProfileButtonTextColor;
}

Profile_FindFriendsButton
{
    background-color:               @clrFindFriendsButtonBackgroundColor;
    font-color:                     @clrFindFriendsButtonTextColor;
}

EditProfile_button
{
    background-color:               @torquise;
    background-image-highlighted:   @darkTorquise;
    background-image-selected:      @darkTorquise;
    font-color:                     @white;
}

FindFriends_button
{
    background-color:               @oceanBlue;
    font-color:                     @white;
}

ProfileMenu_Label
{
    font-color: @darkGray;
    font-color-selected: @torquise;
    font-color-highlighted: @torquise;
}

ProfileCell_Icon
{
    font-name:                      @primaryIconFontName;
    font-size:                      17;
    font-color: @darkGray;
    font-color-selected: @torquise;
    font-color-highlighted: @torquise;
}

GenderSelection_SegmentedControl
{
    background-tint-color:          @dimGray;
    font-color:                     @black;
}

GenderSelection_SegmentedControlForIOS6
{
    font-color:                     @black;
    font-color-selected:            @white;
}

EditProfile_ClickableText
{
    font-color:                     @lightBlue;
}

EditProfile_SignOut_Button
{
    font-color:                     @lightBlue;
}

EditProfileview
{
    background-color:               @whiteBackground;
    border-color:                   @borderGray;
    border-width:                   @primaryBorderWidth;
}

EditProfile_DoneButton
{
    background-color:               @oceanBlue;
    font-color:                     @whiteBackground;
}

EditProfile_CancelButton 
{
    background-color:               @gray;
    font-color:                     @whiteBackground;
}

EditProfile_TextViewBackgroundImage
{
    border-color:                   @strokeGray;
    border-width:                   @primaryBorderWidth;
}

EditProfile_CameraIcon
{
    font-name:                      @primaryIconFontName;
    font-size:                      45;
    font-color:                     @lightBlue;
}

ProfileSummary_WebsiteTitle
{
    font-color:                     @darkTorquise;
    title-insets: 0 0 0 34;
}

ProfileSummary_CellIcon
{
    font-name:                      @primaryIconFontName;
    font-color:                     @darkTorquise;
    font-size:                      25;
}

ProfileSummary_IconLabel
{
    font-size:                      14;
    font-color:                     @lightGray;
    title-insets: 0 0 0 34;
}

ProfileSummary_TitleLabel
{
    font-name:                      @primaryFontNameRegular;
    font-color:                     @darkerGray;
    font-size:                      14;
}

ProfileSummary_ValueLabel
{
    font-name:                      @primaryFontNameRegular;
    font-color:                     @lightGray;
    font-size:                      14;
}

ProfileSummary_FullNameTitleLabel
{
    font-name:                      @primaryFontNameRegular;
    font-color:                     @darkerGray;
    font-size:                      20;
}



profile_article_title
{
    font-size:                      20;
    font-color:                     @darkerGray;
    text-transform:                 uppercase;
}

profile_article_heart_icon

{
    font-name: @primaryIconFontName;
    font-size: 25;
    font-color: @clrHeartButtonUnpressed;
}

profile_article_heart_icon_liked

{
    font-name: @primaryIconFontName;
    font-size: 25;
    font-color: @clrHeartButtonPressed;
}

/*
 *  --------------------------
 *  Find Friends View Controller
 *  --------------------------
 */
 
FindFriends_CloseButton
{
    font-name:                      @primaryIconFontName;
    font-color:                     @oceanBlue;
    font-size:                      14;
}

FindFriends_TextField
{
    background-color:               @whiteBackground;
    border-color:                   @borderGray;
    border-width:                   @primaryBorderWidth;
    padding:                        0 0 0 21;
}

FindFriends_FindButton
{
    font-color:                     @darkGray;
    title-insets:                   0 0 0 85;
    font-size:                      14;
    font-name:                      @primaryFontNameRegular;
}

FindFriends_FacebookIcon
{
    font-color:                     @oceanBlue;
    font-size:                      40;
    title-insets:                   0 0 0 27;
    font-name:                      @primaryIconFontName;
}

FindFriends_ContactIcon
{
    font-color:                     @darkOrange;
    font-size:                      28;
    title-insets:                   0 0 0 35;
    font-name:                      @primaryIconFontName;
}

FindFriends_NameOrEmailIcon
{
    font-color:                     @torquise;
    font-size:                      28;
    title-insets:                   0 0 0 35;
    font-name:                      @primaryIconFontName;
}

FindFriends_Separator 
{
    background-color:               @lighterGray;
}

FindFriends_ResultCell_SeparationLine
{
    background-color:               @separationGray;
}

FindFriends_ResultCell_FollowButton
{
    background-color:               @oceanBlue;
    font-color:                     @whiteBackground;
    font-size:                      14;
    font-name:                      @primaryFontNameRegular;
}

FindFriends_ResultCell_InviteButton
{
    background-color:               @torquise;
    font-color:                     @whiteBackground;
    font-size:                      14;
    font-name:                      @primaryFontNameRegular;
}

FindFriends_ResultCell_FollowingButton
{
    background-color:               @whiteBackground;
    font-color:                     @torquise;
    font-size:                      14;
    font-name:                      @primaryFontNameRegular;
    title-insets:                   0 0 0 19;
}

FindFriends_ResultCell_FollowingIcon
{
    background-color:               @whiteBackground;
    font-color:                     @torquise;
    font-size:                      25;
    font-name:                      @primaryIconFontName;
}


/*
 *  --------------------------
 *  Settings View Controller
 *  --------------------------
 */
 
Settings_topBar
{
    background-color:               @whiteBackground;
    border-color:                   @borderGray;
    border-width:                   @primaryBorderWidth;
    height:                         58;
}

Settings_DefaultButton
{
    font-color:     @torquise;
    font-size:      14;
}

Settings_DynamicButton
{
    font-color:     @lightGray;
    font-size:      14;
}

/*
 *  --------------------------
 *  Login View Controllers
 *  --------------------------
 */

Login_topBar
{
    height:                         51;
}

LoginBackButton
{
font-name:      @primaryIconFontName;
font-color:     @white;
padding:        1 50 0 0;
}


Login_LogInButton
{
    font-color:                     @white;
    font-size:                      15;
    background-color:           RGBA(0,0,0,30);
    border-color:               RGBA(255,255,255,50);
    border-width:               1;
}

Login_LoginIcon
{
    font-color:     @white;
    font-name:      @primaryIconFontName;
    font-size:      22;
    title-insets:   0 0 0 20;
}

Login_LoginIconFacebook
{
    font-color:     @white;
}

Login_LoginIcon_Email
{
    font-color:         @white;
    font-name:          @primaryIconFontName;
    padding:            0 0 0 20;
    background-color:   RGBA(46,46,46,88);
    border-color:       RGBA(244,244,244,50);
    border-width:       1;
}

Login_LoginText
{
    font-color:             @white;
    font-size:              16;
    border-color:           @borderGray;
    title-insets:           0 0 0 15;
}

Login_TextViewInput
{
    font-size:                      13;
    font-color:                     #2d2d2d;
    border-color:                   RGBA(255,255,255,80);
    border-width:                   1;
    padding:                        0 0 0 15;
}

Login_ForgotPasswordText
{
    font-color:                     @white;
    font-size:                      14;
}

Login_ForgotPasswordLine
{
    font-color:                     @whiteBackground;
    title-insets:                   14 0 0 40;
}

Login_ChangePasswordTextField
{
    border-color:                   @borderGray;
    padding:                        0 0 0 12;
}

Login_ChangePassword_CancelButton
{
    font-color:                     @oceanBlue;
    font-color-highlighted:         @darkerBlue;
}

Login_ChangePassword_DoneButton
{
    font-color:                     @whiteBackground;
    background-color:               @torquise;
}

Login_ChangePassword_ErrorLabel
{
    font-color:                     @errorRed;
    font-size:                      16;
}

Login_ErrorText
{
    font-color:                     #ff6d6d;
    font-size:                      12;
}

/*
 *  --------------------------
 *  Professional Controllers
 *  --------------------------
 */

ProffesionalPage_Name
{
    font-name:              @primaryFontName;
    text-transform:         uppercase;
    font-color:             @black;
}

Proffesional_ProjectBaseView
{
    background-color:       @whiteBackground;
    border-color:           @borderGray;
    border-width:           @primaryBorderWidth;
}

ProfessionalsPage_DetailsBaseView
{
    border-color:           @borderGray;
    border-width:           @primaryBorderWidth;
}

ProfessionalsPage_PromoBaseView
{
    background-color:       @whiteBackground;
}

ProfessionalsPage_heartIcon
{
    font-name:  @primaryIconFontName;
    font-color: @clrHeartButtonUnpressed;
}

ProfessionalsPage_heartIconLiked
{
    font-name:  @primaryIconFontName;
    font-color: @clrHeartButtonPressed;
}

ProfessionalsPage_linkLabel
{
    font-name: @primaryFontName;
    font-color: @oceanBlue;
}

ProfessionalsIndex_Background
{
    background-color:       #FAFAFA;
}

ProfessionalsIndex_CellLabel
{
    font-size: 14;
    font-name: @primaryFontName;
}

ProfessionalsIndex_CellDescription
{
    font-color: @lightGray;
    font-size: 17;
    font-name: @primaryFontName;
}

ProfessionalsIndex_ViewProtfolioButton
{
    font-color: @oceanBlue;
    font-size: 12;
    font-name: @primaryFontName;
    title-insets: 0 0 0 30;
}

ProfessionalsIndex_Titles
{
    font-color: @oceanBlue;
    font-size: 13;
    font-name: @primaryFontName;
}

ProfessionalsIndex_ViewProtfolioButtonIcon
{
    font-color: @oceanBlue;
    font-size: 20;
    font-name: @primaryIconFontName;
}

ProfessionalsIndex_DropDownIcon
{
    font-color: @oceanBlue;
    font-size: 10;
    font-name: @primaryIconFontName;
}


/*
 *  --------------------------
 *  Activities - News Stream
 *  --------------------------
 */
 
ActivityGeneral_HeartIcon
{
    font-name: @primaryIconFontName;
    font-color: @clrHeartButtonUnpressed;

}

ActivityGeneral_HeartIconLiked
{
    font-name: @primaryIconFontName;
    font-color: @clrHeartButtonPressed;

}

ActivityGeneral_CommentIcon
{
    font-name: @primaryIconFontName;
    font-color: @torquise;
}

ActivityGeneral_ActivityIcon
{
    font-name: @primaryIconFontName;
    font-color: @lightGray;
}

ActivityNewArticle_BookIcon
{
    font-name: @primaryIconFontName;
    font-color: @iconGray;
    font-size: 36;
}

ActivityNewArticle_LikeIcon
{
    font-name: @primaryIconFontName;
    font-color: @clrHeartButtonUnpressed;
    font-size: 36;
}

ActivityNewFollower_FollowButton
{
    background-color:               @oceanBlue;
    background-color-highlighted:   @darkGray;

    font-name:                      @primaryFontNameRegular;
    font-color:                     @white;
    font-color-highlighted:         @white;
    font-size:                      15;
}

ActivityFeatured_CrownIcon
{
    font-name: @primaryIconFontName;
    font-color: @darkYellow;
    font-size: 26;
}

ActivityNewArticle_CommentText
{
    font-color: @darkGray;
}

/*
 *  --------------------------------
 *  Profile - Followed Professionals
 *  --------------------------------
 */

FollowedProfessionals_ProfessionalHeader
{
    font-name:          @primaryFontNameBold;
    font-color:         @darkGray;
    font-size:          14;
}

FollowedProfessionals_ProfessionalText
{
    font-name:          @primaryFontNameRegular;
    font-color:         @darkGray;
    font-size:          13;
}

FollowedProfessionals_ViewProtfolioLabel
{
    font-name:          @primaryFontName;
    font-color:         @oceanBlue;
    font-size:          11;
}

FollowedProfessionals_ViewProtfolioIcon
{
    font-name:          @primaryIconFontName;
    font-color:         @oceanBlue;
    font-size:          15;
}

/*
 *  --------------------------------
 *  Profile - My Designs
 *  --------------------------------
 */
 
MyDesigns_LikeButton
{
    font-name:          @primaryIconFontName;
    font-color:         @clrHeartButtonUnpressed;
    font-size:          21;
}

MyDesigns_LikeButtonLiked
{
    font-name:          @primaryIconFontName;
    font-color:         @clrHeartButtonPressed;
    font-size:          21;
}

MyDesigns_CommentButton
{
    font-name:          @primaryIconFontName;
    font-color:         @torquise;
    font-size:          21;
}

MyDesigns_RedesignButton
{
    font-name:          @primaryIconFontName;
    background-color:   @torquise;
    font-size:          25;
}

/*
 *  --------------------------------
 *  Profile - Following
 *  --------------------------------
 */
 
Following_FollowLabel
{
    font-name:          @primaryFontNameRegular;
    font-color:         @oceanBlue;
    font-size:          13;
}

Following_FollowIcon
{
    font-name:          @primaryIconFontName;
    font-color:         @oceanBlue;
    font-size:          15;
}

TakePictureOverlay_Text
{
    font-color:         @white;
}

TakePictureOverlay_CameraButton
{
    font-name:          @primaryIconFontName;
    font-color:         @white;
    background-color:   @darkTorquise;
}

/*
 *  --------------------------
 *  Save Design View Controller
 *  --------------------------
 */
 
SaveDesign_Separator
{
    background-color:   @lighterGray;
}
 
SaveDesign_CancelButton 
{
    font-color:                 @oceanBlue;
    font-size:                  14;
    font-name:                  @primaryFontNameRegular;
    font-color-highlighted:     @darkerBlue;
}

SaveDesign_SaveButton
{
    background-color:   @torquise;
    font-color:         @white;
    font-size:          14;
    font-name:          @primaryFontNameRegular;
}

SaveDesign_DesignTitleTextField
{
    background-color:   @white;
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
    padding:            0 0 0 11;
}

SaveDesign_DescriptionTextView
{
    background-color:   @white;
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
    padding:            0 0 0 20;
}

SaveDesign_RoomTypeButton
{
    font-size:          14;
    font-name:          @primaryIconFontName;
    font-color:         @oceanBlue;
}

SaveDesign_RoomTypeTitle
{
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    font-color:         @oceanBlue;
}

SaveDesign_ErrorLabel
{
}

SaveDesign_BackIcon
{
    font-name:          @primaryIconFontName;
    font-color:         @lightBlue;
}

/*
 *  --------------------------
 *  Share Your Design View Controllers
 *  --------------------------
 */
 
SharYourDesign_ConfirmationButton
{
    background-color:   @torquise;
    font-color:         @white;
    font-size:          14;
    font-name:          @primaryFontNameRegular;
}

SharYourDesign_SelectedEffectBorder
{
    border-color:       @borderTorquise;
    border-width:       3;
}

SharYourDesign_SelectedEffectText
{
    font-color:         @white;
}

SharYourDesign_DescriptionTextView
{
    font-color:         @darkGray;
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    border-color:       @borderGray;
    border-width:       @primaryBorderWidth;
}

SharYourDesign_ImageBackgroundView
{
    background-color: #F7F7F7;
}

SharYourDesign_ShareIcon
{
    font-name:                  @primaryIconFontName;
    font-size:                  25;
    font-color:                 @iconGray;
    font-color-disabled:        @iconGray;
    font-color-highlighted:     @torquise;
    font-color-selected:        @torquise;
}

SharYourDesign_TopBarButton
{
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    font-color:         @oceanBlue;
}

LightGreyBorder
{
    border-color:       @lighterGray;
    border-width:       1.0;
}



/*
 *  --------------------------
 *  Measure View Controllers
 *  --------------------------
 */

Measure_CmFtSwitchBase
{
    background-color:   @white;
    border-color:       @borderGray;
    border-width:       1;
    corner-radius:      3;
}

Measure_RulerIcon
{
    font-size:          45;
    font-name:          @primaryIconFontName;
    font-color:         @white;
}

RedesignBottomTool_BaseView
{
    background-color:   @white;
    height:             59;
}

RedesignBottomTool_ButtonText
{
    font-size:          14;
    font-name:          @primaryFontNameRegular;
    font-color:         @oceanBlue;
}

RedesignBottomTool_ButtonIcon
{
    font-size:          14;
    font-name:          @primaryIconFontName;
    font-color:         @oceanBlue;
}

RedesignBottomTool_NotClickableText
{
    font-color:         nui_abort;
}


/*
 *  --------------------------------
 *  SinglePaletteColor View Controller
 *  --------------------------------
 */

SinglePaletteColor_BackgroundView
{
    border-color:           @borderGray;
    border-width:           @primaryBorderWidth;
    corner-radius:          3;
}

SinglePaletteViewController_PaletteNameLabel
{
    font-color:             @white;
    font-name:              @primaryFontNameRegular;
}

SinglePaletteViewController_PaletteNameView
{
    background-color:       @torquise;
}

/*
 *  --------------------------------
 *  PaintViewController View Controller
 *  --------------------------------
 */

PaintViewController_CategoryPickerBackground
{
    background-color:               @white;
    background-color-selected:      @torquise;
    background-color-highlighted:   @torquise;
    font-color:                     @darkGray;
    font-color-selected:            @white;
    font-color-highlighted:         @white;
}

PaintViewController_CategoryPickerIcon
{
    font-name:              @primaryIconFontName;
    font-color:             @darkGray;
    font-color-selected:    @white;
    font-color-highlighted: @white;
    font-size:              15;
    title-insets:           0 0 0 10;
}

PaintViewController_websiteLink
{
    font-color:             @oceanBlue;
    font-size:              15;
}

Paint_Seperator
{
    background-color:   @lighterGray;
}

Paint_UndoRedoIcon
{
    font-name:              @primaryIconFontName;
    font-color:             @white;
    font-color-selected:    @white;
    font-color-highlighted: @lightGray;
    font-size:              34;
}

Paint_EffectsIcons
{
    font-name:              @primaryIconFontName;
    font-size:              20;
    font-color:             @lightGray;
    font-color-selected:    @torquise;
}

Paint_PaintTogglesBaseView
{
    background-color:   @white;
    border-color:       @borderGray;
    border-width:       1;
    corner-radius:      3;
}

Paint_PaintTypeToggleIcon
{
    font-color-selected:     @fadedRed;
}

Paint_LineTypeToggleIcon
{
     font-color-selected:             @orange;
}

Paint_FreeTypeToggleIcon
{
     font-color-selected:             @torquise;
}

/*
 *  --------------------------------
 *  StyleRoom View Controller
 *  --------------------------------
 */

StyleRoom_Button
{
    font-name:          @primaryFontName;
    font-color:         @darkGray;
}

StyleRoom_ButtonIcon
{
    font-size:          17;
    font-name:          @primaryIconFontName;
    font-color:         @lightGray;
}

StyleRoom_WallsIcon
{
font-size:          21;
font-name:          @primaryIconFontName;
font-color:         @darkGray;
}

/*
 *  --------------------------------
 *  Paint Slider View Controller
 *  --------------------------------
 */

PaintSlider_RightIcon
{
    font-name:          @primaryIconFontName;
    font-color:         @oceanBlue;
}

/*
 *  --------------------------
 *  Progress Popup - Loading Indicator
 *  --------------------------
 */
 
ProgressPopupLabels
{
    font-size:          15;
    font-name:          @primaryFontNameRegular;
    text-transform:     uppercase;
}

/*
 *  --------------------------------
 *  Web View Controller
 *  --------------------------------
 */
 
WebView_TopBarIcon
{
    font-color: @darkGray;
    font-color-disabled: @lighterGray;
    font-color-highlighted: nui_abort;
    font-name: @primaryIconFontName;
    font-size: 20;
}

WebView_RefreshIcon
{
    font-size: 23;
}

WebView_BackButton
{
    font-name: @primaryIconFontName;
    font-color: @clrTopBarIconColor;
}

WishListButton
{
    font-name:              @secondaryFontName;
    font-color:             #004C97;
    font-color-highlighted: #004C97;
    font-size:              16;
}

WishListButtonIcon
{
    font-name:  @primaryIconFontName;
    font-color: #004C97;
    font-size:  16;
}

CatalogButtonIcon
{
font-name:  @primaryIconFontName;
font-color: #004C97;
font-size:  19;
}
