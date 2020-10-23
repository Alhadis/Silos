/*  命名规则 */
/* 变量用小写开头的驼峰命名法, 如:orangeColor, appCornerRadius */
/* 样式用大写开头的驼峰命名法, 如:OrangeButton, InvestTextField */
/* 全局/通用的变量或样式, 用app开头 例如:AppOrangeButton,  appLightGrayColor */
/* 二级页面或局部的变量或样式, 用分类别开头, 如属于投资的用Invest, 用户的用Account, 登录的用LoginNormalButton */


@appOrangeColor:#ee7700; /* 主题橙色 */
@appRedColor:#d32623; /* 主题红色 */
@appBorderColor:#ececec;
@appDisableColor:#d2d2d2;
@appBackgroundColor:#f3f3f3;/* 默认背景颜色 */
@appNavigationBarTintColor:#3e3e40;/*标题栏颜色 */
@appLightGrayColor: #a0a0a0;/* 浅灰色文本颜色 */
@appDarkGrayColor: #4c4c4e;/* 深灰色文本颜色 */
@appFundBackgroundColor:#ebebeb;/* 资金记录筛选按钮默认背景颜色 */

@appCornerRadius:5;
@appXX-SmallFontSize:8;/** 最小字体 */
@appX-SmallFontSize:10;/** 小一号字体 */
@appSmallFontSize:12;/** 小号字体 */
@appNormalFontSize:14;/* 字体默认大小*/
@appLargeFontSize:16;/*大号字体*/
@appX-LargerFontSize:18;/*加大号字体*/
@appXX-LargerFontSize:20;/*加大号字体*/
@appXXXX-LargerFontSize:32;/*加大号字体*/
@appAccountLargeFontSize:15;/* 账户中心九宫格大字体大小*/

/* ===================== 全局通用样式 ========================*/

AppGlobal
{
corner-radius:@appCornerRadius;

xx-small-font-size:@appXX-SmallFontSize;
x-small-font-size:@appX-SmallFontSize;
small-font-size:@appSmallFontSize;
normal-font-size:@appNormalFontSize;
large-font-size:@appLargeFontSize;
x-larger-font-size:@appX-LargerFontSize;
xx-larger-font-size:@appXX-LargerFontSize;

disable-color:@appDisableColor;
orange-color:@appOrangeColor;
border-color:@appBorderColor;
background-color:@appBackgroundColor;
light-gray-color:@appLightGrayColor;
dark-color:@appDarkGrayColor;
navigation-bar-tint-color : @appNavigationBarTintColor;
}

AppCellButton
{
background-color:clear;
background-color-highlighted:@appBackgroundColor;
}
AppXSmallOrangeLabel
{
font-size: @appX-SmallFontSize;
font-color: @appOrangeColor;
}

AppSmallOrangeLabel
{
font-size: @appSmallFontSize;
font-color: @appOrangeColor;
}

AppNormalOrangeLabel
{
font-size: @appNormalFontSize;
font-color: @appOrangeColor;
}

AppLargeOrangeLabel
{
font-size: @appLargeFontSize;
font-color: @appOrangeColor;
}


AppXXSmallDarkGrayLabel
{
font-size: @appXX-SmallFontSize;
font-color: @appDarkGrayColor;
}

AppXSmallDarkGrayLabel
{
font-size: @appX-SmallFontSize;
font-color: @appDarkGrayColor;
}

AppSmallDarkGrayLabel
{
font-size: @appSmallFontSize;
font-color: @appDarkGrayColor;
}

AppNormalDarkGrayLabel
{
font-size: @appNormalFontSize;
font-color: @appDarkGrayColor;
}

AppLargeDarkGrayLabel
{
font-size: @appLargeFontSize;
font-color: @appDarkGrayColor;
}

AppXLargerDarkGrayLabel
{
font-size: @appX-LargerFontSize;
font-color: @appDarkGrayColor;
}

AppXXLargerDarkGrayLabel
{
font-size: @appXX-LargerFontSize;
font-color: @appDarkGrayColor;
}


AppXXSmallLightGrayLabel
{
font-size: @appXX-SmallFontSize;
font-color: @appLightGrayColor;
}

AppXSmallLightGrayLabel
{
font-size: @appX-SmallFontSize;
font-color: @appLightGrayColor;
}

AppSmallLightGrayLabel
{
font-size: @appSmallFontSize;
font-color: @appLightGrayColor;
}

AppNormalLightGrayLabel
{
font-size: @appNormalFontSize;
font-color: @appLightGrayColor;
}

AppLargeLightGrayLabel
{
font-size: @appLargeFontSize;
font-color: @appLightGrayColor;
}

AppXLargerLightGrayLabel
{
font-size: @appX-LargerFontSize;
font-color: @appLightGrayColor;
}

AppXXLargerLightGrayLabel
{
font-size: @appXX-LargerFontSize;
font-color: @appLightGrayColor;
}

AppLargeWhiteLabel
{
font-size: @appLargeFontSize;
font-color: white;
}


AppBackgroundView
{
background-color:@appBackgroundColor;
}

AppBackgroundRoundView
{
background-color:@appBackgroundColor;
corner-radius :@appCornerRadius;
}

AppRoundView
{
corner-radius :@appCornerRadius;
}

AppBlackView
{
background-color:@appNavigationBarTintColor;
}

/*白色输入框,登录,注册页面用到*/
AppTextField
{
font-color: @appDarkGrayColor;
font-size: @appLargeFontSize;
height: 40;
background-color:#fefefe;
border-color: @appBorderColor;
corner-radius: @appCornerRadius;
border-width: 0.5;
}


AppOrangeButton
{
font-size: @appLargeFontSize;
font-color: white;
background-color:@appOrangeColor;
background-color-disabled:@appDisableColor;
content-insets: 10;
corner-radius :@appCornerRadius;
}

AppGrayButton
{
font-size: @appLargeFontSize;
font-color: white;
background-color:@appOrangeColor;
background-color-disabled:@appLightGrayColor;
content-insets: 10;
corner-radius :@appCornerRadius;
}


AppWhiteButton
{
font-size: @appLargeFontSize;
font-color: @appDarkGrayColor;
background-color:white;
content-insets: 10;
corner-radius :@appCornerRadius;
border-color: @appBorderColor;
border-width:0.5;
}

/*透明背景橙色文字*/
AppNormalOrangeTextButton
{
font-size: @appNormalFontSize;
font-color: @appOrangeColor;
background-color:clear;
content-insets: 10;
}


AppNormalLightGrayTextButton
{
font-color: @appLightGrayColor;
font-size: @appNormalFontSize;
text-align:right;
background-color:clear;
}

/* ===================== 局部样式 ========================*/

NavigationBar
{
bar-tint-color : @appNavigationBarTintColor;
tint-color :white;
translucent:false;
}

AppItemButton
{
background-color:clear;
background-color-highlighted:@appLightGrayColor;
}

TabBarItem{
font-color: @appLightGrayColor;
font-color-selected: @appOrangeColor;
}

HomeTabBarItem{
finished-image:ic_tab_home_n;
finished-image-selected:ic_tab_home_s;
}

InvestTabBarItem{
finished-image:ic_tab_invest_n;
finished-image-selected:ic_tab_invest_s;
}

AccountTabBarItem{
finished-image:ic_tab_account_n;
finished-image-selected:ic_tab_account_s;
}

/*
MoreTabBarItem{
finished-image:ic_tab_more_n;
finished-image-selected:ic_tab_more_s;
}
*/

InvestRateLabel
{
font-size: 32;
font-color: @appOrangeColor;
}

InvestRateLabelSymbol
{
font-size: @appLargeFontSize;
font-color: @appOrangeColor;
}

/* 业主标签 */
InvestListOwnerDetailLabel
{
font-size: @appSmallFontSize;
font-color: #388ef6;
background-color:#eaf4fe;
padding: 5;
corner-radius :@appCornerRadius;
}

/* 带圆解背景的标签 */
RoundBgLabel
{
font-size: @appSmallFontSize;
font-color: @appLightGrayColor;
background-color:#44444a;
padding: 5;
corner-radius :@appCornerRadius;
}

InvestDetailRateLabel
{
font-size: 50;
font-color: @appOrangeColor;
}


InvestListTagLabel
{
font-size: @appSmallFontSize;
padding:2 8 2 8;
font-color: white;
corner-radius: 9;
HONORABLE: #f64f4f;
RECOMMEND:#ff8584;
NEWBEE:#0cea98;
RATE:#f9d667;
}


InvestListStatusView
{
disable-color:@appDisableColor;
progress-tint-color:@appOrangeColor;
track-tint-color:@appDisableColor;
progress-line-width:1;
font-size:@appNormalFontSize;
font-color:@appOrangeColor;

}

InvesDetailStatusView
{
disable-color:#9f9f9f;
progress-tint-color:@appOrangeColor;
track-tint-color:#9f9f9f;
progress-line-width:1;
font-size:@appNormalFontSize;
font-color:@appOrangeColor;
}

InvestDetailProgressBar
{
font-size:@appXX-SmallFontSize;
font-color:white;
gradient-start-color:#f7a500;
gradient-end-color:@appOrangeColor;
}

RechargeUnbindButton
{
font-color: #006be1;
font-size: @appSmallFontSize;
border-color: #006be1;
border-width: 0.5;
corner-radius: 2;
content-insets: 4 8 4 8;
}

WebProgressView
{
progress-tint-color:@appOrangeColor;
track-tint-color:#d2d2d2;
}

AccountLineChartView
{
padding:16 8 8 16;
font-size:@appXX-SmallFontSize;
font-color:white;
y-grid-color:@appLightGrayColor;/* Y轴的网格线颜色 */
y-label-axis-span:8; /* Y 轴与标签文本的间距*/
x-label-axis-span:8; /* X 轴与标签文本的间距*/
line-color:@appOrangeColor;
line-width:1;
show-smooth-lines:true;
display-animated:true;
}

/*一种提现方式*/
RechargeSingleTagLabel
{
font-size: @appNormalFontSize;
font-color: @appLightGrayColor;
text-align:right;
}

RechargeSegmentedControl
{
background-color: white;
background-color-selected: @appOrangeColor;
border-color: @appBorderColor;
border-width: 1;
corner-radius: 14;
font-size: @appNormalFontSize;
font-color: @appLightGrayColor;
font-color-selected :white;
text-shadow-color: clear;
}

UpdateBoxContainer
{
background-color: white;
corner-radius: 10;
}

UpdateBoxOtherButton
{
background-color: @appOrangeColor;
font-color: white;
font-color-highlighted: white;
font-size: @appLargeFontSize;
}

UpdateBoxVersionLabel
{
background-color: @appOrangeColor;
font-color: white;
font-color-highlighted: white;
font-size: 12;
corner-radius: 8;
}

UpdateBoxCloseButton
{
background-color: white;
content-insets: 8 8 8 8;
corner-radius: 13;
}

AutoLoanSelectedButton
{
font-color: @appLightGrayColor;
font-color-selected: @appOrangeColor;
font-size: @appSmallFontSize;
border-color: @appLightGrayColor;
border-color-selected:@appOrangeColor;
border-width: 0.5;
corner-radius: 2;
content-insets: 4 8 4 8;
}

AutoLoanSelectedButton2
{
font-color: @appLightGrayColor;
font-color-selected: @appOrangeColor;
font-size: @appX-SmallFontSize;
border-color: @appLightGrayColor;
border-color-selected:@appOrangeColor;
border-width: 0.5;
corner-radius: 2;
content-insets: 4 8 4 8;

}

AutoLoanRepayLabel
{
font-size: @appSmallFontSize;
padding:2 4 2 4;
font-color: @appOrangeColor;
corner-radius: 3;
border-color: @appOrangeColor;
border-width: 0.5;
}

FundSelectedButton
{
font-color: @appLightGrayColor;
font-color-selected: white;
font-size: @appSmallFontSize;
background-color: @appFundBackgroundColor;
background-color-selected: @appOrangeColor;
corner-radius: 5;
}

AppAccountLargeLightGrayLabel
{
font-size: @appAccountLargeFontSize;
font-color: @appDarkGrayColor;
}
