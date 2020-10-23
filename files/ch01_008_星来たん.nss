//<continuation number="310">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_008_星来たん";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

	ch01_008_星来たん();
}


function ch01_008_星来たん()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice02("１章エンドフラグ①有り","１章エンドフラグ①無し");
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
			$１章エンドフラグ① = true;
		}
		case @選択肢２:
		{
			ChoiceB02();
		}
	}

}


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
			$GameDebugSelect = 0;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
}

if($GameDebugSelect == 1)
{
	SetChoice02("優愛ルート有り","優愛ルート無し");
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
			$優愛ルート=true;
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$優愛ルート=false;
		}
	}
	$GameDebugSelect = 0;
}



//☆Cut-58-----------------------------


	CreateTextureEX("読み込み処置", 100, 0, 48, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	Fade("読み込み処置", 1000, 1000, null, true);


//ＢＧ//拓巳の部屋
	CubeRoom3("ルーム", 100, 0);

	Fade("ルーム", 1000, 1000, null, true);
	Delete("読み込み処置");
//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
息が切れている。ゼイゼイという、苦しそうな自分の呼吸音が聞こえている……。

僕はパソコンモニタの前に座っていた。
全身は汗だくで、服に汗がにじんでいた。

今の出来事は、なんだ？
僕の妄想？

吐き気をこらえきれなくなりそうだったから、それを抑えるために冷蔵庫からコーラを取り出して口の中に流し込んだ。

我ながらリアルな妄想だったけど、グロすぎだよ。

まだ息が切れている。妄想なのに息が切れる？
……そんなワケない。

自分の右手に違和感があった。
指が白くなるくらいに、拳をきつく握りしめている。
そのことにまったく自覚がなかったんだ。

ドキドキしながら、力を抜き、ゆっくりと手を開いてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//手の平の上に十字架型の杭

	CreateBG(100, 200, 0, 0, "cg/ev/ev007_02_6_十字架杭拓巳_a.jpg");

//ＳＥ//衝撃音
	CreateSE("SE02","SE_じん体_心臓_鼓動");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800010ta">
「ひっ……！」

手の平の上には、１本の杭。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back*", 200, 0, null, true);
	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 1000, @0, @-180, @0, Dxl2, true);
	CreateSE("SE05","SE_衝撃_杭_落ちる_壁");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg026_04_6_拓巳部屋_a.jpg");
	Fade("back05", 300, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600001]
怖くなって、それを壁に向かって投げ捨てた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back*", 200, 0, null, true);

	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 2000, 0, 0, 0, Dxl2, true);

	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
あのときの杭だ……！
路上に散乱していたもののひとつを、僕は確かに拾った。

でもなんで？
あれは妄想じゃなかったの！？

分からない、分からない、分からない。
あり得ない、あり得ない、あり得ない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 1000, @0, @-180, @0, Dxl2, true);
	MoveCube("ルーム", 1000, @+20, @0, @+150, Dxl2, false);
	Rotate("ルーム", 1000, @0, @+45, @0, Dxl2, true);
	MoveCube("ルーム", 1000, @+45, @0, @-100, Dxl2, false);	
	Rotate("ルーム", 1000, @0, @-30, @0, Dxl2, true);
	Rotate("ルーム", 1000, @0, @+90, @0, Dxl2, false);
	MoveCube("ルーム", 1000, @-20, @0, @+50, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600002]
頭を抱えて、部屋の中をウロウロと歩き回ってみる。とにかくさっき見た凄惨な光景が、現実だったのか妄想だったのか、はっきりさせよう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_衝撃_せ中を押される");
	MoveCube("ルーム", 1000, @+100, @0, @-100, Dxl2, true);
	MusicStart("SE3601", 0, 600, 0, 1000, null, false);
	Rotate("ルーム", 500, @-50, @+70, @-50, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600003]
そう思ったけど、床に落ちていたＣＤケースを踏んづけてしまい、足を滑らせた。倒れまいと手を伸ばしつかむものを探す。

かろうじてつかんだのは、僕の嫁たちが並ぶ棚の縁で。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ドンガラガッシャーン
	CreateSE("SE02","SE_衝撃_どんがらがっしゃーん");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 500, 90, 0, 0, Dxl2, true);

	CreateTexture360("背景０", 1000, center, middle, "SCREEN");
	Fade("ルーム", 0, 0, null, true);

	Shake("背景０", 500, 0, 50, 0, 0, 500, null, false);
	FadeDelete("背景０", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
しまった、と思ったときには遅かった。

僕は結局身体を支えきれずに腰から床に倒れ込み、その僕の上に、キレイに並んでいたフィギュアたちが大量に降ってきた。

うう、くっそ……。
最悪だ。なにもかも最悪だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("ルーム", 1000, 1000, null, true);
	Rotate("ルーム", 1000, 0, 0, 0, null, false);
	MoveCube("ルーム", 1000, 0, 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600004]
うめき声を上げながら立ち上がり、フィギュアが無事かどうかを確かめる。

{	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg114_01_3_イグニス_a.jpg");
	Fade("back05", 500, 1000, null, true);}
//☆☆☆☆071011
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800020ta">
「うっげー！？　『塵骸魔京』のイグニスたんの剣がーぁ……！」

ぽっきりと折れてしまっていた。
これ、ネットオークションでプレミア価格で買ったやつなのに！

{	FadeDelete("back05", 300, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800030ta">
「ふざけんな！　ふっざけんなよぅ！」

//☆☆☆☆071011
なんとか刀をくっつけようとしてみるけど、折れた部分を接着することはできても、完全に修復するのは不可能だった。これじゃもう価値なしだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800040ta">
「マジで勘弁してくれよ！　くそ、くそぉっ！」

//ＳＥ//イスを足で蹴り上げ
{	MoveCube("ルーム", 70, @0, @30, @0, null, true);
	CreateSE("SE02","SE_じん体_動作_足_蹴る_イス");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	MoveCube("ルーム", 70, @0, @-30, @0, null, true);}
むかむかして、イスを足で蹴り上げた。
涙が出た。

なんで僕がこんな目に遭わなくちゃいけないんだ。僕がなにをしたって言うんだ！

その場にがっくりと腰を下ろし、しばらく刀をなくしたイグニスたんを見つめてしょぼくれた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//張り付け死体の前に立ち、こちらを振り返る血まみれの梨深
//一瞬だけフラッシュバック
//ＳＥ//フラッシュバック
	CreateSE("SE02","SE_衝撃_ふらっしゅばっく");
	CreateTextureEX("グロ", 200, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");

	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	Fade("グロ", 100, 1000, null, true);

	Wait(400);
	FadeDelete("グロ", 400, false);

//ＢＧ//拓巳の部屋

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800050ta">
「…………」

怒りとか混乱の嵐が過ぎ去ると、
やがて脳裏に浮かぶのは"彼女"の顔や"オブジェ"の光景だけになった。

僕が杭を持っていたっていうことは、
あれは妄想じゃなくて現実だったっていうことになる。

認めたくないけど、認めざるを得ない。
きっと明日には、どのメディアも大騒ぎになってるはずだ。

こんなことに関わりたくない、絶対に。

"彼女"……いや、あの悪魔と関わったりなんかしたら、間違いなく僕は破滅だ。
そもそももうすでに破滅しかかってるんだ。

事件の重要な証拠となる凶器をひとつ、持ち帰ってきちゃったんだから。
僕が犯人だって疑われてもおかしくない状況だ。

しかも……しかも、あの悪魔に、顔を見られた……。

この出来事からは逃げられないよ……。
次は……僕があの悪魔に……。

とにかく、整理をしよう……。
自分の為に。自分が生き残る為に、整理をするんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	Fade("ルーム", 1000, 0, null, true);

	CreateSE("サウンド１","SE_日常_PC_キーたたく_長");
	MusicStart("サウンド１",0,1000,0,1000,null,true);

//イメージＢＧ//ＰＣ画面//ワープロソフト

//とりとめのない文章
//ＰＣ画面中の文章は以下の通り
//・小学校の時の作文は「その目だれの目？」
//・将軍とのチャットで「その目だれの目？」
//・将軍が書いた謎の公式の意味は？
//・将軍から見せつけられたグロ写真
//・写真と同じ殺人現場に遭遇
//・謎の少女が僕の名前を知っていた

//☆☆☆
//フラグ【１章エンドフラグ①】ＯＮの場合
//※以下の文章も追加される
//・学校の黒板に「その目だれの目？」

	if($１章エンドフラグ① == true)
	{
		CreateTextureEX("記事１", 200, 0, 0,"cg/bg/bg044_03_1_ワープロ文章_a.jpg");
		Fade("記事１", 500, 1000, null, true);
	}
	else
	{
		CreateTextureEX("記事１", 200, 0, 0,"cg/bg/bg044_01_1_ワープロ文章_a.jpg");
		Fade("記事１", 500, 1000, null, true);
	}

	Wait(4000);


//イメージＢＧ//ＰＣ画面//ワープロソフト（ドットの荒さが目立つほど拡大）
//将軍＝謎の少女
//謎の少女＝殺人鬼、悪魔
//※↑の文章をアップで画面に表示
	CreateTextureEX("記事２", 200, 0, 0,"cg/bg/bg044_02_1_ワープロ文章_a.jpg");
	Fade("記事２", 500, 1000, null, true);

	SetVolume("サウンド１", 0, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800060ta">
「間違いない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800070ta">
「あの写真は、事件の予告メッセージみたいなものだったんだ」

そうじゃなきゃ、殺し方をあんなに忠実に再現できるはずがない。

あの女はまず合成写真を使って殺人現場を緻密にシミュレートした。
そうやって犯行を――あの女ならきっと犯行じゃなくて"芸術作品"と呼べって言いそうだ。

サイコっていうのはそういう人種だから――完璧なものにしようとしていたに違いない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800080ta">
「……頭がおかしいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800090ta">
「でもどうしてそれを僕に……。そもそもあの女は、ナイトハルトが僕だってどうやって知った？　僕の名前をどうやって知った？」

うう、どうしたらいいんだろう……。

あの悪魔は絶対近いうちに僕を殺しにくる。
名前やメルアドを知られているなら、住所もバレている可能性は高いんだから。

僕はイスの上で膝を抱え、顔を埋めた。
昨日見たあの常軌を逸した殺害方法。僕もあんなような殺し方をされると思うと、とても冷静じゃいられない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800100ta">
「死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない死にたくない――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("記事*");

	DelusionIn();

	Delete("ルーム");

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//ＶＦ//妄想セリフ（以下、星来のセリフはすべて）
//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800110se">
「だいじょうぶ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800120ta">
「え？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣデスクトップ画面
//星来フィギュアが置いてある

	BGMPlay360("CH07", 1000, 1000, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev012_01_1_星来横たわり_a.jpg");
	Fade("背景１", 500, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
星来たんが、ＰＣモニタの前に横たわって、僕に微笑みを向けていた。

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800130se">
「タッキー、あなたはこの部屋に引きこもってればいいんだよ。したら、あの悪魔だって手出しできないっしょ」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800140se">
「そのうちに、警察がうまく捕まえてくれるってぇ♪」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800150se">
「それまでは誰も信じちゃ駄目。誰の言葉にも耳を傾けちゃ駄目」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800160se">
「悪魔ってさ、人の心の隙間をついてくるのが好きなんだよね～。油断すんのはＮＯ！」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800170se">
「できるっしょ、タッキー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800180ta">
「でも、星来……」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800190se">
「逃げるが勝ちってよく言うし」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800200se">
「三次元のことなんてキレイさっぱり忘れちゃえばいいんさ。あなたには一切関係ないことだって思えば気が楽っしょ」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800210se">
「関係ないこと考えたってムダムダさ♪」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800220se">
「いいこと教えたげる。引きこもりって最強なんよ？　だって誰にも会わないっしょ。つまり誰にも攻撃されない。これぞ最強の自己防衛方法なわけさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800230se">
「だからタッキーは引きこもりになるべきなんさ。簡単っしょ♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800240ta">
「…………そ、そうかもしれない」

さすが僕の嫁。いいこと言う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	FadeDelete("背景１", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
僕はすっかり前向きになって、星来たんの細い腰をそっとつかんだ。僕が顔を近づけても、星来たんはイヤな顔ひとつせず微笑み続けている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800250ta">
「ありがとう、星来。おかげで勇気が出てきた」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800260ta">
「そうだよ、三次元なんてクソ食らえだ。あの悪魔だって、僕みたいなキモオタのことなんて気にもとめてないさ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800270ta">
「僕は安全だ。安心して毎日エンスーしたり好きなアニメを見てれば、なんの問題もないんだ」

//【星来】
<voice name="星来" class="星来" src="voice/ch01/00800280se">
「でもさっき言ったみたく、油断は禁物だゾ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800290ta">
「うん、分かってるよ」

誰も信じない。誰の言葉にも耳を傾けない。

三次元のすべてを警戒しろ。
そうすれば僕は大丈夫だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800300ta">
「星来にそこまで心配してもらえて、僕は幸せだなあ、ふひひ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00800310ta">
「さてと、それじゃ気分直しにエンスろうっと」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH07", 1000, 0, NULL);

	Wait(3000);



//	DelusionOut();

//ＳＥ//ハードデスク停止

}