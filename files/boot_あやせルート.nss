#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"

#include "nss/ch08_157_インターミッション３４.nss"

#include "nss/cha_153_あやせ編_第７の事件.nss"
#include "nss/cha_154_あやせ編_インターミッション３４.nss"
#include "nss/cha_155_あやせ編_１１月６日木.nss"
#include "nss/cha_156_あやせ編_血塗られた黒騎士.nss"
#include "nss/cha_157_あやせ編_６７億在る世界.nss"
#include "nss/cha_158_あやせ編_黙示録詩編.nss"
#include "nss/cha_159_あやせ編_罪過に契約のチョコを.nss"
#include "nss/cha_160_あやせ編_邪心昇華の儀式.nss"
#include "nss/cha_161_あやせ編_グラジオール覚醒.nss"
#include "nss/cha_162_あやせ編_相克世界.nss"
#include "nss/cha_163_あやせ編_黒い霞と虚ろな瞳.nss"
#include "nss/cha_164_あやせ編_赤銅色の青い空.nss"
#include "nss/cha_165_あやせ編_小さな世界の希望となって.nss"
#include "nss/cha_166_あやせ編_顕現する邪心.nss"
#include "nss/cha_167_あやせ編_罪過に契約の血を.nss"
#include "nss/cha_168_あやせ編_開け天国の扉.nss"

#include "nss/chz_222_エンドクレジット.nss"

#include "nss/cha_169_あやせ編_エピローグ.nss"


//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "boot_あやせルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeA;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeA
{

	if($GameName == "boot_あやせルート")
	{
		$GameName = 0;
	}

	if($GameName == "chs_153_あやせ編_第７の事件" || $GameName == 0)
	{
		$ChapterName = "chs_153_あやせ編_第７の事件";
		$GameName = 0;
		chs_153_あやせ編_第７の事件();
	}
	if($GameName == "cha_153_あやせ編_第７の事件" || $GameName == 0)
	{
		$ChapterName = "cha_153_あやせ編_第７の事件";
		$GameName = 0;
		cha_153_あやせ編_第７の事件();
	}
	if($GameName == "cha_154_あやせ編_インターミッション３４" || $GameName == 0)
	{
		$ChapterName = "cha_154_あやせ編_インターミッション３４";
		$GameName = 0;
		cha_154_あやせ編_インターミッション３４();
	}
	if($GameName == "cha_155_あやせ編_１１月６日木" || $GameName == 0)
	{
		$ChapterName = "cha_155_あやせ編_１１月６日木";
		$GameName = 0;
		cha_155_あやせ編_１１月６日木();
	}
	if($GameName == "cha_156_あやせ編_血塗られた黒騎士" || $GameName == 0)
	{
		$ChapterName = "cha_156_あやせ編_血塗られた黒騎士";
		$GameName = 0;
		cha_156_あやせ編_血塗られた黒騎士();
	}
	if($GameName == "cha_157_あやせ編_６７億在る世界" || $GameName == 0)
	{
		$ChapterName = "cha_157_あやせ編_６７億在る世界";
		$GameName = 0;
		cha_157_あやせ編_６７億在る世界();
	}
	if($GameName == "cha_158_あやせ編_黙示録詩編" || $GameName == 0)
	{
		$ChapterName = "cha_158_あやせ編_黙示録詩編";
		$GameName = 0;
		cha_158_あやせ編_黙示録詩編();
	}
	if($GameName == "cha_159_あやせ編_罪過に契約のチョコを" || $GameName == 0)
	{
		$ChapterName = "cha_159_あやせ編_罪過に契約のチョコを";
		$GameName = 0;
		cha_159_あやせ編_罪過に契約のチョコを();
	}
	if($GameName == "cha_160_あやせ編_邪心昇華の儀式" || $GameName == 0)
	{
		$ChapterName = "cha_160_あやせ編_邪心昇華の儀式";
		$GameName = 0;
		cha_160_あやせ編_邪心昇華の儀式();
	}
	if($GameName == "cha_161_あやせ編_グラジオール覚醒" || $GameName == 0)
	{
		$ChapterName = "cha_161_あやせ編_グラジオール覚醒";
		$GameName = 0;
		cha_161_あやせ編_グラジオール覚醒();
	}
	if($GameName == "cha_162_あやせ編_相克世界" || $GameName == 0)
	{
		$ChapterName = "cha_162_あやせ編_相克世界";
		$GameName = 0;
		cha_162_あやせ編_相克世界();
	}
	if($GameName == "cha_163_あやせ編_黒い霞と虚ろな瞳" || $GameName == 0)
	{
		$ChapterName = "cha_163_あやせ編_黒い霞と虚ろな瞳";
		$GameName = 0;
		cha_163_あやせ編_黒い霞と虚ろな瞳();
	}
	if($GameName == "cha_164_あやせ編_赤銅色の青い空" || $GameName == 0)
	{
		$ChapterName = "cha_164_あやせ編_赤銅色の青い空";
		$GameName = 0;
		cha_164_あやせ編_赤銅色の青い空();
	}
	if($GameName == "cha_165_あやせ編_小さな世界の希望となって" || $GameName == 0)
	{
		$ChapterName = "cha_165_あやせ編_小さな世界の希望となって";
		$GameName = 0;
		cha_165_あやせ編_小さな世界の希望となって();
	}
	if($GameName == "cha_166_あやせ編_純粋なる邪心の剣" || $GameName == 0)
	{
		$ChapterName = "cha_166_あやせ編_純粋なる邪心の剣";
		$GameName = 0;
		cha_166_あやせ編_純粋なる邪心の剣();
	}
	if($GameName == "cha_166_あやせ編_顕現する邪心" || $GameName == 0)
	{
		$ChapterName = "cha_166_あやせ編_顕現する邪心";
		$GameName = 0;
		cha_166_あやせ編_顕現する邪心();
	}
	if($GameName == "cha_167_あやせ編_罪過に契約の血を" || $GameName == 0)
	{
		$ChapterName = "cha_167_あやせ編_罪過に契約の血を";
		$GameName = 0;
		cha_167_あやせ編_罪過に契約の血を();
	}
	if($GameName == "cha_168_あやせ編_開け天国の扉" || $GameName == 0)
	{
		$ChapterName = "cha_168_あやせ編_開け天国の扉";
		$GameName = 0;
		cha_168_あやせ編_開け天国の扉();
	}

	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}

	if($GameName == "cha_169_あやせ編_エピローグ" || $GameName == 0)
	{
		$ChapterName = "cha_169_あやせ編_エピローグ";
		$GameName = 0;
		cha_169_あやせ編_エピローグ();
	}


	$ClearL=true;
	#ClearG=true;
	#ClearPieceA=true;

}
//=============================================================================//






