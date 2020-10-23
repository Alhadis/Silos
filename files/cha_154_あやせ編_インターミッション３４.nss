

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_154_あやせ編_インターミッション３４";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_154_あやせ編_インターミッション３４();
}


function cha_154_あやせ編_インターミッション３４()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	ch08_157_インターミッション３４();

}

