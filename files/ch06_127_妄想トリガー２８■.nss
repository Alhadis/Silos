//<continuation number="1430">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_127_妄想トリガー２８■";
		$GameContiune = 1;
		Reset();
	}

		ch06_127_妄想トリガー２８■();
}


function ch06_127_妄想トリガー２８■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, center, middle, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ


if($妄想トリガー通過２８ == 0)
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
			$妄想トリガー２８ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー２８ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー２８ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー２８ == 2)
{
//☆☆☆
//分岐１０

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionIn();
	BoxDelete(0);

	CreateTexture360("背景１", 100, center, middle, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");

	DelusionIn2();

//おがみ：SEダミー＞歓声系
	CreateSE("SE01","SE_日常_歓声_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
『将軍』だ……。

きっと『将軍』が集めたんだ。
みんなマインドコントロールされてるんだ。

みんな、僕がここから飛び降りて死ぬのを期待しているんだ。

叩き付けられる、圧倒的な量の負の感情。
ねえ、誰か、僕の味方はいないの……？

//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700010ri">
「タクー！」

ふと――

この喧噪の中に、僕の名を呼ぶ声が聞こえた。

//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700020ri">
「タークー！」

聞き慣れた、その声。
僕の知っている、声。
僕の、唯一の味方の声。

僕の錯覚じゃない。
幻聴でもない。

梨深だ……！
梨深が、どこからか僕を呼んでいる……！

どこだ、どこにいる……？

僕は必死で梨深の姿を探した。

でも人が多すぎる。この中から、しかもこの高さからたったひとりだけを識別するなんて、不可能だよ……。

絶望に打ちひしがれ、僕は無念のうちに頭を垂れる。

必然的に、真下を見ることになり、

そこに、僕を見上げて大きく両手を振っている女の子の姿があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Stand("st梨深_制服_正面","hard", 300, @0);

	Fade("背景２", 0, 1000, null, true);
	FadeStand("st梨深_制服_正面_hard", 0, true);

	Wait(1500);

	DeleteStand("st梨深_制服_正面_hard", 0, true);

	Fade("背景２", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700030ri">
「タクー！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700040ta">
「梨深……！」

いた！　そこに、いてくれた！
僕を助けに来てくれた！

//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700050ri">
「今助けに行くからーっ！」

//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700060ri">
「そこから動いちゃダメだよー！」

嬉しくて、救われた気分になって、何度も何度もうなずく。

涙で視界がぼやけた。

一瞬たりとも梨深の姿を見失いたくなくて、その涙をゴシゴシと拭う。

ところが――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Fade("背景２", 500, 1000, null, true);

	SoundPlay("SE*",5000,0,false);
	BGMPlay360("CH13",3000,1000,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
もう一度梨深が手を振っていた場所を見つめてみたら、様子がおかしかった。

周囲にいた群衆が、なぜか梨深を取り囲み、詰め寄っていく。
梨深を中心として人の黒い頭がうねり出す。

そのうちに、何人ものＤＱＮが、梨深に手を伸ばしもみくちゃにし始めた。

梨深はそれを嫌がり、彼らを振り切ってその場から抜け出そうとするけど、あまりに多くの人に囲まれて、朝の通勤電車のように一歩も身動きが取れないような状態だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700070ta">
「よ、よせ……梨深に、て、手を出すなよ……」

かすかに梨深の悲鳴が聞こえる。

梨深にちょっかいを出している連中は徐々にエスカレートし、さらに数も増えていった。

ついにはもみくちゃ状態の中で、梨深は服を引っ張られ、上着を脱がされてしまう。

{	Fade("背景２", 500, 0, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700080ta">
「やめろよ……そんな、エロゲみたいなこと……やめて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700090ta">
「梨深、逃げて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700100ta">
「そこから逃げろ……、それで、は、早く、僕を、助けに来て……」

その僕の祈りは届かなかった。

梨深に向かって殺到する群衆の数はますます増え、梨深ひとりの抵抗など無力に等しかった。

何人もの男たちに服を破られ、髪を引っ張られ、路上を引きずられ、

//◆恐怖の叫び
//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700110ri">
「タク、助け――」

//◆恐怖の叫び
//◆かなり遠くから呼びかけている
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12700120ri">
「いやああああ――」

ついに黒山の人だかりの中に彼女の姿は消えて、見えなくなってしまった。

動物の死骸にたかるハイエナのように、梨深が見えなくなった場所でなおも大量のＤＱＮたちが蠢いている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700130ta">
「あ……あ……」

なんてことだ……なんてことだ……。
梨深が、陵辱されちゃう。

『将軍』に集められた、マインドコントロールされたＤＱＮたちの汚い手で、梨深がめちゃくちゃに汚されてしまった……。

そしてきっと。
犯された後には無惨に殺されるだろう。

涙が溢れた。
僕はきつく唇を噛みしめた。

梨深があんなことになったことへの悲しさや悔しさだけで、泣いてるわけじゃない。

それよりも、この場にいるすべての人間が自分の敵だと思い知り、その恐怖で、僕は泣いた。

もう、ここからどこにも逃げられない……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//妄想ＯＵＴ
//画面エフェクト//妄想ＯＵＴエフェクト
//合流４へ

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);
	DelusionOut();

	ClearAll(0);

	CreateSE("手拍子ガヤ","SE_はいけい_たくさんのひと々の拍手_三拍し");
	SoundPlay("手拍子ガヤ", 2000, 300, true);

	DelusionOut2();
	PositiveHuman();

}


//=============================================================================//

if($妄想トリガー２８ == 1)
{
//☆☆☆
//分岐１１

	CreateTextureEX("背景５", 100, 0, -96, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Move("背景５", 0, @-320, @0, null, true);
	Fade("背景５", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
『将軍』だ……。

きっと『将軍』が集めたんだ。
みんなマインドコントロールされてるんだ。

昼間の、墜落してくるあやせの姿が記憶によみがえる。

この大群衆の前で、
日本中に生中継されている中で、
僕の言葉を期待する人々の注目の中で、

僕は、

ここから飛び降りるよう強制されるんだ。

そうすれば、まさに死人に口なし。

ニュージェネ犯人を透視しようとしたエスパー少年が、
実はその犯人だった。

衝撃の結末。
まさかの大どんでん返し。

僕が投身自殺したのはこれまでの犯罪を悔いたからっていう物語が捏造される……。

ニュージェネは衝撃映像で幕を閉じるんだ。

コンクリートに身体を叩き付けられて、手足が変な方向に曲がり、割れた頭から血と脳漿を垂れ流す僕の死体が全国にさらされる。

それくらいしなきゃ視聴者も納得しないんだろう。

エンターテイメントなんてそんなもんだ。

そっか、僕は死ねばいいんだ。
そうすればみんな幸せになれるんだ。

みんなだけじゃない。
僕もその方が幸せだよ。

死ねば、もう二度とこんな辛いことも怖いことも経験しなくて済むんだから。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700140ta">
「は、ははは、ふひひ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",0,0,false);

	DelusionIn();

	#ev057_01_3_Q－FrontTVモニター_a=true;
	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev057_01_3_Q-FrontTVモニター_a.jpg");
	Fade("背景１", 0, 1000, null, true);
	Move("背景１", 0, @0, @-742, null, true);

	DelusionIn2();

//おがみ：SEダミー＞歓声系
	CreateSE("SE02","SE_日常_歓声_LOOP");
	CreateSE("SE01","SE_日常_ざわめき大");
	SoundPlay("SE01", 2000, 1000, true);
	MusicStart("SE02", 2000, 500, 0, 1000, null, false);
	CreateSE("飛び降り","SE_衝撃_肩にぶつかる");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
死のう。死ねばいい。死ぬ。氏ぬじゃなくて死ぬ。

なんだ、答えは簡単だったじゃないか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	SoundPlay("SE*", 2000, 0, false);
	Fade("色１",0, 0, null, true);
	Move("背景１", 1000, @0, @-128, Axl1, false);
	Fade("色１", 800, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
すごく気分が楽になった。

その楽な気持ちのまま、僕は何気なく身体を{	SoundPlay("飛び降り", 0, 1000, false);}空中へと投げ出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");
	Request("背景１", Smoothing);
	Zoom("背景１", 20000, 1500, 1500, Dxl2, false);
	Move("背景１", 20000, @0, @-80, null, false);
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 1000, 0, null, true);

	CreateSE("SE05","SE_自然_風音_強_LOOP");
	SoundPlay("SE05", 500, 1000, true);

//ＳＥ//落ちる
	CreateSE("SE03","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	SoundPlay("SE03", 1000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
渋谷駅前の夜景が、ぐるぐると回る。
墜落する。

風を全身に感じる。
気持ちいい。

ほら、みんな見てよ。
僕は今、鳥になった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 1000, 1000, null, false);
	Zoom("背景１", 1100, 5000, 5000, Axl3, true);

//イメージＢＧ//血のイメージ
//ＳＥ//グシャッ（地面に人が激突した音）

	SoundPlay("SE03", 100, 0, false);
	SoundPlay("SE05", 100, 0, false);
	CreateSE("SE01","SE_えい像_拓巳落下後");

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);

	SoundPlay("SE01", 0, 1000, false);
	CreateMovie360("落下", 200, Center, Middle, false, false, "dx/mvやられ02.avi");	
	Wait(2000);

	Fade("色１", 1000, 1000, null, true);

	Delete("落下");

//５秒ほどウエイト


	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【通行人男１】
<voice name="通行人男１" class="通行人男１" src="voice/ch06/12700150z5">
「あーあ、死んじゃった」

//【通行人男２】
<voice name="通行人男２" class="通行人男２" src="voice/ch06/12700160z6">
「バカじゃないのこいつ」

//【通行人女１】
<voice name="通行人女１" class="通行人女１" src="voice/ch06/12700170z1">
「キモ～い」

{	CreateSE("SE01","SE_はいけい_妄そうとりがー28ガヤ");
	SoundPlay("SE01", 0, 1000, false);}
//【通行人たち】
<voice name="通行人たち" class="通行人たち" src="voice/ch06/12700180ze">
「ぎゃはははははは――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――




//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ
//合流４へ

	SetVolume360("CH*", 100, 0, null);
	SoundPlay("SE*",100,0,false);

	DelusionOut();

	ClearAll(0);

	CreateSE("手拍子ガヤ","SE_はいけい_たくさんのひと々の拍手_三拍し");
	SoundPlay("手拍子ガヤ", 2000, 300, true);

	DelusionOut2();
	NegativeHuman();

}


//=============================================================================//

if($妄想トリガー２８ == 0)
{
//☆☆☆
//分岐１２
//フラグ【６章エンドフラグ②】ＯＮ
	$６章エンドフラグ② = true;

	CreateTextureEX("背景５", 100, -480, -96, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Fade("背景５", 1000, 1000, null, true);

	Wait(1000);

	CreateSE("手拍子","SE_はいけい_たくさんのひと々の拍手_三拍し");
	SoundPlay("手拍子", 0, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//サッカーの応援コール「日本チャチャチャ」のように
//ＳＥ//たくさんの人々の拍手（三拍子）
//【通行人たち】
<voice name="通行人たち" class="通行人たち" src="voice/ch06/12700190ze">
「その目！」

//ＳＥ//たくさんの人々の拍手（三拍子）
//【通行人たち】
<voice name="通行人たち" class="通行人たち" src="voice/ch06/12700200ze">
「だれの目！」

//ＳＥ//たくさんの人々の拍手（三拍子）
//【通行人たち】
<voice name="通行人たち" class="通行人たち" src="voice/ch06/12700210ze">
「その目！」

//ＳＥ//たくさんの人々の拍手（三拍子）
//【通行人たち】
<voice name="通行人たち" class="通行人たち" src="voice/ch06/12700220ze">
「だれの目！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//おがみ：実績：その目
	Eyes();

	CreateSE("手拍子ガヤ","SE_はいけい_たくさんのひと々の拍手_三拍し");
	SoundPlay("手拍子ガヤ", 2000, 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
まるでサッカーかバレーボールの応援のように。

スクランブル交差点に集まったＤＱＮたちが、一斉にコールし始めた。

打ち合わせでもしてあったんだろうか。
それとも『将軍』がマインドコントロールでもしたんだろうか。

彼らは一糸乱れず、両手を振り上げ、同じ言葉を叫ぶ。

こいつら……狂ってる……。

僕はゾッとした。
コールはなおも続く。

そのコールの間を縫って、ＤＱＮ女どもの黄色い声がかすかに聞こえてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景５");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//以下の４つのガヤはすべて女性
//【通行人女１】
<voice name="通行人女１" class="通行人女１" src="voice/ch06/12700230z1">
「タクミ～！」

//【通行人女２】
<voice name="通行人女２" class="通行人女２" src="voice/ch06/12700240z2">
「こっち向いて～！」

//【通行人女３】
<voice name="通行人女３" class="通行人女３" src="voice/ch06/12700250z3">
「愛してる～！」

//【通行人女４】
<voice name="通行人女４" class="通行人女４" src="voice/ch06/12700260z4">
「ぎゃははははは！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
よく聞けば、みんなバカにしてるだけだ。

面白がってゲラゲラ笑っているだけだ。

こいつらは、自分たちさえ楽しければいいんだ。

僕を生け贄にした祭り。

その祭りに参加して、バカ騒ぎしたいだけなんだ。

どいつもこいつも最低のＤＱＮだ。

誰も僕を助けてなんてくれない。

みんな、僕がこの場で死ぬことを望んでる。
僕はこいつらの集団心理によって殺される。

憎しみとか怒りではなく、
ノリで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	CreateSE("タクミコール","SE_はいけい_ガヤ_たくみコール_LOOP");
//	SoundPlay("タクミコール", 2000, 1000, true);
//	SoundPlay("タクミコール", 2000, 0, false);

	SoundPlay("手拍子", 2000, 0, true);

	Wait(500);


//合流４へ
}


//=============================================================================//

//☆☆☆
//合流４
//イメージＢＧ//渋谷の夜景

	CreateTextureEX("背景１", 100, -320, 0, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700270ta">
「い、いやだ……いやだいやだいやだぁ、
死、死に、死にたぐ、ない……」

怖い。失禁しそうなほどに。

死を、こんなに間近に感じたのは初めてで。

意識が遠くなりそうで。

駄々をこねる子供みたいに。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700280ta">
「死にだぐなびよぅ……っ」

僕は泣きじゃくる。

そうすることで『将軍』に許してもらえるかもしれないっていう期待。

そうすることで下にいるたくさんの人たちが同情して助けに来てくれるかもしれないっていう期待。

そうすることで警察は僕が犯人じゃなくてただの無実のキモオタだって気付いて、助けに来てくれるんじゃないかっていう期待。

そうすることで、家でテレビを見ている両親が僕の身代わりとして名乗り出てくれるんじゃないかっていう期待。

そうすることで、梨深が颯爽と救いに来てくれるかもしれないっていう期待。

そうすることで、ハッと目を覚まして、実はこれは夢でしたっていうオチになることへの期待。

そうした諸々の期待をこめて、僕は必死で首を振り、“死にたくない”という願望を連呼する。

でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700290su">
「その場から一歩でも下がれば――」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700300su">
「七海ちゃんは死ぬからね」

『将軍』の声音はさっきからまったく変わらない。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700310su">
「キミはもう、舞台に上がってしまったんだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700320su">
「覚醒するには最高のステージだとは思わないか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700330su">
「そこに集まっている人たちも、キミに期待しているんだよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700340su">
「もしそれを裏切れば、暴徒と化してキミに襲いかかってくるかもしれない」

そう言われて、僕は後ずさることも振り返ることもできなくなる。

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700350se">
「気にスンナ！」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700360se">
「ただの脅し文句だよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700370se">
「タッキー、七海っちは死んじゃったんだよ……」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700380se">
「今ここで逃げ出しても、タッキーは悪くないってば」

そんなこと言ったって……

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700390su">
「そこから見える景色に集中してほしい」

『将軍』の声はとても冷静で、それが逆に有無を言わせない迫力を醸し出している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700400su">
「キミにここでしてもらうことはひとつだけ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700410ta">
「と、飛び降りる……なんて、でき、ない……し、死んじゃう……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700420su">
「誰もそんなことは言っていないよ」

え？　ち、違うの……？
じゃあ、僕は死ななくてもいいの？

{	SoundPlay("手拍子ガヤ", 3000, 0, false);
	SoundPlay("SE*", 3000, 0, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700430su">
「キミには、そこから一歩も動かずに――」

{	Wait(500);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700440su">
「ディソードを、見つけてもらう」

{	BGMPlay360("CH06",2000,1000,true);
	Wait(200);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700450ta">
「……！」

ディソードを、見つける！？

ど、どうやって？

今まで散々探してきたけど、まるで見つかる気配なんてなかった。

それをいきなりこんな場所で“見つけろ”なんて、めちゃくちゃだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_01_3_OFRONT見上げ_a=true;

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg165_01_3_O-FRONT見上げ_a.jpg");
	Fade("背景２", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700460su">
「ディソードは、いわば妄想の剣」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700470su">
「それだけ言えば分かるだろう？」

分からないよ……っ。

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700480se">
「騙されちゃダメだよタッキー！　ディソードなんて実在しないって！
　妄想が実際にあるワケないっしょ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700490ta">
「見つかるわけ……ないよ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700500su">
「キミはこれまでに、剣を持った人間と何度か接触した」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700510ta">
「……っ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700520su">
「そうだね？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700530su">
「その人物から聞いているはず。ディソードをどうやって手に入れたのか」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700540su">
「よく思い出して」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	CreateColor("色２", 2000, 0, 0, 1280, 720, "Black");

	Delete("背景２");

	Stand("buあやせ_制服_通常","normal", 200, @200);
	FadeStand("buあやせ_制服_通常_normal", 0, false);
	Move("buあやせ_制服_通常_normal*", 30000, @-400, @0, Dxl1, false);
	Fade("色２", 4000, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//ＶＦ//回想セリフ（あやせ、セナの以下のセリフすべて）
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700550ay">
「この剣は、命運を握るもの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700560ay">
「この剣は、嘆きを集束させたもの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700570ay">
「この剣は、超越した場所に干渉するためのもの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700580ay">
「異空間……のようなもの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700590ay">
「同一次元上にある、もうひとつの可能性」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700600ay">
「あるいは、妄想」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700610ay">
「言い方にあまり意味はないわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700620ay">
「唯一確かなのは――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700630ay">
「この剣も、その領域に存在しているということ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700640ay">
「……いつの間にか、そこにあった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700650ay">
「気付かなかったわ、最初は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700660ay">
「でもちょっとだけ見方を変えたら、分かった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700670ay">
「もしかしたら、拓巳にももう見えているのかも」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700680ay">
「“見ていない”だけで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色２", 500, 1000, null, true);
	DeleteStand("buあやせ_制服_通常_normal", 0, true);
	FadeDelete("色２", 0, 0, null, true);
	CreateColor("色３", 195, 0, 0, 1280, 720, "Black");
	Stand("buセナ_制服_通常","hard", 190, @-100);
	FadeStand("buセナ_制服_通常_hard", 0, true);
	Move("buセナ_制服_通常_hard*", 30000, @400, @0, Dxl1, false);
	Fade("色３", 4000, 500, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700690sn">
「世界を疑え。仕組みを知れ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700700sn">
「――お前の見ている景色は、本物か？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700710sn">
「妄想は、現実にすることが可能だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700720sn">
「本当じゃないモノが景色に紛れ込む」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700730sn">
「つまりエラーを現実として認識させる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色３", 500, 1000, null, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	FadeDelete("色３", 0, 0, null, true);
	FadeDelete("色２", 0, 0, null, true);
	FadeDelete("色１", 300, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//◆含み笑い
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700740su">
「そうだよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700750su">
「すでに多くのヒントが提示されているよね」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700760su">
「キミには、もう“見えている”はず」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700770su">
「キミの眼下に広がっている、その景色の中に！」

つまり、えーっと……えーっと……

ここから見える景色のどこかに、『将軍』がディソードを隠したっていうこと？
それを見つけろってこと？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700780ta">
「み、見つけたら……ゆる、許してくれるの……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700790su">
「見つけるだけじゃクエストクリアにはならない」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700800su">
「実際に、剣を手に入れるんだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700810su">
「その場から一歩も動いちゃならない、っていう
ルールを破らないようにしてね」

そ、そんなのできるわけないじゃないか！

ここから動けないんじゃ、どうやって剣を手に入れてこいって言うんだよぅ！
『将軍』は僕になにをさせたいんだ！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","angry", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700820se">
「だから、あいつは無理難題を突きつけておいて、結局タッキーを殺したいだけなんだって！」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700830su">
「それができないなら、七海ちゃんの命はないよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700840se">
「逃げよ？　タッキー、おうちに帰ろ？」

だ、だって、ここから一歩でも動いたら七海が殺される……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700850se">
「だからー！　七海っちはどうせ助からないってばぁ」

た、助けてくれるって……言ったし……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700860se">
「あいつの言葉を信じるの？　ウソついてるかもしれないよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu星来_覚醒後_通常_angry", 200, true);
	Delete("色２");
	FadeDelete("色１", 400, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
僕は目を凝らす。
下からの照明のせいで遠くの景色が見づらい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景１", 3000, @-160, @0, AxlDxl, true);
	Move("背景１", 3000, @320, @80, AxlDxl, true);
	Move("背景１", 6000, @-320, @-160, AxlDxl, true);

//※画面が左右にゆっくりスクロール

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
できるだけ周囲を見回す。

と言ってもここから見える景色なんてそれほど広くない。ほとんどはビルに隠れちゃってる。

見つけなきゃ……剣を……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700870se">
「無理だよ」

あやせやセナの言葉をもう一度吟味してみる。

いったい、どういうことなのか……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 1000, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("buあやせ_制服_通常","normal", 200, @-200);
	FadeStand("buあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/12700880ay">
「でもちょっとだけ見方を変えたら、分かった」

{	Stand("buセナ_制服_通常","hard", 200, @200);
	FadeStand("buセナ_制服_通常_hard", 500, true);
	DeleteStand("buあやせ_制服_通常_normal", 1000, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700890sn">
「本当じゃないモノが景色に紛れ込む」

{	DeleteStand("buセナ_制服_通常_hard", 1000, true);
	Fade("色２", 0, 0, null, true);
	SetVolume360("CH*", 500, 0, null);}
そのとき、僕は――

なぜか、実家の部屋の天井にある模様のことを思い出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE*",0,0,false);
	BGMPlay360("CH26",2000,1000,true);

	Wait(1000);

//イメージＢＧ//実家の部屋の天上の模様

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 500, 1000, null, true);
	Fade("色１", 0, 0, null, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg167_01_3_実家の天井_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
昔から、寝るときなんかに漠然と思っていた。

部屋の天井の木目が、なんとなく人の顔に見えるなあって。

{#TIPS_パレイドリア = true;$TIPS_on_パレイドリア = true;}
<FONT incolor="#88abda" outcolor="BLACK">一度そういう風に見えちゃうと、
もうそれ以降は顔以外には見えなくなって</FONT>しまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：パレイドリア
	$TIPS_on_パレイドリア = false;

//イメージＢＧ//渋谷の夜景
	CreateTextureEX("背景１", 100, -480, -96, "cg/bg/bg163_01_3_渋谷夜景暗い_a.jpg");
	Fade("回想フラッシュ", 500, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 0, 1000, null, true);
	Delete("背景２");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

	Fade("色１", 1000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700900se">
「はいはい。目の錯覚目の錯覚。そんな木目、どこにでもいっぱいあるよ」

そ、そうだ……。
木目模様とは訳が違うよね……

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700910su">
「“切り取る”んだ」

『将軍』が、相変わらず淡々としたままつぶやく。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700920su">
「剣が見えたなら、そこから“切り取る”。キミにはそれができる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","angry", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_angry", 400, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601023]
//◆「意味ふめー」＝「意味不明」
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12700930se">
「はーい、意味ふめー。そいつはテキトー言ってるだけだよ！」

{	Stand("buセナ_制服_通常","hard", 200, @150);
	FadeStand("buセナ_制服_通常_hard", 400, false);
	DeleteStand("bu星来_覚醒後_通常_angry", 400, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch06/12700940sn">
「妄想は、現実にすることが可能だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_通常_hard", 1000, true);
	Delete("色２");
	FadeDelete("色１", 400, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602023]
あの花壇のように？
あの分裂したあやせのように？

でも、以前ニセモノのディソードから本物を妄想して出現させようとしたときは、うまくいかなかった……

もう一度、顔を左右に振って。
ここから見える景色を見渡してみた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※画面が左右にゆっくりスクロール
	Move("背景１", 4000, @480, @0, AxlDxl, true);
	Move("背景１", 4000, @-480, @0, AxlDxl, true);

//※ＹＥＳ／ＮＯ分岐
//■選択肢開始====================================================
	StartWhich03();

//ＹＥＳ／ＮＯ選択肢１
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text201]
“剣が見えた”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→選択肢２へ
//ＮＯ→選択肢６へ
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
			$６章選択肢 = 6;
		}
		case @選択肢１:
		{
			YES03();
				$６章選択肢 = 2;
		}
		}
		Wait(16);
	}

	while($６章選択肢 != 0 && $６章選択肢 != 1)
		{
		SelectChapter6();
		}

//■選択肢終了
	EndWhich03();

	$構文名 = $SYSTEM_present_process;

//=============================================================================//
//分岐１
//※即ＢＡＤ。ゲームオーバー分岐
if($６章選択肢 == 0)
{

	BGMPlay360("CH*", 1000, 0, true);
	SoundPlay("SE*", 2000, 0, false);
	CreateSE("SE01","SE_衝撃_せ中を押される");

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１",0, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700950su">
「キミには失望したよ」

{	Shake("背景１", 500, 4, 4, 0, 0, 500, null, false);
	SoundPlay("SE01", 0, 1000, false);
	Fade("色１", 800, 1000, null, true);}
背中を、強く押された。

いつの間にか何者かが僕のすぐ後ろにいた。

気配を感じなかった。
『将軍』じゃない。
車椅子のあの軋む音はしなかった。

じゃあ、誰――？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//落ちる
//おがみ：SEダミー＞歓声系
	CreateSE("SE01","SE_はいけい_すくらんぶる交差点ガヤ興奮_LOOP");
	CreateSE("SE02","SE_日常_歓声_LOOP");
	CreateSE("SE03","SE_自然_風音_強_LOOP");
	SoundPlay("SE01", 7000, 1000, true);
	SoundPlay("SE02", 7000, 1000, true);
	SoundPlay("SE03", 500, 1000, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");
	Request("背景１", Smoothing);
	Zoom("背景１", 20000, 1500, 1500, Dxl2, false);
	Move("背景１", 20000, @0, @-80, null, false);
	Fade("背景１", 0, 1000, null, true);
	Fade("色１", 1000, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
渋谷駅前の夜景が、ぐるぐると回る。

墜落する。
風を全身に感じる。
地面が迫ってくる。

周囲から悲鳴――というより歓声が聞こえる。

なにこれ？
これで、終わり？
僕の人生、終了？

イヤだ――

こんなのイヤだイヤだイヤだイヤだイヤだ
イヤだイヤだイヤだイヤだイヤだイ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 1000, 1000, null, false);
	Zoom("背景１", 1100, 3000, 3000, Axl3, true);

	SoundPlay("SE*", 1000, 0, false);

//イメージＢＧ//血のイメージ
//ＳＥ//グシャッ（地面に人が激突した音）
	CreateSE("SE01","SE_えい像_拓巳落下後");

	CreateColor("色１", 300, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);


	SoundPlay("SE01", 0, 1000, false);
	CreateMovie360("落下", 200, Center, Middle, false, false, "dx/mvやられ02.avi");	

	Wait(2000);
	Fade("色１", 2000, 1000, null, true);
//	DrawTransition("色１", 300, 0, 1000, 100, null, "cg/data/effect.png", true);

//～～Ｆ・Ｏ
//ゲームオーバー

	Delete("落下");
	Delete("背景１");
	ClearAll(5000);

	Wait(3000);

	$GameName = "ゲームオーバー";

}
//=============================================================================//




















//=============================================================================//
//分岐２
//※正解分岐
if($６章選択肢 == 1)
{

	SetVolume360("CH*", 500, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12700960ta">
「あ……」

見えた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※景色の中に溶け込んでいる剣の部分にクローズアップ
//おがみ：演出、画像完成後に行います
	Move("背景１", 500, @264, @0, AxlDxl, true);

	Wait(1000);

	Request("背景１", Smoothing);
	Move("背景１", 1000, @160, @24, AxlDxl, false);
	Zoom("背景１", 1000, 1500, 1500, AxlDxl, true);

	Wait(1000);

	BGMPlay360("CH28",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
涙目に浮かんでぼんやりとにじむ夜景、涙で光がねじ曲げられた景色の中に、ちょうど剣のように見える場所を見つけた。

あやせの言う通りだ。

最初は気付かなかったけど、ちょっとだけ見方を変えたら、いつの間にかそこにあった……。

偶然そう見えるだけでもなんでもよかった。

それが剣だと思えば思うほどに色濃くなってきて、やがて現実味を帯び、景色の中で徐々に存在感をまとってくる。

ついには輪郭までもはっきり見て取れるようになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700970su">
「見つけたんだね？」

僕が息を呑む気配に気付いたのか、『将軍』がすかさず声をかけてくる。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700980su">
「では、手を伸ばして、その剣を“切り取って”ほしい」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12700990su">
「深く考えなくていいんだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701000su">
「キミにならできるよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701010se">
「できるわけないじゃん！」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701020se">
「ダメ、タッキー！　そんなことしたら下に落ちちゃう！　落ちたら死んじゃうよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg166_01_3_拓巳見下ろし_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Fade("色１", 400, 0, null, true);
	CreateSE("SE01","SE_日常_ざわめき大");
	SoundPlay("SE01", 2000, 800, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
下を見る。
無数の群衆。

救急隊はいまだ来ていない。昼間と同じだ。対応が遅すぎる。
それも当然だ。それだけ昼間の地震の被害がすごかったんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701030ta">
「切り取るなんて……できないよ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701040su">
「固定観念にとらわれたらだめだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701050su">
「最初からできるわけがないと思っていたら、なにもできない」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701060su">
「常識を捨て去って、あるがままを見ればいいんだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701070su">
「キミには力がある。世界は、その力に応えてくれる」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701080su">
「あの花壇みたいにね」

ホントに、僕にできるの？
手を伸ばすだけで、あの剣が僕のものに？

もしそれがホントなら、やってみてもいい……。

ディソードは僕に救いをもたらすって、あやせは言った。

あの言葉は、今この瞬間のことを暗示してたのかもしれない。

僕は剣を手に入れて、クエストをクリアして、七海は生きたまま無事帰ってきて、『将軍』は僕にちょっかいをかけてくるのをやめる。

今までみたいな平穏な生活に戻る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 250, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 0, null, true);
	Fade("色１", 300, 1000, null, true);
	Fade("色２", 0, 500, null, true);
	Stand("bu星来_覚醒後_通常","angry", 200, @-100);
	FadeStand("bu星来_覚醒後_通常_angry", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701090se">
「そんなに都合よく行くと思う？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701100se">
「『将軍』があっさりタッキーを見逃すって？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701110se">
「だって相手は、１０人も殺した連続殺人鬼なんだよ？」

『将軍』だって、不可能なことを僕にさせようとはしないよ。僕にならできる。できるから、そうしろって言ってるんだろうし……

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701120se">
「あいつはタッキーを殺したいだけ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701130se">
「忘れたの？　『集団ダイブ』の映像」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701140se">
「『将軍』は、５人の男女を１回も触れることなく
転落死させたんだよ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu星来_覚醒後_通常_angry", 500, true);
	Fade("色２", 0, 0, null, true);
	Fade("色１", 1000, 0, null, true);
	Delete("色*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601030]
星来たんには悪いけど、僕は救いを求めるようにすでに手を伸ばしていた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※どよめきが起こる
	SoundPlay("SE01", 2000, 0, true);

	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	SoundPlay("SE02", 2000, 800, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
下の群衆から、どよめきが起こる。

僕の一挙一動が、駅前に詰めかけた何千人っていう人たちに注目されている。

それどころか、テレビ中継によって日本全国何万人とか何十万人に見られているんだ――

吐き気がこみ上げてきた。

自分がそんな大人数に見られているっていう重圧で、心がすぐにでも折れちゃいそう……

いや、意識しちゃダメだ。
意識したら、緊張で指一本動かせなくなる。
今は剣の方に集中するんだ。

{	Fade("背景３", 500, 0, null, true);}
僕は足許に気をつけつつ、その場に立ったまま手を伸ばした。

見えている剣に狙いを定めて、勘だけでつかもうとしてみる。

なんの手応えもない。

風が容赦なく襲いかかってくる。

しかもその風向きは不規則だ。

前から吹き付けてきたかと思うと、次の瞬間には横から僕の身体を押してくる。

身を支えるためにアクリル板をつかんでいたけど、滑りやすいからただの気休めにしかならない。

ちょっとでも気を緩めれば、振り落とされそうだ。

それでも必死に、剣をつかもうとした。
でも何度やっても、成功しない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 2000, 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701150ta">
「で、できるわけないよぅ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701160ta">
「だってあれはホントの剣じゃないんだよ……！？」

また涙が溢れてきた。

視界がかすんで、わずかに剣らしきものに見えていたものが、形を崩していく。

急いで涙を拭った。
一度見失ったら、もう二度と見つけられないような、そんな気がした。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701170su">
「それなら、もっと手を伸ばせばいい」

くそう、人の気も知らないで……
僕は唇を噛んで涙をこらえ、それまでよりも身を乗り出して手を中空へとさまよわせた。

それでもやっぱり剣はつかめない。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701180su">
「もっと」

ここで落ちたら……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景３", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
もう一度、下を見る。
想像以上の高さだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景３", 500, 0, null, true);
	Delete("背景３");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601033]
目眩が起きそうになって、僕は身体を引っ込めてアクリル板にしがみつく。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701190su">
「どうしたの？　剣を、早く、手に入れて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701200su">
「でないと、いつまで経っても七海ちゃんは戻ってこないよ」

下を見なければよかった……。

震えが止まらない。
自分の震えのせいで足を滑らせそうだ。
完全にビビってしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701210ta">
「で、できないよぅ……許して……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701220su">
「キミはあまり僕をナメない方がいい」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701230su">
「キミのワガママに付き合うつもりはないんだ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701240su">
「ディソードを手に入れろ。それができないなら――」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701250su">
「キミの妹は死ぬ。キミも……死ねばいい」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701260su">
「ただそれだけ」

イヤだ……死にたくない……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701270ta">
「死にたくない……っ」

僕はやむなく、もう一度穴から身を乗り出して、手を伸ばす。

剣はまだそこに見えている。
何度か試してみるけど、やっぱりダメだった。
確かに届きそうなのに、どうして届かないんだ……。

さらに身を乗り出す。
全身を伸ばすようにして、手を剣へと差し出す。
指先をもいっぱいまで伸ばして――

手を……ゆっくりと、握りしめる。

やっぱり手応えはなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701280ta">
「手が、手が届かないよ……っ」

無理だ……星来たんの言う通りだ……

そもそもあんな半透明の剣をつかめるはずないじゃないか。遠近法で普通のサイズに見えるだけで、冷静に考えたらとんでもなく巨大だし。

人が握れるサイズじゃない……っ。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701290su">
「その剣をつかめばクエストクリアなんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701300ta">
「でも……落ちちゃう……届かない……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701310su">
「七海ちゃんを助けなくていいの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701320ta">
「助けて……もう許して……死にたくないんだよぅ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701330su">
「昼間のことを思い出すんだ。キミの力があれば、そこから落ちたとしてもまた花壇を出現させればいい」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12701340su">
「キミは、落ちても、死なない」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701350se">
「自信ある？」

と、星来たんのいたずらげなささやきが耳元で聞こえた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 2000, 0, false);
	SetVolume360("CH*", 2000, 0, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
自信……って？

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701360se">
「タッキーがここから落ちて、下の地面に激突するまでほんの３秒もないよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701370se">
「その間に、自分の意志で、また花壇を出現させる」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701380se">
「タッキーが、そんなすごいことできる？」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701390se">
「今まで一度も、自分で意識してその力とかっての、使ったことないっしょ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601035]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12701400ta">
「…………」

そうだ……
そもそも僕は、力を使えたとしても、
使い方を知らない――

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701410se">
「ねえ、逃げよ？　タッキーはよくやったよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701420se">
「でもこれ以上は無理」

//【星来】
<voice name="星来" class="星来" src="voice/ch06/12701430se">
「死にたくないっしょ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("２９");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();
	
}

}







function SelectChapter6()
{
	$構文名 = $SYSTEM_present_process;

//■設定====================================================
if($６章選択肢 == 2)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢２
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text202]
“はっきりと剣が見えた”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→選択肢７へ
//ＮＯ→選択肢３へ
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
				$６章選択肢 = 3;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 7;
			}
		}
		Wait(16);
	}

}

//■設定====================================================
if($６章選択肢 == 3)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢３
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text203]
“なんとなく剣に見えただけ”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→選択肢４
//ＮＯ→分岐１へ
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
				$６章選択肢 = 0;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 4;
			}
		}
		Wait(16);
	}

}


//■設定====================================================
if($６章選択肢 == 4)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢４
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text204]
“ここ以外の場所でもその剣は見える”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→分岐１へ
//ＮＯ→選択肢５へ
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
				$６章選択肢 = 5;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 0;
			}
		}
		Wait(16);
	}

}

//■設定====================================================
if($６章選択肢 == 5)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢５
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text205]
“実際にはそれは剣じゃない”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→分岐２へ
//ＮＯ→分岐１へ
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
				$６章選択肢 = 0;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 1;
			}
		}
		Wait(16);
	}

}

//■設定====================================================
if($６章選択肢 == 6)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢６
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text206]
“剣っぽいものは見えた”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→選択肢７へ
//ＮＯ→選択肢８へ
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
				$６章選択肢 = 8;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 7;
			}
		}
		Wait(16);
	}

}

//■設定====================================================
if($６章選択肢 == 7)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢７
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text207]
“ここから動けるなら取りに行ける”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→分岐１へ
//ＮＯ→選択肢４へ
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
				$６章選択肢 = 4;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 0;
			}
		}
		Wait(16);
	}

}

//■設定====================================================
if($６章選択肢 == 8)
{

	PreWhich03();

//ＹＥＳ／ＮＯ選択肢８

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text208]
“幻覚としては見えた”

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

//ＹＥＳ→選択肢４へ
//ＮＯ→分岐１へ
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
				$６章選択肢 = 0;
			}
			case @選択肢１:
			{
				YES03();
				$６章選択肢 = 4;
			}
		}
		Wait(16);
	}

}



}