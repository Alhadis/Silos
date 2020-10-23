//TYPE FACE
@PRIMARYFONT: HelveticaNeue-Light;
@BOLDFONT: Helvetica;

//PRIMARY APP COLOR
@PRIMARYCOLOR:#fd4e34; //Effect Navigation Bar & Button Color & TableViewSelected
@PRIMARYCOLOR_BOLD:#d73f41; //Effect UIBarButtonItem
@OTHER_COLOR:#ffffff;
@OTHER_COLOR_2:#cccccc; //Use in search background

//Special View Color
@OUT_OF_STOCK_BTN_COLOR:#f22000;
@ADD_TO_CART_BTN_COLOR:#82E700;
@SALES_BADGE_COLOR:#f22000;

@NOTIFICATION_BACKGROUND_COLOR:#00a5ff;

//TYPE FACE COLOR
@DARK_BACKGROUND_FONT_COLOR:#FFFFFF;
@LIGHT_BACKGROUND_FONT_COLOR:#555555;
@HIGHLIGHTED_FONT_COLOR:#FFFFFF;
@OTHER_FONT_COLOR:#888888; //Primary Use in Disable Button or and other unfunctional

@primaryBorderWidth: 0.5;

/*right swipe */

Notification_title_lbl{
font-name: @PRIMARYFONT;
    font-color: @HIGHLIGHTED_FONT_COLOR;
    font-size: 20;

}

Notification_content_lbl{
font-name: @PRIMARYFONT;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-size: 14;

}

Notification_ago_lbl{
font-name: @BOLDFONT;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-size: 12;

}



/* SimpleNotification View */
BaseView{

    background-color: @NOTIFICATION_BACKGROUND_COLOR;
    

}

BaseView_label{
    font-name: @PRIMARYFONT;
    font-color: @HIGHLIGHTED_FONT_COLOR;
    font-size: 13;
    text-shadow-color: clear;

}


/* Top Bar */
BarButton {
    background-color: @PRIMARYCOLOR_BOLD;
    background-color-highlighted: @PRIMARYCOLOR_BOLD;
    border-color: @PRIMARYCOLOR_BOLD;
    border-width: @primaryBorderWidth;
    font-name: @BOLDFONT;
    font-color-highlighted:@HIGHLIGHTED_FONT_COLOR;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-color-disabled: @OTHER_FONT_COLOR;
    font-size: 13;
    text-shadow-color: clear;
}
Button {
 


   
    font-name: @PRIMARYFONT;
    
   
    
}

TableCell {
    background-color-top: @OTHER_COLOR;
    background-color-bottom: @OTHER_COLOR;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 17;
    font-color-highlighted: @HIGHLIGHTED_FONT_COLOR;
    background-color-top-selected: @PRIMARYCOLOR;
    background-color-bottom-selected: @PRIMARYCOLOR;
}
TableCellDetail {
    font-name: @PRIMARYFONT;
    font-size: 14;
    font-color: @OTHER_FONT_COLOR;
}







outOfStockBtn { 
 
    background-color: @OUT_OF_STOCK_BTN_COLOR;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 18;
    border-color: #B43B2E;
    border-width: @primaryBorderWidth;
    font-color: #FFFFFF;
    font-color-highlighted: @HIGHLIGHTED_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 18;
}

addToCartBtn { 
 
    background-color: @ADD_TO_CART_BTN_COLOR;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 18;
    border-color: #2D9900;
    border-width: @primaryBorderWidth;
    font-color: #FFFFFF;
    font-color-highlighted: @HIGHLIGHTED_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 18;
}

inventory { //To Change Bacground Button Color. Please go to ProductDetailBox.m and find addToCartBtn
 
    
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 12;
    
   
    
}

productYouMayLikeHeader { 
 
    
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 14;
    
   
    
}

productYouMayLikeItemTitle { 
 
    
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 9;
    
   
    
}


productYouMayLikeScrollViewHolder {
   
}

OnSaleBadge{
    background-color: @SALES_BADGE_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 18;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;

}

OnSaleBadgeSmall{
    background-color: @SALES_BADGE_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 9;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;

}


TopTabBarColor{
  
    background-color: @OTHER_COLOR;
     background-color-highlighted: #CCCCCC;
}


TopTabButton{
  
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-color-selected: #ffffff;
}


TopTabBarMovementButton{
  font-name: @PRIMARYFONT;
background-color: @PRIMARYCOLOR;
corner-radius: 0;
}


readMoreDeascription {
//Please Change in ReadMoreViewController.m in LoadHtmlString CSS

}

UiBarButtonItem {
   
   background-color: @PRIMARYCOLOR_BOLD;
    border-color: @PRIMARYCOLOR_BOLD;
    border-width: @primaryBorderWidth;
    font-name: @BOLDFONT;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-color-disabled: @OTHER_FONT_COLOR;
    font-size: 13;
    text-shadow-color: clear;
    corner-radius: 0;
 
}
    
   

SmallButton {
    height: 24;
    font-size: 14;
    corner-radius: 5;
}
Label {
    font-name: @PRIMARYFONT;
    font-size: 20;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
}

ProductYouMayLikeHeaderText {
    font-name: @PRIMARYFONT;
    font-size: 15;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    
}

DropDownMenu {
    font-name: @PRIMARYFONT;
    font-size: 12;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    
}

ReviewHeaderUsername {
    font-name: @BOLDFONT;
    font-size: 16;
    font-color: #000000;
    
}

TextView {
    font-name: @PRIMARYFONT;
    font-size: 14;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
}

sendBtnClass{
 font-name: @PRIMARYFONT;
    font-color: @DARK_BACKGROUND_FONT_COLOR;

}

cancelBtnClass{
 font-name: @PRIMARYFONT;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;

}

titleComposeClass{
 font-name: @PRIMARYFONT;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-size: 16;

}

productReviewFollowBtn{
 font-name: @PRIMARYFONT;
    font-color: @PRIMARYCOLOR_BOLD;
    font-size: 12;
    text-align:center;

}

dragStarLbl{
 font-name: @PRIMARYFONT;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-size: 14;

}

LargeLabel {
    font-size: 24;
}
SmallLabel {
    font-size: 15;
}

BoxTitleLabel {
    font-name: @PRIMARYFONT;
    font-size: 15;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
}

BoxPriceLabel {
    font-name: @BOLDFONT;
    font-size: 12;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
}

SmallBoxTitleLabel {
    font-name: @PRIMARYFONT;
    font-size: 9;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
    text-align:left;
}

SmallBoxPriceLabelOnSale {
    /* Please Change Manually at PhotoBox.m and find this ID*/
}

SmallBoxPriceLabelNormal {
    /* Please Change Manually at PhotoBox.m and find this ID*/
}

SmallBoxPriceLabelNormalProductMayLike {
    /* Please Change Manually at PhotoBox.m and find this ID*/
    background-color: #000000;
}

NavigationBar {
   background-color-top: @PRIMARYCOLOR;

    background-color-bottom: @PRIMARYCOLOR;
    font-name: @PRIMARYFONT;
    font-size: 22;
    font-color: #FFFFFF;
    text-shadow-color: clear;
}

Toolbar{
 background-color: @PRIMARYCOLOR;
   }
   
   PhotoBrowserToolBar{

   }

SearchBar {
    background-color-top: @OTHER_COLOR_2;
    background-color-bottom: @OTHER_COLOR_2;

}
SegmentedControl {
    background-color: @PRIMARYCOLOR;
    background-color-selected: @PRIMARYCOLOR_BOLD;
    border-color: @PRIMARYCOLOR_BOLD;
    border-width: @primaryBorderWidth;
    corner-radius: 7;
    font-name: @PRIMARYFONT;
    font-size: 13;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @OTHER_COLOR;
}
TabBar {
    background-color: #000000;
    font-name: @PRIMARYFONT;
   
    
}
postBoxTitle {
    font-name: @BOLDFONT;
    font-size: 12;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
    text-align:left;
}

postBoxUsernameTitle{
    font-name: @BOLDFONT;
    font-size: 14;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
    text-align:left;
}

postBoxAgoTitle {
    font-name: @PRIMARYFONT;
    font-size: 9;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
    text-align:right;
}

TabBarItem {
    font-name: @PRIMARYFONT;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-size: 18;
    text-offset: 0,-11;
}

TextField {
    height: 37;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 17;
    background-color: #FFFFFF;
    border-style: none;
    border-color: #cccccc;
    border-width: 1;
    corner-radius: 7;
    padding: 7;
    vertical-align: center;
}


TextFieldDisable {
    height: 37;
    font-color: @OTHER_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 17;
    background-color: #cccccc;
    border-style: none;
    border-color: #cccccc;
    border-width: 1;
    corner-radius: 7;
    padding: 7;
    vertical-align: center;
}


AddCouponTextField {
    height: 40;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 17;
    background-color: #FFFFFF;
   
    padding: 7;
    vertical-align: center;
}

profileLoggedProfileImg {
    corner-radius: 40;
    border-color: #cccccc;
     border-width: 1;
}

profileLoggedLbl {
    font-name: @PRIMARYFONT;
    font-size: 15;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-align: center;
}

profileLoggedLbl2 {
    font-name: @PRIMARYFONT;
    font-size: 17;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR:;
    text-align: left;
}

profileLoggedUsername {
    font-name: @BOLDFONT;
    font-size: 17;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    text-align: left;
}

LargeButton {
    background-color: @PRIMARYCOLOR;
  background-color-highlighted: @PRIMARYCOLOR_BOLD;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-color-highlighted: @HIGHLIGHTED_FONT_COLOR;
    font-name: @PRIMARYFONT;
    font-size: 17;
    height: 37;
    corner-radius: 7;
    padding: 7;

}

CommentLabelWPController {
    font-name: @PRIMARYFONT;
   corner-radius:25;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
    text-auto-fit: false;
    background-color:#d2d2d2;
}

LargeTextField {
    height: 50;
    font-size: 28;
}
View {
    
}

ViewInit {
   background-color: @OTHER_COLOR;
    background-image: NUIViewBackground.png;
}

DropDownView {
    
}

SearchBarTintView {
     
}


contactUsViewController_base_label{
background-color:#000000;
}

contactUsViewController_titleName{
    font-name: @PRIMARYFONT;
    font-size: 17;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;

}

contactUsViewController_address{
    font-name: @PRIMARYFONT;
    font-size: 12;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;

}

contactUsViewController_btn{
    background-color: @PRIMARYCOLOR_BOLD;
    background-color-highlighted: @PRIMARYCOLOR_BOLD;
    border-color: @PRIMARYCOLOR_BOLD;
    border-width: @primaryBorderWidth;
    font-name: @BOLDFONT;
    font-color-highlighted:@HIGHLIGHTED_FONT_COLOR;
    font-color: @DARK_BACKGROUND_FONT_COLOR;
    font-color-disabled: @OTHER_FONT_COLOR;
    font-size: 13;
    text-shadow-color: clear;

}

NoStyle{

}
poweredBy{
    font-name: @PRIMARYFONT;
    font-size: 12;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
}

supporeted{
    font-name: @PRIMARYFONT;
    font-size: 14;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
}

ccText{
    font-name: LCDMono2;
    font-size: 23;
    font-color: @LIGHT_BACKGROUND_FONT_COLOR;
}

