//<continuation number="490">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_016_妄想トリガー３■";
		$GameContiune = 1;
		Reset();
	}

	ch01_016_妄想トリガー３■();
}


function ch01_016_妄想トリガー３■()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("交差点", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Request("交差点", Smoothing);
	Fade("交差点", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐９へ
//ネガティブ妄想→分岐１０へ
//妄想しない→分岐１１へ
if($妄想トリガー通過３ == 0)
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
			$妄想トリガー３ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３ = 0;
		}
	}
}


//=============================================================================//
if($妄想トリガー３ == 2)
{
//☆☆☆
//分岐９

	DelusionIn();

//※妄想ＩＮエフェクト入れるべきか入れないべきか……

	CreateTextureEX("赤信号", 1100, 0, 0, "cg/bg/bg028_01_3_赤信号_a.jpg");
	CreateTextureEX("青信号", 1000, 0, 0, "cg/bg/bg029_01_3_青信号_a.jpg");
	Fade("青信号", 0, 1000, null, true);
	Fade("赤信号", 0, 1000, null, true);

	DelusionIn2();

	Wait(1000);

	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 500, 800, 0, 1000, null, true);

	FadeDelete("赤信号", 100, false);
	WaitAction("赤信号", null);
	Move("交差点", 0, @0, @-48, null, true);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
信号が、青に変わった。
女子Ａは、他の通行人と同じように歩き出す。

{	FadeDelete("青信号", 500, true);}
こっちに向かってくる。
僕は動けない。その場で立ち尽くす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――
	
	Stand("st優愛_制服_通常左手下","hard", 200, @5);
	Request("st優愛_制服_通常左手下_hard", Smoothing);
	Move("st優愛_制服_通常左手下_hard", 0, @10, @50, Dxl1, true);
	FadeStand("st優愛_制服_通常左手下_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601000]
彼女はいまだに僕をまっすぐに見ている。
どんどん近づいてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――
	
	Stand("bu優愛_制服_通常左手下","hard", 200, @0);
	Request("st優愛_制服_通常左手下_hard", Smoothing);
	Move("bu優愛_制服_通常左手下_hard", 0, @20, @50, Dxl1, true);
	FadeStand("bu優愛_制服_通常左手下_hard", 300, true);
	DeleteStand("st優愛_制服_通常左手下_hard", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
そして、
僕の前で立ち止まった。

逃げろ、と理性がささやいている。

でもなぜか、身体が動かない。意識と身体が遊離したみたいな感覚。

そんな僕に見せつけるようにして、女子Ａはゆっくりとした動作で自身のブレザーの胸元へ手を突っ込んだ。内ポケットからなにかを取り出す。

ナイフか、拳銃か、スタンガンか……？

ドラマの見過ぎかとも思ったけど、イヤな予感が脳裏を離れない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――
	
//ＳＥ//センター街停止
	SoundStop("SE01");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600010yu">
「これ……」

女子Ａがつぶやく。眼鏡の奥の視線は動かない。さっきから延々と、僕の目だけに固定されている。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600020yu">
「落としましたよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600030ta">
「……？」

{	BGMPlay360("CH05", 2000, 1000, true);}
差し出されたのは、生徒手帳だった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600040yu">
「さっきの、ネットカフェで拾いました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600050yu">
「追いつくことができて、よかった」

つい、受け取ってしまう。

開いてみると、僕の顔写真と名前があった。
この生徒手帳は、僕のだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","normal", 200, @0);
	Move("bu優愛_制服_通常左手下_normal", 0, @20, @50, Dxl1, true);
	FadeStand("bu優愛_制服_通常左手下_normal", 300, false);
	DeleteStand("bu優愛_制服_通常左手下_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600060yu">
「西條拓巳くん、って言うんですね」

直前まで硬かった彼女の顔が、ふとやわらぐ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600070yu">
「すいません、勝手に中身を見ちゃって」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600080yu">
「わたしも、同じ学校なんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600090yu">
「よろしく」

……拍子抜けしてしまった。
もしかして、完全に僕の被害妄想だったっていうオチ？

{	Stand("bu優愛_制服_通常","worry", 200, @0);
	Move("bu優愛_制服_通常_worry", 0, @20, @50, Dxl1, true);
	FadeStand("bu優愛_制服_通常_worry", 300, false);
	DeleteStand("bu優愛_制服_通常左手下_normal", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600100yu">
「と、ところで、西條くんは……付き合ってる人、いますか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600110ta">
「い、いません……」

{	Stand("bu優愛_制服_通常","shy", 200, @0);
	Move("bu優愛_制服_通常_shy", 0, @20, @50, Dxl1, true);
	FadeStand("bu優愛_制服_通常_shy", 300, false);
	DeleteStand("bu優愛_制服_通常_worry", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600120yu">
「本当ですか？　じゃ、じゃあ、よかったら、わたしと……」

{	SetVolume360("CH05", 500, 0, NULL);}
{#TIPS_リア充=true;$TIPS_on_リア充 = true;}
フラグ、キタコレ！
僕の<FONT incolor="#88abda" outcolor="BLACK">リア充</FONT>生活は、始まったばかりだ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DelusionOut();

//ＢＧ//黒
	Delete("*", 0, false);

	DelusionOut2();
	PositiveHuman();

//▼TIPS：解除：リア充
	$TIPS_on_リア充 = false;

//ＳＥ//車のクラクション
	CreateSE("SE04","SE_日常_車_クラクション");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("背景１", 500, 0, 0, 1280, 720, "Black");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600130ta">
「……！」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("交差点", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Request("交差点", Smoothing);
	Fade("交差点", 0, 1000, null, false);

	DrawTransition("背景１", 300, 1000, 0, 100, null, "cg/data/center.png", true);
	FadeDelete("背景１", 0, false);

//ＳＥ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);

//ＢＧ//道玄坂//夜
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ハッと我に返る。

青になったはずの信号は、赤のままで。
目の前にいたはずの女子Ａは、横断歩道の向こうにいた。

今のは……僕の妄想か……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＣＧ//交差点の向こう側で信号待ちしてこちらを見ている優愛//青信号
	CreateTexture360("赤信号", 100, 0, 0, "cg/bg/bg028_01_3_赤信号_a.jpg");
	Wait(1000);

	CreateTexture360("青信号", 100, 0, 0, "cg/bg/bg029_01_3_青信号_a.jpg");
	Request("交差点", Smoothing);
	Zoom("交差点", 0, 1500, 1500, null, true);
	Fade("青信号", 0, 0, null, true);
	Fade("青信号", 200, 1000, null, true);

	FadeDelete("赤信号", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
今度こそ信号が青に変わった。
通行人が、一斉に動き出す。

{	FadeDelete("青信号", 1000, false);}
僕は動けなかった。
女子Ａは、動かなかった。
動かないまま、じっと僕を見つめている。

僕と彼女の２人だけが、時間が止まってしまったかのようで。

どうして、あの眼鏡女は歩き出さない？
どうして、その場に立ったままなんだ？

おかしい。変だ。
関わっちゃいけない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流４へ
}


//=============================================================================//
if($妄想トリガー３ == 1)
{

//☆☆☆
//分岐１０

	DelusionIn();

//※妄想ＩＮエフェクト入れるべきか入れないべきか……

	CreateTextureEX("交差点", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Request("交差点", Smoothing);
	Fade("交差点", 0, 1000, null, true);

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
と、通り過ぎた車のヘッドライトの影響なのかどうなのか、
女子Ａの眼鏡がキラリと光った。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600140yu">
「ふふ……」

聞こえた。
唇を歪めて。
あざ笑うかのような。

こんなに距離があるのに。
こんなに人がいるのに。

女の、吐息にも似た笑い声を、僕の耳は確かにとらえていた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600150yu">
「あはは……」

笑いながら、彼女は、
いきなり自身のスカートの裾をまくり上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//スカートの裾をまくり上げる
//ＳＥ//バラバラと金属製の杭が大量に地面に落ちる
	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	CreateSE("SE03","SE_衝撃_杭_落ちる_じ面_大量");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
//ＳＥ//スカートの裾終了待ち
//おがみ：処理重いのでやめ
//	WaitPlay("SE02", null);
	Wait(1000);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateBG(100, 0, 0, 0, "cg/bg/bg025_01_3_アスファルト一面杭_a.jpg");


	BGMPlay360("CH10", 1500, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
その中から、キラキラと光るなにかが、大量にばらまかれた。

それは十字架のようにも見えて。
僕の頭の中に、あの『張り付け』の現場で見た杭が、閃光のように浮かび上がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色２", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色２", AddRender);
	Fade("色２", 0, 0, null, true);
	Fade("色２", 200, 1000, null, true);
	Stand("st優愛_制服_冷酷","mad", 200, @0);
	Move("st優愛_制服_冷酷_mad", 0, @10, @50, Dxl1, true);
	FadeStand("st優愛_制服_冷酷_mad", 300, true);
	FadeDelete("back*", 0, false);
	FadeDelete("色２", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600200]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600160yu">
「あははは……！」

女の表情は、完全に常軌を逸していた。
目を血走らせ、頬を引きつらせて、口元だけに笑みを浮かべている。

そしてなにを思ったのか、信号待ちの人々をかき分け、まだ赤なのに、横断歩道へと躍り出た。

恐怖で僕は縮み上がり、
逃げようと思ったけど、足が根のように地面に張り付いて動かない。
声も出せなくなっている。

女が迫ってくる。
横断歩道を渡ってくる。
手にはあの十字型の杭を握りしめて。

来るな！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	if(#下着パッチ==true)
	{
		CreateTextureEX("優愛", 100, 0, 0, "ex/hu/hu優愛_制服_冷酷_下着_mad_lip02.png");
	}else{
		CreateTextureEX("優愛", 100, 0, 0, "cg/hu/hu優愛_制服_冷酷_mad_lip02.png");
	}

	Zoom("優愛", 1, 600, 600, null, true);
	Move("優愛", 0, @-60, @-240, Dxl1, true);
	FadeDelete("st優愛_制服_冷酷_mad", 0, true);
	Fade("優愛", 0, 1000, null, true);

	CreateSE("SE02","SE_日常_車_クラクション");
	MusicStart("SE02", 0, 1000, -1000, 1000, null, false);
	SetPan("SE02", 500, 0, Axl3);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text608]
そう願った直後――
{	Wait(500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 200, 0, NULL);

	CreateSE("SE03", "SE_衝撃_どすーん");
	CreateSE("SE04", "SE_衝撃_落下激突");
	CreateTextureEX("トラック", 100, -1280, 0, "cg/bg/bg030_01_3_トラック横向き_a.png");

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Wait(200);
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Fade("トラック", 0, 1000, null, true);
	Move("トラック", 400, @1280, @0, Dxl2, false);
	Fade("優愛", 300, 0, null, true);
	Delete("優愛");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text508]
女子Ａの身体が、走ってきたトラックに弾き飛ばされた。

周囲から、悲鳴があがる。

僕の立っているところからは、人垣に阻まれて、あの女がどうなっているのかは見えない。

でもきっと――

死んだ。
間違いなく、死んだ。

ボロぞうきんみたいに、血まみれになって道路に転がってるに違いない。
僕は不謹慎にも、助かった、って、思ってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DelusionOut();

//ＢＧ//黒
	CreateColor("背景１", 1000, 0, 0, 1280, 720, "Black");

	FadeDelete("交差点", 0, false);
	Delete("トラック");
	Delete("黒１");

//ＳＥ//車のクラクション

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE04","SE_日常_車_クラクション");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600170ta">
「……！」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateTextureEX("交差点", 100, center, Middle, "cg/ev/ev018_01_3_優愛_a.jpg");
	Request("交差点", Smoothing);
	Fade("交差点", 0, 1000, null, true);

//ＳＥ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 800, 0, 1000, null, false);

	DrawTransition("背景１", 300, 1000, 0, 100, null, "cg/data/center.png", true);
	FadeDelete("背景１", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
ハッと我に返る。
べっとりと、全身にイヤな汗をかいていた。

騒然となっていたはずの周囲の通行人たちは、平然と信号待ちをしていて。
見える範囲にはトラックの姿はなく。

あの眼鏡女は、横断歩道の向こう側で、相変わらず僕を見つめていた。

今のは、僕の妄想か……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Wait(500);
//ＣＧ//交差点の向こう側で信号待ちしてこちらを見ている優愛//青信号
	CreateTexture360("赤信号", 100, 0, 0, "cg/bg/bg028_01_3_赤信号_a.jpg");
	Wait(1000);

	Zoom("交差点", 0, 1500, 1500, null, true);

	CreateTexture360("青信号", 100, 0, 0, "cg/bg/bg029_01_3_青信号_a.jpg");
	Fade("青信号", 0, 0, null, true);
	Fade("青信号", 200, 1000, null, true);

	FadeDelete("赤信号", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
信号が青に変わった。
通行人が、一斉に動き出す。

{	FadeDelete("青信号", 1000, false);}
僕は動けなかった。
女子Ａは、動かなかった。

笑い出すことも、スカートをまくることもなかった。
ただ、じっと僕を見つめている。

僕と彼女の２人だけが、時間が止まってしまったかのようで。

どうして、あの眼鏡女は歩き出さない？
どうして、その場に立ったままなんだ？

おかしい。変だ。
関わっちゃいけない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//合流４へ
}



//=============================================================================//

if($妄想トリガー３ == 0)
{

//☆☆☆
//分岐１１
//フラグ【１章エンドフラグ②】ＯＮ
	$１章エンドフラグ② = true;

//ＳＥ//センター街
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);

	Zoom("交差点", 2000, 1500, 1500, Dxl2, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
僕は金縛りにあったみたいに、目を離せない。

ふと女子Ａの口が動く。
なにか言おうとしている。

でも周囲の音がうるさくて聞こえるはずもなく。

僕は魅入られたように、彼女の口の動きに目を凝らした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
そ

の

め

だ

れ

の

め

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//おがみ：実績：その目
	Eyes();

	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
――ゾワリと、総毛立った。
そんなはずない。気のせいだ。僕は読唇術なんてできないんだから。単なる読み違いだ。

頭を振り、なんとか努力して女から目をそらした。

いずれにせよ女子Ａがなにかを言ったのは確かで。
その内容がなんだろうと、初対面の僕にあんなことするのはキモすぎる。
関わっちゃいけない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流４へ

}

//=============================================================================//

	Zoom("交差点", 300, 1600, 1600, Dxl1, true);

//☆☆☆
//合流４

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
逃げた方がいい。

今のうちに逃げるんだ。

逃げろ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＢＧ//道玄坂//夜
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg027_01_3_道玄坂_a.jpg");
	DrawTransition("back*", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg027_01_3_道玄坂_a.jpg");

	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE02", 0, 700, 0, 1000, null, true);

	Delete("交差点");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
萎えそうになる貧弱な心を叱咤して、僕は一目散に走り出した。女子Ａとは逆方向、今登ってきた道玄坂を駆け下りて、途中にあった横道へと入った――

//ＳＥ//拓巳走る停止
{	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	SoundStop2("SE02");
	CreateSE("SE03","SE_じん体_動作_尻餅");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE03", null);
	CreateSE("SE04","SE_日常_スクーター_倒れる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);}
直後、なにかに激突して僕は肩口から勢いよく倒れ込んだ。

自分になにが起こったのかよく分からないままうめき声をあげると、全身に痛みが走った。そのせいで身体を起こすのがやっとだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg033_01_3_スクーター倒れ_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/down.png", true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
顔を上げると、道のど真ん中にずんぐりとした大型のスクーターが横倒しになっていた。僕はあれに激突しちゃったらしい。

歯を食いしばって無理矢理立ち上がろうとした。でも足に力が入らない。骨折はしてないみたいだけど……

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600180yu">
「あの～、だ、大丈夫……ですか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev803_01_3_優愛遭遇_a.jpg");
	DrawTransition("背景１", 500, 0, 1000, 100, null, "cg/data/right2.png", true);
	Delete("背景２");
	CreateBG(100, 0, 0, 0, "cg/ev/ev803_01_3_優愛遭遇_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text117]
いつの間にか、目の前に女子Ａがいた。
僕の顔を心配そうにのぞき込むようにしている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600190ta">
「な……んな……」

なんなんだ……。
なんなんだよ、この女は……。

身体は動いてくれなかった。

情けないことに、ビビっていた。
どうしたらいいか分からなかった。

こんなことなら神泉まで電車で帰ればよかったって今さら後悔した。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600200yu">
「……ケガ、してませんか？」

女子Ａは、おずおずという態度で声をかけてくる。

僕を心配しているフリをして油断させようって魂胆か？
だ、騙されないぞ。三次元女なんかに騙されるもんか……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600210ta">
「な、な、なんなんだよ……っ」

{	CreateBG(100, 500, 0, 0, "cg/bg/bg027_01_3_道玄坂_a.jpg");
	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600220yu">
「え……っ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600230ta">
「つ、ついて、ついてくるなよぅ！　僕、僕に、なんの用だぁっ」

困惑顔の女子Ａに、必死で罵声を浴びせる。少しでも距離を取ろうと、尻餅をついたまま後ずさる。

そうしないと、今にもこの女が懐からナイフを取り出して
僕に襲いかかってくるんじゃないかって思ったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
	CreateSE("SE05","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE05", 0, 700, 0, 1000, null, false);

//ＣＧ//張り付け死体
//一瞬だけ表示
	CreateTextureEX("はりつけ", 300, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Fade("はりつけ", 300, 1000, null, true);
	FadeDelete("はりつけ", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
何度も何度も、あの凄惨な光景が脳裏をよぎる。
僕もああなっちゃうんじゃないかって、どうしてもそういう考えが浮かんでしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","sad", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600240yu">
「…………」

女は傷ついたような表情をして、うなだれた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600250yu">
「えっと、えーっと、あの、あなたが急に走り出して、様子を見に来たら倒れてたので、心配で……。で、でもその、今は用事とかあるわけじゃないんですが、あの、その、えっと……」

用事とかあるわけじゃない……だって？
意味不明すぎる……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600260ta">
「じ、じゃあっ、な、なななんで付きまとってくるんだっ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600270yu">
「えっと、それは、えっと」

しどろもどろになっている。
やっぱり言動が怪しすぎる……。

//おがみ：ルビ入力
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600280yu">
「わたし、<RUBY text="くすのき">楠</RUBY>……<RUBY text="ゆ">優</RUBY><RUBY text="あ">愛</RUBY>って言います」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600290ta">
「…………？」

誰も聞いてないのに、いきなり自己紹介を始めた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600300yu">
「その、実は……あなたのこと、一目見て、なんとなく存在が気になって……」

{	Stand("st優愛_制服_通常","worry", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_sad", 300, false);
	FadeStand("st優愛_制服_通常_worry", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600310yu">
「それで、つい……」

//おがみ：ルビ入力
つい、尾行をしたって言うのか……？
<RUBY text="ゆ">優</RUBY><RUBY text="あ">愛</RUBY>と名乗った女は、喋りながらますます視線を下げていく。

{	DeleteStand("st優愛_制服_通常_worry", 300, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600320yu">
「ごめんなさいっ」

そのまま勢いよく頭を下げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","worry", 200, @+100);
	FadeStand("st優愛_制服_通常_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
……あり得ない。
それが僕が抱いた正直な気持ちだった。

こうして見ると、優愛というこの女子はけっこうかわいい。それは認める。

でもだからこそ、信じられない。

自分に好意を持っている三次元の女子だって？

これなんてエロゲ？

今までの人生で、そんなこと言われたことは一度もなかった。だからあまりに唐突なその告白は、嘘くさいものにしか聞こえない。

こんなんで僕が喜ぶとでも思うの？
しかも直前までストーカーみたいにつきまとっておきながら？

二次元じゃそういうキャラもアリかもしれないけど、三次元だとリアルにひく。どんびきだ。

それに、すごく恥ずかしい。
今すぐこの場から立ち去りたい気分だよ……。
喋るだけで緊張を強いられるなんて、ホントに三次元はクソだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600330ta">
「ぼ、僕は……三次元に、興味はないよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600340yu">
「え？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600350ta">
「あ、いや……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600360ta">
「えと、め、めい、め、め……」

キツいことを言おうとするとどもってしまう。
それでもはっきり言ってやらなくちゃ、今後も付きまとわれる。そんなのゴメンだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600370ta">
「めい、迷惑だよ……。つ、つき、まとわないでよ……」

{	Stand("st優愛_制服_通常左手下","sad", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_sad", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600380yu">
「……すいません」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
しゅんとしているところを見ると、本気で反省してるのか。

いや、騙されるな。三次元のことはなにも信じるな。
僕が信じるのは二次元だけ。こんな女より、星来たんの言葉の方が信用できる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600390ta">
「も、もう、ついて、こ、こないでね……。ぼ、僕、帰るから……」

しどろもどろになりながら、必死で立ち上がった。
まだ身体のあちこちが痛む。特に肩口はほとんど力が入らず、ズキズキという鈍い痛みが断続的に続いていた。


痛みのせいで少し目眩がした。転んだときに頭も少し打ったのかもしれない。
{	DeleteStand("st優愛_制服_通常左手下_sad", 300, true);
	CreateSE("SE04","SE_にん間_動作_手_はたく");
	MusicStart("SE04", 0, 500, 0, 1000, null, false);}
よろけそうになった僕の手を、優愛が慌ててつかんで支えてくれた。

{	Stand("bu優愛_制服_通常左手下","worry", 200, @+200);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600400yu">
「ケガしてるんですね？　手、貸します」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600410ta">
「…………」

目を合わせないようにするのが精一杯だった。きっと僕の顔は真っ赤になってるに違いない。それを見られたらきっとバカにされる。
だから顔を背けようと、優愛の手を乱暴に振り払った。

//おがみ：シナリオ修正：早く＞速く
僕の頭の中は真っ白になっていた。家族以外の女の子に触れる経験なんて滅多にない。
自分の胸の鼓動がどんどん速くなってくるのが分かる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600420yu">
「お家まで送ります。えっと、あなたがケガしたのは……わたしが、つきまとっちゃったせいですから……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600430yu">
「だから、送らせてくださいっ」

彼女の申し出は嬉しかった。人から優しくされることに慣れてないから、ついさっきまで嫌悪していた三次元女相手に、本気で好きになっちゃいそうだった。

だからって優愛に正面から向き合える勇気なんてないし、そもそもこの女はストーカーだし、あの悪魔女と関係があるかもしれないし、僕は死にたくないし……

とにかくいろんなことを考えようとして、でもなんにも考えられなくて、訳が分からなくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","worry", 200, @+200);
	DeleteStand("bu優愛_制服_通常左手下_worry", 500, false);
	FadeStand("bu優愛_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600440yu">
「えっと、あの、お家、どこですか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600450ta">
「あ、し、しんせ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600460yu">
「神泉？」

うなずいてから、しまった、と思った。

なんで教えちゃうんだ……。
僕はなにを期待してるんだ……。
どうせこんなの妄想だ。

{#TIPS_死亡フラグ=true;$TIPS_on_死亡フラグ = true;}
あるいは最後の最後で幸せの絶頂から絶望に突き落とされるんだ。アニメではいつもそういうパターンだし。
<FONT incolor="#88abda" outcolor="BLACK">死亡フラグ</FONT>が発動しつつある。

{$TIPS_on_死亡フラグ = false;}
やばいやばいやばいやばいやばいやばいやばいやばい。

いつの間にか、優愛は僕の身体を肩で支えるようにしていた。柔らかい身体が、ぴたりと密着してくる。彼女の髪からいい香りがした。

あり得ない。三次元の女子が僕にこんなに優しくしてくれるはずがない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600470yu">
「歩けます……か？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01600480ta">
「…………」

聞かれて、またうなずいてしまう。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01600490yu">
「じゃあ、行きましょう」

//ＳＥ//センター街3secF/out
{	DeleteStand("bu優愛_制服_通常_worry", 300, false);
	SetVolume("SE01", 2000, 0, null);}
優愛が緊張したような声で、僕の足を見ながらゆっくり進み出す。

そこまでしてもらったらもう、断ることも振り払うこともできなくて、僕は為す術なく彼女の華奢な肩を借りて歩き始めるしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	ClearAll(1000);

//～～Ｆ・Ｏ



}

