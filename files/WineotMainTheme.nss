@primaryFontName: Baskerville-SemiBoldItalic;
@secondaryFontName: HelveticaNeue-Light;
@secondaryFontNameBold: HelveticaNeue;
@secondaryFontNameStrong: HelveticaNeue-Medium;
@inputFontName: HelveticaNeue;
@primaryFontColor: #FFFFFF;
@primaryFontYellowColour: #FFFFFF;
@secondaryFontColor: #990014;
@secondaryFontRedColor: #990014;
@primaryBorderColor: #A2A2A2;
@primaryBorderWidth: 1;

@buttonBorderColor: #FFFFFF;
@buttonBorderWidth: 3;
@buttonCornerRadius: 8;

@textFieldBorderColor: #FFFFFF;
@textFieldBorderWidth: 1;
@textFieldCornerRadius: 8;

@primaryRedColor:#990014;

@navigationBarFontName: HoeflerText-BlackItalic;

Label
{
    font-color: @secondaryFontRedColor;
    font-name: @primaryFontName;
}

TabBarTakePhotoView {
background-color-top: @secondaryFontRedColor;
background-color-bottom: @secondaryFontRedColor;
font-color: @primaryFontColor;
font-color-highlighted: @secondaryFontRedColor;
font-name: @primaryFontName;
font-size: 14;
text-align: center;
text-auto-fit: true;
corner-radius: 7;
exclude-views: UIAlertButton;
exclude-subviews: UITableViewCell,UITextField;

}

LoginViewButton
{

border-color: @buttonBorderColor;
border-width: @buttonBorderWidth;
corner-radius: @buttonCornerRadius;

}

LoginViewTextField
{
border-color: @textFieldBorderColor;
border-width: @textFieldBorderWidth;
corner-radius: @textFieldCornerRadius;
}

TabBarItem {

font-color: @secondaryFontRedColor;
font-name: @primaryFontName;


}

AddCommentView
{
corner-radius: 8;
}

AddCommentTextView
{
corner-radius: 8;
border-color:@primaryRedColor;
border-width: 1;

}

NavigationBar {
background-tint-color: @primaryFontColor;
font-name: @navigationBarFontName;
font-size: 20;
font-color: @primaryFontColor;
text-shadow-color: #666666;
text-shadow-offset: 1,1;
}

