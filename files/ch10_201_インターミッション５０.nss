//<continuation number="650">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_201_インターミッション５０";
		$GameContiune = 1;
		Reset();
	}

		ch10_201_インターミッション５０();
}


function ch10_201_インターミッション５０()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション５０
//ＢＧ//崩壊渋谷・道玄坂//昼・曇り

	IntermissionIn();

	DeleteAll();

	CreateTexture360("back10", 100, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");


	IntermissionIn2();

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 1000, 600, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ラジオから、キャスターがニュースを読み上げる深刻そうな声が聞こえてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

	CreateVOICE("キャスターＡ","ch10/20100010ka");
	SoundPlay("キャスターＡ",0,1000,false);

	SetBacklog("「現在までに確認された死傷者の数は２３３人ですが、この数は最終的に３万人を超えると見られ――」", "voice/ch10/20100010ka", キャスターＡ);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text200]
//ＶＦ//ラジオからの音声
//【キャスターＡ】
//<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch10/20100010ka">
「現在までに確認された死傷者の数は２３３人ですが、この数は最終的に３万人を超えると見られ――」

{	SoundStop2("キャスターＡ");
	CreateVOICE("キャスターＡ２","ch10/20100020ka");
	SoundPlay("キャスターＡ２",0,1000,false);
	SetBacklog("「気象庁の発表によりますと、今回の地震の規模は震度７、マグニチュードは７．８と、関東大震災に匹敵する規模です」", "voice/ch10/20100020ka", キャスターＡ);}
//【キャスターＡ】
//<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch10/20100020ka">
「気象庁の発表によりますと、今回の地震の規模は震度７、マグニチュードは７．８と、関東大震災に匹敵する規模です」

{	SoundStop2("キャスターＡ２");
	CreateVOICE("キャスターＡ３","ch10/20100030ka");
	SoundPlay("キャスターＡ３",0,1000,false);
	SetBacklog("「渋谷では建物の一部が倒壊し、大規模な陥没も発生している模様です」", "voice/ch10/20100030ka", キャスターＡ);}
//【キャスターＡ】
//<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch10/20100030ka">
「渋谷では建物の一部が倒壊し、大規模な陥没も発生している模様です」

{	SoundStop2("キャスターＡ３");
	CreateVOICE("キャスターＡ４","ch10/20100040ka");
	SoundPlay("キャスターＡ４",0,1000,false);
	SetBacklog("「首都高渋谷線が、高架の倒壊により全線通行止め」", "voice/ch10/20100040ka", キャスターＡ);}
//【キャスターＡ】
//<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch10/20100040ka">
「首都高渋谷線が、高架の倒壊により全線通行止め」

{	SoundStop2("キャスターＡ４");
	CreateVOICE("キャスターＡ５","ch10/20100050ka");
	SoundPlay("キャスターＡ５",0,1000,false);
	SetBacklog("「公共交通機関では山手線など全線が――」", "voice/ch10/20100050ka", キャスターＡ);}
//【キャスターＡ】
//<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch10/20100050ka">
「公共交通機関では山手線など全線が――」
{	$待ち時間 = RemainTime ("キャスターＡ５");
	$待ち時間 -= 1800;
	WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin10();//――――――――――――――――――――――――――――――

	SoundStop2("キャスターＡ５");
//ＳＥ//ザザーッとノイズ
	CreateSE("SE01","SE_日常_けい帯_のいず");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ニュースの声にノイズが混じったかと思うと、やがてうんともすんとも言わなくなってしまった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu克子_スーツ_通常","angry", 200, @+150);
	FadeStand("bu克子_スーツ_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100060mm">
「ダメだわ、また聞こえなくなった」

{	Stand("bu克子_スーツ_通常","sigh", 200, @+150);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);
	DeleteStand("bu克子_スーツ_通常_angry", 0, true);}
百瀬は、手にした古くさい携帯ラジオを振ったり手で叩いたりした後、大きくため息をついた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100070mm">
「古いから使い物にならないわねえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_sigh", 500, true);
	CreateTextureEX("back03", 500, 0, 0, "cg/bg/bg027_03_5_道玄坂_a.jpg");
	Fade("back03", 0, 1000, null, false);
	Stand("bu優愛_制服_武器構え","sad", 200, @+250);
	Stand("buあやせ_制服_武器構え","hard", 200, @-250);
	FadeStand("bu優愛_制服_武器構え_sad", 0, false);
	FadeStand("buあやせ_制服_武器構え_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
無理に苦笑いを浮かべ、横を見る。そこには、疲れた表情で歩く岸本あやせと楠優愛の姿があった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100080yu">
「…………」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100090ay">
「…………」

あやせも優愛も、着ている制服は土埃ですっかり汚れてしまっていて、ここまでいかに苦労して歩いてきたかがよく分かる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 300, 1000, null, true);
	DeleteStand("bu優愛_制服_武器構え_sad", 1, false);
	DeleteStand("buあやせ_制服_武器構え_hard", 1, true);
	Stand("st優愛_制服_武器構え","sad", 200, @+200);
	Stand("stあやせ_制服_武器構え","hard", 200, @-200);
	FadeStand("st優愛_制服_武器構え_sad", 0, false);
	FadeStand("stあやせ_制服_武器構え_hard", 0, true);
	Fade("back03", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601100]
だが、２人が揃って手にしている大振りの剣――ディソードは、埃ひとつついておらず、その冷厳な輝きはまったく曇っていない。

地震が起きた後、代々木から渋谷に徒歩で戻ってきた優愛とあやせは、その足でフリージアの事務所へと向かい、百瀬と合流することができた。

行方が分からなくなった判が戻ってくることを期待して、３人は
事務所――入っていた雑居ビルは地震の影響で傾き、今にも倒れ
そうだった――の近くで一夜を過ごした。

だが結局判は姿を見せなかった。

百瀬は渋谷から出ることを提案したが、それに反発したのがあやせだった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100100ay">
「グラジオールが目覚めたのよ。早く、他の黒騎士と合流しないと……」

そう主張して、優愛の手を強引に引っ張り、瓦礫に埋もれた渋谷中心部へ向かおうとした。
それで、やむなく優愛と百瀬も付いてきているのである。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("stあやせ_制服_武器構え_hard", 0, false);
	DeleteStand("st優愛_制服_武器構え_sad", 0, true);
	Stand("st克子_スーツ_通常","sigh", 200, @+200);
	FadeStand("st克子_スーツ_通常_sigh", 0, false);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100110mm">
「…………」

午前７時。
空が明るくなってまだ１時間も経っていない。

朝の清々しい空気など皆無だった。
夜の闇によって隠されていた惨状が、太陽の訪れとともに徐々に露わになってくる。今はまさに、その最中。

渋谷の街は、地獄絵図と化していた。

道路は寸断され、アスファルトが隆起し。

いくつかのビルは倒壊し、崩れ落ちた瓦礫が道の端を埋めている。ガラスはほとんどが割れ、本来ビルの屋上にあったはずの巨大な看板までが落下して、横たわっている。

少し歩けば、あちこちに遺体が倒れており、そのまま放置されている。

百瀬はそうした遺体を見るたびに、痛ましい気持ちになり、心の中でそっと手を合わせていた。

だがあまりに数が多すぎるため、途中からは考えないようにした。でなければ、百瀬自身の心が保ちそうになかった。

たまにすれ違う人たちは、表情を失い、重い足取りであてもなくさまよっているようだった。

男性たちが何人かで協力して、瓦礫に生き埋めにされた人たちを助け出そうとしていたが、重機もない状況ではどうすることもできないようだった。

百瀬は、優愛の手にしているものへと改めて目を向けた。

ディソード。

あやせからそう説明された。
なにもないところから魔法のように取り出すことのできる、剣。
判の言っていたことは本当だった。

優愛は、その剣を自分が持ち得たことに驚き、困惑しているようだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_武器構え","hard", 210, @-150);
	FadeStand("stあやせ_制服_武器構え_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100120mm">
「ねえ、岸本さん」

百瀬の呼びかけに、先を歩くあやせは振り向こうともしない。
その表情には焦りの色が見えた。

{	Stand("st克子_スーツ_通常","hard", 200, @+200);
	FadeStand("st克子_スーツ_通常_hard", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100130mm">
「このディソードを持つ人は、あなたたちを含めて全部で７人いる、っていうこと？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100140ay">
「……そうよ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100150mm">
「他の人たちがどこにいるのか、分かるの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100160ay">
「分からないわ」

{	Stand("st克子_スーツ_通常","sigh", 200, @+200);
	FadeStand("st克子_スーツ_通常_sigh", 300, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100170mm">
「だったら……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100180ay">
「感じるのよ。意志を」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100190ay">
「こっちで間違いないわ」

あやせはとりつく島もない。

百瀬は仕方なく、何度目になるか分からない言葉を繰り返すことにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","hard", 200, @+200);
	FadeStand("st克子_スーツ_通常_hard", 300, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100200mm">
「今、無闇に歩き回るのは危ないわ。ひとまず安全なところに避難するべきよ」

{	Stand("stあやせ_制服_武器構え","angry", 210, @-150);
	FadeStand("stあやせ_制服_武器構え_angry", 300, true);
	DeleteStand("stあやせ_制服_武器構え_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100210ay">
「ダメよ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100220ay">
「時間がないの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("st克子_スーツ_通常_hard", 0, false);
	DeleteStand("stあやせ_制服_武器構え_angry", 0, true);
	Stand("bu克子_スーツ_通常","normal", 200, @+250);
	FadeStand("bu克子_スーツ_通常_normal", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100230mm">
「もしかしたら、他の、ええと、黒騎士、だったかしら？　その人たちだって避難場所にいるかもしれないでしょう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","worry", 200, @-230);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100240yu">
「そ、そうですよ、岸本さん、あの、わたしも、避難場所に、行くべきだと……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("bu克子_スーツ_通常_normal", 0, false);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);
	Stand("stあやせ_制服_武器構え","hard", 210, @-150);
	FadeStand("stあやせ_制服_武器構え_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
と、その優愛の援護射撃が効いたのか、あやせがふと立ち止まった。
目を細める。

今や車が走ることもできなくなっている、道玄坂の荒れた道。
その先を見やった。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100250ay">
「いた」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","sigh", 200, @+150);
	FadeStand("st克子_スーツ_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604005]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100260mm">
「ええ？　いたって、なにが……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back20", 300, 0, 0, 1280, 720, "Black");
	DrawTransition("back20", 300, 0, 1000, 100, null, "cg/data/right2.png", true);

	DeleteStand("stあやせ_制服_武器構え_hard", 0, false);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);

	Stand("st七海_制服ダメージ_武器構え","lost", 200, @0);
	FadeStand("st七海_制服ダメージ_武器構え_lost", 0, true);

	DrawTransition("back20", 500, 1000, 0, 100, null, "cg/data/left2.png", true);
	Delete("back20");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
あやせの視線の先に、駅の方から歩いてくる、ひとりの少女の姿。

翠明学園の制服に身を包んでいるが、その制服はあやせや優愛以上にボロボロだった。

そして、十字架のごとき巨大な剣を左手だけで胸に抱えている。
足取りはおぼつかず、今にも倒れてしまいそうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服ダメージ_武器構え_lost", 500, true);
	Stand("st克子_スーツ_通常","angry", 200, @+150);
	FadeStand("st克子_スーツ_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100270mm">
「大変……っ」

{	DeleteStand("st克子_スーツ_通常_angry", 500, true);}
百瀬は身体を揺らしながら、その少女――西條七海へと駆け寄った。

七海の抱えているディソードが気になったものの、今は詮索することはやめ、その小柄な身体を支える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	Stand("bu克子_スーツ_通常","hard", 200, @+240);
	Stand("bu七海_制服ダメージ_武器構え","lost", 300, @-150);
	FadeStand("bu七海_制服ダメージ_武器構え_lost", 0, false);
	FadeStand("bu克子_スーツ_通常_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100280mm">
「大丈夫？　よく頑張ったわね、今、病院に連れていってあげるから。
気をしっかり持つのよ」

励ましの言葉をかける百瀬に、七海はぼんやりとした目を向けた。

//◆息も絶え絶え
//◆「バングル」と言おうとしている
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100290na">
「バ……グル……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100300mm">
「え？　なんて言ったの？」

//◆息も絶え絶え
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100310na">
「ナナの、バングル……どこ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("bu七海_制服ダメージ_武器構え_lost", 0, false);
	DeleteStand("bu克子_スーツ_通常_hard", 0, true);
	Stand("bu優愛_制服_通常左手下","worry", 200, @+250);
	Stand("buあやせ_制服_武器構え","hard", 200, @-250);
	FadeStand("bu優愛_制服_通常左手下_worry", 0, false);
	FadeStand("buあやせ_制服_武器構え_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
優愛とあやせも、百瀬に遅れて七海に駆け寄った。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100320yu">
「この子……西條くんの、妹さん、です……！」

//◆「なるほど、そうなのね」の意味の「そう」
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100330ay">
「そう」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100340ay">
「黒騎士の資格があるのもうなずけるわ。拓巳の妹なら」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, false);
	DeleteStand("buあやせ_制服_武器構え_hard", 0, true);
	Stand("bu克子_スーツ_通常","hard", 200, @+240);
	Stand("bu七海_制服ダメージ_武器構え","lost", 300, @-150);
	FadeStand("bu七海_制服ダメージ_武器構え_lost", 0, false);
	FadeStand("bu克子_スーツ_通常_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100350mm">
「２人とも、この子を運ぶのを手伝って。なんとか病院に連れて行かないと」

//◆苦しげ
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100360na">
「痛い……」

七海が苦しげにうめく。

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100370na">
「右手……う……う……」

{	Stand("bu克子_スーツ_通常","sigh", 200, @+240);
	FadeStand("bu克子_スーツ_通常_sigh", 300, true);
	DeleteStand("bu克子_スーツ_通常_hard", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100380mm">
「右手？」

何気なく七海の右手を見た百瀬は、ハッと息を呑んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆息を呑む
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100390mm">
「……っ」

{	Stand("bu克子_スーツ_通常","angry", 200, @+240);
	FadeStand("bu克子_スーツ_通常_angry", 300, true);
	DeleteStand("bu克子_スーツ_通常_sigh", 0, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100400mm">
「なんて、ひどい……。こんな……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back03", 500, 1000, null, true);
	DeleteStand("bu七海_制服ダメージ_武器構え_lost", 0, false);
	DeleteStand("bu克子_スーツ_通常_angry", 0, true);
	Stand("bu優愛_制服_通常左手下","worry", 200, @+250);
	Stand("buあやせ_制服_武器構え","hard", 200, @-250);
	FadeStand("bu優愛_制服_通常左手下_worry", 0, false);
	FadeStand("buあやせ_制服_武器構え_hard", 0, true);
	Fade("back03", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100410yu">
「え……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100420ay">
「…………」

優愛とあやせには、百瀬がなぜそれほど動揺するのか理解できない。七海の右手は、巻かれた包帯が血に染まってはいるが、それほど重傷には見えなかった。

だが百瀬の目には、包帯が巻かれた手首の部分で、七海の腕はすっぱりと切断されているものとして映っていた。

外科処置はされていたが、傷口が開いてしまっている。

あやせは無表情のまま、七海の右手、その指を握ろうとしてみた。
しかし差し出した手は、なにもつかまずにすり抜けてしまう。

ホログラム映像のように、七海の指には実体がない。
あやせの手に、紅く染まった包帯から血が一滴、したたり落ちた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下","shock", 200, @+250);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆ビックリしてブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100430yu">
「……っ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100440ay">
「妄想……」

//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100450na">
「梨深さんに……助けて……もらって……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100460yu">
「梨深さん、って、咲畑、梨深さん？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_武器構え_hard", 500, true);
	Stand("bu克子_スーツ_通常","hard", 190, @-250);
	FadeStand("bu克子_スーツ_通常_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100470mm">
「知ってるの？」

{	Stand("bu優愛_制服_通常左手下","worry", 200, @+250);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100480yu">
「え、ええ……。西條くんの、お友達の……」

優愛はずっと拓巳こそがニュージェネ事件の真犯人だと考えていたため、彼の身辺をかなり詳しく調べ尽くしていた。拓巳と接触する機会の多い人物――西條七海や咲畑梨深のことも、もちろん調査済みだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu克子_スーツ_通常_hard", 500, true);
	Stand("buあやせ_制服_武器構え","angry", 200, @-250);
	FadeStand("buあやせ_制服_武器構え_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602009]
一方、あやせも梨深の名を聞いて、いつもクールなその表情をわずかに険しくした。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100490ay">
「…………」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100500ay">
「咲畑梨深も、７人の黒騎士のひとりよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch10/20100510yu">
「え？　そ、そう、なんですか？」

あやせは、昨日の病院での出来事を思い出した。
そこで話しかけてきた梨深の、申し訳なさそうな声がよみがえる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 500, 0, NULL);

//以下、回想
//ＢＧ//ＡＨ東京総合病院・屋上庭園//夕方
	CreateColor("back15", 400, 0, 0, 1280, 720, "White");
	Request("back15", AddRender);
	Fade("back15", 0, 0, null, false);
	Fade("back15", 300, 1000, null, true);

	CreateColor("back11", 300, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back03", 200, 0, 0, "cg/bg/bg107_01_2_外来棟屋上_a.jpg");

	Stand("bu梨深_制服_通常","hard", 200, @+384);
	FadeStand("bu梨深_制服_通常_hard", 0, false);

/*森島・あやせパジャマ差分追加予定*/
	Stand("buあやせ_パジャマ_通常","hard", 250, @-384);
	FadeStand("buあやせ_パジャマ_通常_hard", 0, false);	

	Fade("back15", 300, 0, null, true);

	Wait(500);

	DeleteStand("buあやせ_制服_武器構え_angry", 0, false);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100520ri">
「岸本さん……」

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100530ri">
「タクに、近づかないで」

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100540ri">
「目覚めさせたく、ないの」

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100550ay">
「キミには自覚がないの？　黒騎士のひとりとしての」

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100560ri">
「あたしが、ひとりでなんとかするから」

{	Stand("buあやせ_パジャマ_通常","angry", 250, @-384);
	FadeStand("buあやせ_パジャマ_通常_angry", 300, true);
	DeleteStand("buあやせ_パジャマ_通常_hard", 0, true);}
//◆カッとなったブレス
//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100570ay">
「……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back12", 500, 0, 0, 1280, 720, "White");
	Request("back12", AddRender);
	Fade("back12", 0, 0, null, false);
//ＳＥ//ビンタ
	CreateSE("SE03","SE_衝撃_びんたされる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("back12", 0, 1000, null, true);

	Stand("bu梨深_制服_正面","sad", 200, @+384);
	FadeStand("bu梨深_制服_正面_sad", 0, false);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);

	FadeDelete("back12", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆痛くてブレス
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100580ri">
「…………」

//ＶＦ//回想セリフ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100590ay">
「とても美しいわ、その想いは。でもそれは“大いなる意志”の望むことじゃない」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch10/20100600ay">
「私も、望んでいないわ。あなたひとりに、すべてを背負わせるなんて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20100610ri">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//ＢＧ//崩壊渋谷・道玄坂//昼・曇り

	Fade("back15", 100, 1000, null, true);
	Delete("back03");
	Delete("back11");
	DeleteStand("bu梨深_制服_正面_sad", 0, false);
	DeleteStand("buあやせ_パジャマ_通常_angry", 0, false);

	Stand("bu克子_スーツ_通常","hard", 200, @+240);
	Stand("bu七海_制服ダメージ_武器構え","lost", 300, @-150);
	FadeStand("bu七海_制服ダメージ_武器構え_lost", 0, false);
	FadeStand("bu克子_スーツ_通常_hard", 0, true);

	CreateSE("SE10","SE_はいけい_崩壊しぶ谷_道玄坂_LOOP");
	MusicStart("SE10", 500, 600, 0, 1000, null, true);

	FadeDelete("back15", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100620mm">
「黒騎士云々の話は、今は置いときましょう」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100630mm">
「とにかく早く病院に連れて行かないと。血が止まらないわ」

百瀬は持っていたハンカチを七海の傷口にそっと添えた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch10/20100640mm">
「すごい熱だし、顔色も悪い。急がないと」

//◆苦しげ、泣く
//【七海】
<voice name="七海" class="七海" src="voice/ch10/20100650na">
「おにぃ……おにぃに、会いたいよぅ……」

七海の虚ろな瞳から、一筋の涙がこぼれる。

直後。
それは、唐突に起こった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//道路陥没
//ＢＧ//黒
	CreateVOICE("サウンド１","ch10/20100511yu");
	Request("サウンド１", Lock);
	CreateVOICE("サウンド２","ch10/20100601ay");
	Request("サウンド２", Lock);
	CreateVOICE("サウンド３","ch10/20100651na");
	Request("サウンド３", Lock);
	CreateVOICE("サウンド４","ch10/20100641mm");
	Request("サウンド４", Lock);

	MusicStart("サウンド１", 0, 1000, 0, 1000, null, false);
	MusicStart("サウンド２", 0, 1000, 0, 1000, null, false);
	MusicStart("サウンド３", 0, 1000, 0, 1000, null, false);

	Request("SE10", Lock);

	PrintBG(100);

	Request("サウンド１", UnLock);
	Request("サウンド２", UnLock);
	Request("サウンド３", UnLock);
	Request("サウンド４", UnLock);
	Request("SE10", UnLock);

	CreateSE("SE01","SE_衝撃_道路陥ぼつ");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	Shake("back*", 100, 0, 10, 0, 100, 1000, Axl2, false);
	WaitAction("back*", null);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	SetVolume("SE01", 10000, 0, NULL);
	SetVolume("SE02", 10000, 0, NULL);
	SetVolume("SE10", 3000, 0, NULL);

	Wait(500);
	MusicStart("サウンド４", 0, 1000, 0, 1000, null, false);

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
突然、百瀬たちが立っていた道路が轟音とともに崩壊した。

足場がなくなり、百瀬たち４人の身体は重力による自由落下を始める。

底のない奈落の暗闇へと落ちていくような。

そんな錯覚を感じて、百瀬は年甲斐もなく悲鳴を上げていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	DeleteAll();
	Wait(3000);

//■インターミッション５０終了
}

//■TypeBegin10
