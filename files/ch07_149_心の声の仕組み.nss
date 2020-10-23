//<continuation number="160">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_149_心の声の仕組み";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch07_149_心の声の仕組み();
}


function ch07_149_心の声の仕組み()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("セナルート有り","セナルート無し");
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
			$セナルート=true;
			$RouteON=true;
			$GameDebugSelect = 0;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$セナルート=false;
		}
	}
}

if($GameDebugSelect == 1)
{
	SetChoice02("優愛ルート有り","優愛ルート無し");
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
			$優愛ルート=true;
			$RouteON=true;
			$GameDebugSelect = 0;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$優愛ルート=false;
		}
	}
}


if($GameDebugSelect == 1)
{
	SetChoice02("あやせルート有り","あやせルート無し");
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
			$あやせルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$あやせルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//ＢＧ//渋谷駅前//夕方
	CreateColor("黒", 500, 0, 0, 1280, 720, "Black");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg079_01_2_渋谷駅前_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("st梢_制服_武器構え青","shy", 200, @+150);
	FadeStand("st梢_制服_武器構え青_shy", 0, true);
	
	Fade("黒", 1000, 0, null, true);
	
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14900010ko">
「ほいじゃーねー。また明日なのら～」

{	DeleteStand("st梢_制服_武器構え青_shy", 500, true);}
こずぴぃははにかみながら小さく手を振って、駅の改札へと消えていった。
僕とセナはそれを見送る。

できればセナと２人きりになりたくなかった。

ただ、彼女はまだ渋谷から帰る気はないらしい。
またいつものようにこの辺を徘徊するんだろうか。

僕もさっさと帰りたかったけど、その前にどうしてもひとつだけ、このギガロマニアックス学の博士に聞いておきたいことがあった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14900020ta">
「あ、の……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 200, @+100);
	FadeStand("buセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900030sn">
「…………」

呼びかけても、セナはムスッとしたままだ。

こずぴぃがいるときはまだマシだったけど、やっぱり彼女は取っつきにくい……。

ドキドキしながら、声が届いているものと考えて僕は問いかけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14900040ta">
「こ、こずぴぃの、心の声も、ギガロマニアックスの、能力、なの？」

答えてくれるとは期待していなかった。
どうせ“ふん”と嘲笑されて終わりだろうと思っていた。

セナは、僕を一瞥し、それからスクランブル交差点の街頭ビジョンへと目を移して、

{	Stand("buセナ_制服_通常","angry", 200, @+100);
	FadeStand("buセナ_制服_通常_angry", 300, false);
	DeleteStand("buセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900050sn">
「心の声は、いわば妄想だ」

そう答えた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900060sn">
「梢はそれを他人のデッドスポットに送り込んでいるに過ぎない。仕組みはさっき説明したものとなにも変わらない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900070sn">
「送り込んだ粒子を、映像ではなく音声に変換しているんだ。電話と同じだな」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900080sn">
「そして、梢から心の声という妄想を送り込まれたことで、お前と梢の間で周囲共通認識が成立したんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900090sn">
「テレパシーで会話しているように思えるが、全然違う」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14900100ta">
「だ、だったら、ぼ、僕の心の声は、どうして、こずぴぃに届いたの？」

僕自身はこずぴぃのデッドスポットに妄想を送り込んだりなんてしていない。

それならこずぴぃからの一方通行の意思伝達しかできないはず。

なのに心の声による会話は成立した。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900110sn">
「ギガロマニアックスは、他人の妄想を“見る”ことができる。梢は特にその能力が高い」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900120sn">
「他人が垂れ流す妄想を、ほぼ強制的に“見せられている”と言ってもいい」

妄想を“見る”？
そんなことができるのか。

僕はそれができない。
だから僕はギガロマニアックスじゃない気がする……。

セナはふと遠い目をして、街頭ビジョンから交差点を歩く人ごみへと視線を移した。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900130sn">
「ギガロマニアックスとなった者は、誰だろうと一度は壊れているんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14900140ta">
「こ、壊れたって……なにが？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900150sn">
「……心が、だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
//★セナ編
if(!$セナルート&&!$優愛ルート&&!$あやせルート){
	TypeBeginEX2();//――――――――――――――――――――――――――――――
}else{
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(2000);

//“ch07_150_インターミッション３１ｂ”“ch07_151_１１月４日火”はカットして、“ch07_152_インターミッション３２”へ飛ぶ

//“ch07_152_インターミッション３２”内容は変更なし
}

if(!$セナルート&&!$優愛ルート&&!$あやせルート){

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14900160sn">
「梢は東京に来る前、“ヤツら”に追い詰められて心を壊した」

そしてセナは、こずぴぃが転校前に体験したことを話し始めた。セナはそれを、こずぴぃと初めて会ったときに映像として“見た”んだと言った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, null);
	Wait(2000);
}

//～～Ｆ・Ｏ
	PrintBG(1000);

if($あやせルート){
	ClearAll(2000);
	Wait(1000);
}




}