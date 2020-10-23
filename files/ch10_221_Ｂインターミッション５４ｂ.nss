//<continuation number="80">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_221_Ｂインターミッション５４ｂ";
		$GameContiune = 1;
		$Ｂルート = true;
		Reset();
	}

		ch10_221_Ｂインターミッション５４ｂ();
}


function ch10_221_Ｂインターミッション５４ｂ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	$SYSTEM_text_auto_lock=true;



	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(3000);

	CreateTextureEX("背景１", 100, @0, @0, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");

	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
	Request("雨２", AddRender);
	Fade("雨２", 0, 0, null, true);

	Fade("雨２", 1000, 1000, null, false);
	Fade("背景１", 3000, 1000, null, false);

	Wait(2000);

	$SYSTEM_text_interval = 128;
	LoadBox10();

//アイキャッチ
//■インターミッション５４ｂ

//※以下、梨深視点で見た第１章インターミッション０１です
//ＢＧ//黒
//渋谷は崩壊し瓦礫だらけ。天気は雨
//ＳＥ//雨

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text001]
いつの間に、雨が降り出したんだろう。
{WaitKey(2500);}
あるいは、ノアⅡによって作り出された雨かもしれない。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text002]
視線が、空から降ってくる。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text003]
眼差しは、厚くて真っ黒な雨雲を突き抜けて。
{WaitKey(2000);}
雨のように降り注ぐ。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//以下、画面黒で文章のみ画面中央にカットイン
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text901]
――彼は、もうダメだよ。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//以上、画面黒で文章のみ画面中央にカットイン
	FadeDelete("@text901", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text004]
視線の主に向けて、あたしは心の中でつぶやく。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text005]
雨の冷たさは感じない。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text006]
むしろ頬にかかるその雫は、温かささえ感じる。
{WaitKey(2000);}
雨を温かいと思ったのは初めてだった。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text007]
ノアⅡのあるあのドームが、
背筋が凍るくらいの冷気に包まれていたせいだろうか。
{WaitKey(5000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//ＢＧ//崩壊渋谷//雨
	Move("背景１", 15000, @0, @-560, DxlAuto, 4000);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text008]
あたしの目に映るのは、崩壊した街――
{WaitKey(2000);}
あたしの目に映るのは、絶望――
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3601008]
あたしの目に映るのは、死――
{WaitKey(2000);}
あたしの目に映るのは、無――
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text009]
誰もいない。<?>
{WaitKey(2500);}
誰も動いてない。<?>
{WaitKey(2500);}
誰も、生きていない。
{WaitKey(2500);}
聞こえるのはただ、降り続ける雨の音だけ。
{WaitKey(4500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text010]
方舟はすでに動き出してしまった。
{WaitKey(2500);}
それを止めることは叶わなかった。未来には、絶望しかない。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text011]
このまますべてを――
{WaitKey(2000);}
生きているものも、死んでいるものも、
{WaitKey(2000);}
すべてを優しく包み込んで洗い流してしまうんだろうか。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text012]
そんな、彼の心のつぶやきが、あたしにも聞こえた。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//以下、画面黒で文章のみ画面中央にカットイン
	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text902]
――なんて、キレイな、心。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//以上、画面黒で文章のみ画面中央にカットイン

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 300, 0, -560, "cg/ev/ev001_01_1_INT01近づく梨深_a.jpg");
	CreateSE("SE02","SE_じん体_動作_足_三歩");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Move("背景１", 5000, @0, @160, Dxl1, false);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//	BGMPlay360("CH00",0,1000,true);

	FadeDelete("@text902", 1000, false);
	FadeDelete("色１", 1000, true);

//ＳＥ//瓦礫の山を踏みながら歩いてくる足音

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text013]
歩み寄る。
{WaitKey(2000);}
瓦礫の中に力なく横たわる、彼の元へ。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text014]
彼がこうなってしまったのはあたしのせい。
{WaitKey(2500);}
あたしがもっとうまくやっていれば、彼を巻き込まずに済んだんだ。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text015]
罪悪感に苛まれる。
{WaitKey(2500);}
自分を責める。
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//以下、画面黒で文章のみ画面中央にカットイン
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text903]
許して、今、楽にしてあげるから――
{WaitKey(4500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//以上、画面黒で文章のみ画面中央にカットイン

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 300, 0, -560, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);
	Fade("背景１", 1000, 1000, null, true);

	FadeDelete("@text903", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text016]
あまりにも悲しい生まれ方をして。
{WaitKey(2500);}
あまりにも悲しく死んでいこうとしている。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text017]
このとても臆病で、<?>
{WaitKey(2500);}
ガラスのように繊細で、
{WaitKey(2500);}
そして純粋すぎたが故に壊れてしまった、心の持ち主を。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text018]
せめて最後ぐらい、苦しませたくなかった。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text019]
横たわる彼の虚ろな瞳が、あたしを見上げていた。
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text020]
あたしは自分の感情を排する。
{WaitKey(2500);}
この場で泣き出さないために、見ているけど、見ないようにする。
{WaitKey(5000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text021]
もしも――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text022]
世界にはあたしとあなたの２人だけしかいなくて。
{WaitKey(2500);}
こうしてお互いだけを永遠に見つめ合っていたら――
{WaitKey(5500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text023]
あたしの世界はあなたの瞳に映るものだけになるのかな？
{WaitKey(3000);}
あなたの世界は、あたしの瞳に映るものだけになるのかな？
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text024]
あたしの瞳に映るものは、あなた。
{WaitKey(2500);}
あなたの瞳に映るものは、あたし。
{WaitKey(2500);}
そう考えると、世界は途端に矮小化する。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text025]
あなたに残された時間だけは、せめて。
{WaitKey(2500);}
あたしが、あなたの世界になってあげる。
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text026]
もう、苦しい世界も、<?>
{WaitKey(2000);}
辛い世界も、<?>
{WaitKey(2000);}
悲しい世界も、
{WaitKey(2000);}
見なくていいようにしてあげる。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//	CreateVOICE("サウンドりみ","ch01/00100010ri");
//	SoundPlay("サウンドりみ",0,1000,false);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text904]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100010ri">
「ねえ――」
{WaitKey(5000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 300, 0, -560, "cg/ev/ev001_01_2_INT01近づく梨深_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("背景１", 1000, 1000, null, true);
	Delete("背景２");

	FadeDelete("@text904", 1000, false);
	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text027]
覚悟を決めて、つぶやく。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text028]
うなだれて――
両手を、左右に広げる――
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text029]
あの雨雲の上へ向けて、飛び立つように。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text030]
この雨すべてを、受け止めるように。
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//	CreateVOICE("サウンドりみ１","ch01/00100020ri");
//	SoundPlay("サウンドりみ１",0,1000,false);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text905]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100020ri">
「あなたを見つめる――」
{WaitKey(4500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//	WaitAction("サウンドりみ１", null);

//	CreateVOICE("サウンドりみ２","ch01/00100030ri");
//	SoundPlay("サウンドりみ２",0,1000,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text906]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100030ri">
「妄想――」
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	WaitAction("サウンドりみ２", null);
	FadeDelete("@text906", 1000, false);

//	CreateVOICE("サウンドりみ３","ch01/00100040ri");
//	SoundPlay("サウンドりみ３",0,1000,false);


	Delete("雨２");
	Delete("背景１");

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
	Fade("梨深ソード", 0, 1000, null, true);

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

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text907]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100040ri">
「殺してあげる――」
{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――
*/

//	FadeDelete("@text907", 1000, false);
//	FadeDelete("色１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text031]
光の羽が乱舞する。
{WaitKey(3000);}
まるで葬送するために空が与えてくれた贈り物。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

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

//	SetVolume("SE02", 0, 0, null);
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

	CreateTextureEX("タクミ", 200, InLeft, @-160, "cg/ev/ev003_01_1_INT01横顔_b.png");
	Request("タクミ", Smoothing);
	Move("タクミ", 0, @-200, @+104, null, false);
	Fade("タクミ", 1000, 1000, null, true);

	CreateTextureEX("梨深", 200, InRight, InTop, "cg/ev/ev003_01_1_INT01横顔_c.png");
	Move("梨深", 0, @+120, @-120, null, true);
	Request("梨深", Smoothing);
	Fade("梨深", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text032]
ゆっくりと、倒れている彼の前にあたしは膝をついた。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

	CreateColor("white2", 500, 0, 0, 1280, 720, "White");
	Fade("white2", 0, 0, null, false);
	Fade("white2", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text033]
今、あなたの目を見たら、泣いちゃうから。
{WaitKey(3000);}
だからゴメンね。目を、合わせられなくて。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text034]
あたしは彼の頭をそっと抱える。
{WaitKey(3000);}
彼の身体には力が入っていなくて。
{WaitKey(3000);}
まるで死を覚悟しているかのよう。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

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
[text035]
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100050ri">
「辛いよね……」
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text036]
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100060ri">
「ごめん……ごめんね……」
{WaitKey(6000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text037]
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100070ri">
「今、楽にしてあげるからね……」
{WaitKey(6000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text038]
それが独りよがりじゃないことは、彼の態度で分かった。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text039]
――彼は、とても安らかな笑みを浮かべていた。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text040]
その笑顔が悲しくて。
{WaitKey(3000);}
ずっと我慢していたのに。
{WaitKey(3000);}
涙がにじんで。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text041]
それを彼に見られたくなかったから。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text042]
ようやく安息を手に入れた彼に、<?>
{WaitKey(3000);}
これ以上心配させたくなかったから。
{WaitKey(4000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――

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
[text043]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/22100080ri">
「ん……っ」
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text044]
彼の唇に、キスをしていた。
{WaitKey(3000);}
冷たくて、カサカサで、ますます悲しくなってしまう感触。
{WaitKey(3000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text045]
でも、キスしたことで、彼の震えが止まって。
{WaitKey(3000);}
あたしの温もりが彼の役に立てたんだって、愛おしく思えた。
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text046]
唇を離せば、泣き顔を見られちゃうから。
{WaitKey(3000);}
唇を離せば、もう一度キスをしたくなるから。
{WaitKey(4500);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text047]
唇を離せば、<?>
{WaitKey(3000);}
あたしはワガママになって、殺せなくなってしまうから。
{WaitKey(4500);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text048]
キスをしたまま、あたしはディソードを彼の胸に突き刺した。
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text049]
彼の胸の皮膚を裂き、<?>
{WaitKey(2000);}
肉をえぐり、<?>
{WaitKey(2000);}
骨の間を縫い、
{WaitKey(4000);}
ゆっくりと身体の中に沈み込んでいく感触が、
{WaitKey(3000);}
剣を通してあたしの手に伝わってくる。
{WaitKey(5000);}
</PRE>
	SetText2($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――



//以下、画面黒で文章のみ画面中央にカットイン

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text908]
ごめんね――
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text909]
もう、ゆっくりと眠っていいんだよ――
{WaitKey(3500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text910]
さようなら――
{WaitKey(5000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――


//以上、画面黒で文章のみ画面中央にカットイン

	SetVolume("SE*", 2000, 0, null);

//	SetVolume360("CH00", 1000, 0, NULL);
	ClearAll(2000);
//～～Ｆ・Ｏ



//イメージＢＧ//雨雲の空
//ＳＥ//雨の音

	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	Wait(3000);

//おがみ：EV：位置調整
	CreateTextureEX("背景１", 100, center, 0, "cg/ev/ev105_01_1_拓巳光と消える_a.jpg");

//おがみ：雨削除
//	CreateMovie360("雨２", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
//	Request("雨２", AddRender);
//	Fade("雨２", 0, 0, null, true);
//	Fade("雨２", 1000, 1000, null, false);

	Fade("背景１", 3000, 1000, null, false);
//	Move("背景１", 10000, @0, @-960, Dxl1, false);
	Move("背景１", 8000, @0, @-820, Dxl1, false);

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
雨を落とし続ける空。

青くない。

紺碧は、どこにもない。

望んでも、もう見られない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

//	FadeDelete("雨２", 500, false);
//おがみ：360データ差し替え高さ調整
//	CreateMovie360("タクミ消え", 200, center, @-960, false, false, "dx/mv消える02.avi");

	CreateTextureEX("背景２", 250, @0, @20, "cg/ev/ev105_02_1_拓巳光と消える_a.jpg");
	CreateSE("SE02","SE_えい像_拓巳光と消える");

	SetVolume("SE01", 1000, 0, null);
	BGMPlay360Suspend("CHN_ED_B",0,1000,true);

	CreateMovie360("タクミ消え", 200, center, middle, false, false, "dx/mv消える02.avi");
	Fade("タクミ消え", 0, 0, null, true);
//	Request("タクミ消え", Play);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("タクミ消え", 500, 1000, null, true);
	Delete("背景１");


//	Wait(1000);

//おがみ：360データ差し替えの為コマンド削除
//	Move("タクミ消え", 5000, @+0, @+960, AxlDxl, false);
//	Wait(1000);
//	CreateTexture360("背景１", 100, @0, @0, "cg/ev/ev105_02_1_拓巳光と消える_a.jpg");
	WaitAction("タクミ消え", null);
	Fade("背景２", 500, 1000, null, true);
	Delete("タクミ消え");

	$SYSTEM_text_interval = 128;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
空が滲んでいるのは、雨のせい？　涙のせい？
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	WaitKey(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
光の粒子に包まれてゆっくりと消えていく、彼の身体を支えながら。
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	WaitKey(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601016]
空へと手を伸ばす。
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	WaitKey(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
誰か、{Wait(1000);}
教えて、
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX2();//――――――――――――――――――――――――――――――

	WaitKey(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
あたしたちのあの空は、何処へいっちゃったんだろう――{WaitKey(4000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,1000);//――――――――――――――――――――――――――――――


//	Fade("背景１", 3000, 1000, null, false);
//	Move("背景１", 5000, @0, @-960, AxlDxl, false);
//			Move("背景２", 5000, @0, @-1025, AxlDxl, false);
//			Wait(5000);
//	Delete("雨２");


//エンディングスタッフロールへ
//Ｂルートトゥルーエンド

}

/*森島文字用function===============================================================*/
//■SetText2