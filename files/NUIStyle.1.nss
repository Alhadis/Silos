@primaryFontName: AppleGothic;
@secondaryFontName: HelveticaNeue-Light;
@secondaryFontNameBold: HelveticaNeue;
@secondaryFontNameStrong: HelveticaNeue-Medium;
@inputFontName: HelveticaNeue;
@primaryFontColor: #555555;
@secondaryFontColor: #888888;
@tertiaryFontColor: #34495e
@primaryBackgroundColor: #95a5a6;

@primaryHighButtonColor: #e74c3c;
@secondaryHighButtonColor: #c0392b;
@primaryLowButtonColor: #f1c40f;
@secondaryLowButtonColor: #e67e22;
@primaryOffButtonColor: #27ae60;
@secondaryOffButtonColor: #2ecc71;

@primaryHighlightedColor: #27ae60 
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #E6E6E6;
@primaryBackgroundColorBottom: #E6E6E6;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #2c3e50;
@primaryBorderWidth: 1;

BarButton {
    background-color: @primaryBackgroundColor;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    corner-radius: 7;
    font-name: @secondaryFontNameBold;
    font-color: @primaryFontColor;
    font-color-disabled: @secondaryFontColor;
    font-size: 13;
    text-shadow-color: clear;
}
HighButton {
    background-color-top: @primaryHighButtonColor;
    background-color-bottom: @secondaryHighButtonColor;
    background-color-selected: @primaryHighlightedColor;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @tertiaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 30;  
    height: 37;
    corner-radius: 7;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}

LowButton {
    background-color-top: @primaryLowButtonColor;
    background-color-bottom: @secondaryLowButtonColor;
    background-color-selected: @primaryHighlightedColor;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @tertiaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 30;  
    height: 37;
    corner-radius: 7;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}

OffButton {
    background-color-top: @primaryOffButtonColor;
    background-color-bottom: @secondaryOffButtonColor;
    background-color-selected: @primaryHighlightedColor;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    font-color: @tertiaryFontColor;
    font-color-highlighted: @secondaryFontColor;
    font-name: @secondaryFontName;
    font-size: 30;  
    height: 37;
    corner-radius: 7;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}
Label {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}

NavigationBar {
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottomStrong;
}
Progress {
    progress-tint-color: @primaryBackgroundTintColor;
    track-tint-color: @secondaryBackgroundColorTop;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: #FFFFFF;
}
SegmentedControl {
    background-color: @primaryBackgroundColorTop;
    background-color-selected: @primaryBackgroundColorBottomStrong;
    border-color: @primaryBorderColor;
    border-width: @primaryBorderWidth;
    corner-radius: 7;
    font-name: @secondaryFontNameBold;
    font-size: 13;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundTintColor;
}
TabBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
}
TabBarItem {
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
    height: 37;
    font-name: @inputFontName;
    font-size: 18;
    border-style: rounded;
    vertical-align: center;
}

LargeTextField {
    height: 50;
    font-size: 28;
}
View {
    background-color: @primaryBackgroundColor;
    background-image: NUIViewBackground.png;
}
Window{
    background-color: @primaryBackgroundColor;
}