//<continuation number="830">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_156_妄想トリガー３５■";
		$GameContiune = 1;
		Reset();
	}

		ch08_156_妄想トリガー３５■();
}


function ch08_156_妄想トリガー３５■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１へ
//ネガティブ妄想→分岐２へ
//妄想しない→分岐３へ

if($妄想トリガー通過３５ == 0)
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
			$妄想トリガー３５ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３５ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３５ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー３５ == 2)
{
//☆☆☆
//分岐１
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionFakeIn();
	BoxDelete(0);

	CreateTextureEX("背景１", 200, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionFakeIn2();

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600010ri">
「…………」

{	CreateSE("SE02","SE_じん体_動作_すかーと裾まくり");
	SoundPlay("SE02", 0, 1000, false);}
と、背後で梨深が動く気配。
彼女の服の衣擦れの音が近づいてきて。

//◆寂しそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600020ri">
「だから……無視、しないでよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_抱く1");


//※※３６０以下
//ＣＧ//新規ＣＧ追加このへん？
//※※３６０以上
	CreateTexture360("抱きつき", 100, 0, 0, "cg/ev/ev116_01_6_梨深抱きつき_a.jpg");
	CreateTexture360("星来", 100, 0, 0, "cg/ev/ev116_01_6_梨深抱きつき_b.png");
	CreateTexture360("モニタ", 100, 0, 0, "cg/ev/ev116_01_6_梨深抱きつき_c.png");
	Request("モニタ", Smoothing);

//	Zoom("抱きつき", 0, 1100, 1100, null, true);
	Zoom("モニタ", 0, 1500, 1500, null, true);

	Move("モニタ", 0, -336, 0, null, true);
	Move("星来", 0, -80, 0, null, true);
	Move("抱きつき", 0, -112, 0, null, true);

	SoundPlay("SE03", 0, 1000, false);
	FadeDelete("背景１", 1000, false);

	Zoom("モニタ", 2000, 2000, 2000, Dxl1, false);
	Move("モニタ", 2000, 0, -96, Dxl1, false);
	Move("星来", 2000, 180, -96, Dxl1, false);
	Move("抱きつき", 2000, 0, -96, Dxl1, true);


//	Fade("星来", 0, 0, null, true);
//	Fade("モニタ", 1000, 1000, null, true);
//	Fade("抱きつき", 1000, 1000, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
振り返る間もなく、後ろから抱きつかれた。

フローラルな、優しい香りがする。

梨深の胸の柔らかい感触が、背中に当たっている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600030ri">
「寂しいよ、そういうことされると……」

どうやらまた僕は現実から逃避して、自分に都合のいい妄想を作り出したみたいだ。

そう考えると、欲情よりも虚しさを強く感じて、この妄想を楽しむことすらできなかった。

押し倒す代わりに、妄想の中だからこそ言える正直な気持ちをぶつけてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("モニタ", 13000, @0, @-144, AxlDxl, false);
	Move("抱きつき", 13000, @0, @-64, AxlDxl, false);
	Move("星来", 13000, @0, @-96, AxlDxl, false);

	FadeDelete("モニタ", 4000, false);

	BGMPlay360("CH11", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600040ta">
「僕だって、寂しかった。辛かったんだ……梨深がこの一週間、全然連絡くれなくて……」

背中から、ダイレクトに伝わってくる梨深の身体の動き。呼吸するたびに彼女の胸はかすかに上下して。当たり前だけど、梨深が生きていることを実感させてくれる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600050ri">
「うん、ごめん……。一緒にいてあげられなくて、ごめん」

梨深は、僕を抱きしめる腕にますます力を込めた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600060ri">
「あたしの中でも、まだ迷いがあって……どうしたらいいか、分からなくて……ちょっと、考えてみようと思って……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600070ta">
「……？」

迷いって、なんのこと？
いったいなんの話をしてるの？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600080ri">
「そもそもあたし、タクと一緒にいていいのかな、とか。このままの関係を続けるべきなのかな、とか」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600090ri">
「でも、でもね……このままじゃ……きっとダメなんだ。それじゃ、なにも救えない」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600100ri">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600110ta">
「あの……？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600120ri">
「ねえ、タク。あたしが最初に願ったのはさ、ひとつだけだった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600130ri">
「なのにどうして、人は……あたしは、際限なく望み続けちゃうんだろうね……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600140ri">
「あの空を見つけたときに、あたしは――」

//◆ブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600150ri">
「…………」

梨深がなにを言っているのか、分からない。

僕はなんて答えればいいか思いつかなくて。

沈黙が訪れる。

すぐ耳元で、梨深が息をするかすかな音が聞こえる。

そろそろオチがないとおかしいはずなのに、
沈黙が漂ったまま、なにも起こらない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateColor("色１", 300, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);


	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	BGMPlay360("CH*", 2000, 0, false);
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
もしかして、これって、妄想じゃないの？

そうと気付いた瞬間、一気に自分の身体に緊張が走った。

梨深が現実に抱きついてきている。
密着している。
そのことに、理性が吹っ飛びそうになる。

このまま押し倒しても、梨深は、許してくれるような気がする――

ゴクリと息を呑み、

//【星来】
<voice name="星来" class="星来" src="voice/ch08/15600160se">
「メールだよ～、ぼけなす♪」

{
	Fade("色１", 200, 1000, Axl1, false);
	Zoom("抱きつき", 200, 2000, 2000, Axl2, false);
	Move("星来", 200, @160, @0, Axl2, false);
	Zoom("星来", 200, 2000, 2000, Axl2, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600170ta">
「！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("抱きつき");
	Delete("星来");

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	CreateSE("SE02","SE_じん体_動作_足_蹴る_イス");
	Shake("抱きつき", 300, 5, 5, 0, 0, 500, null, false);
	
	SoundPlay("SE02", 0, 1000, false);
	FadeDelete("色１", 300, true);

	Stand("bu梨深_制服_通常","shock", 200, @50);
	FadeStand("bu梨深_制服_通常_shock", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600180ri">
「わ、今のなに？」

梨深が驚いたように身体を離した。
柔らかい感触が消えてしまう。

救われたような、残念なような、複雑な気持ちが僕の胸の中に広がった。

っていうか、梨深に星来たんの着信ボイスを聞かれちゃったよ。これはかなり恥ずかしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	PositiveHuman();

//妄想ＯＵＴエフェクトはナシ
//合流１へ
}


//=============================================================================//

if($妄想トリガー３５ == 1)
{
//☆☆☆
//分岐２
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	BoxDelete(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionIn2();

	Wait(1500);

	CreateSE("SE04","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE04",2000,500,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600190ri">
「ふ～ん、ああ、そうですか」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600200ri">
「そういう態度ならあたし、帰る。勝手にすれば」

{	CreateSE("SE02","SE_じん体_動作_座る七海");
	SoundPlay("SE02", 0, 1000, false);}
梨深が立ち上がる気配。
{	Wait(1000);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景２", 0, 1000, null, true);}
驚いて振り返ると、すでに彼女はドアの方へと身体を向けていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600210ta">
「ちょ、ちょ……」

慌てて呼び止めようとするけど、焦ってしまってうまく言葉が出ない。

と、梨深は立ち止まり、肩越しに振り向いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("背景１");

	Stand("st梨深_制服_通常","hard", 200, @100);
	FadeStand("st梨深_制服_通常_hard", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600220ri">
「妹さんのこと、心配？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600230ta">
「え……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600240ta">
「ど、どうして、それを」

僕はまだ、七海のことは一言も相談していないのに。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600250ri">
「独り言、ぶつぶつ言ってたから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600260ri">
「ねえ、あたしと妹さん、どっちが大事？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600270ta">
「…………」

{	SoundPlay("SE04",1000,0,false);
	BGMPlay360("CH04", 3000, 1000, true);}
うわあ……。最低な質問キター。

答えられるわけがないと分かってるくせに、そういう意地悪なことを聞く女っているよね。

自分のことしか考えていない。相手の気持ちなんて完全に無視ですか。

まさか現実にこの言葉を耳にするとは思わなかった。
こういうところが、三次元女の醜いところなんだ。

所詮、梨深もその程度の思考しかできない女だったっていうことか。

はっきり言ってがっかりだ。
少しでも梨深に心を許した僕がバカだった。

やっぱり三次元は二次元にはかなわない。
もう梨深と付き合うのもやめよう。

一気に梨深への興味を失った僕は、うんざりした想いでため息をついた。

もう引き留める気もなかった。
むしろさっさと出て行ってほしかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("st梨深_制服_通常_hard", 300, true);

	BGMPlay360("CH04", 1000, 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ところがそこで、梨深は予想外の行動に出た。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600280ri">
「答えて。あたしか、妹さんか、どっちか選んで」

{	CreateSE("SE04","SE_じん体_動作_手_らんどせる漁る");
	SoundPlay("SE04",2000,1000,false);
	BGMPlay360("CH01", 3000, 1000, true);}
カバンからおもむろに果物ナイフらしきものを取り出すと、彼女は自身の手首にそれを突きつけたんだ。

僕はあっけに取られ、それから恐怖を覚えて身を震わせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","lost", 200, @50);
	FadeStand("bu梨深_制服_正面_lost", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600290ri">
「あたしを選んで。あたしだけを見て」

それは脅しのつもり！？
これがこの女の本性だったのか！？
もしかしてとんでもないメンヘラだった！？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600300ri">
「お願い。あたしを見てよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600310ta">
「き、き、君はっ、僕だけを、見てくれてない、じゃないか！」

{	DeleteStand("bu梨深_制服_正面_lost", 500, true);}
ついマジレスしてしまった。
メンヘラの脅迫なんてスルー推奨なのに。
後悔したけど、もう遅い。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600320ri">
「見てるよ」

梨深の声が、ひどく冷たく聞こえる。
その目が、血走っている。
口許には、嘲るような笑み。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600330ri">
「だから邪魔者は排除するの。あなたの妹をさらったのも、あたしだし」

ウソだ……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600340ri">
「タクに選んでもらうためなら、
あたし、こんなことだって、するよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","lost", 200, @50);
	FadeStand("bu梨深_制服_正面_lost", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
そして梨深は。
手首に押しつけたナイフを、
ゆっくりと、横へ引いた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600350ta">
「や、やめろ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_じん体_血_噴きでる_包丁でさされ");
	Stand("bu梨深_制服_正面血まみれ","lost", 200, @50);

	SoundPlay("SE04",0,1000,false);

	Wait(1000);
	FadeStand("bu梨深_制服_正面血まみれ_lost", 0, true);
	DeleteStand("bu梨深_制服_正面_lost", 0, true);

	Wait(1000);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*",0,0,false);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	DelusionOut();

	DeleteStand("bu梨深_制服_正面血まみれ_lost", 0, true);

	Delete("背景２");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

//ＢＧ//ＰＣ画面

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600360ri">
「え？　やめろって、なにが？」

気が付くと僕の視界の正面には、ＰＣモニタがあった。
梨深の不思議そうな声が、背後から聞こえてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Fade("背景２", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
慌てて振り返ると、彼女はソファに座ったままだった。手にはマンガ本を持ち、キョトンとした顔を僕に向けている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600370ri">
「タク？　顔色悪いけど、どうかしたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600380ta">
「あ、ううん……」

なんだ、妄想か……。
すごく焦った。

{	Fade("背景１", 0, 1000, null, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch08/15600390se">
「メールだよ～、ぼけなす♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600400ta">
「！？」

{	Stand("bu梨深_制服_通常","shock", 200, @50);
	Fade("背景１", 0, 0, null, true);
	FadeStand("bu梨深_制服_通常_shock", 200, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600410ri">
「わ、今のなに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600420ta">
「あ、いや……」

梨深に星来たんの着信ボイスを聞かれちゃったよ。これはかなり恥ずかしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("背景１");

//合流１へ
}


//=============================================================================//

if($妄想トリガー３５ == 0)
{
//☆☆☆
//分岐３


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600430ri">
「おーっと。ここまで言ったのになおも無視しますか」

{	CreateSE("SE04","SE_じん体_動作_座る七海");
	SoundPlay("SE04",0,1000,false);}
梨深が勢いよく立ち上がる気配。

{	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	SoundPlay("SE01",1000,0,false);
	Fade("背景２", 0, 1000, null, true);}
そのまま僕の方へ寄ってくると、テーブルの横に立て掛けてあったオモチャのディソードをおもむろに手に取った。

戸惑っている僕に構わず、梨深はそれを上段に構える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("背景１");

	CreateSE("SE04","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE05","SE_にん間_動作_手_はたく");
	CreateSE("SE06","SE_にん間_動作_手_はたく");

	Stand("bu梨深_制服_通常","angry", 200, @50);
	FadeStand("bu梨深_制服_通常_angry", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch08/15600770ri">
<voice name="梨深" class="梨深" src="voice/ch08/15600440ri">
「そんなタクには、こうだー！」

{	DeleteStand("bu梨深_制服_通常_angry", 200, false);
	SoundPlay("SE04",0,1000,false);}
そして剣を振り下ろしてきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600450ta">
「ちょ……！」

{	SoundPlay("SE06",0,1000,false);
	Wait(300);
	SoundPlay("SE05",0,1000,false);}
もちろん本気じゃなくて、冗談めかした態度だったけど、剣の先端で背中をつつかれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE04","SE_衝撃_せ中を押される");
	CreateSE("SE05","SE_衝撃_せ中を押される");

	Stand("bu梨深_制服_通常","happy", 200, @50);
	FadeStand("bu梨深_制服_通常_happy", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch08/15600760ri">
<voice name="梨深" class="梨深" src="voice/ch08/15600460ri">
「えいっ、うりゃー。あはは」

{	Shake("背景２", 200, 2, 2, 0, 0, 500, null, false);
	SoundPlay("SE04",0,800,false);
	Wait(300);
	SoundPlay("SE05",0,800,false);}
さらに、頭をコツコツと叩かれ、僕が嫌がって手で振り払おうとしてもそれを巧みに避ける。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600470ri">
「ねえねえ、もっと楽しいことしようよー」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600480ri">
「じゃないと本気で斬っちゃうぞ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600490ta">
「え、と……た、楽しいこと、って？」

梨深は僕の首を袈裟切りに斬りつけている途中で、少し考え込む。

{	Stand("bu梨深_制服_通常","rage", 200, @50);
	FadeStand("bu梨深_制服_通常_rage", 200, true);
	DeleteStand("bu梨深_制服_通常_happy", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600500ri">
「うーん、じゃあ、ゲームとか。ほら、タクは得意でしょ？」

{	Stand("bu梨深_制服_通常","normal", 200, @50);
	FadeStand("bu梨深_制服_通常_normal", 200, true);
	DeleteStand("bu梨深_制服_通常_rage", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600510ri">
「対戦ゲームしようよ。あたし、そういうのやったことないから、いろいろ教えてほしいな」

残念ながら僕が持っているゲームは、エンスーかエロゲーだけだ。どっちも対戦はできない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600520ta">
「む、無理だよ、ソフトが、なくて……」

{	Stand("bu梨深_制服_正面","sad", 200, @50);
	FadeStand("bu梨深_制服_正面_sad", 300, false);
	DeleteStand("bu梨深_制服_通常_normal", 300, false);}
剣の切っ先をつかみ、身体から離す。
梨深は不満そうに唇を尖らせ、その剣を元の位置に戻した。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600530ri">
「だって、せっかく久しぶりに会えたのに……」

そう言ってくれる気持ちは嬉しいけど……。
それでもやっぱり今は、梨深と楽しく過ごそうっていう気分にはなれないんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume360("SE01", 200, 0, null);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	DeleteStand("bu梨深_制服_正面_sad", 0, true);
	Fade("背景１", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【星来】
<voice name="星来" class="星来" src="voice/ch08/15600540se">
「メールだよ～、ぼけなす♪」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600550ta">
「！？」

{	Stand("bu梨深_制服_通常","shock", 200, @50);
	Fade("背景２", 0, 1000, null, true);
	FadeStand("bu梨深_制服_通常_shock", 200, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600560ri">
「わ、今のなに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600570ta">
「あ、いや……」

梨深に星来たんの着信ボイスを聞かれちゃったよ。これはかなり恥ずかしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Delete("背景１");

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

//合流１へ
}


//=============================================================================//

//☆☆☆
//合流１

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	DeleteStand("bu梨深_制服_通常_shock", 0, true);
	Fade("背景１", 0, 1000, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
メールソフトを開くと、チャットルームに入ってこいという内容のメールが３通ほどグリムから来ていた。

そう言えば最近、グリムとチャットしてないなあ。以前は毎日のようにオンラインで会っていたのに。

エンスーも控えていたから、もう１０日近く話していない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（チャット画面）
//ウェブＣＨＡＴ開始

	ChatMain(420,-54,"002");
	Fade("box01", 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_ちゃっと_参加音");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
ナイトハルトさんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
ナイトハルト：おっす
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
グリム：やあナイトハルトくん
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
グリム：お待ちしておりました
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
グリム：新しい乳毛だお！(｀・ω・´)
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
ナイトハルト：お前はなにを言っているんだ（ＡＡ{#TIPS_ＡＡ = true;$TIPS_on_ＡＡ = true;}略
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：ニュージェネだよニュージェネ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
ナイトハルト：なんでニュージェネが乳毛なんだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
グリム：NEW GENERATION→NEW GE→にゅうげ→乳毛
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
グリム：分かるだろ、常識的に考えて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
グリム：それより、第７の事件だ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//ウェブＣＨＡＴ終了
	SoundPlay("SE*",2000,0,false);
	BGMPlay360("CH01", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600580ta">
「……！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600590ri">
「どうしたの？」

息を呑んだ僕の声に気付いたのか、梨深が立ち上がって歩み寄ってきた。

僕の後ろから、ＰＣモニタをのぞき込む。

//◆呆然
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600600ri">
「『第７の事件』……」

また、起きた。
またニュージェネだ。

いったい、いつまで続くんだ。
僕が殺されるのは次か？　その次か？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Stand("bu梨深_制服_正面","sad", 200, @50);
	Fade("box01", 200, 0, null, false);
	Fade("背景２", 200, 1000, null, true);
	FadeStand("bu梨深_制服_正面_sad", 200, true);
	Delete("box01");

	$TIPS_on_ＡＡ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600610ri">
「タク……気にすることないよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600620ri">
「なにも怖いことなんてない」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600630ri">
「タクは、狙われたりなんかしない」

{	Stand("bu梨深_制服_通常","normal", 200, @50);
	FadeStand("bu梨深_制服_通常_normal", 300, false);
	DeleteStand("bu梨深_制服_正面_sad", 300, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600640ri">
「全部、タクの被害妄想。ね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600650ta">
「…………」

なんの根拠もない励ましだ。
それじゃ僕の心は安らがないよ、梨深。

それにしても、グリムはまるでニュージェネ事件の広報担当みたいだ。
いちいち僕に報せてくる。

今も、わざわざニュースサイトなど複数のリンクを貼り付けてきていた。

見ろ、ということらしい。

やむなくそのリンクをクリックし、きつく唇を噛む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面（ネット画面）
	DeleteStand("bu梨深_制服_通常_normal", 0, true);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");

	Wait(3000);

	CreateSE("SE00","SE_衝撃_衝撃音02");
	SoundPlay("SE00", 0, 1000, false);

	#bg183_01_3_PC画面ZACO‐DQN_a=true;
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg183_01_3_PC画面ZACO-DQN_a.jpg");
	WaitKey();

	#bg183_02_3_PC画面ZACO‐DQN_a=true;
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	CreateTexture360("背景１", 100, 0, 40, "cg/bg/bg183_02_3_PC画面ZACO-DQN_a.jpg");
	WaitKey();

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Move("背景１", 500, @0, @-176, Dxl2, true);
	WaitKey();

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Move("背景１", 500, @0, @-176, Dxl2, true);
//	WaitKey();

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
//以下、ネット記事文章ですが、イメージＢＧ指定がないのでテキストで括り、コメントアウト
//※以下、ネットの記事の見出し
ニュージェネ７ｔｈ事件は通称『ＤＱＮパズル』

//※以下、ネットの記事
４日午前４時５０分ごろ、東京都渋谷区の線路沿い鉄柱で、何者かによって殺害されたと見られる３人の男性の遺体が発見された。殺されたのは無職藤田耕平さん（１９）、大学生安沢三郎さん（２０）、とび職鷹木了さん（１９）。
警察の調べによると、３人の遺体は胴体の部分で上半身と下半身とに分断されており、またその裂傷痕は刃物で切断したような鋭利な切り口ではなかったという。
さらに上半身と下半身は別々の組み合わせへとその主を替え、丈夫な糸で縫いつけられていた。
３人の額にはそれぞれ“Ｄ”“Ｑ”“Ｎ”と読める傷が付けられており、この言葉が犯人からのなんらかのメッセージなのではないかと見て警察で捜査を続けている。
インターネットの大型匿名掲示板『＠ちゃんねる』では、事件の報道を待たずして何者かによって同事件現場の写真が流出されており、早くも“ニュージェネレーションの狂気”通称ニュージェネの第７の事件として“認定”。上半身と下半身が組み替えられていたことから『ＤＱＮパズル』と命名された。ちなみに＠ちゃんねるにおいてＤＱＮは“一般常識のない人”という意味で使われている。
一連のニュージェネ事件に関連して、被害者遺族が＠ちゃんねるの一部モラルのない書き込みに対して法的手段を取る動きが出てきており、ネット上でも賛否両論だ。

１５時２７分配信　ZACOZACO
//※以上、ネットの記事
//以上、ネット記事文章ですが、イメージＢＧ指定がないのでテキストで括り、コメントアウト
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTexture360("背景９", 2000, center, middle, "SCREEN");
	CreateBoard(0,0);

//おがみ：フォント調整
//<FONT size="34" incolor="#ff0000"><SPAN value=32>

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text900]
　　　<FONT size="32" incolor="#ff0000"><SPAN value=30>【ニュージェネ】渋谷で胴体分断された３人の遺体「額にＤＱＮ」★３</SPAN></FONT>
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TitleBoard("【3:950】");
	TypeBoard(500,null);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text901]
<FONT incolor="#0000ff"><U>946</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:29:24  <FONT incolor="#0000ff"><U>ID:</U></FONT>TtIxacRy8
新しい乳ジェネｋｔｋｒ！！！
　
　
<PRE>＜◎＞　＜◎＞</PRE>　その目だれ（ｒｙ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text902]
<FONT incolor="#0000ff"><U>947</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:29:50  <FONT incolor="#0000ff"><U>ID:</U></FONT>wZGbSvjkO
ちょｗｗｗＤＱＮてｗｗｗ
事件との関係性なんてあるワケねーだろｗｗｗ
警察バカスｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text903]
<FONT incolor="#0000ff"><U>948</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［sage］ ：200X/11/4(火) 16:30:48  <FONT incolor="#0000ff"><U>ID:</U></FONT>MOsurvPq0
<FONT incolor="#0000ff"><U><PRE>>></PRE>920</U></FONT>
　
ＤＱＮ嫌いな漏れ達の仕業だとでも言いたいのか？
つか下半身が別々ってまさに死体パズルだな
漏れも上半身を池麺と入れ替えたいおｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//※池麺＝イケメン。わざとです

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text904]
<FONT incolor="#0000ff"><U>949</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:31:22  <FONT incolor="#0000ff"><U>ID:</U></FONT>KnYohrpd0
そろそろエスパー西條に犯人突き止めてもらえよｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	FadeDelete("背景９", 0, true);

	WaitKey();

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text905]
<FONT incolor="#0000ff"><U>950</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 17:41:59  <FONT incolor="#0000ff"><U>ID:</U></FONT>Hmaeicj30
<PRE>乳毛速報だクマ(ll´（エ）｀ll)
　
乳毛その１＠集団ダイブ　ﾉﾉﾉ---(ollllll´▽｀)oﾉ
乳毛その２＠妊娠男　＼(||｀□´||;;＼)
乳毛その３＠張り付け　†l†l(＠□＠)l†l†
乳毛その４＠ヴァンパイ屋ξ--（;￣ξ￣;)---ξ
乳毛その５＠ノータリン　ヘ（´ρ｀）ノ~
乳毛その６＠美味い手　Ψ(Q^； )Ψ
乳毛その７＠ＤＱＮパズル　(ﾟ∀｡)ﾉ・ω・)ﾉA` )ﾉ
乳毛その？＠……to be continued!!!(゜ロ)ギョェ</PRE>
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


	CreateTexture360("背景９", 100, center, middle, "SCREEN");
	EndBoard();

//ＢＧ//ＰＣ画面（テレビニュース）
//おがみ：ニュース画面なし？
//徒歩：なんちゅうていさんに交渉中

	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg213_01_6_ニュースDQNパズル_a.jpg");

	CreateMovie360("砂嵐", 200, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);
	SoundPlay("SE02", 0, 1000, true);

	Wait(500);

	Fade("背景２", 0, 1000, null, true);
	SetVolume("SE02", 100, 0, NULL);
	Fade("砂嵐", 100, 0, null, true);
	Delete("背景１");
	Delete("砂嵐");
	Delete("背景９");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600660ka">
「今日午前４時５０分頃、東京都渋谷区の線路沿いで、男性３人の他殺死体が鉄柱につり下げられているのを、通りかかった新聞販売員の男性が発見しました」

//◆「ふじた・こうへい」「あんざわ・さぶろう」「たかぎ・りょう」
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600670ka">
「警察の調べによりますと、殺されたのは、いずれも渋谷区に住む、無職、藤田耕平さん、大学生の安沢三郎さん、とび職の鷹木了さん、の３人です」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600680ka">
「３人とも胴体の部分が切断され、それぞれの上半身と下半身が別々に入れ替えられて、糸で縫合されていました」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600690ka">
「３人の額にはそれぞれ謎の傷が付けられており、警察では犯人からのメッセージではないかと見て、調べています」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600700ka">
「渋谷では、２ヶ月ほど前から猟奇殺人事件が頻発しており、警察では今回の事件も同一犯による犯行の可能性が高いと見て、捜査を続けています」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面パンして拓巳の視線をさまよわせる

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CubeRoom4("ルーム", 100, 0);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("ルーム", 500, 1000, AxlDxl, true);
	Rotate("ルーム", 600, @5, @5, @0, AxlDxl, true);
	Rotate("ルーム", 800, @-10, @-10, @0, AxlDxl, true);
	Rotate("ルーム", 600, @10, @5, @0, AxlDxl, true);
	Rotate("ルーム", 800, @-5, @0, @0, AxlDxl, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
最後に見た動画ニュースに、被害者３人の顔写真が映し出されていた。

僕は、
その顔に、
見覚えがあった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600710ta">
「あ、あいつらだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600720ri">
「知ってるの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600730ta">
「き、昨日……僕に、か、絡んできた……」

僕は財布を差し出して、
でも暴力を振るわれて、

意識を失って、
気が付いたら、そこにこずぴぃがいて、

彼ら３人は血まみれで倒れてた……。

自分の財布をポケットから出して、まじまじと見つめてみる。

これは、僕が気が付いたとき、こずぴぃが持っていて、返してくれた。

もしかして、あの３人を殺したのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//梢・ディソード顕現
//フラッシュバックで一瞬表示
	CreateSE("SE回想in","SE_衝撃_衝撃音02");

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	SoundPlay("SE回想in",0,1000,false);
	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("背景３", 100, 0, middle, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("背景３");
	Delete("ルーム");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
いや、違う。

あのとき、僕が最後にあの３人を見たとき、確かに顔は変形して血まみれだったけど、胴体が切断されていたりなんかしなかった。

あの３人が殺されたのは、僕とこずぴぃが立ち去った後……。

やっぱり『将軍』だ。
あいつが、あのじいさんが、僕を挑発しているんだ……！

くそぅ、どこまで僕を精神的に追い詰める気だ……。

吐きそうな気分になった。胃がきりきりと痛み、お腹を手で押さえる。

次か？
この次こそ僕が殺されるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＰＣ画面が消えて真っ暗に

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*",0,0,false);

	CreateSE("SE10","SE_擬音_妄そうOUT");
	SoundPlay("SE10", 0, 600, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 50, 0, 800, 100, null, "cg/data/lcenter2.png", true);
	DrawTransition("色１", 50, 800, 1000, 100, null, "cg/data/tlcenter.png", true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("色１", 0, 1000, null, true);
	Fade("背景１", 0, 1000, null, true);
	Stand("bu梨深_制服_正面","normal", 200, @50);
	FadeStand("bu梨深_制服_正面_normal", 0, true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Wait(1000);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
//◆しゅーりょー＝終了
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600740ri">
「しゅーりょー」

と、僕の後ろから伸びてきた手が、モニタの電源スイッチを押した。画面が真っ暗になる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 500, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601026]
//◆優しく
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600750ri">
「落ち着いて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600760ri">
「気にすることないよ」

{	Stand("bu梨深_制服_正面","smile", 200, @50);
	FadeStand("bu梨深_制服_正面_smile", 200, true);
	DeleteStand("bu梨深_制服_正面_normal", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600770ri">
「ただの偶然だって、きっと」

どうして梨深はそんなに脳天気なんだ……。
これだけ偶然が重なることなんてあり得ないよ。

{	Stand("bu梨深_制服_通常","normal", 200, @50);
	FadeStand("bu梨深_制服_通常_normal", 200, false);
	DeleteStand("bu梨深_制服_正面_smile", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600780ri">
「それより、お腹すいちゃった」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600790ri">
「ねえ、あたしが行きつけのお店があるんだけど、そこにごはん食べにいかない？」

{	Stand("bu梨深_制服_通常","smile", 200, @50);
	FadeStand("bu梨深_制服_通常_smile", 200, true);
	DeleteStand("bu梨深_制服_通常_normal", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600800ri">
「安くておいしいんだよ。あたしが保証する」

{	Stand("bu梨深_制服_通常","happy", 200, @50);
	FadeStand("bu梨深_制服_通常_happy", 200, true);
	DeleteStand("bu梨深_制服_通常_smile", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600810ri">
「まあ、お客さんはオジサンが多いから、あたしみたいのがひとりで行くのはちょ～っと恥ずかしい、けどね」

{	Stand("bu梨深_制服_通常","normal", 200, @50);
	FadeStand("bu梨深_制服_通常_normal", 200, true);
	DeleteStand("bu梨深_制服_通常_happy", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600820ri">
「あ、それと、駅の中に入らなくちゃいけないんだった。渋谷駅の構内にあるから」

{	Stand("bu梨深_制服_通常","smile", 200, @50);
	FadeStand("bu梨深_制服_通常_smile", 200, true);
	DeleteStand("bu梨深_制服_通常_normal", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/15600830ri">
「ちなみに山手線内回りと外回りのホーム、どっちにもあるんだけど、あたしは断然内回りの方が好き」

{	DeleteStand("bu梨深_制服_通常_smile", 500, true);}
食事……か。

とてもそんな気分にはなれないよ……。

のど元にナイフを突きつけられているかのような感覚。

“いつでもお前を殺せるんだよ”と宣告されているかのような感覚。
もう、許してよ。

僕がなにをしたって言うんだ。
こんなの、いい加減うんざりだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	Wait(1500);


}