@primaryFontName: Helvetica;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;

@primaryFontColor: #2F2F2F;

NavigationBar {
    font-name: @primaryFontName;
    font-size: 22;
    font-color: @primaryFontColor;
    text-shadow-color: clear;
}

eventsTableView {
    separator-color: #EBEBEB;
}

eventCell {
    font-color: @primaryFontColor;
    font-name: Helvetica;
    font-size: 18;
    text-align: center;
}

eventView {
    background-image: piano.png;
}

roomLabel {
    font-size:30;
    font-name: Helvetica;
    font-color: #FFFFFF;
}

eventPageButton {
    background-color: #37383D;
    font-color: #FFFFFF;
    font-color-highlighted: #CCCCCC;
    font-name: @primaryFontNameBold;
    font-size: 17;
    height: 100;
    corner-radius: 4co;
    exclude-views: UIAlertButton;
    exclude-subviews: UITableViewCell,UITextField;
}

instructionLabel {
font-name:Helvetica;
font-size:50;
text-align:center;

}

commentView{
background-color:#C0C0C0;
}

commentNameLabel {
font-size:50;
text-align:center;
}

commentLabel {
font-size:25
}

prevCommentsLabel {
font-size:25;
}

rankingCell{
font-size:25;
text-align:center;
}

