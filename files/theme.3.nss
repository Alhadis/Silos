@primaryFontName: AppleGothic;
@secondaryFontName: HelveticaNeue-Light;
@secondaryFontNameBold: HelveticaNeue;
@secondaryFontNameStrong: HelveticaNeue-Medium;
@inputFontName: HelveticaNeue-Light;
@primaryFontColor: #555555;
@secondaryFontColor: #888888;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #F3F3F3;
@primaryBackgroundColorBottom: #E6E6E6;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #A2A2A2;
@primaryBorderWidth: 1;

RedButton {
    background-color-top: #DD4B39;
    background-color-bottom: #B3330D;
    border-color: #000000;
    border-width: 1;
    font-color: #FFFFFF;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    text-shadow-color: #741e05;
    font-size: 18;
    corner-radius: 4;
}
Label {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-size: 24;
}
SmallLabel {
    font-size: 15;
}
TopBarLabel {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: #FFFFFF;
    text-auto-fit: false;
}
NavigationBar {
    font-name: HelveticaNeue-Light;
    font-size: 20;
    font-color: #ffffff;
    text-shadow-color: clear;
    background-color-top: #d24509;
    background-color-bottom: #a63302;
}
SecondaryNavigationBar {
    font-name: HelveticaNeue-Light;
    font-size: 20;
    font-color: #000000;
    text-shadow-color: clear;
}
SegmentedControl {
    background-tint-color: @primaryBackgroundColorTop;
    font-name: @secondaryFontNameBold;
    font-size: 13;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
TabBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    font-name: @secondaryFontName;
    font-color: @primaryFontColor;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color-top: @secondaryBackgroundColorTop;
    background-color-bottom: @secondaryBackgroundColorBottom;
    font-color: @primaryFontColor;
    font-name: @secondaryFontNameBold;
    font-size: 17;
}
TableCellDetail {
    font-name: @secondaryFontName;
    font-size: 14;
    font-color: @secondaryFontColor;
}
TextField {
    height: 35;
    font-color: @primaryFontColor;
    font-name: @primaryFontName;
    font-size: 17;
    background-color: #FFFFFF;
    border-style: none;
    border-color: @primaryBorderColor;
    border-width: 1;
    corner-radius: 0;
    padding: 5;
    vertical-align: center;
}
LoginBox {
    border-width: @primaryBorderWidth;
}
LoginTitle {

}
