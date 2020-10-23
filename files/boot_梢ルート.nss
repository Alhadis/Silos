#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"

#include "nss/chk_151_梢編_インターミッション３３Ａ.nss"
#include "nss/chk_152_梢編_第７の事件.nss"
#include "nss/chk_153_梢編_１１月５日水.nss"
#include "nss/chk_154_梢編_ぶちゅぶちゅさん.nss"
#include "nss/chk_155_梢編_僕を撮るな.nss"
#include "nss/chk_156_梢編_こちらスパイダー.nss"
#include "nss/chk_157_梢編_インターミッションＫ１.nss"
#include "nss/chk_158_梢編_味方だよね.nss"
#include "nss/chk_159_梢編_惨劇の後.nss"
#include "nss/chk_160_梢編_裏切り.nss"
#include "nss/chk_161_梢編_殺意.nss"
#include "nss/chk_162_梢編_インターミッションＫ２.nss"
#include "nss/chk_163_梢編_たった１人の友達.nss"
#include "nss/chk_164_梢編_星は永遠に.nss"

#include "nss/chz_222_エンドクレジット.nss"

//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "boot_梢ルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeK;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeK
{

	if($GameName == "boot_梢ルート")
	{
		$GameName = 0;
	}

	if($GameName == "chk_151_梢編_インターミッション３３Ａ" || $GameName == 0)
	{
		$ChapterName = "chk_151_梢編_インターミッション３３Ａ";
		$GameName = 0;
		chk_151_梢編_インターミッション３３Ａ();
	}
	if($GameName == "chk_152_梢編_第７の事件" || $GameName == 0)
	{
		$ChapterName = "chk_152_梢編_第７の事件";
		$GameName = 0;
		chk_152_梢編_第７の事件();
	}
	if($GameName == "chk_153_梢編_１１月５日水" || $GameName == 0)
	{
		$ChapterName = "chk_153_梢編_１１月５日水";
		$GameName = 0;
		chk_153_梢編_１１月５日水();
	}
	if($GameName == "chk_154_梢編_ぶちゅぶちゅさん" || $GameName == 0)
	{
		$ChapterName = "chk_154_梢編_ぶちゅぶちゅさん";
		$GameName = 0;
		chk_154_梢編_ぶちゅぶちゅさん();
	}
	if($GameName == "chk_155_梢編_僕を撮るな" || $GameName == 0)
	{
		$ChapterName = "chk_155_梢編_僕を撮るな";
		$GameName = 0;
		chk_155_梢編_僕を撮るな();
	}
	if($GameName == "chk_156_梢編_こちらスパイダー" || $GameName == 0)
	{
		$ChapterName = "chk_156_梢編_こちらスパイダー";
		$GameName = 0;
		chk_156_梢編_こちらスパイダー();
	}
	if($GameName == "chk_157_梢編_インターミッションＫ１" || $GameName == 0)
	{
		$ChapterName = "chk_157_梢編_インターミッションＫ１";
		$GameName = 0;
		chk_157_梢編_インターミッションＫ１();
	}
	if($GameName == "chk_158_梢編_味方だよね" || $GameName == 0)
	{
		$ChapterName = "chk_158_梢編_味方だよね";
		$GameName = 0;
		chk_158_梢編_味方だよね();
	}
	if($GameName == "chk_159_梢編_惨劇の後" || $GameName == 0)
	{
		$ChapterName = "chk_159_梢編_惨劇の後";
		$GameName = 0;
		chk_159_梢編_惨劇の後();
	}
	if($GameName == "chk_160_梢編_裏切り" || $GameName == 0)
	{
		$ChapterName = "chk_160_梢編_裏切り";
		$GameName = 0;
		chk_160_梢編_裏切り();
	}
	if($GameName == "chk_161_梢編_殺意" || $GameName == 0)
	{
		$ChapterName = "chk_161_梢編_殺意";
		$GameName = 0;
		chk_161_梢編_殺意();
	}
	if($GameName == "chk_162_梢編_インターミッションＫ２" || $GameName == 0)
	{
		$ChapterName = "chk_162_梢編_インターミッションＫ２";
		$GameName = 0;
		chk_162_梢編_インターミッションＫ２();
	}
	if($GameName == "chk_163_梢編_たった１人の友達" || $GameName == 0)
	{
		$ChapterName = "chk_163_梢編_たった１人の友達";
		$GameName = 0;
		chk_163_梢編_たった１人の友達();
	}
	if($GameName == "chk_164_梢編_星は永遠に" || $GameName == 0)
	{
		$ChapterName = "chk_164_梢編_星は永遠に";
		$GameName = 0;
		chk_164_梢編_星は永遠に();
	}


	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}

	$ClearL=true;
	#ClearG=true;
	#ClearPieceK=true;

}
//=============================================================================//






