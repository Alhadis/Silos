//<continuation number="510">





chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_050_妄想トリガー１０■";
		$GameContiune = 1;
		Reset();
	}

		ch03_050_妄想トリガー１０■();
}


function ch03_050_妄想トリガー１０■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg084_01_3_渋谷センター街_a.jpg");
	Delete("背景２");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１へ
//ネガティブ妄想→分岐２へ
//妄想しない→分岐３へ

if($妄想トリガー通過１０ == 0)
{
	SetChoice03("ポジティブ妄想","ネガティブ妄想","妄想しない");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA03();
			$妄想トリガー１０ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１０ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１０ = 0;
		}
	}

	if($妄想トリガー１０ == 0)
	{
		SetChoice02("１週目","２週目以降");
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
				#ClearG=false;
			}
			case @選択肢２:
			{
				ChoiceB02();
				#ClearG=true;
			}
		}
	}
}



//=============================================================================//

if($妄想トリガー１０ == 2)
{
//☆☆☆
//分岐１

//	BoxDelete(200);

	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");
	DrawTransition("背景２", 500, 0, 1000, 100, null, "cg/data/up.png", true);
	Delete("背景１");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
女子Ｂはそんな僕を冷たく見下ろしていた。

//ＣＧ//尻餅をついた拓巳を見下ろすセナ
っていうか、近い……。

ナマ足が、すぐ目の前にあるじゃないか……。
か、角度的には……スカートの中も……見えそう……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000010sn">
「やはり見えるのか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000020ta">
「す、すす、すいませんっ、見てないですっ」

慌てて目を伏せる。

きっと“パンツ見ただろ”って因縁をつけてくる気だ。

でも僕は誓って見てないぞ！　見えそうだったけどまだ見てない！
それに三次元のパンツになんて興味ないんだ！　僕がハァハァするパンツは二次元やフィギュアのものだけだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 0, 0, null);
	MusicStart("@SE*",0,0,0,0,null,false);

	DelusionIn();

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");

	CreateSE("SE01","SE_日常_雑踏01");
	SoundPlay("SE01", 2000, 1000, true);

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000030sn">
「嘘だ。絶対見た」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000040sn">
「さっきから、チラチラ見てただろう」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000050ta">
「ホ、ホントに、見てない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000060sn">
「ふーん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");

	SoundPlay("SE01", 2000, 0, false);
	BGMPlay360("CH05",0,1000,true);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	Fade("色１", 500, 1000, null, true);
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
すると女子Ｂは、なぜかその場でローファーとハイソックスを脱ぎ始めた。

その仕草の最中にもスカートの中が見えそうになり、目のやり場に困ってしまう。

なんとか相手の隙を見て逃げようと思ったけど、女子Ｂは靴下を脱ぎながらも僕から目を離そうとしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, -760, "cg/ev/ev110_01_3_セナ足_a.jpg");
	Fade("色１", 500, 0, null, true);
	Wait(1000);
	Move("背景１", 3000, @0, @256, AxlDxl, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
裸足になった女子Ｂは、僕の目と鼻の先に仁王立ちして、蔑むように唇の端をつり上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景１", 4000, @0, @296, AxlDxl, true);
	Wait(1000);
	Move("背景１", 4000, @0, @304, AxlDxl, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000070sn">
「白状させてやる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000080ta">
「はうっ！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(300);

	Zoom("背景１", 100, 1020, 1020, Dxl2, true);
	Zoom("背景１", 100, 1000, 1000, Axl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
いきなり、女子Ｂの生温かい素足が僕の股間を踏みつけてきた。
突然の屈辱に僕は困惑するしかない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000090sn">
「ほら、どうだ？　ぐりぐり」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000100ta">
「ちょ、やめ……っ」

周囲を歩く人たちは僕に見向きもしない。

誰かひとりくらい、助けてくれてもいいのに。
なんて冷たいんだ、この世の中は。

{	Zoom("背景１", 100, 1020, 1020, Dxl2, true);
	Zoom("背景１", 100, 1000, 1000, Axl2, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000110sn">
「ふん、だんだん大きくなってきたぞ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000120ta">
「う……っ」

渋谷センター街のど真ん中で、こんなことされるなんて……。
悔しい……でも感じちゃう……！

{	Zoom("背景１", 100, 1020, 1020, Dxl2, true);
	Zoom("背景１", 100, 1000, 1000, Axl2, true);
	Zoom("背景１", 100, 1020, 1020, Dxl2, true);
	Zoom("背景１", 100, 1000, 1000, Axl2, true);
	Zoom("背景１", 100, 1020, 1020, Dxl2, true);
	Zoom("背景１", 100, 1000, 1000, Axl2, true);}
//※わざとこんな口調です
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000130ta">
「ひゃあああん、らめぇっ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ホワイトアウト
//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);
	MusicStart("@SE*", 100, 0, 0, 0, null, false);

	DelusionOut();

	Delete("背景*");
	Delete("色*");
//ＢＧ//センター街
	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_日常_雑踏01");
	SoundPlay("SE01", 2000, 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000140sn">
「答えろ。見えるんだな――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000150sn">
「ディソードが」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000160ta">
「え……？」

我に返った僕は、とっさに状況が把握できなくて、女子Ｂの顔をまじまじと見上げてしまった。

彼女は靴を履いたままだったし、
僕の股間を踏んづけたりもしていなかった。

なんだ……妄想だったのか……。
それに、パンツを見たか見てないかで因縁を付けられたわけでもないらしい。

それにしても、ディソード……？
なんだそれ？

初めて聞いた言葉だ。ソードって言うぐらいだし、女子Ｂが持ってる物の形状からしても、きっと剣のことなんだろうけど。

で、剣が、見えるのか、だって？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

if($妄想トリガー１０ == 1)
{

//☆☆☆
//分岐２
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 100, 0, null);
	MusicStart("@SE*", 100, 0, 0, 0, null, false);


	DelusionIn();

//	BoxDelete(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000170sn">
「やはり間違いない……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000180sn">
「お前、私が見えているんだろう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000190ta">
「は、はい……？」

今、“私が見えている”って言った？
“私”って、つまり、目の前に立っている、女子Ｂのこと？

{	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg084_01_3_渋谷センター街_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	BGMPlay360("CH01",0,1000,true);}
ふと、女子Ｂは表情を切なそうに歪めて、僕の前にしゃがみ込んだ。
同じ目線の高さで、僕にすがるような視線を向けてくる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000200sn">
「私、誰にも見つけてもらえなくて」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000210sn">
「どれだけ声を出しても、誰にも届かなくて」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000220sn">
「身体はすり抜けちゃうし……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000230sn">
「寒いし……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000240sn">
「ほら、見て。私、足も透けちゃって……」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000250sn">
「自分になにが起きたのか、さっぱり、分からなくて……」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000260sn">
「もう、何年も、何十年も、この場所を……
　さまよっていたような気がする……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
まさか……ゆ、ゆ、ゆゆ幽霊……！？
そんなバカな。僕は霊感なんてまったくないのに。

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000270sn">
「ずっと……探してた」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000280sn">
「私を見つけてくれる人を」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000290sn">
「ありがとう」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000300sn">
「ありがとう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000310sn">
「お礼に――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 500, 0, null);
	Wait(1000);

	CreateSE("SE01","SE_衝撃_衝撃音02");

//イメージＢＧ//ミイラのような手を連想させるビジュアル
//第１章の使い回しでいい気がします
	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev009_01_4_腕掴みミイラ_a.jpg");
	DrawTransition("背景１", 200, 0, 1000, 100, null, "cg/data/left2.png", true);

	SoundPlay("SE01", 0, 1000, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆狂気の声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000320sn">
「お前に取り憑いてやるッ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume360("CH*", 100, 0, null);
	MusicStart("@SE*", 100, 0, 0, 0, null, false);

	DelusionOut();

	Delete("背景*");
	Delete("色*");
	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");

	DelusionOut2();
	NegativeHuman();

	Wait(1000);


//ＢＧ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	SoundPlay("SE01", 2000, 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000330sn">
「答えろ。見えるんだな――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000340sn">
「ディソードが」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000350ta">
「え……？」

我に返った僕は、とっさに状況が把握できなくて、女子Ｂの顔をまじまじと見上げてしまった。

彼女は泣いていなかったし、足が透けてもいなかったし、手も普通の手だった。

なんだ……妄想だったのか……。

それにしても、ディソード……？
なんだそれ？

初めて聞いた言葉だ。ソードって言うぐらいだし、女子Ｂが持ってる物の形状からしても、きっと剣のことなんだろうけど。

で、剣が、見えるのか、だって？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流２へ

}


//=============================================================================//

if($妄想トリガー１０ == 0)
{

//☆☆☆
//分岐３

//	BoxDelete(200);

	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev027_01_3_見下ろしセナ_a.jpg");
	DrawTransition("背景２", 500, 0, 1000, 100, null, "cg/data/up.png", true);

	CreateSE("SE01","SE_日常_雑踏01");
	SoundPlay("SE01", 2000, 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
女子Ｂはそんな僕を冷たく見下ろしていた。

こいつ、異常だ……。
こんな剣を、人ごみの中で振り回すなんて。

まさかこの女……通り魔……！？
それとも、ニュージェネの犯人？
悪魔女の仲間！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
if(#ClearG && !$RouteON){
	TypeBegin();//――――――――――――――――――――――――――――――
}else{
	TypeBeginEX();//――――――――――――――――――――――――――――――
}



//※※３６０以下
if(#ClearG && !$RouteON){

//★セナ編_突入用分岐
//※以下のＹＥＳ／ＮＯ分岐は分岐しません。必ず全問に解答します
//全問正解で、セナ個別シナリオに分岐。以後、７章までは通常通りの流れに

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text901]
“もっと視姦してください”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$セナルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text902]
“この女になら全力で土下座してもいい”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$セナルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text903]
“むしろ踏まれたい”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$セナルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text904]
“剣でアッー！　されるんですね分かります”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→正解
//ＮＯ→ミス
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
				$セナルート無し=true;
			}
			case @選択肢１:
			{
				YES03();
			}
		}
		Wait(16);
	}

//■設定====================================================
	PreWhich03();

//ＹＥＳ／ＮＯ選択肢５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text905]
“どうせ僕はあの剣で殺されるんだ……”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→ミス
//ＮＯ→正解
	FadeWhich03();
	SetWhich03();
	while($WhichBreak){
		select
		{
			if($SYSTEM_skip||$SYSTEM_text_auto)
			{
				$SYSTEM_skip=false;
				$SYSTEM_text_auto=false;
			}
			//SelectCursor();
			if($SelectBreak){break;}
			case @選択肢２:
			{
				NO03();
			}
			case @選択肢１:
			{
				YES03();
				$セナルート無し=true;
			}
		}
		Wait(16);
		}

//すべて正解の場合
//フラグ【セナ編確定】ＯＮ
//ひとつでもミスがあった場合
//フラグ発生せず

//■選択肢終了
	EndWhich03();

	if($セナルート無し){
	}else{
		$セナルート=true;
		$RouteON=true;
//○実績No.14：ガルガリ君ソーダ味
		XBOX360_Achieved(14);
	}

//※※３６０以上

}




//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000360ta">
「た、助けて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000370ta">
「殺さないで……」

気が付けば僕は震えていた。
今にも恐怖で小便をちびりそうだった。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000380sn">
「ふん……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000390sn">
「なにを勘違いしている」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000400sn">
「私はただ、見えるのかと聞いているだけだ」

いったい、なんの話だよ……。

見えなかったら殺すのか？
なにが見えるのか分からないのに、答えられるわけないじゃないか……！

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000410sn">
「少し落ち着け」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000420sn">
「もう一度聞くぞ？」

{	SetVolume360("CH*", 1000, 0, null);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000430sn">
「この剣――ディソードが、見えるのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000440ta">
「え……？」

ディソード？

初めて聞いた言葉だ。
きっと、この女が持ってる剣のことなんだろうけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//合流２へ

}

//=============================================================================//

//☆☆☆
//合流２



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
とりあえずうなずいてみる。

そりゃ、見えるに決まってるよ……。見えない方がおかしいでしょ。

そんなに大きくて目立つ剣を、よりによってセンター街なんかでむき出しにして持ってるんだから。

これがアキバだったらまだ納得できたけど、よりによって渋谷でそれはないよ……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000450sn">
「そうか……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000460sn">
「お前も“集められた”んだな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/05000470ta">
「……？」

集められた？

誰が？
誰に？

少なくとも僕は自主的にここにいるんだけど……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000480sn">
「エラーを見たことがあるか？」

//わざと「おｋ」です。
{#TIPS_日本語でおｋ = true;$TIPS_on_日本語でおｋ = true;}
<FONT incolor="#88abda" outcolor="BLACK">日本語でおｋ</FONT>。

{$TIPS_on_日本語でおｋ = false;}
と言いそうになったけどさすがにその勇気はなかった。
だってヘタなこと言うと刺されそうなんだもん……。
っていうか、この女の言葉はさっきから意味不明なことばかりだ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000490sn">
「見たら教えろ」

{	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg084_01_3_渋谷センター街_a.jpg");
	DrawTransition("背景１", 300, 0, 1000, 100, null, "cg/data/left.png", true);
	Delete("背景２");
	Stand("stセナ_制服_横向剣持ち青","normal", 200, @50);
	FadeStand("stセナ_制服_横向剣持ち青_normal", 300, true);}
女子Ｂはそう言うと、その場で踵を返した。
彼女のスカートがフワリと風に揺れ、パンツが見えそうになる。

僕は急いで目を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//ＢＧ//黒
	CreateColor("back05", 200, 0, 0, 1280, 720, "Black");
	DrawTransition("back05", 200, 0, 1000, 100, null, "cg/data/center.png", true);
	DeleteStand("stセナ_制服_横向剣持ち青_normal", 0, true);

	CreateSE("SE03","SE_自然_風音_強_LOOP");
	SoundPlay("SE03", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000500sn">
「私は３年の<RUBY text="あおい">蒼井</RUBY>セナ」

//駅前の電車、とはハチ公前にある、古い東急電車のカットボディのことです
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch03/05000510sn">
「駅前の電車にいる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 1500, 0, false);
	Wait(1500);
	DrawTransition("back05", 1000, 1000, 0, 100, null, "cg/data/center.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//ＢＧ//センター街//夜
目を開く。

すでにそこに、セナと名乗った女子の姿はなかった。

僕はただ呆然としてしまっていて、彼女が言っていた言葉のなにひとつも理解できていないことに気付いたのは、ベースに帰ってからだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);

	Wait(2000);


//～～Ｆ・Ｏ

}