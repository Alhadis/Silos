//<continuation number="250">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_121_マグネタイトヴァレイ";
		$GameContiune = 1;
		Reset();
	}

		ch06_121_マグネタイトヴァレイ();
}


function ch06_121_マグネタイトヴァレイ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Delete("*");
	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Wait(1500);

//※拓巳視点に戻る
//ＢＧ//拓巳の部屋
//※可能ならこの時点で拓巳の部屋の散乱した床に、見慣れないダンボール箱が置いてあるようにする。気付く人は気付く。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
セナと別れた後、少しだけ呆然としちゃったけど、すぐに我に返るとダッシュでここまで戻ってきた。

幸いにも、『将軍』や優愛と遭遇することはなかった。

結局、梨深には会えずに戻ってきてしまった。

あやせの騒動や昼間の地震のことがあるから、きっと学校は授業を切り上げて生徒を帰らせるはず。

もうしばらくしたら梨深が訪ねてきてくれるかもしれない。それまではなんとかひとりで恐怖に耐えるしかない……のか。

不安から目をそらすため、回復したＰＣを使って情報を集めることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_06_1_chnチャットサンプル_a.jpg");

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text801]
と、ＰＣモニタの横に置いてあったケータイのライト部分が点滅していた。

開いてみると、メールが来ている。
梨深からの連絡かと思ったんだけど……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//拓巳のケータイ


	CreateSE("携帯ボタン","SE_日常_けい帯ボタン押す");
	MusicStart("携帯ボタン", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateSE("携帯ボタン","SE_日常_けい帯ボタン押す");
	MusicStart("携帯ボタン", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateTextureEX("七海メール内容", 100, 0, 0, "cg/bg/bg157_02_1_七海メール_a.jpg");
	Fade("七海メール内容", 0, 1000, null, true);
	Wait(3000);

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//以下、メール文章ですがＢＧ指定がありませんので、テキストで括ります
//※以下、七海からのメール
From : nana-iiko-iiko@waves.ne.jp
Subject : 今日学校で！

今日学校ですごいことあった！
飛び降り自殺未遂だよ！　ビックリしたし、怖かった……。ｸｽﾝ（’_’、）
あの人大丈夫だったのかな……。
おにぃはあのとき学校いた？
あと地震もすごかったよね。ナナ、めちゃ×２頭が痛くなったんだけど、あれってなんだったんだろ？(；＿；？）
//※以上、七海からのメール
//以上、メール文章ですがＢＧ指定がありませんので、テキストで括ります

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12100010ta">
「…………」

ちょっとした野次馬気分か。おめでてーな。
当然のように返事はしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（ネットブラウザ）

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg011_01_1_検索欄UP_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	Delete("背景２");
	Delete("七海メール内容");
	Wait(500);

	CreateSE("SE02","SE_日常_PC_マウスくりっく02");
	MusicStart("SE02", 2000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
あやせのことをネットで調べてみる。相変わらずファンタズムの公式ＨＰには繋がらない。

新聞社もあやせのことはどこも報じていなかった。

まあ、たかがインディーズバンドのボーカルが自殺未遂したことより、今は渋谷を襲った地震のことで手一杯なんだろう。

あやせが無事だったのかどうか、確かめる術は今の僕にはなかった。

地震については、さっき見たときよりもずっと多くの情報が判明していた。

死者は現時点で１１８人にまで増え、
負傷者は３００人以上とのことだった。
まさか、死者が三桁を超えるなんて……。

震源は渋谷で、被害は意外にもほぼ渋谷区に限定されているらしい。震度は５だった。

渋谷中の磁気メディアのほとんどが損壊した、という記事もあった。僕のような悲劇に見舞われた人が他にもたくさんいたのかと思うと、また悔しさが沸き出してきそうになった。

あれはまさに悲劇だった。

僕のお宝萌えイラスト集やエロゲのセーブデータは、
もう永遠に戻ってこない……はあ。

それにしても、やっぱりあれはただの地震には思えない。

１１８人も死ぬなんて異常だ。

その異常さは当然ながらネットでも話題になっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE02", 500, 0, 0, 1000, null, false);

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTexture360("背景９", 2000, center, middle, "SCREEN");
	CreateBoard(0,0);

//おがみ：フォントサイズ修正
//<FONT size="34" incolor="#ff0000"><SPAN value=32>

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text900]
　　　<FONT size="32" incolor="#ff0000"><SPAN value=30>【地震】渋谷で震度５・死者多数</SPAN></FONT>
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TitleBoard("【1:687】");
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text901]
<FONT incolor="#0000ff"><U>684</U></FONT>  名前：<FONT incolor="#228b22">ぁゃιぃ編集者（東京都）</FONT>［age］：200X/10/27(月) 17:06:33  <FONT incolor="#0000ff"><U>ID:</U></FONT>KibAyAsHI
この地震は“その目だれの目？”が起こしたんじゃね？
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text902]
<FONT incolor="#0000ff"><U>685</U></FONT>  名前：<FONT incolor="#228b22">配管工（アラスカ州）</FONT>［age］：200X/10/27(月) 17:07:52  <FONT incolor="#0000ff"><U>ID:</U></FONT>FoxnWoV91
<PRE>Ω ΩΩ< </PRE>な、なんだってー！！
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text903]
<FONT incolor="#0000ff"><U>686</U></FONT>  名前：<FONT incolor="#228b22">クリオネ飼育員（関東西部）</FONT>［age］：200X/10/27(月) 17:08:43  <FONT incolor="#0000ff"><U>ID:</U></FONT>Wr3mqsBI0
その目だれの目　ＳＵＧＥＥＥＥＥ！！１！！１１
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text904]
<FONT incolor="#0000ff"><U>687</U></FONT>  名前：<FONT incolor="#228b22">文部科学大臣（西表島）</FONT>［age］：200X/10/27(月) 17:08:57  <FONT incolor="#0000ff"><U>ID:</U></FONT>GaF0rUkB4
<FONT incolor="#0000ff"><U>>>684</U></FONT>
そうか！　震度５で１１８人も死者が出た理由はそれだったのかｗｗｗｗｗうぇｗｗｗｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	FadeDelete("背景９", 0, true);

//画面パンして拓巳の視線をさまよわせる

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
くそ……いい気なもんだ……。

あの地震の瞬間のことを、僕は振り返ってみた。

あのとき、ものすごい衝撃に襲われた。

頭が沸騰するような、爆発するような、今まで味わったことのない感覚。

あれを食らったら……ショック死してもおかしくない。

ネットだけじゃなくて、テレビニュースも見てみる。

僕のＰＣはテレビチューナーを付けてある。だからこの部屋にはテレビなんて不要なんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（ニュース番組）

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	CreateTextureEX("背景２", 100, 0, -64, "cg/bg/bg158_01_1_ニュース地震_a.jpg");
	EndBoard();
	Fade("背景２", 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//キャスターＡ＝女
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch06/12100020ka">
「現在までに死者１１８名、重軽傷者３００名以上と、非常に多くの犠牲者が出ていることが分かっています」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch06/12100030ka">
「さて、渋谷の駅前と中継が繋がったようです」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch06/12100040ka">
「島谷さん、現地の様子はいかがですか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//画面エフェクト//砂嵐（チャンネル変えてることを意味してます）
//	CreateTexture360("砂嵐", 100, 0, 0, "cg/bg/bg158_01_1_ニュース地震_a.jpg");

	Delete("@text006");
	CreateTextureEX("背景１", 100, 0, 40, "cg/bg/bg158_02_1_ニュース地震_a.jpg");
	CreateSE("SE02","SE_日常_けい帯_のいず");

	CreateMovie360("砂嵐", 200, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);

	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);

//	CreateColor("砂嵐", 150, 0, 0, 1280, 720, "Black");
//	CreateColor("砂嵐２", 100, 0, 0, 1280, 720, "#666666");
//	DrawTransition("砂嵐", 50, 0, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 200, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 200, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 200, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 200, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 0, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐２", 50, 500, 0, 100, null, "cg/data/noize.png", false);
//イメージＢＧ//ＰＣ画面（ニュース番組）
//可能ならイメージＢＧの中身にも変化を

	SoundPlay("SE02", 0, 0, false);
	Fade("背景１", 0, 1000, null, true);
	Delete("砂嵐");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//コメンテーター１、２ともに男
//【コメンテーター１】
<voice name="コメンテーター１" class="コメンテーター１" src="voice/ch06/12100050c1">
「２００５年に同じように震度５の地震が東京であったんですよ。そのときはゼロで、なぜ今回は１００名以上の被害者が出ているんですか？」

{	Move("背景１", 1000, @0, @-120, Dxl1, false);}
//【コメンテーター２】
<voice name="コメンテーター２" class="コメンテーター２" src="voice/ch06/12100060c2">
「被害者の数は震度に比例するわけじゃないんです。そこには様々な要因がありまして――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("@text007");

	CreateTextureEX("背景２", 100, 0, -96, "cg/bg/bg158_03_1_ニュース地震_a.jpg");
	CreateSE("SE02","SE_日常_けい帯_のいず");

	CreateMovie360("砂嵐", 200, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);

	SoundPlay("SE02", 0, 1000, false);
	Wait(1000);


//画面エフェクト//砂嵐
//	CreateColor("砂嵐", 150, 0, 0, 1280, 720, "Black");
//	CreateColor("砂嵐２", 100, 0, 0, 1280, 720, "#666666");
//	DrawTransition("砂嵐", 50, 0, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 200, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 200, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 200, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 200, 500, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐", 50, 500, 0, 100, null, "cg/data/noize.png", true);
//	DrawTransition("砂嵐２", 50, 500, 0, 100, null, "cg/data/noize.png", false);

//イメージＢＧ//ＰＣ画面（ニュース番組）

	SoundPlay("SE02", 0, 0, false);
	Fade("背景２", 0, 1000, null, true);
	Delete("砂嵐");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//キャスターＢ＝男、キャスターＣ＝女
//【キャスターＢ】
<voice name="キャスターＢ" class="キャスターＢ" src="voice/ch06/12100070kb">
「亡くなった方の死因や、病院に運ばれた負傷者の容体については、未だ詳しい情報が入っておりません」

//【キャスターＢ】
<voice name="キャスターＢ" class="キャスターＢ" src="voice/ch06/12100080kb">
「また渋谷区を中心に磁気メディアが全壊してしまっていることについて、今日は専門家にお越しいただいております」

{	Move("背景２", 3000, @0, @80, AxlDxl, false);}
//【キャスターＣ】
<voice name="キャスターＣ" class="キャスターＣ" src="voice/ch06/12100090kc">
//◆「はやしばら・たいぞう」「おざわ・みきひと」
「地質学産業研究所より林原泰蔵先生、財団法人地質調査環境センターより小沢幹人先生にお越しいただきました」

//【キャスターＢ】
<voice name="キャスターＢ" class="キャスターＢ" src="voice/ch06/12100100kb">
「林原さん、今回の地震について、磁気メディアに深刻な被害が出た原因というのは、どういうところにあるんでしょうか？」

//◆深刻な感じで
//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100110hs">
「まず知っておいていただきたいのは、渋谷区辺りの地下２００メートル付近には、磁鉄鉱……え～、つまり天然の磁石が多く埋蔵されている地層があるということですね」

//◆深刻な感じで
//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100120hs">
「え～、地層の分類としては火成岩層ですが、私達はこのエリアを磁鉄鉱の谷……“マグネタイトヴァレイ”と呼んでいます」

//◆深刻な感じで
//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100130hs">
「地中にある磁石の谷ですね。文字通り、かなり大規模な岩脈なんですよ」

//◆深刻な感じで
//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100140hs">
「ここにですねぇ、今回の地震のような大きな刺激が加わったとするならば、その影響で地上に存在する磁性体、主に磁気メディアの持つ記録部に、え～、致命的なダメージを与えてもおかしくはないんです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆怒っているように
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100150oz">
「なにをバカな」

//【キャスターＣ】
<voice name="キャスターＣ" class="キャスターＣ" src="voice/ch06/12100160kc">
「小沢先生は、別の意見ですか？」

//◆深刻な感じで
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100170oz">
「確かに、渋谷の地下には巨大なマグネタイトの岩脈があることは事実です」

//◆深刻な感じで
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100180oz">
「ですが、磁石と呼ぶには余りにも微弱なこのマグネタイト群にはですね、地上の磁気モーメントや安定磁場を崩すほどの力はないというのが、通説になっています」

//◆深刻な感じで
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100190oz">
「実際ですね、過去にも震度５の地震は、何度も発生しています。過去のそれらの地震では、今回のような被害はなかった」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//◆深刻な感じで
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100200oz">
「なので原因は別にあるのではないかと考えるのが妥当だと思います」

//◆ムッとして
//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100210hs">
「そうは言うがね、今回の異常な犠牲者数については、ただの地震では片付けられないなにかがあるのが、え～、事実なわけであり」

//【林原】
<voice name="林原" class="林原" src="voice/ch06/12100220hs">
「渋谷にいた人のほとんどが、頭痛がしたって訴えてることからも、間違いなく磁鉄鉱が関係している可能性が――」

//◆興奮して
//【小沢】
<voice name="小沢" class="小沢" src="voice/ch06/12100230oz">
「磁場ごときで１００人も殺せると主張するおつもりですか！？」

//◆小沢を遮って
//【キャスターＢ】
<voice name="キャスターＢ" class="キャスターＢ" src="voice/ch06/12100240kb">
「それではここでＣＭです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面がパンして拓巳は視線をさまよわせる

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	CubeRoom4("ルーム", 100, 0);
	MoveCube("ルーム", 0, @0, @0, @-150, null, true);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02", 0, 1000, false);
	Fade("ルーム", 300, 1000, null, false);
	MoveCube("ルーム", 500, @0, @0, @150, Dxl2, true);

	Wait(500);

	MoveCube("ルーム", 1000, @0, @30, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch06/12100250ta">
「結局、詳しいことはなにも分からず、か……」

地震直後、渋谷に巨大な白い靄みたいなものが立ちのぼったとか、空が白く染まったとか、その点についてはことごとくスルーされていた。

最初の頃には、ちゃんと報道されていたのに。

まるでなかったことにされてるみたいに感じて、
僕は薄気味悪くなった……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*",2000,0,false);

	Wait(2000);

}