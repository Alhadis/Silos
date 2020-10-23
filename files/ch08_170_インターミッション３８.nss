//<continuation number="330">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_170_インターミッション３８";
		$GameContiune = 1;
		Reset();
	}

		ch08_170_インターミッション３８();
}


function ch08_170_インターミッション３８()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション３８

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 2000, 0, true);
	SoundPlay("SE*",2000,0,false);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("梨深剣", 500, 0, 0, "cg/bg/bg240_01_6_chnディソード全体_梨深_a.jpg");

	Stand("st梨深_制服_武器構え","hard", 250, @0);
	FadeStand("st梨深_制服_武器構え_hard", 0, true);

	IntermissionIn2();

	Wait(1000);
	BGMPlay360("CH01", 2000, 1000, true);

//ＢＧ//ＫＵＲＥＮＡＩ会館ビル屋上//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
蒼井セナは、驚愕の思いで目の前の少女の顔を見つめていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("梨深剣", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
セナのディソードによる攻撃を難なく受け止めた、その翼のような剣は、明らかにディソードだ。

扱いに慣れていなければ、こうもタイミングよくセナの攻撃を受け止めることなどできない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("梨深剣", 1000, 0, null, true);
	Delete("梨深剣");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//以下、梢のセリフはすべて心の声
//ＶＦ//心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17000010ko">
「ふひゃー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17000020ko">
「咲畑しゃんもギガロマニアーックスだったのら～」

梢が、コンテナハウスの上から高見の見物をするかのように、セナたちを眺めていた。投げ出した足をブランブランと揺らしている。

ついさっき奇襲攻撃の邪魔をしたのに呑気なものだ、とセナは心の中で舌打ちした。

だが視線は、目の前にいる梨深の瞳からそらさない。
対する梨深は、思い詰めたような表情をしていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17000030ta">
「あ……あ……」

梨深の背後で、情けなくへたり込んでいる西條拓巳がうめき声を上げている。

セナの狙いはあくまで彼であり、梨深と戦うつもりなどなかった。ましてやディソードでの斬り合いなど、マンガやアニメじゃないんだし、およそ現実的ではない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000040sn">
「その男がなにをしたか、知っているのか」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000050sn">
「Ｉｒ２という公式を――」

{	Stand("st梨深_制服_武器構え","sad", 250, @0);
	DeleteStand("st梨深_制服_武器構え_hard", 500, false);
	FadeStand("st梨深_制服_武器構え_sad", 500, true);}
//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000060ri">
「知ってるよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	DeleteStand("st梨深_制服_武器構え_sad", 0, true);
	Stand("st梨深_制服_正面","sad", 250, @0);
	FadeStand("st梨深_制服_正面_sad", 0, true);
	Fade("回想フラッシュ", 500, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
セナの言葉は遮られた。
静かな、悲しそうな、だがはっきりとした答え。

それを聞き、セナはディソードを握る手に力をこめる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE04","SE_衝撃_衝撃音03");
	CreateSE("SE05","SE_じん体_動作_足_走る_LOOP");
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000070sn">
「それなら――！」

{	Stand("st梨深_制服_正面","hard", 250, @0);
	FadeStand("st梨深_制服_正面_hard", 200, false);
	DeleteStand("st梨深_制服_正面_sad", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000080ri">
「タクを覚醒させれば」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000090ri">
「もっと、大変なことになる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000100sn">
「その前に殺す」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000110ri">
「あなたには」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000120ri">
「無理だよ」

{	BGMPlay360("CH01", 2000, 0, false);}
話にならない、とセナは判断した。
居合いの構えを取る。

一方の梨深は、無造作に立っているだけ。

へたり込んだままの西條拓巳までの距離は、大股でおよそ５歩。３秒あれば決着を付けられる距離だ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000130sn">
「…………」

{	BGMPlay360("CH13", 2000, 1000, true);}
セナは躊躇せず、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE04", 0, 1000, false);
	Wait(500);
	SoundPlay("SE03", 0, 1000, false);
	Fade("背景２", 0, 1000, null, true);
	Fade("背景３", 0, 1000, null, true);
	Zoom("背景２", 1000, 1500, 1500, Axl2, false);
	Fade("背景２", 1000, 0, null, false);
	Wait(100);
	SoundPlay("SE05", 0, 1000, false);
	Zoom("背景３", 1000, 1500, 1500, Axl2, false);
	Fade("背景３", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
梨深に正面から突進した。

{	DeleteStand("st梨深_制服_正面_hard", 300, true);
	Stand("bu梨深_制服_正面","hard", 250, @0);
	FadeStand("bu梨深_制服_正面_hard", 300, true);}
彼女目がけて、ディソードを横凪ぎに払う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE06","SE_擬音_ディそーどかまえる");
	SoundPlay("SE06", 0, 1000, false);
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);
	Stand("bu梨深_制服_武器構え","hard", 250, @0);
	FadeStand("bu梨深_制服_武器構え_hard", 0, true);
	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
梨深はそれを、先ほどと同じように受け止めようとする。

だが――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	SoundPlay("SE05", 200, 0, false);
	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	SoundPlay("SE03", 0, 1000, false);

	CreateColor("色１", 500, 0, 0, 1280, 720, "#FFFFFF");
	DrawTransition("色１", 250, 0, 1000, 100, null, "cg/data/lcenter.png", false);
	Wait(50);
	Fade("色１", 200, 0, null, true);
	Delete("色１");

	Stand("bu梨深_制服_武器構え","sad", 250, @0);
	FadeStand("bu梨深_制服_武器構え_sad", 300, true);
	DeleteStand("bu梨深_制服_武器構え_hard", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000140ri">
「あっ！？」

{	DeleteStand("bu梨深_制服_武器構え_sad", 400, true);}
セナの一閃はフェイク。

{	Stand("buセナ_制服_武器構え青","angry", 200, @0);
	FadeStand("buセナ_制服_武器構え青_angry", 200, true);}
剣は梨深の剣と身体をすり抜けてしまう。

リアルブートを解いていた。

今のセナのディソードは、妄想でしかなく。

なににも触れられず。
なにも斬れず。
なにも殺せない。

けれどそれは狙い通り。
攻撃を受け止めるべく身構えていた梨深は、反応が遅れる。

その間に、セナはすでに梨深の横をすり抜け、拓巳まであと２歩と迫っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);
	Request("色１", AddRender);
	CreateColor("色２", 300, 0, 0, 1280, 720, "RED");
	Fade("色２", 0, 0, null, true);

	Fade("色１", 0, 800, null, true);
	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/lightn7.png", false);

	Stand("buセナ_制服_武器構え","angry", 200, @0);
	FadeStand("buセナ_制服_武器構え_angry", 500, true);
	DeleteStand("buセナ_制服_武器構え青_angry", 0, true);

	CreateSE("SE03","SE_衝撃_衝撃は_リアルぶーと");
	SoundPlay("SE03", 0, 1000, false);

	Wait(500);

	Fade("色２", 300, 0, null, false);
	Fade("色１", 700, 0, null, false);
	DrawTransition("色１", 700, 1000, 0, 100, null, "cg/data/zoom1.png", true);
	Delete("色１");
	Delete("色２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text103]
一瞬のうちに、再度リアルブート。

これで――！

拓巳の目は恐怖の色をたたえてセナに向けられており、
労せずしてリアルブートが完了する。

再び現実のものとなったディソードを、
拓巳の心臓へと穿とうとして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 500, 0, false);
	BGMPlay360("CH*", 200, 0, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601103]
//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000150ha">
「……セナ」

{	Stand("buセナ_制服_武器構え","sad", 200, @0);
	FadeStand("buセナ_制服_武器構え_sad", 300, true);
	DeleteStand("buセナ_制服_武器構え_angry", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000160sn">
「……！？」

視界の隅に、何者かの影がよぎる。
その声を聞いた瞬間、激しく動揺したセナは狙いを外し、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣がコンクリートを砕く音
	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	CreateSE("SE04","SE_擬音_ディそーど_コンクリート砕く");

	Move("buセナ_制服_武器構え_sad", 200, @100, @0, Dxl1, false);
	DeleteStand("buセナ_制服_武器構え_sad", 200, true);

	SoundPlay("SE03", 0, 1000, false);
	CreateColor("色１", 500, 0, 0, 1280, 720, "#FFFFFF");
	Shake("背景１", 200, 5, 5, 0, 0, 500, null, false);
	DrawTransition("色１", 100, 0, 150, 100, null, "cg/data/ncenter1.png", false);
	Wait(50);
	Fade("色１", 200, 0, null, false);

	Wait(300);
	Shake("背景１", 500, 0, 15, 0, 0, 500, null, false);
	SoundPlay("SE04", 0, 1000, false);

	Wait(1000);

	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
剣の切っ先は拓巳の足をかすめて、コンクリートに突き刺さった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_武器構え","sad", 200, @50);
	FadeStand("buセナ_制服_武器構え_sad", 600, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
セナはゆっくりと顔を上げ、

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000170sn">
「お、まえ……」

{	DeleteStand("buセナ_制服_武器構え_sad", 500, true);}
うなるような声を発した。

屋上の縁に。
沈みかけた夕陽を背景にして。
ひとりの男が幽鬼のように立っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//※波多野です
//※ＫＵＲＥＮＡＩ会館屋上はフェンスなしを想定していますが大丈夫でしょうか？
	Stand("st一成_浮浪者_通常","normal", 200, @0);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Fade("背景３", 0, 1000, null, true);
	FadeStand("st一成_浮浪者_通常_normal", 1000, false);
	Zoom("背景２", 2000, 1050, 1050, Dxl2, false);
	Fade("背景２", 2000, 0, null, false);
	Wait(100);
	Zoom("背景３", 2000, 1050, 1050, Dxl2, false);
	Fade("背景３", 2000, 0, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
顔色が悪く、土気色をしていて。

落ちくぼんだ目の中に、充血した瞳。

無表情のまま、うなだれている。

その姿を見た途端、セナは拓巳のことなどどうでもよくなった。

セナがずっと追い続けていた男。
憎しみの対象。

セナを捨て、
家族を裏切った男。

その男が、目の前にいる。

{	BGMPlay360("CH10", 3000, 700, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000180sn">
「ようやく、見つけた……っ」

セナは男の方へと足を踏み出し、
歯噛みし、こみ上げる憎悪をこらえる。
ディソードを構え直す。

さらに一歩、前へ。

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000190ha">
「どうしようもなかった……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000200ha">
「私は、お前の母さんを生け贄に捧げるしかなかったんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000210sn">
「黙れ……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000220ha">
「母さんの最期は、とても安らかなものだったよ。
だからセナ、安心してほしい」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000230ha">
「母さんのおかげで、素晴らしい実験結果が出た。
母さんは、世界のために役立ったんだ」

//【波多野】
<voice name="波多野" class="波多野" src="voice/ch08/17000240ha">
「お前も、母さんの功績を誇っていい」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000250sn">
「黙れよぉぉっ！！」

頭に血が上ったセナには、もはや男の姿しか目に入らない。

駆ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 500, 0, true);
	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);

	DeleteStand("st一成_浮浪者_通常_normal", 200, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Fade("背景３", 0, 1000, null, true);
	Fade("色１", 500, 1000, null, false);
//	Zoom("bu一成_浮浪者_通常_normal", 800, 2000, 2000, Axl2, false);
	Zoom("背景２", 500, 1500, 1500, Axl2, false);
	Fade("背景２", 500, 0, null, false);
	Wait(100);
	Zoom("背景３", 500, 2000, 2000, Axl2, false);
	Fade("背景３", 500, 0, null, true);

	Delete("背景２");
	Delete("背景３");

	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	CreateSE("SE04","SE_擬音_ディそーど_人を切る");
	SoundPlay("SE03", 0, 1000, false);
	Wait(400);
	SoundPlay("SE04", 0, 1000, false);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
一瞬だった。

セナはあっという間に距離を詰めると、
男の懐に飛び込み、
深々とディソードを突き刺していた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000260sn">
「はあっ、はあっ、はあっ」

それが、セナの念願だった。

この男を殺すためだけに、毎日のように渋谷を徘徊していた。
この男を殺す日のことを、ずっと夢見ていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 3000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000270sn">
「やっと……母さんの、仇を……」

剣を抜こうとした。
男から離れようとした。

{	BGMPlay360("CH22", 3000, 1000, true);
	CreateSE("SE03","SE_じん体_動作_のぞく");
	SoundPlay("SE03", 0, 1000, false);}
だが、剣は抜けず。
男が、セナを包み込むようにして、抱きしめてくる。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000280sn">
「よ、よせっ……気安く触るな……っ！」

全身が総毛立つ。
今さらそんなことをされても、おぞましいだけだ。

もうとっくの昔に、
セナと男の間にあった家族の絆は、断ち切れている。

それなのに、セナは、なぜか男を振り払えない自分に愕然となった。

温もり。
大きな胸。

父というリアルな存在感。
赤く染まっていくセナの手。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000290sn">
「わ、私は……」

//◆泣きそう
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000300sn">
「こんなの……っ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 500, 0, true);
	Fade("色１", 0, 1000, null, true);
	Wait(400);

//おがみ：音声同時に出す演出、音声ファイル合成依頼
//※以下の波多野と梨深のセリフ、同時に音を出すことって可能でしょうか？

//◆ささやき
//【波多野】
//<voice name="波多野" class="波多野" src="voice/ch08/17000310ha">
//「お前が、望んだ妄想だ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "「お前が、望んだ妄想だ」");
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	CreateVOICE("波多野","ch08/17000310ha");
	SoundPlay("波多野", 0, 1000, false);
	SetBacklog("「お前が、望んだ妄想だ」", "voice/ch08/17000310ha", 波多野);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//◆ささやき
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000320ri">
「あなたが、望んだ妄想だよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	Delete("テキスト１");

//※以上の波多野と梨深のセリフ、同時に音を出すことって可能でしょうか？
//おがみ：後で演出相談

	Fade("色１", 0, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000330sn">
「――――っ」

ささやかれて。
セナは悟った。

――デッドスポットに紛れ込んだエラー――

――精神攻撃――

――幻惑――

――妄想を読まれた――

しまった、と思ったときには遅かった。

バランスを崩し、男もろとも、屋上の縁から、身体が投げ出される――

８階下にある地面が、セナにはやけに遠くに見えた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ


	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);
	DelusionOut();

//■インターミッション３８終了

}