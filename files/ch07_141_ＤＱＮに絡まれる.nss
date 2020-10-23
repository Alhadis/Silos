//<continuation number="450">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_141_ＤＱＮに絡まれる";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch07_141_ＤＱＮに絡まれる();
}


function ch07_141_ＤＱＮに絡まれる()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("梢ルート有り","梢ルート無し");
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
			$梢ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梢ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

//ＳＥ//渋谷雑踏
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	
//ＢＧ//１０７前//夕方
	CreateTextureEX("背景１", 500, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
学校を出て、フラフラとあてもなく歩いた。

なにもかもがどうでもよくなってた。

『将軍』や優愛に襲われるかもしれないっていう心配も、どこかへ吹き飛んでいた。

むしろその２人に、僕を痛くない方法で殺してくれないかな、とさえ願った。

精神状態は完全に鬱モードだ。

そんな状態で見る渋谷の中心は、その鬱をさらに加速させるくらい殺伐としている。道を歩いている誰にも笑みはなく、険しく周囲をにらみつけている。

すれ違う人たちといつケンカが始まってもおかしくない、そんな雰囲気。

こうして歩いただけでも、いつもなら客で賑わっている店のいくつかはシャッターが閉められているのを確認できた。

それに心なしか、道を走る車の数も普段より減っている気がする。

いつもやかましいくらいに音を垂れ流している街頭ビジョンも、今は沈黙していた。

代わりに、遠くからパトカーのサイレンや、車のクラクション、スキール音などがひっきりなしに聞こえてくる。

一週間前、僕が駅前であれだけの騒動を起こした痕跡は、どこにもなかった。

人の記憶からはまだ消え去っていなくても、街の記憶はとっくに僕のことを忘却の彼方へ追いやったのかもしれない。

僕も、僕自身の記憶をきれいさっぱり忘れ去ることができればいいのに。

なにも知らないでいること。無知でいること。アホのままでいること。

そういう人間って、きっと人生がバラ色で、毎日楽しいんだろうな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒", 500, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 1000, 1000, null, true);

	CreateColor("黒２", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒２", 0, 300, null, true);

	Stand("stセナ_制服_通常","hard", 600, @);
	FadeStand("stセナ_制服_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14100010sn">
「無知は罪だ。“知らない方が幸せなこともある”という人間もいるが、そんなのはただの甘えだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_hard", 500, true);
	Fade("黒２", 0, 0, null, true);
	Fade("黒", 1000, 0, null, true);
	Delete("黒２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
セナはそう言ってた気がするけど。
いいじゃないか、甘えたって。

人は、僕は、そんなに強くない。
いつも、誰かに救いを求めてる。

自分ひとりじゃなにもできない。したくない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	Delete("黒");
	CreateColor("背景２", 400, 0, 0, 1280, 720, "Black");
	DrawTransition("背景１", 1000, 1000, 0, 100, null, "cg/data/lcenter.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕は道の真ん中に立ち尽くし、目を閉じた。

今の、中途半端に知ってしまっている状態が、一番厄介だ。

『将軍』とかディソードとか。知りたくもないことだったけど、知ってしまった。かと言って、じゃあそれってなんなの？　って聞かれたら答えられない。

僕は答えを知らない。

――死んでみようかな。
Ｏ－ＦＲＯＮＴの屋上を見上げて、そう思ってみる。

死ねば、記憶はリセットされて、再プレイ可能なのかな。

ねえ、どうなの、中の人？

今回のロールプレイは完全に失敗だよ。キャラの成長のさせ方を間違えてる。

もっと勇者っぽいかっこいいキャラにしなくちゃいけなかった。社交的で女性に優しく、強きをくじき弱きを助ける、そんな熱い正義漢じゃなきゃダメだった。

僕じゃ、ラスボスを倒せない。クリアもできない。

僕に期待しないで。
リセットして。

頼むから、
こんな、価値のない僕を、
消してよ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//※エンターキーおして、ウインドウになにもテキストが表示されてない状態にしてから、１０秒ほどウエイト
	Wait(4000);
//ＳＥ//肩にぶつかる音
	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
消えなかった。

代わりに、肩に誰かがぶつかる衝撃が来た。

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100020hu">
「おい、邪魔なんだよ」

幻聴かと思った。

朝は女子バージョンの声が聞こえたから、今度は男子バージョンってわけか。誰もそんなの求めてない。もっと萌え声の、ハァハァできる幻聴がいい。

でもって、エロいセリフを耳元で喋ってくれたら、街中だけど勃起するね、ふひひ。

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100030hu">
「無視してんじゃねえぞ」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100040yz">
「なあ、テメェ、西條だな？」

//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100050tg">
「どうなんだ、やらせ超能力少年」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100060yz">
「この前テレビ出てたよな。ギャラいっぱいもらったんだろ？」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100070hu">
「ちょっと顔貸せよ、エスパーくん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//１０７前//夕方
	CreateTexture360("背景１", 300, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	DrawTransition("背景２", 1000, 1000, 0, 100, null, "cg/data/center.png", true);

	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
目を開いてみる。

僕を取り囲むようにして、３人の男が立っていた。

３人ともダブダブの服を着て、髪は金と銀と赤。耳とか鼻にピアスをしてるのが２人。耳だけピアスが１人。
１人は、今どき天然記念物なみの稀少さであるガングロ男。

ああ……死亡フラグだ、って思った。
これも“不幸トラップ”？
ホント、次から次へと……。

もうどうでもいいってば――
早く殺せよ。そしたらリセットされて僕は生まれ変われるから。

ナイフの一本でも用意してる？
ちゃんと即死するように刺してよね。

怖くて、膝が震えた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100080ta">
「助けて！」

本能的に叫んでいた。
ほとんど悲鳴に近かった。
でもなりふり構っていられなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100090ta">
「誰か助けて！」

死にたくない死にたくない死にたくない！

どうでもいいなんてウソだ！

こんな絶望的状況だけど、死ぬのはいやなんだ！

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100100hu">
「うっせーんだよ」

口を塞がれた。
声を出せなくなった。
左右から腕をつかまれた。

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100110hu">
「騒ぐと殺すぞ」

それで僕は、抵抗をやめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE01");

//あやべ：渋谷雑踏の遠くがなければ音量下げることで対応
	CreateSE("SE03","SE_日常_雑踏_遠い");
	MusicStart("SE03", 0, 1000, 0, 500, null, true);

//ＢＧ//路地裏//夕方
	CreateTexture360("背景３", 200, 0, 0, "cg/bg/bg090_01_2_路地裏_a.jpg");
	DrawTransition("背景１", 500, 1000, 0, 100, null, "cg/data/left2.png", true);

	
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
人の気がない路地裏に連れ込まれた。
ニヤニヤしている３人に対して、僕は先制攻撃をしかけた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100120ta">
「ゆ、許して……」

震える声で謝りながら、土下座した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100130ta">
「お、お金なら全部渡すから……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100140ta">
「それで、み、みの、がしてくだ、ください……」

財布を自分から差し出していた。
ＤＱＮがそれを引ったくっていく。

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100150hu">
「へえ、お前金持ちだな。さすが超能力少年だぜ」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100160yz">
「ぎゃはは！」

//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100170tg">
「ぎゃはは！」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100180hu">
「お前、いいヤツじゃん。オレ気に入っちゃったよ」

そう言われて、土下座したまま安堵の吐息をついた。
どうやら見逃してもらえるみたいだ――

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100190hu">
「オレらの仲間に入れてやるよ。入会金は１００万円な。これ強制。本当はすぐ払ってもらうとこだけどよ、今日の夜までにしてやるよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100200ta">
「…………」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100210hu">
「まあ、なんか超能力使って見せてくれたら、半額にしてやってもいいけどな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100220ta">
「…………」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100230yz">
「なんか言えよ、あ？」

//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100240tg">
「超能力見せろっつってんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100250ta">
「…………」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100260hu">
「できねえの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14100270ta">
「…………」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100280yz">
「できねえのかっつってんだよ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Shake("背景３", 200, 20, 20, 0, 0, 500, null, false);
//ＳＥ//蹴られる
	CreateSE("SE04","SE_衝撃_顔面蹴られる");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
脇腹に痛みが走った。

あばら骨が折れたかと思った。

呼吸ができなくなる。
意識が遠のきそうになる。目眩がする。

と、目の前にＤＱＮの足が視界に入ってきて。
その爪先が、僕の顔目がけてものすごい勢いで迫ってきた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundStop("SE03");
	
//ＳＥ//顔面を蹴られる
	CreateSE("SE05","SE_衝撃_顔面蹴られる");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	
//画面エフェクト//フラッシュ
	CreateColor("フラッシュ", 500, 0, 0, 1280, 720, "white");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 1000, null, true);
	Wait(200);
	Fade("フラッシュ", 300, 0, null, true);
	Delete("フラッシュ");

//ＢＧ//黒
	CreateColor("背景４", 500, 0, 0, 1280, 720, "Black");
	Fade("背景４", 0, 0, null, true);
	Fade("背景４", 1500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
……………………。

なにが起きたんだろう。

悶絶するほどの痛みを顔面に感じた気もするけど、妄想だったかもしれない。

目を開けようと思ったけど、まぶたが動かない。闇が消えてくれない。

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100290yz">
「んだよ、もうノビたのか？」

//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100300tg">
「どうする？　このくらいにしとく？」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100310hu">
「もうちょっと痛めつけといた方がいいんじゃね？」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100320hu">
「あのダーススパイダーのにいちゃんもそう言ってたじゃん」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100330yz">
「ああ、ボコボコにしてくれって言ってた」

//【怖いお兄さんＣ】
<voice name="怖いお兄さんＣ" class="怖いお兄さんＣ" src="voice/ch07/14100340qg">
「こいつボコるだけで金くれるなんて、よっぽどこいつのこと嫌いなのかもな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//※ダーススパイダーのにいちゃん＝諏訪のこと。チンピラ３人組に、拓巳にからむよう依頼した。後の伏線。

//以下、３人の笑い声は同時で

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100350hu">
「ギャハハハ！」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100360yz">
「ギャハハハ！」

//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100370tg">
「ギャハハハ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――
//以上、３人の笑い声は同時で

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100380hu">
「というわけなんでぇ、続けまーす」

//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100390yz">
「オレらのこと恨まないでねぇ。ひひひ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ", 500, 0, 0, 1280, 720, "white");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 1000, null, true);
	Wait(200);
	Fade("フラッシュ", 300, 0, null, true);
	Delete("フラッシュ");

//ＳＥ//蹴られる
//何度も蹴られる
	CreateSE("SE06","SE_衝撃_蹴られる");
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
ごめんなさい……ごめんなさい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//――殺してやりたい。
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "――殺してやりたい。");
	Move("テキスト１", 0, @10, @0, null, true);
	SetBacklog("――殺してやりたい。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Enter);
	Request("テキスト１", NoIcon);
	WaitAction("テキスト１", null);

	WaitKey(1000);
	Fade("テキスト１", 1000, 0, null, true);
	Delete("テキスト１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
ごめんなさい……ごめ、んなさい……っ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//――殺してやりたい。
	SetFont("ＭＳ ゴシック", 26, #ffffff, #000000, 500, LIGHTDOWN);
	CreateText("テキスト２", 1000, center, middle, Auto, Auto, "――殺してやりたい。");
	Move("テキスト２", 0, @10, @0, null, true);
	SetBacklog("――殺してやりたい。", "NULL", NULL);
	Request("テキスト２", NoLog);
	Request("テキスト２", Enter);
	Request("テキスト２", NoIcon);
	WaitAction("テキスト２", null);
	
	WaitKey(1000);
	Fade("テキスト２", 1000, 0, null, true);
	Delete("テキスト２");

//※以下、拓巳は薄れゆく意識の中で聞いている。なにかボイスエフェクト付けたいです
//※拓巳がキレて無意識のうちに妄想能力で棒のようなものをリアルブート。それでＤＱＮ３人組を一方的にボコボコにする。拓巳は自覚なし。

	CreateSE("SE01","SE_擬音_ディそーど出現");
	MusicStart("SE01", 0, 300, 0, 1000, null, false);

	WaitAction("SE01", 2000);

	CreateSE("SE02","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//◆棒のようなものでぶん殴られる。強烈な一撃を食らった
//【鷹木】
<voice name="鷹木" class="鷹木" src="voice/ch07/14100400tg">
「ぐえっ！」

//ＳＥ//振り回した棒のようなものが空を切る
{	CreateSE("SE05","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Wait(500);
	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);}
//◆棒のようなものでぶん殴られる。強烈な一撃を食らった
//【安沢】
<voice name="安沢" class="安沢" src="voice/ch07/14100410yz">
「ぎゃあっ！」

//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100420hu">
「お、おい、なにとち狂ってんだよ……ふざけんなよ……」

//◆怯え
//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100430hu">
「ひ……な、なんだそれ……おい、よせ……やめろ……」

//◆泣きそう
//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100440hu">
「や、やめて……やだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//振り回した棒のようなものが空を切る
	CreateSE("SE05","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Wait(500);
	CreateSE("SE02","SE_衝撃_打撃_殴る");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);
	CreateSE("SE01","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Wait(500);
	CreateSE("SE03","SE_衝撃_蹴られる");
	MusicStart("SE03", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//◆棒のようなもので２～３発殴られる
//【藤田】
<voice name="藤田" class="藤田" src="voice/ch07/14100450hu">
「ごばっ！　ぐがっ！　あ、ごぽっ……う、う……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//５秒ほどウエイト
	Wait(4000);
	
//～～Ｆ・Ｏ

}