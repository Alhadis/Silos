//<continuation number="160">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_158_作文と落書き";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch08_158_作文と落書き();
}


function ch08_158_作文と落書き()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice02("梨深ルート有り","梨深ルート無し");
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
			$梨深ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}

	CreateTextureEX("幻惑イメージ", 100, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Fade("幻惑イメージ", 2000, 1000, null, true);

	BGMPlay360("CH07", 2000, 300, true);

	Wait(1500);

//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//拓巳の部屋
//ＶＦ//テレビの中からの声
	Stand("bu星来_覚醒後_通常","ero", 200, @0);
	FadeStand("bu星来_覚醒後_通常_ero", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆泣きながら
//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800010se">
「この……ぼけなすっ！　ずっと、待ってた……待ってたんだからね……っ」

//◆泣きながら
//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800020se">
「あなたのことなんか……大嫌い……！　でも、大好きっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	Wait(1000);

	BGMPlay360("CH*", 5000, 0, false);

	CreateTextureEX("背景１", 300, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

	MusicStart("SE01", 3000, 500, 0, 1000, null, true);

	Delete("幻惑イメージ", 0, true);
	DeleteStand("bu星来_覚醒後_通常_ero", 0, true);


	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800030ta">
「…………」

ぼーっと、ＰＣモニタの中で動く星来たんを眺める。

昨日の深夜に放映したブラチューの最新話。物語も徐々に盛り上がってきて、＠ちゃんでの評価もかなり高かった。

見るのはこれで３回目。でもちっとも頭に入ってこない。

時計を見ると、夜の１０時を回っていた。
梨深は８時ぐらいに帰っていった。

鬱状態の僕をあれこれと励ましてくれたし、優しい言葉もかけてくれた。梨深が一緒にいてくれたことで、今日はこれまでの一週間よりも寂しくなかった。

だけど、梨深はまだそれほど事態を深刻に受け止めてくれていない。
まるで梨深は、ニュージェネの話題を避けようとしているみたいだった。

もしかして、ウザがられてるのかな……。

梨深は知り合いが地震でケガしたらしいし、そっちのことでいっぱいいっぱいで、僕なんかに構ってる余裕がないのかもしれない。

いや、でも――

確かに僕は被害妄想が過ぎるかもしれないけど、それでもこの危機的状況は本物なんだ。

今日にでも僕は殺されるかもしれない……。

『将軍』が僕を執拗に狙う目的。
それが分かれば、少しは対策を練ることだってできるのに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 1000, 1, true);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateColor("色１", 400, 0, 0, 1280, 720, "Black");
	Stand("bu梢_制服_正面","normal", 500, @0);
	FadeStand("bu梢_制服_正面_normal", 0, true);
	Fade("回想フラッシュ", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/15800040ko">
「そう言えば、あのおじしゃん、別れ際にこんなこと言ってたのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/15800050ko">
「“中でも一番特別なのは”」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/15800060ko">
「“その目だれの目？を産み落とした少年”」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 3000, 500, true);
	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("色*", 0, true);
	Delete("回想明度");
	DeleteStand("bu梢_制服_正面_normal", 300, true);
	Fade("回想フラッシュ", 2000, 0, null, true);
	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
――その目だれの目？

いまや渋谷のあちこちで聞かれる言葉。
ネット上でもこれが犯人の代名詞みたいになってる。

あれは僕が、昔からよく使っていた言葉だ。

きっとそれを知っていた『将軍』から僕への、メッセージ。あるいは、挑発なんだ。

僕が最初にあの言葉を使い始めたのはいつだっただろう。
誰かに教えてもらったような気がする。

そのことを、小学生のときの作文にも書いたことを、うっすらと覚えている。

タイトルはそのものずばり『その目だれの目？』。

内容はほとんど忘れてしまった。
中身を確かめたい。

僕は、あの作文になにを書いたのか。

実家に、まだ残ってるかな。

あんな昔の作文、とっくに捨てちゃったような気もするけど。

ただ、昔から大切なものはなんでもかんでも、大きなお菓子の空き缶――僕は“宝箱”と呼んでいた――に入れてしまっておくクセがあった。

だからあの作文も、あるいはその中に入っているかもしれない。

どうしよう。実家に行くべきだろうか。
でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 600, 100, true);

//ＣＧ//廊下を歩く七海の後ろ姿
//フラッシュバックで一瞬表示
	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE02", 200, 500, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 200, 1000, null, true);
	CreateColor("回想明度", 1000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	CreateTexture360("背景２", 500, 0, 0, "cg/ev/ev069_01_1_七海廊下後姿髪かきあげ_a.jpg");
	Fade("回想フラッシュ", 1000, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 200, 1000, null, true);
	CubeRoom4("ルーム", 100, 0);
	Fade("ルーム", 0, 1000, null, true);
	Rotate("ルーム", 0, @0, @0, @0, AxlDxl, true);
	Delete("背景*", 0, true);
	Delete("回想明度");
	Fade("回想フラッシュ", 2000, 0, null, true);
	Delete("回想フラッシュ");

	SoundPlay("SE01", 3000, 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
七海と、顔を合わせたくない。
なにを喋っていいのか分からない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800070ta">
「はあ、僕は……どうしようもなくヘタレだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CreateSE("SE03","SE_じん体_動作_尻餅");
	SoundPlay("SE02", 0, 1000, false);
	MoveCube("ルーム", 1500, @0, @20, @0, AxlDxl, true);
	SoundPlay("SE01", 1500, 200, true);
	MoveCube("ルーム", 1000, @-50, @0, @100, AxlDxl, true);
	MoveCube("ルーム", 1000, @-50, @0, @100, AxlDxl, true);
	MoveCube("ルーム", 1000, @-50, @0, @100, AxlDxl, true);
	Rotate("ルーム", 1500, @60, @0, @0, Axl1, true);
	SoundPlay("SE03", 0, 1000, false);
	MoveCube("ルーム", 50, @0, @20, @0, AxlDxl, true);
	MoveCube("ルーム", 50, @0, @-20, @0, AxlDxl, true);
	MoveCube("ルーム", 50, @0, @20, @0, AxlDxl, true);
	MoveCube("ルーム", 200, @0, @-40, @0, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
のろのろとイスから立ち上がり、代わりにソファに倒れ込んだ。

//ＶＦ//テレビからの声
//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800080se">
「きゃあ！　あなた、なんでここにいんの！？」

//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800090se">
「こ、これはその、違うんだからねっ！　あたしは別にさ、立ち食いそばが好物なわけじゃないんさっ」

//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800100se">
「って、なにニヤニヤしてんの、このぼけなす！　もぉ怒った！」

//【星来】
<voice name="星来" class="星来" src="voice/ch08/15800110se">
「うなれぇっ、サムライ☆コンデンサ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//爆発音（テレビからの音）
//◆※立ち食いそばを食べていた星来が、主人公の男の子に見つかってあたふたしている、というシチュエーション。
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	CreateSE("SE02","SE_じん体_動作_手_ぱいぷいす引きずる");
	CreateSE("SE03","SE_じん体_動作_尻餅");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
仰向けになり、星来のセリフを聞き流しながら天井を見上げる。
鉄板がむき出しの、寒々しい天井。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Rotate("ルーム", 1500, @20, @0, @-40, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
実家の僕の部屋みたいに、人の顔と錯覚するような木目も染みもない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Rotate("ルーム", 1000, @-20, @0, @20, AxlDxl, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800120ta">
「……ん？」

{	Rotate("ルーム", 700, @20, @0, @-20, Dxl1, true);}
ふと、視界の隅――
ロフトベッドの上に積み上げられたエロゲのパッケージと一緒に、見覚えのあるデザインの缶が目に入った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800130ta">
「あれ……って……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 0, 1000, false);
	Move("背景１", 200, @0, @-4, Dxl1, false);
	Fade("背景１", 200, 1000, null, true);
	Move("背景１", 200, @0, @4, Axl1, true);
	Wait(1000);
	SoundPlay("SE02", 0, 500, false);
	Delete("ルーム");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
慌てて立ち上がり、はしごを使ってベッドの上をのぞき込む。

{	Wait(1000);
	SoundPlay("SE02", 500, 0, false);}
赤褐色の、四角い缶。
大きさはＢ５サイズ。
蓋の表面に“サブレ”という白い字。

やっぱり間違いない。
“宝箱”だ。

実家からこっちに持ってきていたんだ。

そんな記憶、全然ないけど。

僕ＧＪ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_じん体_動作_手_ぱいぷいす引きずる");
	CreateSE("SE03","SE_じん体_動作_尻餅");
	SoundPlay("SE02", 0, 300, false);
	Wait(2000);
	SoundPlay("SE02", 200, 0, false);
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604004]
さっそく箱を下ろし、蓋を開く。

中に入っているのは、テストの解答用紙だったり作文用紙だったり、スケッチブックの切れ端だったりした。

小物はほとんどなくて、どれも紙だ。

全部缶から一度取り出し、目当てのものを探す。

それはすぐに見つかった。
なにしろ一番上にあったから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//作文用紙に小学生の拓巳のつたない文字で書かれたタイトル『その目だれの目？』
//※１章で使ったものの使い回し

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg004_01_1_作文用紙その目_a.jpg");

	BGMPlay360("CH01", 3000, 800, true);
	Fade("背景２", 3000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
色あせた作文用紙。

表紙に書かれた、お世辞にも上手いとは言えない文字。

ここに……この作文の中に、なにか、重大な秘密が隠されてるんだろうか。
『将軍』がこだわるなにか。

ホームレスのおじさんが“一番特別”と言った意味。

僕はゴクリと息を呑むと、一字一句見落とさないよう慎重に読み始めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ここはテキスト？orイメージBG演出？
	Wait(1000);

//※※３６０以下
//※以下、拓巳の作文
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
『その目だれの目？』

４年３組　西條拓巳

　ぼくはよく夢を見ます。夢の中では大人になってるぼくがタイムマシンにのって今のぼくのところにワープして来ます。大人のぼくは、ぜんぜんにていませんでした。

　あと、タイムマシンにはいっぱいボタンがついていて、おすとシャワーが出たりシャンプーも出た。大人のぼくに使いかたを聞いたら、きょうりゅう時代とか、原始時代とかにも行けると言いました。

　苦手な授業はなにと聞いてきたから算数と言いました。そうしたら算数のべん強ができるようになるスイッチもあると言いました。

　ぼくがスイッチをおそうとしたら、おこりました。自分でど力をしてがんばらないとだめだそうです。

　大人のぼくは１回おこっただけで、あとはやさしかったから良かった。あと、ぼくがけっこんする女子とかも教えてくれました。それはひみつです。

　あと、神さまのことも聞きました。いると言っていました。

　ぼくもいると思います。神さまはどこでも見ているから、悪いことをすると地ごくに行かされるとお母さんも言っていました。だから悪いことはぜったいにいけないと思う。妹とも仲良くしないとだめです。

　お母さんは、悪いことをすると神さまじゃなくて、こわい人が見てくると言っていました。

　こわい人は、その目だれの目というオバケだった。見られると地ごくに行かされます。

　神さまの目も、その目だれの目も、空にも、家の天じょうにも、かべにも、学校にもいっぱいあって、いつもぼくを見ています。

　だからべん強も、良いことも、いっぱいやらないといけないと思います。でも、いつも見ているから、おふろとかトイレとかははずかしいです。

　あと、ぼくは小さい時から、ねてない時も目をつむっただけで、時々ゆめを見る。頭の中がゲームみたいになるし、マンガみたいになります。

　でもそれをやると、その目だれの目が出てくるのでやりたくない。お母さんに聞いたら、それはやっちゃだめと言いました。

　でも、今作文を書いている時も、ゆめの中で大人のぼくにタイムマシンのことを聞いたら、知っていると言っていました。でもぼくが子どもだから、おしえてくれませんでした。

　だからこれからは、良いことをいっぱいして、その目だれの目をたおしたいです。（おわり）

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※※３６０以上

/*
『その目だれの目？』

４年３組　西條拓巳

　ぼくはよく夢を見ます。夢の中では大人になってるぼくがタイムマシンにのって今のぼくのところにワープして来ます。大人のぼくは、ぜんぜんにていませんでした。
　あと、タイムマシンにはいっぱいボタンがついていて、おすとシャワーが出たりシャンプーも出た。大人のぼくに使いかたを聞いたら、きょうりゅう時代とか、原始時代とかにも行けると言いました。
　苦手な授業はなにと聞いてきたから算数と言いました。そうしたら算数のべん強ができるようになるスイッチもあると言いました。ぼくがスイッチをおそうとしたら、おこりました。自分でど力をしてがんばらないとだめだそうです。
　大人のぼくは１回おこっただけで、あとはやさしかったから良かった。あと、ぼくがけっこんする女子とかも教えてくれました。それはひみつです。
　あと、神さまのことも聞きました。いると言っていました。
　ぼくもいると思います。神さまはどこでも見ているから、悪いことをすると地ごくに行かされるとお母さんも言っていました。だから悪いことはぜったいにいけないと思う。妹とも仲良くしないとだめです。
　お母さんは、悪いことをすると神さまじゃなくて、こわい人が見てくると言っていました。
　こわい人は、その目だれの目というオバケだった。見られると地ごくに行かされます。
　神さまの目も、その目だれの目も、空にも、家の天じょうにも、かべにも、学校にもいっぱいあって、いつもぼくを見ています。
　だからべん強も、良いことも、いっぱいやらないといけないと思います。でも、いつも見ているから、おふろとかトイレとかははずかしいです。
　あと、ぼくは小さい時から、ねてない時も目をつむっただけで、時々ゆめを見る。頭の中がゲームみたいになるし、マンガみたいになります。
　でもそれをやると、その目だれの目が出てくるのでやりたくない。お母さんに聞いたら、それはやっちゃだめと言いました。
　でも、今作文を書いている時も、ゆめの中で大人のぼくにタイムマシンのことを聞いたら、知っていると言っていました。でもぼくが子どもだから、おしえてくれませんでした。
　だからこれからは、良いことをいっぱいして、その目だれの目をたおしたいです。（おわり）
*/

//※以上、拓巳の作文
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800140ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800150ta">
「なんだかよく分からないな……」

この頃から“神の視線”の気配を感じていた、っていうことがはっきりしたぐらいだ。

もしかしたら僕って、子供の頃はかなりのデンパ少年だったのかも。

とにかくこの意味不明な内容からなにかを読み取ろうなんて、とてもじゃないけど無理だった。

ヒエログリフを解読するより大変そうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 2000, 0, true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
そこでふと、作文用紙の裏に落書きがしてあることに気付いた。

そう言えばこの頃の僕は、落書きが大好きだったっけ。

例えば社会の教科書に出てくる、過去の偉人たちの顔写真には、必ずチョビヒゲとかサングラスなんかを書き込んだりしていたし、ノートの端にパラパラマンガを書いたりもした。

だんだん“描くこと”が楽しくなって、
あるときスケッチブックを買ってもらったことさえある。

まあ、絵が上手だって誉められたことは一度もないんだけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg004_01_1_作文用紙その目_a.jpg");
	Fade("背景２", 200, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
僕はそんな懐かしい気分に浸りながら、そこに描かれた落書きを見てみようと、作文用紙を裏返してみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SoundPlay("SE01", 500, 0, false);

	Wait(500);

	CreateSE("SE03","SE_衝撃_生と手帳落ちる");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg155_01_1_Ir2_a.jpg");
	CreateTextureEX("背景２", 150, 0, 0, "cg/bg/bg155_01_1_Ir2_a.jpg");

	SoundPlay("SE03", 0, 400, false);
	Fade("背景１", 100, 1000, null, true);

	Wait(1500);

	Zoom("背景１", 0, 1500, 1500, null, true);
	Move("背景１", 0, @-160, @80, null, true);
	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 1000, true);

	Wait(1000);

	Fade("背景２", 2000, 1000, null, true);
	Delete("背景１", 0, true);

	Wait(2000);

//イメージＢＧ//Ｉｒ２の公式が描かれた落書き
//ＳＥ//心臓の鼓動


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
それは、
意味不明の落書き。

意味不明だけど、ただひとつだけ、

ごく最近、見た覚えのあるものが含まれていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Move("背景２", 300, @0, @96, Dxl2, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//◆「あいあーるに」
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15800160ta">
「あいあーる２……」

それが数式なのか、それ以外の意味があるものなのか、それとも無意味なアルファベットと数字の羅列でしかないのか、

それは分からない。

だけど――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateColor("回想明度", 2000, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);
	ChatMain(420,-54,"002");

//おがみ：チャットサンプル画面は覚醒前、回想なので仕様です
	CreateTexture360("背景３", 200, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("box01", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text116]
将軍：The world changes if you click it&.
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text117]
ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text119]
将軍：おどかしてゴメン
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text121]
ナイトハルト：ぜんぜん無問題
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text122]
ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text123]
将軍：考え事したり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text124]
ナイトハルト：将軍はドコから参加？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text126]
将軍：渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text128]
ナイトハルト：（・∀・）人（・∀・）僕も渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text129]
ナイトハルト：なんか最近変な事件が多発してるらしいね
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text130]
将軍：事件はまだ起こるぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text131]
ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text132]
<pre>将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//実験おわり


	Fade("回想フラッシュ", 200, 0, null, true);

//イメージＢＧ//チャット画面の『将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２』のアップ
//※１章冒頭のチャットで将軍が提示した際の回想

/*
	Wait(3000);

	BGMPlay360("CH06", 3000, 1000, true);
	CreateColor("チャット下地色", 1500, 0, 0, 1280, 720, "#252525");

//おがみ：↓ほんとは48
	SetFont("ＭＳ ゴシック", 26, #AAFF2D, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1600, 1960, 280, Auto, Auto, "将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２");
	Request("テキスト１", Smoothing);
	Request("テキスト１", NoLog);
	Request("テキスト１", PushText);
	Zoom("テキスト１", 0, 8000, 8000, null, true);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);
	Fade("テキスト１", 10, 1000, null, true);

	Wait(1000);

	Move("テキスト１", 2500, @-4320, @0, Dxl3, false);

*/
	Wait(2000);

	Fade("回想フラッシュ", 200, 1000, null, true);
	Delete("box01");
	Delete("背景３");
	FadeDelete("テキスト１", 0, true);
	FadeDelete("チャット下地色", 0, true);

	CreateSE("SE01","SE_衝撃_衝撃音01");

	CreateTexture360("あいあーる", 2000, 0, 0, "cg/bg/bg184_02_3_PC画面公式アップ_a.jpg");

	Fade("回想フラッシュ", 200, 0, null, true);

	SoundPlay("SE01", 0, 1000, false);


	Fade("回想フラッシュ", 300, 0, null, true);
	Wait(3000);

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("あいあーる");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");


	Wait(1000);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
この数式は、『将軍』が最初にチャットで僕に接触してきたとき、唐突に書き込んだものと同じだ。

“その目だれの目？”と“Ｉｒ２”。

僕が何年も前に書いたこの作文の中にある、ふたつのキーワード。
僕自身ですら忘れていたキーワード。

それを『将軍』が知っているということは。

やっぱり僕は、あいつに思考を盗撮されている――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//★梨深編
if(!$梨深ルート){
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*", 2000, 0, false);
	Wait(2000);
}else{
	SetVolume("SE02", 1000, 0, null);
	Wait(1000);
	ClearAll(2000);
	Wait(3000);
}


}