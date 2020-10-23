//<continuation number="200">

chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_045n_★七海編_インターミッション０６Ａ";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	ch02_045n_★七海編_インターミッション０６Ａ();
}


function ch02_045n_★七海編_インターミッション０６Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編
//２周目七海編追加インターミッション０６Ａ

//七海編突入フラグが立っている場合、“ch02_045_ショップからの帰路”終了後にアイキャッチを入れて、以下を挿入

//※※３６０以下
//アイキャッチ
//■インターミッション０６Ａ

//■アイキャッチIN
	IntermissionIn();

	DeleteAll();

//ＢＧ//スクランブル交差点・夜
	CreateTexture360("背景０", 100, 0, 0, "cg/bg/bg085_03_3_スクランブル交差点_a.jpg");

	IntermissionIn2();

	Stand("st七海_制服_通常","smile", 200, @+100);
	FadeStand("st七海_制服_通常_smile", 500, true);

	CreateSE("SE10","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE10", 500, 1000, 0, 1000, null, true);

	CreateSE("SE01","SE_日常_けい帯操作");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
西條七海は、鼻歌交じりでケータイをいじっていた。
今の彼女は、気分が良かった。

あの出不精の兄を無理矢理連れ出して、ついにケータイを買わせることに成功したのだ。ゲロカエルんストラップも付けさせたことだし、困難なミッションをやり遂げたようで、七海は満足だった。

――久しぶりに、おにぃと出かけられたし。

それは七海にとっては、とても新鮮なことだった。
過去に何度あったか分からない。記憶をたどってみたが、曖昧だ。さっぱり思い出せない。

兄妹だと言うのに、２人ではまったく出かけたことなどなかったのだ。

――ま、たまにはおにぃとデートもいいかな。後は陰気な性格を直して、もうちょっと優しい態度になってくれれば問題ないのになぁ。

そんなことを思いつつ、スクランブル交差点の信号待ちの合間に、兄のケータイへさっそくメールを送りつけてやろうと、手早く文字を入力していく。

//べー：ＳＥ：要素材組み込み次第解放
//ＳＥ//スクランブル交差点の信号の“鳩”の音
//	CreateSE("SE02","SE_はいけい_すくらんぶる交差点ガヤ_鳩_LOOP");
//	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
と、信号が青に変わった。
たくさんの通行人が、一斉に歩き出す。

七海もケータイの画面に目をやったまま、流れに身を任せて足を進めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_通常_smile", 500, true);

//ＢＧ//渋谷駅前・夜
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg079_01_3_渋谷駅前_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg079_01_3_渋谷駅前_a.jpg");

	Stand("st七海_制服_通常","normal", 200, @+100);
	FadeStand("st七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
さすがに人が多くて、渋谷の駅前でメールを打ちながらではまともに歩けない。

下を向いていた七海は、すれ違ったサラリーマンのおじさんに肩をぶつけられ、倒れそうになった。

{	CreateSE("SE02","SE_衝撃_肩にぶつかる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Delete("SE01");

	Stand("st七海_制服_通常","shock", 200, @+100);
	FadeStand("st七海_制服_通常_shock", 300, false);
	DeleteStand("st七海_制服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100010na">
「きゃっ、すいませんっ」

にらみつけてきたおじさんにペコリと頭を下げ、ケータイをバッグにしまった。続きは帰りの電車内で打つことにして、ちゃんと前を向いて歩くことにする。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100020na">
「……あれ？」

そこでふと、改札から出てくる人波の中に、見知った顔を発見した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 1000, 0, 1000, 200, null, "cg/data/left3.png", true);

	DeleteStand("st七海_制服_通常_shock", 0, false);
	Stand("st梨深_私服_通常","normal", 300, @-280);
	FadeStand("st梨深_私服_通常_normal", 0, true);

	DrawTransition("Black", 1000, 1000, 0, 200, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆梨深との距離は５メートルくらい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100030na">
「おーい、梨深さーん！」

//キャラ表示//梨深・私服
{	Stand("st梨深_私服_通常","shock", 300, @-280);
	FadeStand("st梨深_私服_通常_shock", 300, false);
	DeleteStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100040ri">
「……！？」

呼びかけると、咲畑梨深はギョッとして七海を見た。
それから、なぜかバツが悪そうな様子で視線をそらす。

七海はそれに構わず、梨深に歩み寄った。

{	Stand("st七海_制服_通常","normal", 200, @+280);
	FadeStand("st七海_制服_通常_normal", 500, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100050na">
「梨深さん、久しぶりだね～」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100060ri">
「う、うん。久しぶり……」

妙によそよそしい態度だった。

これから誰かとデートなんだろうか、と七海は推理してみる。少なくとも兄でないことは確かだ。さっき、七海と別れたときの兄は、早足で帰って行ってしまったから。

{	Stand("st七海_制服_通常","smile", 200, @+280);
	FadeStand("st七海_制服_通常_smile", 300, false);
	DeleteStand("st七海_制服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100070na">
「あれから、おにぃとはどうです？」

兄は出不精で人嫌いなので、もしかして梨深ともあまり連絡は取っていないかもしれない。

そこまで考えて、七海は小首をかしげた。
自分の記憶についての、奇妙な違和感。

{	Stand("st七海_制服_通常","shock", 200, @+280);
	FadeStand("st七海_制服_通常_shock", 300, false);
	DeleteStand("st七海_制服_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100080na">
「ん？　あれから、って、いつからだっけ？」

梨深はなにも答えない。
気まずそうに、街頭ビジョンに映る大村カレラの新曲ＰＶを眺めている。

七海は自分の記憶を探ってみた。
梨深のこと。梨深と兄の関係。

知っているはずだった。
知らないはずがない。

だって、さっき梨深の顔を見ただけで、名前がすぐに浮かんできて、呼び止めていたんだから。

それなのに、梨深のことが、よく思い出せない。

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100090na">
「そもそもナナって、梨深さんといつ知り合ったんだっけ？　なんで、名前知ってるんだろ？」

必死で記憶を探ってみるが、まるでその記憶がすっぽりと抜け落ちているかのようだった。“のどまで出かかっている”という感覚すらない。
まったくの空白。

そのことが気持ち悪くて、しかもなぜか、胸の奥がキュッと締め付けられるような気がして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_私服_通常","smile", 300, @-280);
	FadeStand("st梨深_私服_通常_smile", 300, false);
	DeleteStand("st梨深_私服_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆笑顔
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100100ri">
「やだなー。ナナちゃん。忘れるなんて」

と、それまで気まずそうだった梨深が、一転して人懐っこそうな笑みを浮かべ、七海を見た。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100110ri">
「あたしとナナちゃんが知り合ったのは、タクを通してでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100120ri">
「ほら、学校で。タクと一緒にいたあたしを見て、ナナちゃんが目を丸くしてさ。“うわー、おにぃにカノジョができたー！　明日地球が滅びちゃうー！”って」

{	Stand("st七海_制服_拗ね","angry", 200, @+280);
	DeleteStand("st七海_制服_通常_shock", 300, false);
	FadeStand("st七海_制服_拗ね_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100130na">
「え……、あはは、言ったっけ、そんなこと……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100140ri">
「うん。言った。あんまりびっくりしてたから、あたし、すごくよく覚えてる」

言われてみれば、そんなことがあったような気がする。
一方で“そうじゃない、そんなことはなかった”という感覚もある。

七海は完全には納得できていなかったが、すぐに、どうでもいいや、と思うことにした。

{	Stand("st七海_制服_通常","normal", 200, @+280);
	DeleteStand("st七海_制服_拗ね_angry", 300, false);
	FadeStand("st七海_制服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100150na">
「それで、おにぃとは最近会ってます？」

{	Stand("st梨深_私服_通常","normal", 200, @-280);
	FadeStand("st梨深_私服_通常_normal", 300, false);
	DeleteStand("st梨深_私服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100160ri">
「会ってるよ。だって、クラスメイトだし」

{	Stand("st七海_制服_通常","pride", 200, @+280);
	FadeStand("st七海_制服_通常_pride", 300, false);
	DeleteStand("st七海_制服_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100170na">
「でも、あんまり学校行ってないんですよね。おにぃのお尻、蹴っ飛ばしてあげてください。いっつも引きこもってるんだもん。ナナの言うことはちっとも聞いてくれないし」

{	Stand("st梨深_私服_右向き","hurry", 200, @-280);
	FadeStand("st梨深_私服_右向き_hurry", 300, false);
	DeleteStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100180ri">
「たはは。りょーかい」

{	Stand("st七海_制服_通常","smile", 200, @+280);
	FadeStand("st七海_制服_通常_smile", 300, false);
	DeleteStand("st七海_制服_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00100190na">
「それじゃ、ナナ、帰りますね。遅くなると、お母さんに怒られちゃう」

{	Stand("st梨深_私服_通常","smile", 200, @-280);
	FadeStand("st梨深_私服_通常_smile", 300, false);
	DeleteStand("st梨深_私服_右向き_hurry", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn06/00100200ri">
「うん。またね」

{	DeleteStand("st七海_制服_通常_smile", 300, true);}
小さく手を振る梨深に見送られて、七海は駅へ歩き出す。

{	DeleteStand("st梨深_私服_通常_smile", 500, false);}
相変わらず梨深についての記憶がさっぱり思い出せずにいたし、この時間になぜ梨深は制服ではなく私服で歩いていたのかも疑問だったが、それよりももっと気になることで頭の中は占められていた。

――おにぃと梨深さんって、恋人だったりするのかな？

――そんなわけないよね！

自分で考えておきながら、そのあまりの非現実的な発想に七海は苦笑していた。

兄にカノジョができるというのは、それこそかつての七海自身が言ったように、地球が滅ぶのに等しい事態なのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1000);


//アイキャッチ
//※拓巳視点に戻る
//※※３６０以上

//この後、“ch02_046_ヴァンパイ屋事件”へ
}