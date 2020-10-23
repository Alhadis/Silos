#include "nss/function.nss"
#include "nss/function_stand.nss"
#include "nss/function_select.nss"
#include "nss/function_chat.nss"
#include "nss/function_mmo.nss"
#include "nss/function_board.nss"

#include "nss/chr_170_梨深編_インターミッションＲ１.nss"
#include "nss/chr_171_梨深編_壊れた心.nss"
#include "nss/chr_172_梨深編_偽りの日常.nss"
#include "nss/chr_173_梨深編_梨深の心象風景.nss"
#include "nss/chr_174_梨深編_インターミッションＲ２a.nss"
#include "nss/chr_175_梨深編_インターミッションＲ２b.nss"
#include "nss/chr_176_梨深編_インターミッションＲ３a.nss"
#include "nss/chr_177_梨深編_インターミッションＲ３b.nss"

#include "nss/chz_222_エンドクレジット.nss"

#include "nss/chr_178_梨深編_エピローグ.nss"

//============================================================================//
..//■ゲームモード判別■
//============================================================================//
chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "boot_梨深ルート";
		$GameContiune = 1;
		Reset();
	}

		call_scene @->SelectStoryModeR;

}
//=============================================================================//






//============================================================================//
..//■ゲーム開始■
//============================================================================//

// ---------- 頭から ---------- //
//本番用初期化用フラグ
scene SelectStoryModeR
{

	if($GameName == "boot_梨深ルート")
	{
		$GameName = 0;
	}

	if($GameName == "chr_170_梨深編_インターミッションＲ１" || $GameName == 0)
	{
		$ChapterName = "chr_170_梨深編_インターミッションＲ１";
		$GameName = 0;
		chr_170_梨深編_インターミッションＲ１();
	}
	if($GameName == "chr_171_梨深編_壊れた心" || $GameName == 0)
	{
		$ChapterName = "chr_171_梨深編_壊れた心";
		$GameName = 0;
		chr_171_梨深編_壊れた心();
	}
	if($GameName == "chr_172_梨深編_偽りの日常" || $GameName == 0)
	{
		$ChapterName = "chr_172_梨深編_偽りの日常";
		$GameName = 0;
		chr_172_梨深編_偽りの日常();
	}
	if($GameName == "chr_173_梨深編_梨深の心象風景" || $GameName == 0)
	{
		$ChapterName = "chr_173_梨深編_梨深の心象風景";
		$GameName = 0;
		chr_173_梨深編_梨深の心象風景();
	}
	if($GameName == "chr_174_梨深編_インターミッションＲ２a" || $GameName == 0)
	{
		$ChapterName = "chr_174_梨深編_インターミッションＲ２a";
		$GameName = 0;
		chr_174_梨深編_インターミッションＲ２a();
	}
	if($GameName == "chr_175_梨深編_インターミッションＲ２b" || $GameName == 0)
	{
		$ChapterName = "chr_175_梨深編_インターミッションＲ２b";
		$GameName = 0;
		chr_175_梨深編_インターミッションＲ２b();
	}
	if($GameName == "chr_176_梨深編_インターミッションＲ３a" || $GameName == 0)
	{
		$ChapterName = "chr_176_梨深編_インターミッションＲ３a";
		$GameName = 0;
		chr_176_梨深編_インターミッションＲ３a();
	}
	if($GameName == "chr_177_梨深編_インターミッションＲ３b" || $GameName == 0)
	{
		$ChapterName = "chr_177_梨深編_インターミッションＲ３b";
		$GameName = 0;
		chr_177_梨深編_インターミッションＲ３b();
	}
	if($GameName == "chr_178_梨深編_エピローグ" || $GameName == 0)
	{
		$ChapterName = "chr_178_梨深編_エピローグ";
		$GameName = 0;
		chr_178_梨深編_エピローグ();
	}
	if($GameName == "chz_222_エンドクレジット" || $GameName == 0)
	{
		$ChapterName = "chz_222_エンドクレジット";
		$GameName = 0;
		chz_222_エンドクレジット();
	}


	$ClearL=true;
	#ClearG=true;
	#ClearPieceR=true;

}
//=============================================================================//






