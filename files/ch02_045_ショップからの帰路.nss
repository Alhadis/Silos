//<continuation number="0">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_045_ショップからの帰路";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch02_045_ショップからの帰路();
}


function ch02_045_ショップからの帰路()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("七海ルート有り","七海ルート無し");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			$七海ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$七海ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//ＢＧ//道玄坂//夜
//背景のモブに、うなだれて道端に座っているホームレスがいる。胸元に『この街に審判が下される』と書かれたボードを持っている。拓巳はそのホームレスをスルー
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg027_04_3_道玄坂_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
その後も七海の下らない話に散々付き合わされ、ケータイ本体が僕の手許に戻ってきた頃には日も暮れていた。

長く、苦痛な数時間だった……。
ようやく七海と別れて帰路につくことができた。

もうすっかり秋になったみたいで、少し肌寒さを感じさせる夜風が、頭痛と吐き気のする身には心地いい。

人混みの中に長時間いると、僕はいつもこの頭痛と吐き気に苛まれる。

//わざと「氏ね」
七海なんか、氏ねばいいんだ。
死ね、まではいかなくてもいいけど、とにかく氏ね。

あいつは自分のことしか考えてない。

あいつの行動がどれだけ僕を傷つけているかなんて、どうせこれっぽっちも気付いてないんだろうな。

できることなら、今すぐにでも買ったケータイをバキッと真っ二つにして、近くのゴミ箱に捨ててしまいたい。
どうせ僕のお金で買ったものじゃないしね。

でもそんなことしたら、七海だけじゃなく両親までやって来て、懲りずにまた“壊れたから新しいケータイを買いに行こう”とか間抜けなことをのたまうに決まってる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg014_03_3_神泉町並み_a.jpg");
	Fade("背景２", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
だから僕はやむを得ず、破壊衝動をぐっと抑えた。

早く、帰ろう……。
帰って、今日もエンスーに潜ろう。

ここ数日、ストレスが溜まらない日がない。
僕の平穏な日々が早く戻ってきてくれないかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//★七海編
if(!$七海ルート){
	SetVolume360("CH*", 2000, 0, null);
	MusicStart("SE*", 2000, 0, 0, 1000, null, false);

	ClearAll(1000);
	Wait(2000);
}else{
	SetVolume360("CH*", 2000, 0, null);
	MusicStart("SE*", 2000, 0, 0, 1000, null, false);
	Wait(2000);
}


}

