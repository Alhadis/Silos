#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"

#include "nss/chn_125_七海編_七海帰還.nss"
#include "nss/chn_126_七海編_現実と妄想の境界.nss"
#include "nss/chn_127_七海編_いたずら.nss"
#include "nss/chn_128_七海編_朝餉の準備.nss"
#include "nss/chn_129_七海編_朝食.nss"
#include "nss/chn_130_七海編_理想の妹.nss"
#include "nss/chn_131_七海編_噛み合わない会話.nss"
#include "nss/chn_132_七海編_混乱.nss"
#include "nss/chn_133_七海編_同衾.nss"
#include "nss/chn_134_七海編_七海帰還２.nss"
#include "nss/chn_135_七海編_二人のナナ.nss"
#include "nss/chn_136_七海編_僕は妹とキスをする.nss"

#include "nss/chz_222_エンドクレジット.nss"

//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "boot_七海ルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeN;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeN
{

	if($GameName == "boot_七海ルート")
	{
		$GameName = 0;
	}

	if($GameName == "chn_125_七海編_七海帰還" || $GameName == 0)
	{
		$ChapterName = "chn_125_七海編_七海帰還";
		$GameName = 0;
		chn_125_七海編_七海帰還();
	}
	if($GameName == "chn_126_七海編_現実と妄想の境界" || $GameName == 0)
	{
		$ChapterName = "chn_126_七海編_現実と妄想の境界";
		$GameName = 0;
		chn_126_七海編_現実と妄想の境界();
	}
	if($GameName == "chn_127_七海編_いたずら" || $GameName == 0)
	{
		$ChapterName = "chn_127_七海編_いたずら";
		$GameName = 0;
		chn_127_七海編_いたずら();
	}
	if($GameName == "chn_128_七海編_朝餉の準備" || $GameName == 0)
	{
		$ChapterName = "chn_128_七海編_朝餉の準備";
		$GameName = 0;
		chn_128_七海編_朝餉の準備();
	}
	if($GameName == "chn_129_七海編_朝食" || $GameName == 0)
	{
		$ChapterName = "chn_129_七海編_朝食";
		$GameName = 0;
		chn_129_七海編_朝食();
	}
	if($GameName == "chn_130_七海編_理想の妹" || $GameName == 0)
	{
		$ChapterName = "chn_130_七海編_理想の妹";
		$GameName = 0;
		chn_130_七海編_理想の妹();
	}
	if($GameName == "chn_131_七海編_噛み合わない会話" || $GameName == 0)
	{
		$ChapterName = "chn_131_七海編_噛み合わない会話";
		$GameName = 0;
		chn_131_七海編_噛み合わない会話();
	}
	if($GameName == "chn_132_七海編_混乱" || $GameName == 0)
	{
		$ChapterName = "chn_132_七海編_混乱";
		$GameName = 0;
		chn_132_七海編_混乱();
	}
	if($GameName == "chn_133_七海編_同衾" || $GameName == 0)
	{
		$ChapterName = "chn_133_七海編_同衾";
		$GameName = 0;
		chn_133_七海編_同衾();
	}
	if($GameName == "chn_134_七海編_七海帰還２" || $GameName == 0)
	{
		$ChapterName = "chn_134_七海編_七海帰還２";
		$GameName = 0;
		chn_134_七海編_七海帰還２();
	}
	if($GameName == "chn_135_七海編_二人のナナ" || $GameName == 0)
	{
		$ChapterName = "chn_135_七海編_二人のナナ";
		$GameName = 0;
		chn_135_七海編_二人のナナ();
	}
	if($GameName == "chn_136_七海編_僕は妹とキスをする" || $GameName == 0)
	{
		$ChapterName = "chn_136_七海編_僕は妹とキスをする";
		$GameName = 0;
		chn_136_七海編_僕は妹とキスをする();
	}

	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}

	$ClearL=true;
	#ClearG=true;
	#ClearPieceN=true;

}
//=============================================================================//






