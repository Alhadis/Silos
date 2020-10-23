@primaryFontName: Helvetica;
@primaryFontNameBold: HelveticaNeue;
@boldFont: Helvetica-Bold;
@primaryFontColor: #3E3D43;
@secondaryFontColor: #838385;
@primaryBackgroundColor: #F5F5F5;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #FFFFFF;
@primaryBackgroundColorBottom: #EFF0F2;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #DDDDDD;
@primaryBorderWidth: 1;


@hpBarGreenColor: #41AB07;
@hpBarOrangeColor: #EBB728;
@hpBarRedColor: #EB3B28;

@battleStatusColor: #959B86;
@battleBorderColor: #3D3D3C;

@barBackgroundColorTop: #11ABE1;
@barBackgroundColorBottom: #01A0DA;

@primaryButtonColor: #00ADEF;
@secondaryButtonColor: #37383D;
@confirmButtonColor: #00A366;
@denyButtonColor: #DB3134;

BarButton {
    background-color-top: @barBackgroundColorTop;
    background-color-bottom: @barBackgroundColorBottom;
    border-color: #0099D5;
    border-width: 1;
    corner-radius: 7;
    font-name: @primaryFontNameBold;
    font-color: #FFFFFF;
    font-size: 13;
    text-shadow-color: clear;
}
BarButtonBack {
    background-color-top: @barBackgroundColorTop;
    background-color-bottom: @barBackgroundColorBottom;
    border-color: #0099D5;
    border-width: 1;
    corner-radius: 7;
    font-name: @primaryFontNameBold;
    font-color: #FFFFFF;
    font-size: 13;
    text-shadow-color: clear;
}
Button {
    background-color: @primaryButtonColor;
    font-color: #FFFFFF;
    font-color-highlighted: #CCCCCC;
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 37;
    corner-radius: 7;
    padding: 12;
}
SecondaryButton {
    background-color: @secondaryButtonColor;
    font-color: #FFFFFF;
    font-color-highlighted: #CCCCCC;
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 37;
    corner-radius: 7;
    padding: 12;
}
LargeButton {
    height: 50;
    font-size: 20;
    corner-radius: 7;
    padding: 7;
}
SmallButton {
    height: 24;
    font-size: 12;
    corner-radius: 7;
    padding: 3;
}
TextFieldButton {
    height: 37;
    font-size: 17;
    corner-radius: 7;
    padding: 7;
}
ConfirmButton {
    background-color: @confirmButtonColor;
}
DenyButton {
    background-color: @denyButtonColor;
}
XButton {
    height: 20;
    font-size: 12;
    corner-radius: 5;
    padding: 0;
}
ImageButton {
    
}
BattleOptionsButton {
    background-color: @secondaryButtonColor;
    height: 80;
    font-size: 22;
}
BattleOptionsButton4 {
    background-color: @secondaryButtonColor;
    height: 50;
    font-size: 20;
}
RunOptionsButton {
    height: 60;
    font-size: 22;
}
RunOptionsButton4 {
    height: 40;
    font-size: 20;
}
Label {
    font-name: @primaryFontName;
    font-size: 18;
    font-color: @primaryFontColor;
    text-auto-fit: false;
}
LargeLabel {
    font-name: @primaryFontNameBold;
    font-size: 26;
    font-color: @primaryFontColor;
}
SmallLabel {
    font-name: @primaryFontName;
    font-size: 14;
    font-color: #8F8F91;
}
TinyLabel {
    font-name: @primaryFontName;
    font-size: 12;
    font-color: @primaryFontColor;
}
StatusLevelLabel {
    text-align: center;
    font-size: 14;
    font-color: #FFFFFF;
}
ConfirmText {
    font-size: 14;
    font-name: @boldFont;
    text-align: left;
    font-color: @confirmButtonColor;
}
DenyText {
    font-size: 14;
    font-name: @boldFont;
    text-align: left;
    font-color: @denyButtonColor;
}
BattleBoldText {
    text-align: left;
    font-size: 11;
    font-name: @boldFont;
}
BattleStat {
    text-align: left;
    font-size: 11;
}
BattleValue {
    font-name: @boldFont;
    text-align: right;
    font-size: 11;
}
StartBattleBar {
    background-color: @secondaryButtonColor;
    border-width: 2;
    border-color: @primaryFontColor;
}
HPOutlineBar {
    background-color: #DDDDDD;
    border-width: 2;
    border-color: @primaryFontColor;
    border-radius: 5;
}
HPBarGreen {
  background-color: @confirmButtonColor;
  border-radius: 5;
}
NavigationBar {
    background-color: #00ADEF;
    font-name: @primaryFontNameBold;
    font-size: 22;
    font-color: #FFFFFF;
    text-shadow-color: clear;
}
SearchBar {
    background-color-top: @primaryBackgroundColorTop;
    background-color-bottom: @primaryBackgroundColorBottom;
    scope-background-color: @primaryBackgroundColorTop;
}
SegmentedControl {
    background-color: #BBBBBB;
    background-color-selected: #00ADEF;
    border-width: 1;
    border-color: @primaryBorderColor;
    corner-radius: 10;
    font-name: @primaryFontNameBold;
    font-size: 12;
    font-color: #FFFFFF;
    text-shadow-color: clear;
}
Switch {
    on-tint-color: @primaryBackgroundColor;
}
TabBar {
    background-color-top: #363636;
    background-color-bottom: #181818;
}
TabBarItem {
    font-name: @primaryFontNameBold;
    font-color: @secondaryFontColor;
    font-size: 18;
    text-offset: 0,-11;
}
TableCell {
    background-color: #F7F7F7;
    font-color: @primaryFontColor;
    font-name: @primaryFontNameBold;
    font-size: 17;
    border-width: 1;
    border-color: @primaryBorderColor;
}
TableCellDetail {
    font-name: @primaryFontName;
    font-size: 14;
    font-color: @secondaryFontColor;
}
TextField {
    height: 37;
    font-color: @primaryFontColor;
    font-name: @primaryFontName;
    font-size: 17;
    background-color: #FFFFFF;
    border-style: none;
    border-color: @primaryBorderColor;
    border-width: 1;
    corner-radius: 7;
    padding: 7;
    vertical-align: center;
}
LargeTextField {
    height: 50;
    font-size: 28;
    corner-radius: 9;
    padding: 13;
}
DefaultView {
    background-color: @primaryBackgroundColor;
}
StatusView {
    background-color: @secondaryButtonColor;
}
BattleStatusView {
    background-color: @battleStatusColor;
    border-color: @battleBorderColor;
    border-width: 3;
    corner-radius: 7;
}
HPBarGreen {
    progress-tint-color: @hpBarGreenColor;
    track-tint-color: @secondaryButtonColor;
}
HPBarOrange {
  
}
HPBarRed {
  
}
