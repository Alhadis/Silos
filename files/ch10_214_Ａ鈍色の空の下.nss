//<continuation number="70">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_214_Ａ鈍色の空の下";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_214_Ａ鈍色の空の下();
}


function ch10_214_Ａ鈍色の空の下()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("グッド","ノーマル");
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
			$Ａ２ルート = true;
		}
		case @選択肢２:
		{
			ChoiceB02();
		}
	}

	$GameDebugSelect = 0;
}

	$SYSTEM_text_auto=false;
	$SYSTEM_text_auto_lock=true;

//ＳＥ//雨
	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(3000);

//ＢＧ//黒
//渋谷は崩壊し瓦礫だらけ。天気は雨


	CreateColor("色１", 1000, 0, 0, 1280, 720, "BLACK");

//おがみ：ズーム
	CreateTexture360("背景０", 100, @0, @320, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");

//おがみ：バーテックス修正　//コメントアウト済み
//	SetVertex("背景０", 400, 0);//コメントアウト済み
	Request("背景０", Smoothing);
	Zoom("背景０", 0, 1500, 1500, null, true);

	CreateMovie360("雨１", 100, Center, Middle, true, false, "dx/mv雨01.avi");
	Request("雨１", AddRender);
	FadeDelete("色１", 3000, true);

	Wait(2000);

	$SYSTEM_text_interval = 128;
	LoadBox10();



//※拓巳視点に戻る
//※以下、第１章インターミッション０１とほぼ同じ

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text001]
いつの間に、雨が降り出したんだろう。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text002]
激しい爆発が起きた。<?>
{WaitKey(3000);}
その爆風で。
{WaitKey(2500);}
僕の身体はボロ切れみたいに軽々と飛ばされ。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text003]
気が付けば、ここにいた――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//うっすらと崩壊渋谷が見える

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text004]
その瞳は、いつも僕を見つめていて。
{WaitKey(2500);}
眼差しは、厚くて真っ黒な雨雲を突き抜けて。
{WaitKey(2500);}
雨のように僕へと降り注ぐ。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//以下、画面黒で文章のみ画面中央にカットイン
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text901]
――僕を、見るな。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――
//以上、画面黒で文章のみ画面中央にカットイン

//ＢＧ//崩壊渋谷//雨

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 100, @0, @0, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	FadeDelete("@text901", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text005]
雨の冷たさより、背中を預けている瓦礫の冷たさのせいで、
{WaitKey(2500);}
さっきから身体の震えが止まらない。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text006]
ひどく、寒い……。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text007]
突き刺さってくる、誰のものかも分からない天からの視線。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
	Request("雨２", AddRender);
	Fade("雨２", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text008]
それから逃げるように、僕はわずかに首を持ち上げて周囲を見回す。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	Fade("雨１", 1000, 0, null, false);
	Fade("雨２", 1000, 1000, null, false);
	Fade("背景１", 3000, 1000, null, false);
	Move("背景１", 15000, @0, @-800, DxlAuto, 4000);
	Delete("雨１");
	Delete("背景０");

//おがみ：テキスト：↓文字4行でないんだけど・・・

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text009]
そこにあるのは、崩壊した街――
{WaitKey(2000);}
そこにあるのは、絶望――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3601009]
そこにあるのは、死――
{WaitKey(1500);}
そこにあるのは、無――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text010]
誰もいない。<?>
{WaitKey(2000);}
誰も動いてない。<?>
{WaitKey(2000);}
誰も、生きていない。
{WaitKey(2000);}
聞こえるのはただ、降り続ける雨の音だけ。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text011]
このまますべてを――
{WaitKey(2500);}
生きているものも、死んでいるものも、
{WaitKey(2500);}
すべてを優しく包み込んで洗い流してしまうんだろうか。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text902]
全部の出来事が単なる妄想だったらよかったんだけど、
どうやらそうでもないらしい――
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――
//以上、画面黒で文章のみ画面中央にカットイン

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 300, 0, -848, "cg/ev/ev001_01_1_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("@text902", 1000, 0, null, true);
	Delete("@text902");
//	FadeDelete("@text902", 1000, false);

	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text012]
身体が、動かない。<?>
{WaitKey(2000);}
動かせるのはかろうじて、首と瞳だけ。
{WaitKey(2500);}
もう、さっきみたいな化け物じみた力も使えない。
{WaitKey(2000);}
身体が震えているけど、そんなのただの生理現象でしかない。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text013]
僕の意志じゃない。<?>
{WaitKey(2500);}
僕は身を震わせたいなんて思ってない。
{WaitKey(2500);}
僕の自由にならないなら、こんなの僕の身体じゃない。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text014]
あるいは生まれたときから僕は自由なんかじゃなかったかもしれない。
{WaitKey(2500);}
心の保管してある場所なんて誰にも分からないんだ。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text015]
それなのにいったい誰が、
{WaitKey(2500);}
この身体の中に僕の心があるって言い切れるんだ？
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text016]
でも――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text017]
だったら僕はどこにいたんだろう？
{WaitKey(2500);}
僕は、ここにいるのかな？
{WaitKey(2500);}
僕は、どこにもいないのかな？
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//ＳＥ//瓦礫の山を踏みながら歩いてくる足音
	CreateSE("SE02","SE_じん体_動作_足_三歩");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Move("背景１", 4000, @0, @256, Dxl1, false);

//	BGMPlay360("CH00",0,1000,true);
//----------------------------------------------------------------------------//

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text018]
すべてが静止している、コワレてしまった世界に、
ふと死の雨以外の音が響く。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text019]
無の中から浮かび上がってくる、たったひとつの有。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text903]
――君は、誰？
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//以上、画面黒で文章のみ画面中央にカットイン

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景２", 300, 0, -384, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Move("背景１", 12000, @0, @512, Dxl1, false);
	FadeDelete("@text903", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text020]
その肌が青白く見えるのは、
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text021]
雨の冷たさに凍えているから？
{WaitKey(2000);}
それとも、君がもう死んでいるから？
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text022]
でも、彼女は震えていなかった。
{WaitKey(2000);}
そして、前髪で隠れそうになっているその瞳は――
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


	Fade("背景２", 1000, 1000, null, false);
	Move("背景２", 6000, @0, @192, Axl1, true);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

	Delete("背景１");

//以下、画面黒で文章のみ画面中央にカットイン
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text904]
――僕を、見るな。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//以上、画面黒で文章のみ画面中央にカットイン

	Move("背景２", 2000, @0, @64, Dxl1, false);
	FadeDelete("@text904", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text023]
ひどく悲しそうにも見える。
{WaitKey(1500);}
狂気じみているようにも見える。
{WaitKey(1500);}
なにも映していないようにも見える。
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text024]
もしも――
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text025]
世界には僕と彼女の２人だけしかいなくて。
{WaitKey(2000);}
こうしてお互いだけを永遠に見つめ合っていたら――
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text026]
僕の世界は、彼女の瞳に映るものだけになるのかな？
{WaitKey(2500);}
彼女の世界は、僕の瞳に映るものだけになるのかな？
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text027]
彼女の瞳に映るものは、僕。
僕の瞳に映るものは、彼女。
そう考えると、世界は途端に矮小化する。
{WaitKey(5000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//「ねえ――」
	CreateVOICE("サウンドりみ","ch01/00100010ri");
	SoundPlay("サウンドりみ",0,1000,false);

	WaitPlay("サウンドりみ", null);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 300, 0, -550, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("背景１", 1000, 1000, null, true);

	FadeDelete("@text012", 1000, false);
	FadeDelete("色１", 1000, true);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch10/21400010ri">
「ねえ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/



//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text029]
不意に僕の耳に届く、とてもキレイなノイズ――
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text030]
彼女はうなだれて――
{WaitKey(2000);}
両手を、左右に広げる――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text031]
まるで、あの雨雲の上へ向けて飛び立とうとするかのように。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text032]
あるいは、この雨すべてを、受け止めようとするかのように。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
//「あなたを見つめる――」
	CreateVOICE("サウンドりみ１","ch01/00100020ri");
//「妄想――」
	CreateVOICE("サウンドりみ２","ch01/00100030ri");
	CreateTextureEX("背景１", 300, 0, -540, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");


//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	SoundPlay("サウンドりみ１",0,1000,false);
	WaitPlay("サウンドりみ１", null);

	$待ち時間 = RemainTime ("サウンドりみ１");
	$待ち時間 += 2000;
	WaitKey($待ち時間);

	SoundPlay("サウンドりみ２",0,1000,false);
	WaitPlay("サウンドりみ２", null);

	$待ち時間 = RemainTime ("サウンドりみ２");
	$待ち時間 += 2000;
	WaitKey($待ち時間);

	Delete("背景２");

	Fade("背景１", 0, 1000, null, true);

//	FadeDelete("@text012", 1000, false);
	FadeDelete("色１", 1000, true);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text033]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400020ri">
「あなたを見つめる――」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text034]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400030ri">
「妄想――」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text035]
うなだれた彼女の表情は、<?>
{WaitKey(2000);}
僕の位置からもうかがい知ることができない。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text036]
雨の薄膜の向こうで、君は、どんな顔をしている……？
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


/*
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text037]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400040ri">
「殺してあげる――」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――
*/

//	CreateSE("SE02","SE_えい像_梨深の剣しゅつ現");

	Delete("背景１");
	Delete("雨２");

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE05","SE_擬音_光が広がる");
	CreateTextureEX("背景１", 500, 0, -40, "cg/ev/ev002_01_1_INT01殺してあげる_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


//おがみ：スキップ停止とメニューロック
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_menu_lock = true;

	CreateMovie360("ムービー", 1000, Center, Middle, false, false, "dx/mvそーど03.avi");
	Fade("ムービー", 0, 0, null, true);
//	Request("ムービー", Play);

//	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("ムービー", 500, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);

//	WaitAction("ムービー", 3000);
	Wait(3000);
	Fade("ムービー", 500, 0, null, true);
	Wait(1000);

//	SetVolume("SE02", 1000, 0, null);
	Request("ムービー", Pause);

	Move("背景１", 2000, 0, 0, null, false);

	Wait(1000);

//「殺してあげる――」
	CreateVOICE("サウンドりみ","ch01/00100040ri");
	SoundPlay("サウンドりみ",0,1000,false);

	WaitPlay("サウンドりみ", null);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	Delete("背景１");

	CreateColor("色２", 100, 0, 0, 1280, 720, "White");
	CreateColor("色３", 600, 0, 0, 1280, 720, "White");
	Fade("色３", 0, 300, null, true);

	CreateTextureEX("梨深ソード", 500, Center, Middle, "cg/ev/ev109_01_6_梨深ディソード構え_a.png");
	Move("梨深ソード", 0, @0, @80, null, true);
	Fade("梨深ソード", 0, 1000, null, false);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Move("梨深ソード", 5000, @+80, @0, Dxl1, false);
	Fade("色１", 1000, 0, null, true);

//おがみ：メニューロック解除
	$SYSTEM_menu_lock = false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text038]
――天使？
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//</PRE>
//	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
//	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text039]
乱舞する光の羽は、
僕を祝福しているのか、
それとも……
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

//	CreateSE("SE02","SE_えい像_梨深の剣しゅつ現2");
	CreateColor("色１", 800, 0, 0, 1280, 720, "White");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//おがみ：スキップ停止とメニューロック
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_menu_lock = true;

	Fade("色１", 1000, 1000, null, true);

	Delete("色３");
	Delete("梨深ソード");

	Request("ムービー", Resume);
//おがみ：↓360タイム調整
//	Wait(300);
	Wait(720);
//▼べー：演出：SetStreamコマンドが使用不可ですので一時コメントアウト致します。
//	SetStream("SE02", 4000);
//	MusicStart("SE02", 1500, 1000, 0, 1000, null, false);
	Fade("ムービー", 1300, 1000, null, true);
	Delete("色１");

//	$待ち時間 = RemainTime ("ムービー");
//	WaitKey($待ち時間);
	WaitPlay("ムービー", null);

	SetVolume("SE02", 0, 0, null);
	Fade("ムービー", 1000, 0, null, true);
	Delete("ムービー");

//おがみ：メニューロック解除
	$SYSTEM_menu_lock = false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text040]
ああ……そうか。理解したよ。
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text041]
“それ”で、僕を殺してくれるんだね――
{WaitKey(2500);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

	XBOX360_LockVideo(true);

	CreateColor("WhiteAll", 1000, 0, 0, 1280, 720, "White");
	Request("WhiteAll", Smoothing);
	Fade("WhiteAll", 0, 0, null, false);
	CreateTextureEX("タクミ", 200, InLeft, @-160, "cg/ev/ev003_01_1_INT01横顔_b.png");
	CreateTextureEX("梨深", 200, InRight, InTop, "cg/ev/ev003_01_1_INT01横顔_c.png");
	Request("タクミ", Smoothing);
	Request("梨深", Smoothing);

	XBOX360_LockVideo(false);

	Fade("WhiteAll", 500, 300, null, false);

//	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
//	Request("雨２", AddRender);
//	Fade("雨２", 0, 1000, null, true);
	Move("タクミ", 0, @-200, @+104, null, false);
	Move("梨深", 0, @+120, @-120, null, true);

	Fade("タクミ", 1000, 1000, null, true);
	Fade("梨深", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text042]
ゆっくりと、倒れている僕の前に彼女が膝をつく。
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text043]
いまだに、彼女はうなだれたまま。<?>
{WaitKey(1500);}
僕の頭をそっと抱えてくる。
{WaitKey(2000);}
僕を見てくれないことに、僕はホッとして、ただ身を委ねた。
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――



	CreateColor("white2", 500, 0, 0, 1280, 720, "White");
	Fade("white2", 0, 0, null, false);
	Fade("white2", 500, 1000, null, true);

	Delete("タクミ");
	Delete("梨深");

	CreateTextureEX("タクミup", 200, InLeft, InBottom, "cg/ev/ev003_01_1_INT01横顔_b.png");
	CreateTextureEX("梨深up", 200, InRight, InTop, "cg/ev/ev003_01_1_INT01横顔_c.png");

	Request("タクミup", Smoothing);
	Request("梨深up", Smoothing);


	Fade("梨深up", 0, 1000, null, false);
	Fade("タクミup", 0, 1000, null, true);

//おがみ：ズーム
//	if(Platform()==100)
//	Zoom("タクミup", 0, 2000, 2000, null, true);
//	Move("タクミup", 0, @-50, @-30, null, true);
//	Zoom("梨深up", 0, 2000, 2000, null, true);
//	Move("梨深up", 0, @-100, @-100, null, true);


	Zoom("タクミup", 0, 1500, 1500, null, true);
	Move("タクミup", 0, @-120, @120, null, true);

	Zoom("梨深up", 0, 1500, 1500, null, true);
	Move("梨深up", 0, @-80, @-80, null, true);


	Fade("white2", 1000, 0, null, true);
	Delete("white2");



	CreateColor("white", 500, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 1000, 1000, null, true);

	Delete("タクミup");
	Delete("梨深up");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text044]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400050ri">
「……殺さなくちゃ……いけないの」
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

	BGMPlay360Suspend("chn05",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text045]
耳元で、ささやき。キレイなノイズ。
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text046]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400060ri">
「ごめん……ごめんね……」
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text047]
謝ること、ないよ。
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text048]
僕が消えなくちゃ、もうひとりの僕――本物の僕が、死んじゃうんだ。
{WaitKey(3500);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text049]
だから、これでいい。
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text050]
君に消されるなら、よかった。
化け物としては、幸せな終わり方。
もう、なにも悔いはない。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

	Fade("white", 1000, 1000, null, true);

	CreateColor("white", 500, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);

	CreateTextureEX("タクミup", 200, 0, @-160, "cg/ev/ev003_01_1_INT01横顔_b.png");
	Request("タクミup", Smoothing);
	Zoom("タクミup", 0, 1500, 1500, null, false);

	CreateTextureEX("梨深up", 200, InRight, InTop, "cg/ev/ev003_01_1_INT01横顔_c.png");
	Request("梨深up", Smoothing);
	Rotate("梨深up", 0, @0, @0, @-5, null, false);
	Zoom("梨深up", 0, 1500, 1500, null, false);

	Fade("梨深up", 0, 1000, null, false);
	Fade("タクミup", 0, 1000, null, true);

//おがみ：ズーム
//	Move("タクミup", 0, @-140, @+60, null, false);
//	Move("梨深up", 0, @+120, @-180, null, false);
//	Move("タクミup", 5000, @+40, @-30, null, false);
//	Move("梨深up", 5000, @-120, @+50, null, false);


	Move("タクミup", 0, @-112, @+0, null, false);
	Move("梨深up", 0, @+96, @-96, null, false);

	Move("タクミup", 5000, @+4, @-16, null, false);

	Move("梨深up", 5000, @-56, @+24, null, false);

	WaitAction("梨深up", 4000);

	Fade("white", 1000, 1000, null, true);

	Delete("梨深up");
	Delete("タクミup");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text051]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21400070ri">
「ん……っ」
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text052]
温かくて、柔らかくて、優しくて、甘美な感触。
{WaitKey(3500);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text053]
それは麻酔のようで――
{WaitKey(1500);}
不思議なことに、身体の震えが、ゆっくりと治まっていく。
彼女のかすかな鼻息が、僕の頬をくすぐる。とても甘い匂い。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

	CreateTexture360("タクミ", 200, Center, Middle, "cg/ev/ev004_01_1_INT01KISS_b.png");
	Request("タクミ", Smoothing);

	CreateTexture360("梨深", 200, InLeft, InTop, "cg/ev/ev004_01_1_INT01KISS_c.png");
	Request("梨深", Smoothing);

	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 3000, 1000, 0, 1000, null, true);

	Fade("white", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text054]
ふと、胸に圧迫感を覚えた。
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text055]
彼女の持っていた大きな剣が、<?>
{WaitKey(1000);}
僕の胸の皮膚を裂き、
{WaitKey(1500);}
肉をえぐり、骨の間を縫い、<?>
{WaitKey(1000);}
ゆっくりと身体の中に沈み込んできている。
{WaitKey(2000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text056]
でも、彼女のキスという麻酔にかけられて、もう痛みを感じない。
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text057]
こんなにも優しく殺してくれるから――
不意に切なくなって――
涙が溢れそうになって――
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

	CreateColor("white", 500, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 1000, 1000, null, true);
	Delete("タクミ");
	Delete("梨深");
	Delete("背景０");
	Delete("WhiteAll");
	CreateTextureEX("背景１", 100, 0, -480, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");

	CreateMovie360("雨２", 200, Center, Middle, true, false, "dx/mv雨01.avi");
	Fade("雨２", 0, 0, null, true);
	Request("雨２", AddRender);

	Move("背景１", 5000, @0, 0, AxlDxl, false);
	Fade("背景１", 0, 1000, null, false);
	Fade("white", 5000, 0, null, false);
	Wait(3000);
	Fade("雨２", 2000, 1000, null, true);
//	WaitAction("背景１", null);


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text058]
それをごまかすために、
彼女の頭越しに、雨を落とし続けている鈍色の空を見上げた。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//―――――――――――――――――――――――――――――

//	SetVolume360("CH00", 1000, 0, NULL);
	SetVolume("SE01", 1000, 0, NULL);
	Fade("white", 3000, 1000, null, true);
	Delete("雨２");

//フラグ判定
//フラグ【Ａエンドエピローグ】ＯＮの場合
//Ａルートグッドエンドへ


//フラグ【Ａエンドエピローグ】ＯＦＦの場合
//エンディングスタッフロールへ
//Ａルートノーマルエンド。ゲームオーバー。エピローグはありません

}


/*文字用function===============================================================*/

//■SetText3
