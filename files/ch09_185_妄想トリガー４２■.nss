//<continuation number="400">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_185_妄想トリガー４２■";
		$GameContiune = 1;
		Reset();
	}

		ch09_185_妄想トリガー４２■();
}


function ch09_185_妄想トリガー４２■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTextureEX("back10", 100, 0, 0, "cg/bg/bg000_06_1_chnチャットサンプル_a.jpg");
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("back10", 0, 1000, null, true);
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//☆☆☆
//妄想トリガー
//ポジティブ妄想→分岐７
//ネガティブ妄想→分岐８
//妄想しない→分岐９

if($妄想トリガー通過４２ == 0)
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
			$妄想トリガー４２ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４２ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４２ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４２ == 2)
{
//☆☆☆
//分岐７

	SetVolume("SE01", 500, 0, NULL);

	BoxDelete(0);

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Request("back14", AddRender);
	Fade("back14", 0, 0, null, false);
	Fade("back14", 100, 1000, null, true);

	CreateTexture360("妄想", 100, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Stand("bu星来_覚醒後_通常","angry", 200, @0);
	FadeStand("bu星来_覚醒後_通常_angry", 0, true);

	FadeDelete("back14", 300, true);

	BGMPlay360("CH07", 2000, 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500010se">
「消えなくたって、これまでタッキーは存在感ゼロだったっしょ」

ズキリと、胸の奥が痛む。
星来たんにまでそんなひどいこと言われるなんて……。

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500020se">
「ひどいこともなにも、ホントのことだよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500030se">
「消えたいとか言ってるくせに、図星突かれたぐらいでヘコむんだ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500040ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500050se">
「タッキーはさ、この１ヶ月ぐらい、調子に乗ってたよね」

//◆リア充＝りあじゅう
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500060se">
「まわりの人たち、特に女子だよね、かわいい子たちと、リア充みたく話すようになっちゃって」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500070se">
「それまではさ、友達なんてひとりもいなくて、引きこもってたのに」

{	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_angry", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500080se">
「でも逆に考えれば、またその頃みたいな生活に戻るってだけなんさ」

戻る……？

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500090se">
「そ。戻る」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500100se">
「誰とも会っちゃダメ。誰も信じちゃダメ」

{	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500110se">
「本物なのかニセモノなのかとか、どうでもいい。そんなの誰にも証明できないし」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500120se">
「タッキーは、あたしだけ見てればいいんさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500130se">
「前は、それだけでじゅうぶん幸せだったっしょ？」

{	Stand("bu星来_覚醒後_通常","angry", 200, @0);
	FadeStand("bu星来_覚醒後_通常_angry", 300, true);
	DeleteStand("bu星来_覚醒後_通常_happy", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500140se">
「そう感じなくなっちゃったのは、タッキーに近づいてきたあの女子たちのせいだよ」

//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500150se">
「あんなアバズレビッチどもとはさ、
会わない方がいいって。ゼッタイ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500160ta">
「ふひ、ふひひ……そうか、そういうことか……」

悪いのは、僕に関わろうとしてきた連中だ。
梨深とかが悪いんだ。
僕は悪くない。

僕はまた引きこもる。星来たんをはじめとした僕の嫁たちに囲まれて、匿名の存在として、ここにいる。
それでいいんだよね、星来たん。

{	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒後_通常_angry", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500170se">
「そういうこと」

{	Stand("bu星来_覚醒後_通常","happy", 200, @0);
	FadeStand("bu星来_覚醒後_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500180se">
「タッキーは、あたしが幸せにしたげる♪」

僕の手の中で、星来たんが楽しそうに言う。
彼女にそう言わせた自分自身に、虫酸が走った。

{	DeleteStand("bu星来_覚醒後_通常_happy", 500, true);}
――僕って、ウザすぎる。

ますます、死にたくなった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	PositiveHuman();

	SetVolume360("CH07", 500, 0, NULL);

	Wait(1000);

//～～Ｆ・Ｏ
//合流３へ
}


//=============================================================================//

if($妄想トリガー４２ == 1)
{
//☆☆☆
//分岐８
	SetVolume("SE01", 500, 0, NULL);

	BoxDelete(0);

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Request("back14", AddRender);
	Fade("back14", 0, 0, null, false);
	Fade("back14", 100, 1000, null, true);

	CreateTexture360("妄想", 200, 0, 0, "cg/bg/bg161_01_6_妄想世界_a.jpg");
	Stand("bu星来_覚醒後_通常","normal", 200, @0);
	FadeStand("bu星来_覚醒後_通常_normal", 0, true);

	Fade("back14", 200, 0, null, true);

	Delete("back14");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500190se">
「だったら消えればいいっしょ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500200ta">
「ふひ、ふひひ……ああ、消えてやんよ……消えてやる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Request("back14", AddRender);
	Fade("back14", 0, 0, null, false);
	Fade("back14", 100, 1000, null, true);
	DeleteStand("bu星来_覚醒後_通常_normal", 1, false);
	Delete("back03");
	Delete("妄想");
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);
	Fade("back14", 200, 0, null, true);
	Delete("back14");



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//机の引き出しを開ける。
ベッドの下の収納ボックスを開ける。
確かそこに、ナイフが入っているはずだった。

今になって思えばただの中２病だけど、ナイフを懐に忍ばせているのがカッコイイと思っている時期が、僕にもあったんだ。

警察の取り締まりが厳しくなって、やめちゃったけど。

案の定、キーホルダーだとかトレカ、文房具などに紛れて、折り畳みナイフがそこにあった。

刃を出してみる。
ライトに反射して妖しく光る。

少し錆びていた。１年近く放置していたせいだ。

でも手首を切るぐらいなら、この程度のサビはどうってことないはず。

星来たんを持つ左手。その手首に、ナイフを添えた。
刃はひんやりと冷たい。
その冷たさが死というものを連想させる。

目を閉じて。
三度ほど深呼吸。

あとはナイフを強く押しつけたまま横へ引くだけ。
ほんのちょっと、右手に力をこめればいいだけ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500210ta">
「はあ、はあ、はあ……」

ドキドキする。ニセモノの心臓が早鐘を打っている。ニセモノのくせに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("back11", 500, 800, null, true);
	FadeDelete("back11", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
頭の芯に冷たい氷を入れられたような感覚。震えが止まらない。むしろどんどんひどくなる。ニセモノのくせに。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500220ta">
「はあっ、はあっ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("back11", 500, 800, null, true);
	FadeDelete("back11", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
切れ。
手首を切れ。
そうすれば消えられる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500230ta">
「うぁあぁぁああ……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 0, null, false);
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("back11", 200, 800, null, true);
	FadeDelete("back11", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604002]
声を上げて、死ぬための気力を必死に奮い起こそうとした。

切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。切れ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(200);

//ＳＥ//星来フィギュアが床に落ちる
	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500240ta">
「……っ」

震えが激しすぎて、持っていた星来たんフィギュアを落としてしまった。

ナイフはいまだ手首に押しつけたまま。
そのナイフを持つ手も、ブルブルと震えていて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500250ta">
「ダメだ……できない……できないよぅ……」

{	CreateSE("SE02","SE_衝撃_杭_落ちる_壁");
	MusicStart("SE02", 500, 500, 0, 1000, null, false);}
//ＳＥ//ナイフが放り捨てる
ナイフを投げ捨てて、僕はイスの上で背中を丸め、頭を抱えた。

なんて、情けないんだ……。
僕には、自殺する勇気すらない。

生きてる価値がないのに、死ぬことすらできない。醜い化け物である自分に終止符を打つことすらできない。

どうしようもないほどのヘタレ。
生きることに執着してるわけじゃない。
ただ死ぬことが、消えることが怖い。

ニセモノのくせに……！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500260ta">
「頼むよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500270ta">
「誰か、こんな僕を殺してくれ……」

結局、他人に殺してもらうことを期待する。

自分じゃなにもできない。
どこまでも腐った他力本願根性。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);
	Stand("bu星来_覚醒後_通常","normal", 200, @-320);
	FadeStand("bu星来_覚醒後_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【星来】
<voice name="星来" class="星来" src="voice/ch09/18500280se">
「そんなタッキーもカワイイよ♪」

//僕の手の中で、星来たんが楽しそうに言う。
星来たんが楽しそうに言う。
彼女にそう言わせた自分自身に、虫酸が走った。

――僕って、ウザすぎる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	NegativeHuman();

	Wait(1000);

//～～Ｆ・Ｏ
//合流３へ

}


//=============================================================================//

if($妄想トリガー４２ == 0)
{
//☆☆☆
//分岐９

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
そう思うなら。
行動すればいいじゃないか。

結局、今の僕は悲劇の主人公を気取ってるだけだ。
ここで悲嘆に暮れてたって、誰も同情してくれない。

みんな、僕なんて見ていない。
みんな、僕を見捨てていった。

いや、最初から縁なんてなかった。
僕に友達って言える人なんていないんだ。
家族だって、いないんだ。

僕はしょせんニセモノなんだから。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500290ta">
「ご託ばっかり並べてる……」

いいから、さっさと死ね。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	CubeRoom4("ルーム", 100, 0);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


	Fade("ルーム", 500, 1000, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 2000, 0, -180, 0, AxlDxl, true);
	MoveCube("ルーム", 1000, 0, 50, 0, Dxl2, true);
	MoveCube("ルーム", 1000, 100, 50, 100, Axl2, false);
	Rotate("ルーム", 1000, 0, -150, 0, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
僕は星来たんを置いてのろのろとイスから立ち上がると、ベッドの下に落ちていたビニール紐を見つけ、それを拾い上げた。

首が入るぐらいの輪を作って結び、もう一方の端をロフトベッドのパイプにきつく縛る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500300ta">
「ふひ、ふひひ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500310ta">
「死んでやる……死んでやるよ……死んでやるんだからな……」

止める人間なんて誰もいない。
この部屋には僕しかいないんだからそれは当然。

ビニール紐はかなりいい感じで固定できた。
案外、死ぬのなんて簡単だな、と思ってみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 2000, 0, -300, 0, Axl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601200]
紐の輪の中に頭を入れ、首に巻くようにした。

ロフトベッドの高さじゃ、普通に立っていると首吊りはできない。

でも足を投げ出しちゃえば、低くても問題はない。
必要なのは、死ぬ覚悟だ。

最後に、机の上から僕に向かって微笑んでくれている星来たんを見る。

見送ってくれるのは、星来たんをはじめとして棚に大量に並んだ、僕の嫁たちだけだ。

悲しくて。寂しくて。
鼻の奥がツンとして。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500320ta">
「さよなら……」

紐に全体重がかかるようにして、足を投げ出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ビニール紐が首に食い込む

	SetVolume("SE01", 300, 0, NULL);
	Rotate("ルーム", 100, 15, -300, 0, Dxl2, false);
	MoveCube("ルーム", 100, 100, -100, 100, Dxl3, true);
	CreateSE("SE02","SE_衝撃_どさっ");
	MusicStart("SE02", 0, 100, 0, 1000, null, false);

	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 0, 1000, null, true);
	FadeDelete("back10", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆苦しくてうめく
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500330ta">
「が……っ」

首が絞まる。
紐が圧迫してくる。
肉にきつく食い込んでくる。

痛い……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 500, 800, null, true);
	FadeDelete("back10", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500340ta">
「は、ぐ、ぎ、げ……！」

{	Rotate("ルーム", 200, 15, -310, 0, Dxl2, true);}
気付けば無意識のうちに、両手の指で紐の圧迫を緩めようとしていた。
足を元の位置に戻して、立とうとした。

{	Rotate("ルーム", 200, 15, -300, 0, AxlDxl, true);}
でもそれじゃ死ねない。
このまま全体重をかけ続けない限り、首は絞まらない。
だから我慢する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500350ta">
「ぎ、ぎゃ、が……っ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 500, 800, null, true);
	FadeDelete("back10", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
喉が痛い。
息苦しさより、首に食い込む痛さが辛い。

早く……。
早く、死ねよ、僕……。

苦しさは続く。
苦しすぎて、意識はちっとも飛ばない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_ひととぶつかる");
	MusicStart("SE02", 0, 300, 0, 1000, null, false);
	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 500, 800, null, true);
	FadeDelete("back10", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
身体が揺れる。ぐるぐると無様に回る。足をバタバタとさせる。

ギチギチと、ロフトベッドのパイプが軋む。

そのとき、急に僕の身体は支えを失い――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Rotate("ルーム", 300, 50, -300, 0, Dxl2, false);
	Move("ルーム", 300, @0, @-80, Axl1, true);

	WaitAction("ルーム", 200);

//ＳＥ//激しく尻餅
	CreateSE("SE02","SE_じん体_動作_尻餅");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateSE("SE03","SE_衝撃_どさっ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 500, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
尻から、激しく床に着地した。
尻の骨を打った痛みで、のたうち回る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500360ta">
「がはっ、げほげほっ、うげっ、ひぐっ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("ルーム");
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	FadeDelete("back10", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
と同時に、空気を必死で吸い込んでいた。
涙目になりながら、ベッドに結んだ紐を見上げると、途中でぶっつりと切れてしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500370ta">
「がふっ、へぐっ、う……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500380ta">
「はあ、はあ……なんだよ、それ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500390ta">
「なんなんだよぅ、それは……」

なんでこの期に及んで失敗するんだよ……。

確かに僕はどうしようもない人間で、他人に誉められるようなことはなにひとつ成し遂げたことのないダメ人間で。そもそも人間ですらないけど。

死ぬことにさえ、失敗するなんて、あんまりだ……。
どうして、死ねないんだ。

死にたいのに。
死にたいのに……！

宙吊りになっているときの苦しさを一度味わっちゃったら、もう二度と、首吊りに挑戦する勇気も気力も湧いてこない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18500400ta">
「楽に死ぬ方法を……誰か、教えてよ……」

またも他力本願根性を丸出しにしている自分に、反吐が出そうだった。

僕は……ホントにどうしようもない男だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);
	Wait(1000);

//～～Ｆ・Ｏ
//合流３へ
}
}