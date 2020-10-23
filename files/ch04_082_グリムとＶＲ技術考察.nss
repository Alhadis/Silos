//<continuation number="110">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_082_グリムとＶＲ技術考察";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch04_082_グリムとＶＲ技術考察();
}


function ch04_082_グリムとＶＲ技術考察()
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


	CreateColor("back05", 100, 0, 0, 1280, 720, "Black");

//ＢＧ//ＰＣ画面（チャット画面）
//ウェブＣＨＡＴ開始

	CreateColor("色１", 2000, 0, 0, 1280, 720, "BLACK");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);
	FadeDelete("色１", 1000, true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text001]
ナイトハルト：とまあ、そんな感じで中２病女にリアルに絡まれたわけよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text002]
グリム：てめーは漏れを　怒　ら　せ　た
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text003]
ナイトハルト：( ﾟдﾟ)
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text004]
グリム：ナイトハルト殿ってさあ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text005]
グリム：三次元女に興味ねーとか言ってるけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text006]
グリム：最近いろんな三次元女と仲良さそうじゃね？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text007]
グリム：この前も家に押しかけられたとか言ってたろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text008]
グリム：それどう考えてもエロゲ状態じゃねーか！ヽ(`Д´#)ﾉ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text009]
グリム：マジでモテ期突入してたとはな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
ナイトハルト：いいかよく聞け
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
ナイトハルト：確かにかわいい女子と話す機会が増えたのは認める
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
ナイトハルト：だがな…
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
ナイトハルト：リアルメンヘラ{#TIPS_メンヘラ = true;$TIPS_on_メンヘラ = true;}ばっかだっちゅーねん！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
ナイトハルト：そんな連中に毒デンパ垂れ流されてみろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
ナイトハルト：マジでホラーだから(((( ；ﾟДﾟ)))ｶﾞｸｶﾞｸﾌﾞﾙﾌﾞﾙ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：……正直すまんかった（´・ω・`）
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
ナイトハルト：気にすんな（´・ω・`）
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("500");

//ウェブＣＨＡＴ終了

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
家に帰ってからも、セナの語ったことがなんとなく気になっていた。

もちろんあの話がホントだとは思えないけど、特許とか大統領命令っていう部分については、ちょっと調べればホントか嘘かを確かめることができるはず。

というわけでグリムに協力を仰いで、さっそくネットで検索をかけてみた。

グリムの知り合いというアメリカ在住の人にも手伝ってもらって、
調べてもらってるんだ。

まあ、見つかるはずはないだろうけどね。

今の時代、ソースがなくちゃ誰にも信用してもらえないよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
グリム：お、ＳＨＩＨＯから連絡キタお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1000");

//ウェブＣＨＡＴ終了

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
ＳＨＩＨＯ、というのはさっき言ったグリムのネット上の知り合い。アメリカに住んでいて英語もペラペラらしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text021]
ナイトハルト：やっぱガセだったろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text022]
ナイトハルト：あのメンヘラ女め
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text023]
ナイトハルト：どうせ僕のこと、英語が分からないヤツだってバカにしてたに違いない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text024]
ナイトハルト：ネットなめんな！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text025]
ナイトハルト：これで論破終了だな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text026]
グリム：あったらしいぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//ウェブＣＨＡＴ終了

	Wait(1000);


	CreateSE("SE05","SE_じん体_心臓_鼓動");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200010ta">
「…………え？」

“あったらしいぞ”……？
って、なにが？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text028]
//※わざと「くれてるお」です。
グリム：わざわざ和訳してくれてるお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//▼TIPS：解除：；メンヘラ
	$TIPS_on_メンヘラ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text029]
//※わざと「うｐ」です。
//※添付ファイルが送られてくる。ｔｘｔとｊｐｇ。その後に「ソースはこれ」と海外サイトのＵＲＬも。
グリム：とりあえずうｐるわ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text030]
ナイトハルト：また釣りか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
グリム：漏れって信用ねーなぁｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
グリム：まあ普段の行いが悪いせいだけどさｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text033]
グリム：じゃあＳＨＩＨＯをここに招待するか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1000");

//ウェブＣＨＡＴ終了

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200020ta">
「も、もしかして……マジなのか……？」

これまでグリムには散々騙されてきた。

いつもこんな調子で信用すると、精神的ブラクラを踏まされるんだ。

でも、ＳＨＩＨＯを招待するとまで言ってるし、ソースまで出してきたし……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text035]
ナイトハルト：もしまた釣りだったらギルドから除名してやる
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text036]
グリム：おｋ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text037]
グリム：今回だけは信じろって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//ウェブＣＨＡＴ終了

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
ずいぶんな自信だなあ。
今回こそ信じてもいいのかも……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200030ta">
「くそぅ、僕はなんてお人好しなんだ！」

少しドキドキしながら、いきなりはっきり見ないようにするため薄目にしつつ、リンクをクリックした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("チャット画面", 100, center, middle, "SCREEN");

	CreateSE("SE03","SE_日常_PC_マウスくりっく");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//イメージＢＧ//特許登録イメージ１
//※プロットにあったものとは別。新規に架空のものを作成

	CreateBG(1000, 0, 0, 0, "cg/bg/bg139_01_3_特許_a.jpg");

	Delete("box01");

	Wait(500);
	BGMPlay360("CH24", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200040ta">
「な、なんだこれ……？」

それは英語で書かれた文書で、下の方には奇妙な図が描かれていた。図の中には人の顔みたいな絵も見える。

見出しは『Ｕｎｉｔｅｄ　Ｓｔａｔｅｓ　Ｐａｔｅｎｔ』。
Ｐａｔｅｎｔって確か特許っていう意味だったはず……。

つまりこれは……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200050ta">
「アメリカの特許……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH24", 500, 500, NULL);
	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTextureEX("back03", 1100, 0, 0, "cg/bg/bg081_01_1_電車カットボディ窓_a.jpg");
	Stand("buセナ_制服_横向","think", 1200, @+200);
	FadeStand("buセナ_制服_横向_think", 0, true);
	CreateColor("back04", 1500, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 300, null, false);
	Fade("back03", 0, 1000, null, true);
	FadeDelete("色１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601039]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200060sn">
「ＶＲ技術を知っているか？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200070sn">
「すでに実際にテストは成功している。ある研究チームが特許を取得済みだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	DeleteStand("buセナ_制服_横向_think", 0, true);
	Delete("back03");
	Delete("back04");
	FadeDelete("色１", 500, true);
	SetVolume360("CH24", 500, 1000, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text540]
ホントに、あった……。

さらに一緒に添付されていたふたつのテキストファイルのうちのひとつを開いてみる。そこには、この特許について触れたらしいニュースが、和訳されてずらっと書かれていた。

アメリカのヴィクトル・コンドリア大学、精神生理学研究室で現在も研究が行われているＶＲ技術（Visual Rebuilding）と呼ばれる画期的な発明がある。

これは介護を目的としたもので、世界中の盲目の人々から注目されている研究だ。

生まれながらに盲目の人でもビデオカメラなどの映像機器を介すことで、そこに映る景色が見えるようになるという画期的なものである。

その手法を簡単に説明すると、ビデオカメラに写った風景の映像信号を、脳が唯一認識することのできる神経パルスと呼ばれる電気信号へと変換し、これを脳と繋がっている視神経に接続するのだそうだ。

既にテストは成功しており、特許についても登録取得された。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//「ヴィクトル・コンドリア大学」は架空の大学……？
//※以上、ワープロソフト上で表示される文章

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200080ta">
「特許……ホントに認められてる……」

セナが言っていたことは中２病の妄想じゃなかったっていうこと？

僕はゴクリと息を呑みつつ、もうひとつのテキストファイルを開いてみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_日常_PC_マウスくりっく");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	CreateBG(1000, 0, 0, 0, "cg/bg/bg139_01_3_特許_a.jpg");
	Wait(500);
//以下、ＢＧ文章のため一時的にコメントアウト致します。
//※以下、ワープロソフト上で表示される文章

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text541]
アメリカ政府　ホワイトハウス発表
１９９７年３月２７日交付
『機密の人体研究に対する保護の強化』

{#TIPS_インフォームド・コンセント = true;$TIPS_on_インフォームド・コンセント = true;}
いかなる機関も<FONT incolor="#88abda" outcolor="BLACK">インフォームド・コンセント</FONT>なしに人体の機密の研究をしてはならない、もしくはそれを支援してはならない。

{$TIPS_on_インフォームド・コンセント = false;}
本件は１９９８年３月２７日、もしくは立法過程がそれ以前に完了する場合は１９９８年３月２７日以前に実施される。

合衆国大統領　ウィリアム・Ｊ・クリントン

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//※一次ソースを見つけたい……
//※以上、ワープロソフト上で表示される文章

//ＢＧ//ＰＣ画面
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text041]
アメリカ大統領の行政命令……

まるで映画の設定にありそうな内容だけど、まさかこれまで現実だったなんて。

試しにＵＲＬのリンク先にも行ってみた。英文を読むぐらい僕にだってできる。こう見えても毎日学校に通ってるＤＱＮ連中よりよっぽど頭はいいんだ。

で、実際に書かれていた内容は、やっぱり和訳されたテキストと同じだった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08200090ta">
「ということは……」

セナの言葉が脳裏にこだまする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH24", 500, 500, NULL);
	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Fade("色１", 0, 0, null, false);
	Request("色１", AddRender);
	Fade("色１", 100, 1000, null, true);
	CreateTextureEX("back03", 1100, 0, 0, "cg/bg/bg081_01_1_電車カットボディ窓_a.jpg");
	Stand("buセナ_制服_通常","hard", 1200, @+200);
	FadeStand("buセナ_制服_通常_hard", 0, true);
	CreateColor("back04", 1500, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 300, null, false);
	Fade("back03", 0, 1000, null, true);
	FadeDelete("色１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text042]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200100sn">
「ある意図的な情報を、
神経パルスへコンバートすることが可能なら――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/08200110sn">
「人の五感すべて、さらには人の意志そのものもコントロールできるんじゃないか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 5000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 100, 1000, null, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	Delete("back03");
	Delete("back04");
	FadeDelete("色１", 500, true);
	SetVolume360("CH24", 500, 1000, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601042]
なんだか難しい話になってきたけど、セナが語ったこと、そしてそれを裏付けるネット上のソースを目の当たりにして、背筋がゾワゾワとしてきた。

そこに恐ろしいなにかが潜んでいるような気がしたんだ。

なによりも気になるのは――

セナがわざわざ僕にこの話をしたその意図。

僕にも関係がある話なの？

“人の意志をコントロールできる”という部分は、はっきり言って他人事じゃなかった。

なぜなら僕には夢遊病の可能性があるからだ。

ニュージェネ第３の事件『張り付け』が起きた日、
自分の記憶にないのに＠カフェで『将軍』としてチャットに書き込みをしていたらしいし……

それに僕は、梨深のことをまったく覚えていなかった。
一年以上、同じクラスメイトとして過ごして、何度か一緒に遊びに行ったらしい仲だけど、記憶にない。

もしかしたら、僕が何者かに操られている間にそうした行動を取ったかもしれないんだ。

そもそも三次元女子と話すのが苦手な僕が、梨深みたいなかわいい子と仲良くなれるはずがない……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH24", 1000, 0, NULL);
	FadeDelete("back*", 1000, true);

	CreateSE("SE03","SE_日常_PC_マウスくりっく");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//イメージＢＧ//特許登録イメージ１
//※プロットにあったものとは別。新規に架空のものを作成

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text043]
……いや、考えすぎだ。

少なくともチャットの件については優愛の妄想なんだ。

『将軍』は別にいて、僕をはめようとしているに過ぎないんだ。
その『将軍』の正体があの１０７前に現れた車椅子の老人かどうかはともかくとして。

もしかすると、セナも『将軍』の手下かもしれない。

僕を惑わそうとしているのかもしれない。

鵜呑みにするな。
あんな得体の知れない女の言うことを信じるな。
セナも優愛と同じ人種だ。

それでいいんだよね、星来たん……。

//■３６０
//覚醒後の星来が、切なそうな表情で僕を見ていた。

//きっと僕のことが心配で心配でたまらないんだね、ふひひ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(2000);
//～～Ｆ・Ｏ


}