//<continuation number="300">

chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "chz_215_青空編_title";
		$GameContiune = 1;
		$Ａルート = true;
		$Ａ２ルート = true;
			#ClearG=true;
			#ClearPieceR=true;
			#ClearPieceY=true;
			#ClearPieceS=true;
			#ClearPieceK=true;
			#ClearPieceN=true;
			#ClearPieceA=true;
			#ClearRouteB=true;
			#ClearRouteA=true;
			#EndPieceR=true;
			#EndPieceY=true;
			#EndPieceS=true;
			#EndPieceK=true;
			#EndPieceN=true;
			#EndPieceA=true;
			#EndRouteB=true;
			#EndRouteA=true;
			$ClearPreAll=true;
		Reset();
	}

	chz_215_青空編_title();
}


function chz_215_青空編_title()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	ch10_214_Ａ鈍色の空の下();

}
