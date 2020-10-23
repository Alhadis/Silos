#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"

#include "nss/ch08_154_インターミッション３３.nss"

#include "nss/chy_153_優愛編_インターミッションＹ１Ａ.nss"
#include "nss/chy_154_優愛編_インターミッションＹ１Ｂ.nss"
#include "nss/chy_155_優愛編_第７の事件.nss"
#include "nss/chy_156_優愛編_訪問者.nss"
#include "nss/chy_157_優愛編_インターミッションＹ２.nss"
#include "nss/chy_158_優愛編_監禁.nss"
#include "nss/chy_159_優愛編_食べて.nss"
#include "nss/chy_160_優愛編_逆監禁できるかも.nss"
#include "nss/chy_161_優愛編_消えた優愛.nss"
#include "nss/chy_162_優愛編_日記帳.nss"
#include "nss/chy_163_優愛編_君は誰.nss"
#include "nss/chy_164_優愛編_インターミッションＹ３.nss"
#include "nss/chy_165_優愛編_楠美愛.nss"
#include "nss/chy_166_優愛編_さよなら.nss"
#include "nss/chy_167_優愛編_インターミッションＹ４.nss"

#include "nss/chz_222_エンドクレジット.nss"

//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "boot_優愛ルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeY;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeY
{

	if($GameName == "boot_優愛ルート")
	{
		$GameName = 0;
	}

	if($GameName == "chy_153_優愛編_インターミッションＹ１Ａ" || $GameName == 0)
	{
		$ChapterName = "chy_153_優愛編_インターミッションＹ１Ａ";
		$GameName = 0;
		chy_153_優愛編_インターミッションＹ１Ａ();
	}
	if($GameName == "chy_154_優愛編_インターミッションＹ１Ｂ" || $GameName == 0)
	{
		$ChapterName = "chy_154_優愛編_インターミッションＹ１Ｂ";
		$GameName = 0;
		chy_154_優愛編_インターミッションＹ１Ｂ();
	}
	if($GameName == "chy_155_優愛編_第７の事件" || $GameName == 0)
	{
		$ChapterName = "chy_155_優愛編_第７の事件";
		$GameName = 0;
		chy_155_優愛編_第７の事件();
	}
	if($GameName == "chy_156_優愛編_訪問者" || $GameName == 0)
	{
		$ChapterName = "chy_156_優愛編_訪問者";
		$GameName = 0;
		chy_156_優愛編_訪問者();
	}
	if($GameName == "chy_157_優愛編_インターミッションＹ２" || $GameName == 0)
	{
		$ChapterName = "chy_157_優愛編_インターミッションＹ２";
		$GameName = 0;
		chy_157_優愛編_インターミッションＹ２();
	}
	if($GameName == "chy_158_優愛編_監禁" || $GameName == 0)
	{
		$ChapterName = "chy_158_優愛編_監禁";
		$GameName = 0;
		chy_158_優愛編_監禁();
	}
	if($GameName == "chy_159_優愛編_食べて" || $GameName == 0)
	{
		$ChapterName = "chy_159_優愛編_食べて";
		$GameName = 0;
		chy_159_優愛編_食べて();
	}
	if($GameName == "chy_160_優愛編_逆監禁できるかも" || $GameName == 0)
	{
		$ChapterName = "chy_160_優愛編_逆監禁できるかも";
		$GameName = 0;
		chy_160_優愛編_逆監禁できるかも();
	}
	if($GameName == "chy_161_優愛編_消えた優愛" || $GameName == 0)
	{
		$ChapterName = "chy_161_優愛編_消えた優愛";
		$GameName = 0;
		chy_161_優愛編_消えた優愛();
	}
	if($GameName == "chy_162_優愛編_日記帳" || $GameName == 0)
	{
		$ChapterName = "chy_162_優愛編_日記帳";
		$GameName = 0;
		chy_162_優愛編_日記帳();
	}
	if($GameName == "chy_163_優愛編_君は誰" || $GameName == 0)
	{
		$ChapterName = "chy_163_優愛編_君は誰";
		$GameName = 0;
		chy_163_優愛編_君は誰();
	}
	if($GameName == "chy_164_優愛編_インターミッションＹ３" || $GameName == 0)
	{
		$ChapterName = "chy_164_優愛編_インターミッションＹ３";
		$GameName = 0;
		chy_164_優愛編_インターミッションＹ３();
	}
	if($GameName == "chy_165_優愛編_楠美愛" || $GameName == 0)
	{
		$ChapterName = "chy_165_優愛編_楠美愛";
		$GameName = 0;
		chy_165_優愛編_楠美愛();
	}
	if($GameName == "chy_166_優愛編_さよなら" || $GameName == 0)
	{
		$ChapterName = "chy_166_優愛編_さよなら";
		$GameName = 0;
		chy_166_優愛編_さよなら();
	}
	if($GameName == "chy_167_優愛編_インターミッションＹ４" || $GameName == 0)
	{
		$ChapterName = "chy_167_優愛編_インターミッションＹ４";
		$GameName = 0;
		chy_167_優愛編_インターミッションＹ４();
	}


	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}

	$ClearL=true;
	#ClearG=true;
	#ClearPieceY=true;
}
//=============================================================================//






