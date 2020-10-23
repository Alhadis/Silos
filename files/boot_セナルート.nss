#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"
#include "nss/function_Dos.nss"

#include "nss/chs_153_セナ編_第７の事件.nss"
#include "nss/chs_154_セナ編_１１月５日水.nss"
#include "nss/chs_155_セナ編_希本社ビル.nss"
#include "nss/chs_156_セナ編_罠.nss"
#include "nss/chs_157_セナ編_渋谷崩壊.nss"
#include "nss/chs_158_セナ編_理性崩壊.nss"
#include "nss/chs_159_セナ編_電気仕掛けの世界.nss"
#include "nss/chs_160_セナ編_デウス・エクス・マキナ.nss"
#include "nss/chs_161_セナ編_インターミッションＳ１.nss"
#include "nss/chs_162_セナ編_死の街.nss"
#include "nss/chs_163_セナ編_チートコード.nss"
#include "nss/chs_164_セナ編_襲撃.nss"
#include "nss/chs_165_セナ編_月まで届け赤き刃.nss"

#include "nss/chz_222_エンドクレジット.nss"

#include "nss/chs_166_セナ編_エピローグ.nss"


//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "boot_セナルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeS;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeS
{

	if($GameName == "boot_セナルート")
	{
		$GameName = 0;
	}

	if($GameName == "chs_153_セナ編_第７の事件" || $GameName == 0)
	{
		$ChapterName = "chs_153_セナ編_第７の事件";
		$GameName = 0;
		chs_153_セナ編_第７の事件();
	}
	if($GameName == "chs_154_セナ編_１１月５日水" || $GameName == 0)
	{
		$ChapterName = "chs_154_セナ編_１１月５日水";
		$GameName = 0;
		chs_154_セナ編_１１月５日水();
	}
	if($GameName == "chs_155_セナ編_希本社ビル" || $GameName == 0)
	{
		$ChapterName = "chs_155_セナ編_希本社ビル";
		$GameName = 0;
		chs_155_セナ編_希本社ビル();
	}
	if($GameName == "chs_156_セナ編_罠" || $GameName == 0)
	{
		$ChapterName = "chs_156_セナ編_罠";
		$GameName = 0;
		chs_156_セナ編_罠();
	}
	if($GameName == "chs_157_セナ編_渋谷崩壊" || $GameName == 0)
	{
		$ChapterName = "chs_157_セナ編_渋谷崩壊";
		$GameName = 0;
		chs_157_セナ編_渋谷崩壊();
	}
	if($GameName == "chs_158_セナ編_理性崩壊" || $GameName == 0)
	{
		$ChapterName = "chs_158_セナ編_理性崩壊";
		$GameName = 0;
		chs_158_セナ編_理性崩壊();
	}
	if($GameName == "chs_159_セナ編_電気仕掛けの世界" || $GameName == 0)
	{
		$ChapterName = "chs_159_セナ編_電気仕掛けの世界";
		$GameName = 0;
		chs_159_セナ編_電気仕掛けの世界();
	}
	if($GameName == "chs_160_セナ編_デウス・エクス・マキナ" || $GameName == 0)
	{
		$ChapterName = "chs_160_セナ編_デウス・エクス・マキナ";
		$GameName = 0;
		chs_160_セナ編_デウス・エクス・マキナ();
	}
	if($GameName == "chs_161_セナ編_インターミッションＳ１" || $GameName == 0)
	{
		$ChapterName = "chs_161_セナ編_インターミッションＳ１";
		$GameName = 0;
		chs_161_セナ編_インターミッションＳ１();
	}
	if($GameName == "chs_162_セナ編_死の街" || $GameName == 0)
	{
		$ChapterName = "chs_162_セナ編_死の街";
		$GameName = 0;
		chs_162_セナ編_死の街();
	}
	if($GameName == "chs_163_セナ編_チートコード" || $GameName == 0)
	{
		$ChapterName = "chs_163_セナ編_チートコード";
		$GameName = 0;
		chs_163_セナ編_チートコード();
	}
	if($GameName == "chs_164_セナ編_襲撃" || $GameName == 0)
	{
		$ChapterName = "chs_164_セナ編_襲撃";
		$GameName = 0;
		chs_164_セナ編_襲撃();
	}
	if($GameName == "chs_165_セナ編_月まで届け赤き刃" || $GameName == 0)
	{
		$ChapterName = "chs_165_セナ編_月まで届け赤き刃";
		$GameName = 0;
		chs_165_セナ編_月まで届け赤き刃();
	}

	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}

	if($GameName == "chs_166_セナ編_エピローグ" || $GameName == 0)
	{
		$ChapterName = "chs_166_セナ編_エピローグ";
		$GameName = 0;
		chs_166_セナ編_エピローグ();
	}


	$ClearL=true;
	#ClearG=true;
	#ClearPieceS=true;

}
//=============================================================================//






