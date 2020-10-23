
@secondaryFontName: ArialRoundedMTBold;
@secondaryFontNameBold: ArialRoundedMTBold;
@secondaryFontNameStrong: ArialRoundedMTBold;
@inputFontName: ArialRoundedMTBold;
@primaryFontColor: #666666;
@secondaryFontColor: #888888;
@navFontColor: #FFFFFF;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #ECECEC;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FFFFFF;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #EEEEEE;
@primaryBorderWidth: 1;

@primaryFontName: HelveticaNeue-Medium;

@primaryTableColor: #9ED5F5;
@primaryTableCellColor: white;
@priceFontColor: red;

Table {
    separator-color: #d1d3d4;
}

TableCellView {
    background-color: @primaryTableCellColor;
}
ButtonOrderCell{
    background-color: white;
    border-width: 1;
    corner-radius: 5;
    font-name: HelveticaNeue-Light;
    font-size: 14;
    text-align: center;
    text-auto-fit: false;
}
ButtonInOrder {
    border-color: #7ac943;
    font-color: #7ac943;
}
ButtonInNotOrder {
    border-color: #007aff;
    font-color: #007aff;
}
ButtonDelivery {
    border-color: black;
    font-color: black;
}

ButtonCategory {
    font-name: HelveticaNeue-Light;
    font-size: 17;
    text-align: center;
    text-auto-fit: false;
    border-width: 3;
    border-color: #f8f8f8;
}
ButtonCategorySelected {
    background-color: #007aff;
    font-color: white;
}
ButtonCategoryNoSelected {
    background-color: #f8f8f8;
    font-color: #007aff;
}

ButtonAddToCart {
    corner-radius: 5;
    font-name: @secondaryFontName;
    font-size: 16;
    text-align: center;
    text-auto-fit: false;
    border-width: 0;
}
ButtonAddToCartSelected {
    background-color: #7ac943;
    font-color: white;
}

ButtonAddToCartUnSelected {
    background-color: white;
    font-color: #007aff;
    border-width: 1;
    border-color: #007aff;
}
Detailed {
    font-name: HelveticaNeue-Light;
    font-size: 17;
}
TextViewDescriptionProduct {
    font-color: black;
    font-name: HelveticaNeue-Light;
    font-size: 14;
}
ButtonLastUpdate {
    font-name: HelveticaNeue-Light;
    font-size: 14;
    font-color: black;
}

Label {
    font-name: HelveticaNeue-Light;
    font-size: 14;
    font-color: black;
    text-auto-fit: false;
}
NameCompany {
    font-name: @primaryFontName;
    font-size: 18;
    font-color: black;
}
WhiteText {
    font-size: 17;
    font-color: white;
}
TitleProductCell {
    font-size: 14;
}
PriceProductCell {
    font-size: 14;
}
AllSum {
    font-size: 17;
}
OrderFill {
    font-size: 17;
    text-align: center;
    font-color: #6c6d6d;
    background-color: #d1d3d4;
}
OrderDeliver {
    font-size: 17;
    text-align: center;
    font-color: white;
    background-color: #7ac943;
}
OrderSending {
    font-size: 17;
    text-align: center;
    font-color: black;
    background-color: white;
}
OrderReturn {
    font-size: 17;
    text-align: center;
    font-color: white;
    background-color: #007aff;
}
Telephone {
    font-size: 20;
}

OrderInfo {
    font-size: 12;
}
OrderSend {
    font-size: 16;
    text-align: center;
    font-color: white;
    background-color: #7ac943;
}
OrderFailSend {
    font-size: 16;
    text-align: center;
    font-color: white;
    background-color: red;
}

NavigationBar {
    font-name: HelveticaNeue-Medium;
    font-size: 18;
    font-color: black;
    text-shadow-color: clear;
}
TabBar {
    background-color: #FFFFFF;
}
TabBarItem {
    font-name: @primaryFontName;
    font-color: red;
    font-size: 18;
    text-offset: 0,-11;
}
BarButtonIos7 {
    font-name: HelveticaNeue-Light;
    font-color: #007aff;
    font-size: 17;
}
BarButtonBackIos7
{
    font-color: #007aff;
    font-name: HelveticaNeue-Light;
    font-size: 17;
}
TextField {
    font-name: HelveticaNeue-Light;
    font-size: 16;
    font-color: #d1d3d4;
    border-style: none;
    vertical-align: center;
}
TextFieldActive {
    font-size: 16;
    font-color: black;
}
TextFieldCity {
    font-color: #007aff;
}
BottomView{
    background-color: #d1d3d4;
}
ScrollView {
    background-color: #f8f8f8;
}
OrderAllowed {
    background-color: #007aff;
}
OrderNotAllowed {
    background-color: #d1d3d4;
}