//<continuation number="1120">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_026_妄想トリガー５■";
		$GameContiune = 1;
		Reset();
	}

	ch01_026_妄想トリガー５■();
}


function ch01_026_妄想トリガー５■()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg040_01_2_優愛カバン_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//=============================================================================//
//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１５へ
//ネガティブ妄想→分岐１６へ
//妄想しない→分岐１７へ
//=============================================================================//
if($妄想トリガー通過５ == 0)
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
			$妄想トリガー５ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー５ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー５ = 0;
		}
	}
}



if($妄想トリガー５ == 2)
{
//☆☆☆
//分岐１５
//ＣＧ//ケータイを見せてくる七海
//フラッシュバックで一瞬表示



	CreateSE("SE01","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE01", 0, 1000, false);

	CreateTextureEX("携帯", 100, Center, Middle, "cg/ev/ev016_01_1_七海携帯萌_a.jpg");
	Zoom("携帯", 0, 500, 500, null, false);
	Fade("携帯", 200, 1000, null, true);

	FadeDelete("携帯", 800, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
あ、そ、そうだ……。

七海がケータイのストラップにしていたんだ。ただそれだけのことだよ。

そうだよ、僕はなにを妙なこと考えてるんだ。
ひとりで勝手にキョドっちゃったよ。バカみたいだ。

そもそもゲロカエルんは女子高生に大人気って七海が言ってたぐらいだから、優愛が持ってても全然不思議じゃない。うん、そうだ。そうなんだ。

ホント、想像力が豊かすぎるのも困りものだよね。
自分の妄想に怯えてたら世話ないよ。ははは。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	CreateBG(100, 0, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");
	Stand("bu優愛_制服_通常","normal", 200, @100);
	FadeStand("bu優愛_制服_通常_normal", 0, true);

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600010yu">
「西條くん？」

僕を見上げたまま、優愛が首を傾げている。
慌てて愛想笑いを返した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600020ta">
「あ、え……と……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600030ta">
「そ、それ、ホ、ホントに、流行って……るんだなあ、って……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600040ta">
「ゲ、ゲロ、カエルん」

{	Stand("bu優愛_制服_通常","shock", 200, @100);
	FadeStand("bu優愛_制服_通常_shock", 200, true);
	DeleteStand("bu優愛_制服_通常_normal", 0, false);}
//ハッと息を呑む
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600050yu">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//心臓の鼓動
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
え……？

{	BGMPlay360("CH12", 2000, 1000, true);}
なに、そのリアクション……。
なんでそんな、
表情を、引きつらせてるの……？

僕、今、なにかまずいこと、言った？

ゲロカエルん、っていうキャラクターの話題を、しただけじゃないか。
なのに、なんで……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @100);
	DeleteStand("bu優愛_制服_通常_shock", 300, false);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600060ta">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600070yu">
「…………」

それまで柔らかい笑みを浮かべていた優愛は、今はうなだれ、僕を見ようとしない。
表情をうかがい知ることができない。

イヤな予感が、消えてくれない。
カバンにぶら下がる３匹のゲロカエルんを見た瞬間から感じている、デジャヴ。

やっぱり僕は、前にもこれを――

“３匹並んだゲロカエルん”を、どこかで見たことがある――
そしてそれを僕から指摘されることを、優愛は、恐れている――

不信感が、むくむくと頭をもたげて僕の心を支配する。
優愛を信頼するべきなのか、どうなのか……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常","sad", 200, @100);
	DeleteStand("bu優愛_制服_通常左手下_worry", 300, false);
	FadeStand("bu優愛_制服_通常_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600080yu">
「ゲ、ゲロカエルん、西條くんも、し、知ってるんですね」

その声は明らかにうわずっていた。

//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600090yu">
「本当に大人気、で、ですよね。あはは。わたしも、あんまり、その、か、かわいいとは、思わなかったり、す、するんですけど」

//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600100yu">
「何人かの友達から、もらっちゃって……
き、気が付いたら、３つになってまして……」

優愛が言葉を紡げば紡ぐほど、不自然さが際立っていく。

僕を見ない。
僕を見て笑おうとしない。
さっきまで、あんなに穏やかに、あんなに優しく、話せていたのに。

僕は虚しくなってきて。
もうなにも言わなくていい、って、心の中でつぶやいた。

//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600110yu">
「み、見せてあげましょうか」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常_sad", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
優愛がカバンに手を伸ばし、くくりつけられたゲロカエルんを外そうとする。

//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600120yu">
「えーっと、ちょ、ちょっと、待って、くださいね……」

その手が、少し震えている。
焦っているのか、なかなかストラップはカバンから外れない。

//焦り
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600130yu">
「へ、変だな、どうして外れないんでしょう……っ。
か、絡まっちゃってるのかな――」

//ＳＥ//カバンがベンチから下に落ちる
{	CreateSE("SE02","SE_衝撃_鞄_落ちる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg041_01_2_優愛カバンぶちまけ_a.jpg");}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600140yu">
「あっ……」

優愛が強引にストラップを外そうとした拍子に、カバンがベンチから落ちた。ファスナーを閉めていなかったせいで、中に入っているノートや教科書がぶちまけられる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	PositiveHuman();

//合流６へ


}


//=============================================================================//

if($妄想トリガー５ == 1)
{
//☆☆☆
//分岐１６
//フラグ【ＲＯＯＭ３６】ＯＮ
	$ＲＯＯＭ３６ = true;

//ＳＥ//フラッシュバック
	CreateSE("SE01","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//ＢＧ//＠カフェ・ＲＯＯＭ３７付近//ＲＯＯＭ３６の仕切り戸が開いている
//フラッシュバックで一瞬表示
	CreateTextureEX("カフェ", 100, 0, 0, "cg/bg/bg035_01_3_ネットカフェ隣室_a.jpg");
	Fade("カフェ", 200, 1000, null, true);

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	CreateBG(100, 0, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");
	Stand("bu優愛_制服_通常","normal", 200, @100);
	FadeStand("bu優愛_制服_通常_normal", 0, true);
	FadeDelete("カフェ", 0, true);

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//ＢＧ//松濤公園
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600150ta">
「…………っ！」

ＲＯＯＭ３６！！

『＠カフェ』で僕がいつも使っているＲＯＯＭ３７の隣室。先週、優愛に初めて会った日、いつもは空いているＲＯＯＭ３６に珍しく客がいて、『ニュージェネ』のまとめサイトを見ていた。

そしてそのとき『＠カフェ』で僕は優愛を見かけて、
慌てて店を出た――

まさか……
あのとき、隣室にいたのは……

{	BGMPlay360("CH12", 2000, 1000, true);}
僕は、ベンチに座って僕を見上げている彼女を見た。
眼鏡の奥からこっちを見あげている視線とぶつかる。
出会ってから、初めて目が合った。

彼女はまだ微笑んでいる。でもすぐに戸惑いの色に変わる。

僕は、どんな顔をしてる？
分からない。

視線を、彼女のカバンに――あのぬいぐるみストラップに――もう一度戻す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, center, middle, "SCREEN");

	DeleteStand("bu優愛_制服_通常_normal", 0, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg040_01_2_優愛カバン_a.jpg");

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
彼女が、ハッと息を呑む気配がした。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600160yu">
「西條……くん……？」

さらさらと。
黄色い葉が風に吹かれて枝から離れ、舞う。

頭の中では、いろんな考えがグルグル回っている。

『ゲロカエルん』は、僕には理解できないけど流行ってるんだから、例え３つ同じ物をカバンにぶら下げている人間が何人もいたって珍しいことじゃない。

だけど――

ＲＯＯＭ３６。
あの日、優愛は隣に座っていたかもしれない。
そしてそれを、これまで一言も言おうとしなかった。

そして『ニュージェネ』。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 0, 0, NULL);

//ＳＥ//衝撃音
	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//ＣＧ//張り付け死体
//フラッシュバックで一瞬表示
	CreateTextureEX("はりつけ", 500, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Fade("はりつけ", 200, 1000, null, true);

	FadeDelete("はりつけ", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
すっかり忘れかけていたけど。
僕は、事件現場を目撃してる。

脳裏によみがえる、あのときの凄惨な光景。
そして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,1);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//ＣＧ//張り付け死体の前に立ち、こちらを振り返る血まみれの梨深
//フラッシュバックで一瞬表示

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE03","SE_衝撃_ふらっしゅばっく");
	CreateColor("色１", 300, 0, 0, 1280, 720, "BLACK");

	if(#下着パッチ==true)
	{
		CreateTextureEX("はりつけ", 500, -240, -240, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTextureEX("はりつけ", 500, -240, -240, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("はりつけ", 200, 1000, null, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	Delete("色１");
	Delete("はりつけ");
	CreateBG(100, 0, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");
	Stand("bu優愛_制服_通常","shock", 200, @100);
	FadeStand("bu優愛_制服_通常_shock", 0, true);

	FadeDelete("背景１", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
僕は、犯人の顔を見ているんだ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600170yu">
「こ、これですか？　ゲロカエルんって言うんです。何人かの友達にもらっちゃって……気が付いたら３つになってまして……」

{	DeleteStand("bu優愛_制服_通常_shock", 500, false);}
優愛は少し引きつった笑みを見せた。
カバンに手を伸ばし、くくりつけられたゲロカエルんを外そうとする。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600180yu">
「最近、女子高生に大人気なんですよ。わ、わたしは、あんまりかわいいとは思わないんですけど……」

優愛の手が、少し震えている。
焦っているのか、なかなかストラップはカバンから外れない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600190yu">
「へ、変だな、どうして外れないんでしょう……っ。
ちょ、ちょっと待ってくださいね、西條くんにも、見せてあげ――」

//ＳＥ//カバンがベンチから下に落ちる
{	CreateSE("SE02","SE_衝撃_鞄_落ちる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 0, 0, 0, "cg/bg/bg041_01_2_優愛カバンぶちまけ_a.jpg");}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600200yu">
「あっ……」

優愛が強引にストラップを外そうとした拍子に、カバンがベンチから落ちた。ファスナーを閉めていなかったせいで、中に入っているノートや教科書がぶちまけられる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	NegativeHuman();

//合流６へ

}

//=============================================================================//

if($妄想トリガー５ == 0)
{
//☆☆☆
//分岐１７

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
分からない……。

既視感だけはあるのに、思い出せない。

僕ってこんなに記憶力悪かったっけ？
暗記には自信があるのに。テストの成績だけはいいんだ。僕は、頭がいいんだ。

なのに、こんな、重要な――重要のような気がする――ことが思い出せないなんて。

どこだ、どこで、見た……？

もっと、ちゃんとゲロカエルんを観察すれば、思い出せるかも。
思い出すことで、どうなるかさえ、分からないけど。

ただ、“分からない”っていうことの気持ち悪さから逃れたいためだけに、僕は――

仲良く３匹並んでいるゲロカエルんに、
ほとんど無意識に、
手を伸ばす――

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600210yu">
「ダメッ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＳＥ//優愛の手が拓巳の手をはたく
	CreateSE("SE05","SE_にん間_動作_手_はたく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	CreateColor("背景１", 500, 0, 0, 1280, 720, "White");
	DrawTransition("背景１", 200, 0, 1000, 100, null, "cg/data/爆発.png", true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");

	FadeDelete("背景１", 200, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600220ta">
「っ！」

突然、優愛が僕の手をはたいた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600230ta">
「え……？」

……え？

{	Stand("st優愛_制服_通常","worry", 200, @0);
	FadeStand("st優愛_制服_通常_worry", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600240yu">
「あ……」

//切ないブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600250yu">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_worry", 500, true);

	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
……え？

呆然とする僕から、優愛は目をそらし、
ギクシャクした動きでベンチから立ち上がろうとして、

その手が、自身のカバンに、
あのゲロカエルん３匹をぶら下げたカバンに当たり、

まるでスローモーションの映像を見ているように、

カバンは、

ベンチから、

ゆっくりと、

下の地面へと、落ちた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//カバンがベンチから下に落ちる

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_衝撃_鞄_落ちる");
	CreateBG(200, 0, 0, 0, "cg/bg/bg041_01_2_優愛カバンぶちまけ_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600260yu">
「あっ……」

ファスナーを閉めていなかったせいで、中に入っているノートや教科書がぶちまけられる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//合流６へ

}

//=============================================================================//

//☆☆☆
//合流６

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600270yu">
「あ、ああ、わたしったら、なにをやってるんでしょう……」

ほんの数分前なら――

優愛のおっちょこちょいなところに、萌えていたかもしれない。
でも今は、ただ凍り付くことしかできない。
なぜなら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//イメージＢＧ//ぶちまけられた一冊のノート
//ノートが開いて、中に挟み込まれているメモや新聞の切り抜きなどが散乱している。すべて『ニュージェネ』事件関係のもの

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
地面に投げ出され、たまたま開いた一冊のノート。その中に挟み込まれていたメモや新聞の切り抜きなどが、散乱してしまっていた。

どうやらそれはスクラップブックらしくて。
メモも、切り抜きも、すべて、ひとつの事件に関連しているものだった。

はっきりと、僕には見えた。

{	BGMPlay360("CH12", 2000, 1000, true);}
『ニュージェネ』

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600280ta">
「な……んで……」

声がかすれてしまう。
優愛はあたふたしつつ、散乱したメモや切り抜きをかき集め、乱暴にカバンの中に押し込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	Stand("st優愛_制服_通常","worry", 200, @100);
	FadeStand("st優愛_制服_通常_worry", 0, true);

//ＢＧ//松濤公園//夕方
	CreateBG(100, 0, 0, 0, "cg/bg/bg015_01_2_松濤公園_a.jpg");

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600290yu">
「…………」

そのカバンを胸に抱きしめるようにして、優愛は立ち上がる。さっきまでの微笑みは完全に消え失せて、ばつの悪そうな表情でうなだれている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600300ta">
「そ、それは……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600310yu">
「…………」

優愛はなにも答えなかった。

どうして、答えてくれないの？
答えてよ……。
なにか言ってよ……。

なにも言わないんじゃ、後ろめたい気持ちがあるんだって思っちゃうじゃないか……。

せっかく、信じかけたのに……。
優愛は、僕の味方になってくれるかもしれないって、
思い始めてたのに……。

{	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTexture360("背景１", 200, 0, 0, "cg/ev/ev012_01_1_星来横たわり_a.jpg");
	Fade("色１", 500, 0, null, true);}
//ＶＦ//回想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch01/02600320se">
「誰も信じちゃ駄目。誰の言葉にも耳を傾けちゃ駄目」

{	Fade("色１", 100, 1000, null, true);
	Delete("背景１");
	Fade("色１", 500, 0, null, true);
	Delete("色１");}
やっぱり、星来が一番正しかった。

三次元の女は、どいつもこいつも最低なんだ。

優愛だって、僕に好意なんてなくて、ただなにか目的があって近づいてきただけなんだ。

僕を警察に突き出すつもりかもしれない。
僕を脅すつもりかもしれない。

最悪だ……。
最悪だよ……っ！

あの事件のことはせっかく忘れかけてたのに。

警察もなにも言ってこないみたいだから、
僕は無関係のままでいられるって思い込んでいたのに。
巻き込まれたくなんてないのに。

優愛は、いったいなにが目的なんだ……。
とにかく逃げ出したくて、僕はその場から踵を返そうとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, -1024, 0, "cg/bg/bg015_03_2_松濤公園_a.jpg");

	Move("st優愛*", 2000, @1024, @0, Axl1, false);
	Move("背景１", 2000, @1024, @0, Axl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text517]
でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

	CreateSE("サウンド１","SE_衝撃_衝撃音03");
	MusicStart("サウンド１",0,1000,0,1000,null,false);

	Shake("背景１", 500, 0, 50, 0, 0, 500, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text617]
手首を背後から優愛につかまれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//☆Cut-97-----------------------------
//以下、優愛の態度が豹変

//	Stand("st優愛_制服_冷酷","cool", 200, @0);
//	FadeStand("st優愛_制服_冷酷_cool", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//すごく冷徹に
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600330yu">
「逃げるの？」

その声に、ゾッとした。

背筋が凍りそうなほどの冷徹な声。
さっきまでの優愛とは同一人物とは思えない。

しかも――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600340ta">
「う……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("st優愛*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
僕の手首をつかんだ優愛の握力は、普通じゃなかった。

あまりにもきつく握りしめてきて、痛みが走る。骨まで握りつぶされるんじゃないかっていうくらいの激痛だった。

振り払おうとしたけど、離してもらえない。
それどころか、逆に引き寄せられ、僕は後ろ側につんのめった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, -80, "cg/ev/ev020_01_3_優愛足下_a.jpg");
	Fade("背景１", 300, 1000, null, false);
	Move("背景１", 500, @0, @80, Dxl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
//すごく冷徹に
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600350yu">
「逃げるの？」

背後……しかも僕のすぐ耳元で、感情を押し殺したかのようなささやきが発せられる。

ゾクリ、として、恐る恐る振り返る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＣＧ//至近距離から拓巳をにらむ優愛

	CreateTexture360("背景１", 300, center, middle, "SCREEN");

	Stand("bu優愛_制服_冷酷","cool", 200, @0);
	FadeStand("bu優愛_制服_冷酷_cool", 0, true);

	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600360yu">
「…………」

にらみつけてくるその瞳の奥に宿る色は、まともじゃなかった。

//すごく冷徹に
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600370yu">
「逃がさないよ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600380yu">
「騙してたことは謝るけど、お互い様だし」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600390yu">
「あなただって、隠してたこと、あるよね」

隠してた……こと……。

そんなの、思い当たるのはひとつしかない。
そして、どういうわけかこの女は、僕があの杭張り付け死体とその犯人を目撃したことを、知っていて。

そして、そのために僕に近づいてきたっていうこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
やっぱり、この女は巧妙だ……。
この女が僕に語った言葉は、全部ウソだったっていうことなんだ……！

僕を一目見て存在が気になったっていうことも。

ブラチューが好きって言ったことも。
星来覚醒後バージョンのフィギュアを発売日に一緒に取りに行こうって約束したことも。

僕の話に楽しそうに相づちを打ったことも。
僕ともっと仲良くなりたいって言ったことも。

学校に来ない僕を心配してたっていうことも。
僕のことを偉いって言ってくれたことも。

全部全部、口から出任せだったんだ……。

悔しくて、悲しくて、僕はきつく拳を握りしめた。

くそぅ！　くそぅ！　くそぅ！

どうして僕は、こんな女の言うことを信じようとしたんだ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600400yu">
「本当は、もっと時間をかけて調べたかったんだけど、バレちゃったから、しょうがないよね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600410yu">
「あなたに、聞いてもらいたい話があるの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600420yu">
「聞いてくれるよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600430yu">
「聞かないなんて言わないよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600440yu">
「あなたは聞くべきよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600450yu">
「聞いて」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600460yu">
「聞くでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600470yu">
「聞かないなら……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600480yu">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
聞かないなら、なんだよ……。

今までの優愛とは別人みたいだった。

穏やかでおっとりした雰囲気は消えていた。

近寄りがたい雰囲気。そして異様なほどの執念を感じる。

口調は冷静そのもの。いや、むしろ“冷徹”って言った方がいいかもしれない。
いつもの弱々しさはどこにもない。

イヤだ、聞きたくない……。
僕は耳を塞ごうとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//☆☆☆
でもできなかった。片手は優愛につかまれてしまっている。

さっきよりは握る力は弱まっているけど、なおも離そうとはしない。手を自由に動かせない。

そのままの状態で、彼女はカバンの中から鈍色に光るなにかをおもむろに取り出し、僕の方へ差し出してきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//優愛が杭を差し出す
	CreateTextureEX("杭", 300, 0, 0, "cg/ev/ev021_01_3_十字架杭優愛_a.jpg");
	Fade("杭", 300, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600490ta">
「――――っ！」

愕然となった。

心臓の鼓動が、一段階跳ね上がる。

冷静でいられない。
ショックのあまり、耳を塞いでいた手を下ろしてしまっていた。その僕の耳に、優愛の残念そうな声が届いてくる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600500yu">
「この十字架に、見覚えあるよね？」

もちろん、見覚えはある。

僕にはそれがなんなのか、すぐに理解できた。

それは十字架のように見えるけど、ホントは杭だ。
こんな独特な形をした杭は、なかなか見ない。

少なくとも僕はこれまでに、一度しか見たことがない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 300, 0, 0, 1280, 720, "BLACK");
	Fade("色１", 0, 0, null, true);

	CreateTexture360("背景１", 300, 0, 0, "cg/bg/bg025_01_3_アスファルト一面杭_a.jpg");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text525]
――あの夜、路上に散らばっていた。{	WaitKey(1000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("色１", 0, 1000, null, true);

	XBOX360_LockVideo(true);

	if(#下着パッチ==true)
	{
		CreateTexture360("背景１", 300, -400, -640, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost.png");
	}else{
		CreateTexture360("背景１", 300, -400, -640, "cg/hu/hu梨深_制服_正面血まみれ_lost.png");
	}

	XBOX360_LockVideo(false);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text625]
――あの夜、悪魔女が壁に打ち付けていた。{	WaitKey(1000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 300, 0, 0, "cg/ev/ev005_01_3_杭貼付け_a.jpg");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text725]
――あの夜、死体を壁に張り付けにしていた。{	WaitKey(1000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 300, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

	Fade("色１", 100, 1000, null, true);

	Delete("背景１");
	Delete("杭");

	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600510yu">
「やっぱり、知ってるのね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600520yu">
「知ってるんでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600530yu">
「知ってるに決まってる」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600540yu">
「知らないなんて言わせない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600550yu">
「知ってなくちゃおかしい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600560yu">
「知ってるよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600570yu">
「しっ・て・る・よ・ね？」

僕は必死で首を振った。
イヤな脂汗が額に浮き出ていた。それを拭いながら、とにかく首を左右に振ることしかできなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600580yu">
「これ、あなたの部屋にあったのよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600590ta">
「……っ！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600600yu">
「あなたの部屋」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600610yu">
「ベッドの下」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600620yu">
「床に落ちてた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600630yu">
「落ちてたの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600640yu">
「落としたよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600650yu">
「それとも捨てた？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600660yu">
「とにかく落ちてた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600670yu">
「落ちてたの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
この女……っ！

いつの間に、僕の部屋を調べたんだ！？
初めて会ったあの日か！？

僕が足をケガして、部屋まで送ってもらったときか！？
星来のフィギュアを見て、かわいいと顔を輝かせていたあのときか！？

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600680yu">
「この杭、外国製のすごく珍しい杭なのよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600690yu">
「それと……『ニュージェネ』第３の事件で使われた杭と同じ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600700yu">
「同じなの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600710yu">
「同じよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600720yu">
「同じなのは間違いない」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600730yu">
「同じよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600740yu">
「遺体を壁に張り付けにした杭と」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600750yu">
「同じ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
確信した。

この女は、僕が『ニュージェネ』の犯人だと疑ってる。
この僕を殺人鬼だと思い込んでいるんだ。

探偵気取りか？
『女子高生探偵・楠優愛』とか。

死ね。氏ねじゃなくて死ね。
アニメやゲームじゃ成立したかもしれないけど。

優愛の推理は致命的に間違ってるんだ。

僕は、犯人を知っている。

この目で見た。
あの悪魔を。

名前の知らない女だった。
でも翠明の制服を着てた。
犯人は、僕の近くにいる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600760ta">
「だ……だから？」

//ブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600770yu">
「…………」

優愛はふとうなだれ、小さく息をついた。
手首を握る力が弱まり、ようやく僕は解放される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	Stand("st優愛_制服_通常","worry", 200, @0);
	DeleteStand("bu優愛_制服_冷酷_cool", 300, true);
	FadeStand("st優愛_制服_通常_worry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
//優愛は以下、元に戻る
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600780yu">
「……それ以上でも、それ以下でもないです。ただ、あなたが知ってるかどうかを確かめたかっただけ。本当は、まだ言うつもりじゃなかったですし」

“まだ”ってどういう意味だ！？

{	Stand("st優愛_制服_通常左手下","hard", 200, @0);
	DeleteStand("st優愛_制服_通常_worry", 300, false);
	FadeStand("st優愛_制服_通常左手下_hard", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600790yu">
「それじゃ、もうひとつ確認させてください」

//【優愛】
{#TIPS_予知=true;$TIPS_on_予知 = true;}
<voice name="優愛" class="優愛" src="voice/ch01/02600800yu">
「あなたには、<FONT incolor="#88abda" outcolor="BLACK">予知能力</FONT>がありますか？」

{$TIPS_on_予知 = false;}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600810ta">
「は……？」

思わずポカンとしてしまった。

予知能力、だって？
なんだそれ？
それが、事件となんの関係があるんだ？

首をひねっていると、優愛はカバンの中に手を突っ込んで、画像がフルカラーで印刷された紙を引っ張り出してきた。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600820yu">
「予知能力があるって思わなきゃ、納得できないような画像データを、あなたが持っていたから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//☆Cut-98-----------------------------

	CreateTextureEX("グロ", 1000, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");
	Fade("グロ", 500, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
//イメージＢＧ//グロ画像イメージ
『将軍』が送りつけてきたグロ画像……！
どうして優愛が持ってるんだ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600830ta">
「こ、これ……っ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600840yu">
「あなたはどうして、『ニュージェネ』第３の事件の再現画像を持っているんですか？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600850yu">
「しかもこの画像が流出したのは、事件の前日です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600860yu">
「あなたの使ったＰＣに、キャッシュが残ってました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＢＧ//松濤公園//夕方
	FadeDelete("グロ", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600870ta">
「ち、違う……っ！」

これは、あの日初めてチャットした『将軍』とかいう男からもらったんだ！
僕が作った画像じゃない！

ダウンロードしたっていう履歴もちゃんと残ってるはずだ。そうだ、それを優愛に見せてやる！

っていうか、優愛はこの画像をどこで手に入れた……？

僕のパソコンにキャッシュが残ってたなんて、
どうやって知ったんだ……。

優愛が僕の部屋に来たとき、少なくともＰＣを調べる時間なんてまったくなかったはずなのに……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600880ta">
「まさか……君が……『将軍』か……！」

僕をハメようとしてるのか！？

全部優愛が仕組んだことで、優愛も『ニュージェネ』の犯人のひとりで、警察の捜査を攪乱するために、僕っていうスケープゴートをでっち上げるつもりか！？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600890ta">
「た、助けて……」

こんなの、あんまりだ……。

どうして僕なんだ。

僕がキモいから？
僕に友達がいないから？

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600900yu">
「…………」

優愛はなにも言わずに小さく首を振った。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600910yu">
「その画像は、『＠カフェ』ＲＯＯＭ３７のＰＣから拾ったんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600920yu">
「あなたのＰＣも、できれば調べたかったんですけど、その機会はさすがにありませんでした」

ＲＯＯＭ３７……僕がいつも使っている部屋。
この女、完全に探偵気取りか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 200, @0);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("st優愛_制服_通常左手下_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
優愛は少しだけ申し訳なさそうな顔をして僕を見た。
いつもの優愛に一瞬だけ戻ったような気がした。

その表情のまま、優愛はまたもカバンの中をあさり出した。
今度は文字が印字されたプリントを取り出して、差し出してくる。

嫌な予感がする。
見ない方がいいって、理性が警告してる。

でも、見ないワケにはいかない。
抵抗しないと、濡れ衣を着せられちゃうんだから。

{	Stand("st優愛_制服_通常","hard", 200, @0);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, false);
	FadeStand("st優愛_制服_通常_hard", 300, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600930yu">
「それが――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600940yu">
「あなたのすべてです」

僕のすべて？
まさか、個人情報を完全に盗まれた？
優愛ってハッカーなのか？

ドキドキしながら、僕はプリントを広げた。
でも意外なことに、そこに印刷されていたのは僕の個人情報なんかじゃなくて、チャットの過去ログみたいだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600950ta">
「あ……」

そのチャットの参加者は『ナイトハルト』と――

『将軍』

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//イメージＢＧ//チャットの過去ログが印刷されたプリント
	CreateTextureEX("ログ", 1000, 160, -400, "cg/bg/bg042_01_2_ログプリント_a.jpg");
	Rotate("ログ", 1000, @0, @0, @45, null, true);

	Move("ログ", 5000, @-240, @240, null, false);
	Fade("ログ", 1000, 500, null, true);

	Wait(3000);

	FadeDelete("ログ", 1000, true);

/*===============================================================================

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
<pre>将軍：http://wibo.m78.com/clip/img/158498.jpg(09/29 Mon 19:58:51)
将軍：The world changes if you click it.(09/29 Mon 19:58:35)
将軍：おどかしてゴメン(09/29 Mon 19:58:35)
将軍：考え事したり(09/29 Mon 19:57:55)
将軍：渋谷(09/29 Mon 19:57:49)
将軍：事件はまだ起こるぞ(09/29 Mon 19:57:27)
将軍：ｆｕｎ１０×ｉｎｔ４０＝Ｉｒ２(09/29 Mon 19:57:27)
将軍：この公式によって世界の可能性は殺されてしまった(09/29 Mon 19:57:27)
将軍：興味があるかと思って(09/29 Mon 19:57:27)
将軍：http://wibo.m78.com/clip/img/158492.jpg(09/29 Mon 19:58:27)
将軍：http://wibo.m78.com/clip/img/158493.jpg(09/29 Mon 19:58:28)
将軍：http://wibo.m78.com/clip/img/158494.jpg(09/29 Mon 19:58:29)
将軍：http://wibo.m78.com/clip/img/158495.jpg(09/29 Mon 19:58:30)
将軍：http://wibo.m78.com/clip/img/158496.jpg(09/29 Mon 19:58:31)
将軍：http://wibo.m78.com/clip/img/158497.jpg(09/29 Mon 19:58:32)
将軍：http://wibo.m78.com/clip/img/158498.jpg(09/29 Mon 19:58:33)
将軍：http://wibo.m78.com/clip/img/158500.jpg(09/29 Mon 19:58:34)
将軍：http://wibo.m78.com/clip/img/158501.jpg(09/29 Mon 19:58:35)
将軍：http://wibo.m78.com/clip/img/158502.jpg(09/29 Mon 19:58:36)
将軍：http://wibo.m78.com/clip/img/158503.jpg(09/29 Mon 19:58:37)
将軍：http://wibo.m78.com/clip/img/158504.jpg(09/29 Mon 19:58:38)
将軍：その目だれの目？(09/29 Wed 19:59:53)</pre>

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
<pre>ナイトハルト：あのさ、コレなんていう孔明の罠？ｗｗ(09/28 Sun 03:11:27)
ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ(09/28 Sun 03:12:27)
ナイトハルト：ぜんぜん無問題(09/28 Sun 03:13:30)
ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？(09/28 Sun 03:14:10)
ナイトハルト：将軍はドコから参加？(09/28 Sun 03:14:40)
ナイトハルト：（・∀・）人（・∀・）僕も渋谷(09/28 Sun 03:15:05)
ナイトハルト：なんか最近変な事件が多発してるらしいね(09/28 Sun 03:15:30)
ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ(09/28 Sun 03:15:37)
ナイトハルト：意味が分からないんだけど(09/28 Sun 03:17:27)
ナイトハルト：それよりさっきの画像リンクってなに？(09/28 Sun 03:17:59)
ナイトハルト：釣られてみた方がいいネタでつか？ｗｗ(09/28 Sun 03:18:27)</pre>

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

===============================================================================*/

	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168491.jpg(09/29 Mon 19:52:24)","null", null);
	SetBacklog("将軍：The world changes if you click it.(09/29 Mon 19:53:15)","null", null);
	SetBacklog("将軍：おどかしてゴメン(09/29 Mon 19:53:33)","null", null);
	SetBacklog("将軍：考え事したり(09/29 Mon 19:54:05)","null", null);
	SetBacklog("将軍：渋谷(09/29 Mon 19:54:49)","null", null);
	SetBacklog("将軍：事件はまだ起こるぞ(09/29 Mon 19:55:12)","null", null);
	SetBacklog("将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２(09/29 Mon 19:56:16)","null", null);
	SetBacklog("将軍：この公式によって世界の可能性は殺されてしまった(09/29 Mon 19:56:20)","null", null);
	SetBacklog("将軍：興味があるかと思って(09/29 Mon 19:57:22)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168492.jpg(09/29 Mon 19:58:27)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168493.jpg(09/29 Mon 19:58:28)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168494.jpg(09/29 Mon 19:58:29)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168495.jpg(09/29 Mon 19:58:30)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168496.jpg(09/29 Mon 19:58:31)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168497.jpg(09/29 Mon 19:58:32)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168498.jpg(09/29 Mon 19:58:33)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168499.jpg(09/29 Mon 19:58:34)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168500.jpg(09/29 Mon 19:58:35)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168501.jpg(09/29 Mon 19:58:36)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168502.jpg(09/29 Mon 19:58:37)","null", null);
	SetBacklog("将軍：http://www.gazouup.com/bbs/images/168503.jpg(09/29 Mon 19:58:38)","null", null);
	SetBacklog("将軍：その目だれの目？(09/29 Mon 19:59:53)","null", null);
	
	SetBacklog("ナイトハルト：あのさ、コレなんていう孔明の罠？ｗｗ(09/28 Sun 03:11:27)","null", null);
	SetBacklog("ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ(09/28 Sun 03:12:27)","null", null);
	SetBacklog("ナイトハルト：ぜんぜん無問題(09/28 Sun 03:13:30)","null", null);
	SetBacklog("ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？(09/28 Sun 03:14:10)","null", null);
	SetBacklog("ナイトハルト：将軍はドコから参加？(09/28 Sun 03:14:40)","null", null);
	SetBacklog("ナイトハルト：（・∀・）人（・∀・）僕も渋谷(09/28 Sun 03:15:05)","null", null);
	SetBacklog("ナイトハルト：なんか最近変な事件が多発してるらしいね(09/28 Sun 03:15:30)","null", null);
	SetBacklog("ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ(09/28 Sun 03:15:37)","null", null);
	SetBacklog("ナイトハルト：意味が分からないんだけど(09/28 Sun 03:17:27)","null", null);
	SetBacklog("ナイトハルト：それよりさっきの画像リンクってなに？(09/28 Sun 03:17:59)","null", null);
	SetBacklog("ナイトハルト：釣られてみた方がいいネタでつか？ｗｗ(09/28 Sun 03:18:27)","null", null);

//バックログ対応用
//	SetBacklog("将軍:http://wibo.m78.com/clip/img/158498.jpg(09/29 Mon 19:58:51)","null", null);
//	SetBacklog("","null", null);

//ＢＧ//松濤公園//夕方



//	CreateWindow("ウィンドウ１", 500, Center, InBottom, 1280, 218, false);
	CreateWindow("ウィンドウ１", 500, Center, InBottom, 1280, 274, false);
	CreateTextureEX("ウィンドウ１/ログ１", 500, @0, -339, "cg/bg/bg042_01_2_ログプリント_a.jpg");
	CreateTextureEX("ログ２", 300, 0, -703, "cg/bg/bg042_01_2_ログプリント_a.jpg");
//	CreateTextureEX("ログ２", 300, 0, -651, "cg/bg/bg042_01_2_ログプリント_a.jpg");
//	CreateTextureEX("ログ２", 300, 0, -578, "cg/bg/bg042_01_2_ログプリント_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600960yu">
「そのログ、変ですよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02600970ta">
「え……」

{	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, false);
	Fade("Black", 500, 1000, null, true);
//	CreateColor("ログ線", 400, 0, 0, 1280, 276, "Black");
	CreateColor("ログ線", 400, 0, 0, 1280, 276, "Black");
	Fade("ウィンドウ１/ログ１", 1, 1000, null, false);
	Fade("ログ２", 1, 1000, null, true);
	Fade("Black", 500, 0, null, true);
	Move("ウィンドウ１/ログ１", 10000, @0, @-144, Dxl1, false);
	Move("ログ２", 10000, @0, @-144, AxlDxl, false);
	Delete("Black");}
変って、なにが？
普通のログだ。確かに僕は『将軍』とこういう会話を交わした覚えがある。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600980yu">
「『ナイトハルト』と『将軍』の――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02600990yu">
「発言時間が、全然噛み合ってないんです」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02601000ta">
「あ……！」

{	WaitAction("ウィンドウ１/ログ１", null);
	WaitAction("ログ２", null);}
え？　なんだこれ？
なんで、こんなことに……？

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601010yu">
「そこにある『ナイトハルト』は西條くん。発言時間は９月２８日の午前３時台」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601020yu">
「そして翌日、あなたは『＠カフェ』に行ってます」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601030yu">
「西條くんが『＠カフェ』に行くのは、学校帰りと決まってる」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601040yu">
「そして学校に行くのは、週に２．５回。あなたのクラスメイトから聞いたんですけど、先週あなたが学校に来た日は――」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601050yu">
「月曜日、水曜日、木曜日」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601060yu">
「先週の月曜日は……９月２９日。『将軍』の発言時間と同じ日です」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/02601070ta">
「…………な……」

なんだ？　なにを……言ってるんだ……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("ログ３", 1000, center, middle, "SCREEN");
	Delete("ログ２");
	Delete("ウィンドウ１/ログ１");
	Delete("ログ線");

	Fade("ログ３", 500, 0, null, true);
	Delete("ログ３");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601080yu">
「ＲＯＯＭ３７のＰＣのチャットログを調べさせてもらいました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601090yu">
「そこから分かったことは……」

優愛は少しだけ、言葉を切り――

やがて視線をまっすぐに僕へと見据え、残酷な事実を口にした。


//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601100yu">
「あなたひとりの自作自演……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "――僕を、見るな。");

	SetBacklog("――僕を、見るな。", "NULL", NULL);

	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);


	Wait(500);

	FadeDelete("テキスト１", 500, false);
	FadeDelete("色１", 500, true);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text037]
//以下、画面黒で文章のみ画面中央にカットイン
――僕を、見るな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//以上、画面黒で文章のみ画面中央にカットイン
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601110yu">
「『将軍』は――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "――僕を、見るな！");

	SetBacklog("――僕を、見るな！", "NULL", NULL);

	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 500, false);
	FadeDelete("色１", 500, true);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
//以下、画面黒で文章のみ画面中央にカットイン
――僕を、見るな！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
//以上、画面黒で文章のみ画面中央にカットイン
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/02601120yu">
「あなた自身」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_hard", 0, false);
	SetVolume360("CH12", 0, 0, NULL);


	DelusionOut();
//画面エフェクト//妄想ＯＵＴ用エフェクト
//ＳＥ//妄想ＯＵＴ
//ここでも妄想終了のエフェクトがあるので、プレイヤーは今の出来事も妄想なのではないか？と怪しんでいます

	ClearAll(1000);

	DelusionOut2();
}
