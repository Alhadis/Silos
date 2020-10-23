/*
FioriDesignLanguage.nss

Copyright © 2016 - 2017 SAP SE or an SAP affiliate company. All rights reserved.
No part of this publication may be reproduced or transmitted in any form or for any purpose
without the express permission of SAP SE. The information contained herein may be changed
without prior notice.

*/

@samprimary1:              #ff0000; /*red*/
@samprimary2:              #0040ff; /*blue*/
@samprimary3:              #33cc33; /*green*/
@samprimary4:              #cc6600; /*brown*/
@samprimary5:              #ffbb33; /*yellow*/
@samprimary6:              #A65395;
@samprimary7:              #9BE1FF;
@samprimary8:              #42CCC8;
@samprimary9:              #B0D450;
@samprimary10:       		  #895600;

@samblue1:              	#3333cc;
@samblue2:              	#7070db;
@samblue3:             	#adadeb;
@samblue4:               #3678af;

@samred1:  	           	#ff0000;
@samred2:  	           	#ff3333;
@samred3:  	           	#ff6666;
@samred4:  	           	#D9364C;

@samgreen1:				#339966;
@samgreen2:				#39ac63;
@samgreen3:				#79d2a6;

@samblack:                 #000000;

@sambackground1:			#ffe6e6;
@sambackground2:			#e6f0ff;
@sambackground3:			#ffd9cc;
@sambackground4:			#cce0ff;
@sambackground5:			#ffc6b3;
@sambackground6:			#b3d1ff;
@sambackground7:			#ffb399;
@sambackground8:			#80b3ff;
@sambackground9:			#ff9f80;
@sambackground10:		#66a3ff;

@samBackgroundLightGrey: #f2f2f2;
@samBackgroundLightGrey: #f2f2f2;
@samBackgroundWhite: #ffffff;

@samFootnotePrimary: #76767B;
@samCaptionBlack: #3F3A3A;

FormCellLabelCritical {
  font-color: @samprimary1;
  font-name: boldSystem;
  font-size: 14;
}

FormCellLabelStandard {
  font-color: @samprimary2;
  font-name: thinSystem;
  font-size: 12;
}

FormCellValueCritical {
  font-color: @samprimary9;
  font-name: boldSystem;
  font-size: 16;
}

FormCellValueStandard {
  font-color: @samprimary10;
  font-name: thinSystem;
  font-size: 12;
}

FormCellLabelPropertyStandard {
  font-color: @samred1;
  font-name: italicSystem;
  font-size: 14;
}

FormCellLabelPropertyCritical {
  font-color: @samblue1;
  font-name: boldSystem;
  font-size: 14;
}

FormCellValuePropertyStandard {
  font-color: @samred2;
  font-name: italicSystem;
  font-size: 12;
}

FormCellValuePropertyCritical {
  font-color: @samblue2;
  font-name: boldSystem;
  font-size: 12;
}

FormCellLabelPickerStandard {
  font-color: @samred1;
  font-name: italicSystem;
  font-size: 14;
}

FormCellLabelPickerCritical {
  font-color: @samblue1;
  font-name: boldSystem;
  font-size: 14;
}

FormCellValuePickerStandard {
  font-color: @samred2;
  font-name: italicSystem;
  font-size: 12;
}

FormCellValuePickerCritical {
  font-color: @samblue2;
  font-name: boldSystem;
  font-size: 12;
}

FormCellBackgroundCritical {
	background-color: @sambackground1;
	tint-color: @sambackground3;
	font-color: @samprimary3;
	font-name: italicSystem;
  font-size: 14;
}

FormCellBackgroundStandard {
	background-color: @sambackground2;
	tint-color: blue;
	font-color: @samprimary4;
	font-name: thinSystem;
  font-size: 12;
}

FormCellBackgroundCriticalTitle {
	background-color: @samgreen1;
	tint-color: purple;
	font-color: @samprimary3;
	font-name: italicSystem;
  font-size: 12;
}

FormCellBackgroundStandardTitle {
	background-color: @samgreen3;
	tint-color: @samgreen1;
	font-color: @samprimary4;
	font-name: thinSystem;
  font-size: 10;
}

FormCellSwitchStandard {
	on-tint-color: @samblue3;
	tint-color: @sambackground8;
	thumb-tint-color: brown;
}

FormCellSwitchCritical {
  on-tint-color: @samred3;
  tint-color: @sambackground7;
  thumb-tint-color: yellow;
}

FormCellNoteTextCritical {
	font-color: @samred3;
  	font-name: boldSystem;
  	font-size: 14;
}

FormCellNoteTextStandard {
	font-color: @samblue3;
  	font-name: thinSystem;
  	font-size: 12;
}

FormCellTitleTextCritical {
	font-color: @samred2;
  	font-name: boldSystem;
  	font-size: 14;
}

FormCellTitleTextStandard {
	font-color: @samblue2;
  	font-name: thinSystem;
  	font-size: 12;
}

FormCellBackgroundNotEditable {
    background-color: @samBackgroundWhite;
}

FormCellBackgroundEditable {
    background-color: @samBackgroundWhite;
}

ObjectCellStyleBlack {
    font-color: @samblack;
}
ObjectCellStyleRed {
  tint-color: @samred4;
}
FootnotePrimary {
    font-color: @samFootnotePrimary;
}

ResetRed {
  font-color: @samred4;
}
FormCellButton {
    font-color: @samblue4;
}
FormCellReadOnlyEntry {
    font-color: #76767B;
}

GrayText {
    font-color: @samFootnotePrimary;
}

FormCellTextEntry {
    font-color: #3F3A3A;
}