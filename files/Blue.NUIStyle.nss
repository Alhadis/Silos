@primaryFontName: ArialRoundedMTBold;
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
@primaryBorderColor: #000080;
@primaryBorderWidth: 10;

Button {
    background-color:#000080;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @primaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 18;
    height: 33;
    corner-radius: 7;
}
LargeButton {
    height: 50;
    font-size: 24;
    corner-radius: 10;
}
SmallButton {
    height: 24;
    font-size: 14;
    corner-radius: 5;
}
Label {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-size: 28;
}
SmallLabel {
    font-size: 15;
}
NavigationBar {
    font-name: @secondaryFontName;
    font-size: 25;
    font-color: #808080;
    background-tint-color: @primaryBackgroundColor;



}
SegmentedControl {
    background-tint-color: @primaryBackgroundColorTop;
    font-name: @secondaryFontNameBold;
    font-size: 13;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
TabBar {
    background-color: #FFFFFF;
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
    font-size: 20;
}
TableCellDetail {
    font-name: @secondaryFontName;
    font-size: 18;
//    000080
    font-color: @secondaryFontColor;
}
TextField {
    font-name: @inputFontName;
    height: 37;
    font-size: 18;
}
LargeTextField {
    height: 50;
}
LargeTextField {
    font-size: 28;
}
View {
    background-image: NUIViewBackground.png;
}
UIBarButtonItem {
    background-color: #c0c0c0;
    font-name: @secondaryFontNameBold;
    font-color: @navFontColor;
    text-shadow-color: clear;
    font-size: 20;
}
UINavigationItem {
    background-color: #9ED5F5;
}
NUITableViewCell {
    background-color: #9ED5F5;
}