//<continuation number="540">


chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_170_梨深編_インターミッションＲ１";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_170_梨深編_インターミッションＲ１();
}


function chr_170_梨深編_インターミッションＲ１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//ch08_169_妄想トリガー３９■.nss から

	$SYSTEM_last_text="第９章";

	if(Platform()!=100){
		Save(9999);
	}

//――――――――――――――――
//■第９章【アニマの像】
//■インターミッションＲ１
//章タイトルアイキャッチ
	ChapterIn("dx/mvL.avi");

		Request("インターミッション色", UnLock);
		Request("インターミッションムービー１", UnLock);
		FadeDelete("インターミッション色", 0, false);
		FadeDelete("インターミッションムービー１", 0, true);

		Delete("背景*");
		Delete("色*");
		SetVolume360("CH*", 2000, 0, true);
		SoundPlay("SE*",2000,0,false);

		CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
		Stand("stセナ_制服_武器構え","angry", 250, @0);
		FadeStand("stセナ_制服_武器構え_angry", 0, true);

	ChapterIn2();

	Wait(1000);
	BGMPlay360("CH01", 2000, 1000, true);

//※梨深視点
//ＢＧ//ＫＵＲＥＮＡＩ会館ビル屋上//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
あたしのディソードを見て、蒼井さんが目を見開いている。

蒼井さんの一閃はなかなか鋭かったけど、それを受け止めることは容易だった。

ディソード同士が共鳴している。
甲高い音が響く。

蒼井さんの負の感情――怒りと憎しみ――が、
ディソードを通して伝わってくる。

//以下、梢のセリフはすべて心の声
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17000010ko">
「ふひゃー」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17000020ko">
「咲畑しゃんもギガロマニアーックスだったのら～」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17000030ta">
「あ……あ……」

あたしの背後で、タクが呆然とへたり込んでいる。
あの状態じゃ、タクだけ逃がすのは絶望的。
蒼井さんをなんとか追い払うしかない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000040sn">
「その男がなにをしたか、知っているのか」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000050sn">
「Ｉｒ２という公式を――」

//◆悲しそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17000060ri">
「知ってるよ」

{	CreateSE("SE03","SE_擬音_ディそーど_空を切る1");
	SoundPlay("SE03", 0, 1000, false);
	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Fade("回想フラッシュ", 500, 0, null, true);}
蒼井さんの言葉を遮った。
その公式の名を、タクに聞かせたくなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17000070sn">
「それなら――！」

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

蒼井さんは攻撃的だけど、ディソードの使い方について勘違いしている。

あまりにも直線的。あまりにも直情的。

この剣を剣として使ったって、そんなのただのチャンバラごっこにしかならない。

剣の扱いについてちゃんと訓練を受けた人ならともかく、ただの女子高生が剣を振り回すだけなら、どうってことない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn01/01700010sn">
「西條は死ぬべき男だ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn01/01700020sn">
「この世に災厄を振りまいたんだから」

蒼井さんは憎しみに凝り固まっている。
その負の妄想が、あたしには見える。

彼女から溢れ出す負の妄想は、黒い靄となって、あたしのデッドスポットに強制的に突き刺さってくる。

きっと蒼井さんはそれを意識してやっていない。

蒼井さん相手だから、見えるわけじゃない。

これはギガロマニアックスの特異な性質。
人間相手なら、その感情のうねりを視覚化できる。
他人の感情を見ることができる。

あたしは脳裏を侵すように強制的に浮かび上がってくる、その映像に意識を傾けた。
蒼井さんを今、憎しみに駆り立てている感情。記憶。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_妄そうIN");
	SetVolume360("CH01", 1000, 0, null);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "BLACK");
	Fade("回想フラッシュ", 0, 0, null, true);
//	Request("回想フラッシュ", SubRender);
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("回想フラッシュ", 100, 1000, null, true);

	XBOX360_LockVideo(true);

//ＣＧ//マジックミラー波多野//セナがいるver
//画面エフェクトで周囲に黒い靄があったり映像が若干乱れてたり妄想エフェクトも付けてください
	CreateTextureEX("背景２", 500, 0, 0, "cg/ev/ev063_01_1_マジックミラー波多野_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

//	Request("消滅", Play);

	XBOX360_LockVideo(false);

	CreateMovie360("消滅", 2000, center, middle, true, true, "dx/mv砂嵐.avi");
	Fade("消滅", 0, 700, null, true);

	DrawTransition("回想フラッシュ", 2000, 1000, 500, 200, null, "cg/data/effect.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
見える。

彼女の苦しみと哀しみ。

彼女をさいなむ過去の記憶。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//ＫＵＲＥＮＡＩ会館屋上//夕方


	DrawTransition("回想フラッシュ", 100, 500, 1000, 200, null, "cg/data/effect.png", true);
	Delete("背景２");
	Delete("レンズ*");
	Delete("消滅");

	CreateSE("SE10","SE_自然_風音_強_LOOP");
	MusicStart("SE10",0,1000,0,1000,null,true);

	Fade("回想フラッシュ", 3000, 0, Axl1, true);
	Delete("回想フラッシュ");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
その記憶を、逆に利用して――

あたしは蒼井さんをにらみつけた。
妄想する。
彼女の心の傷を抉るような、偽りの光景を作り出す。

{	Stand("stセナ_制服_武器構え","sad", 250, @0);
	FadeStand("stセナ_制服_武器構え_sad", 300, true);
	DeleteStand("stセナ_制服_武器構え_angry", 0, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn01/01700030sn">
「……っ！？」

{	DeleteStand("stセナ_制服_武器構え_sad", 500, true);}
蒼井さんが、ビクッと身を震わせた。
構えていた剣をのろのろと下ろし、立ち尽くす。
動揺したような表情。

{	CreateSE("SE01","SE_擬音_ディそーど落ちる");
	MusicStart("SE01",0,700,0,1000,null,false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn01/01700040sn">
「あ……あ……」

その瞳は虚ろ。
もう、あたしを見ていない。
もう、現実を見てはいない。

今はあたしが作り出した妄想の中にいる。
与えたのはきっかけだけ。後は彼女の強迫観念が、勝手に“物語”を作り出す。

もう、蒼井さんは戦えない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	SetVolume("SE10", 1000, 500, null);
	Wait(700);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700050ko">
「それで、そ～れで」

ギクリとした。
声が、あたしの頭の中に響いてくる。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700060ko">
「セナしゃんの心、ぐちゃぐちゃにした咲畑しゃんは、その後、ど～うするの？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700070ko">
「殺しちゃーうのかな？　かな？」

コンテナハウスの方へと目をやった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ＣＧ//梢ディソード顕現
//背景を『拓巳の部屋外観・夕方』にした差分が欲しいです
//おがみ：EV：差分追加希望
//おがみ：ダミー組み込み
	CreateSE("SE360502","SE_擬音_ディそーどかまえる");
	CreateSE("SE360503","SE_擬音_ディそーど出現");

	CreateTextureEX("梢構え", 100, 0, 0, "cg/ev/ev071_02_2_梢ディソード顕現_a.jpg");

	MusicStart("SE360502",0,1000,0,1000,null,false);
	Move("梢構え", 1000, @0, @-480, Dxl2, false);
	Fade("梢構え", 300, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700080ko">
「も～しもね？　殺すって言うんなら～」

その剣が身に纏うのは。

圧倒的な禍々しさ。
無垢なる獰猛さ。
破滅的な凛々しさ。

あれが、折原さんのディソード……。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700090ko">
「咲畑しゃんのこと、悪い人リストー！　に、入れちゃうのら」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700100ko">
「リストにね、入った人は、人は～」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	MusicStart("SE360502",0,1000,0,1000,null,false);
	FadeDelete("梢構え", 500, true);

	Stand("st梢_制服_武器構え2","mad", 250, @0);
	FadeStand("st梢_制服_武器構え2_mad", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
ディソードを掲げ持って。
折原さんは、朗らかに笑った。

//◆楽しそうに
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700110ko">
「こずぴぃが、皆殺しにするの♪」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700120ri">
「あたしは――」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01700130ta">
「こ、こ、殺せっ！」

いきなり、タクが悲鳴に似た声を上げた。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01700140ta">
「セ、セナも、こずぴぃも、て、て、敵なんだっ！　敵だったんだっ！　だ、だから、梨深、こ、こ、殺しちゃえよっ！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01700150ta">
「ぼ、ぼぼ、僕は、し、死にたくないっ！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700160ri">
「タク、ちょっと黙って――」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700170ko">
「ほーい、リスト入り～♪」

折原さんが、嬉しそうに、唇を歪めた。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700180ko">
「２人とも――」

{	DeleteStand("st梢_制服_武器構え2_mad", 300, false);
	SetVolume("SE10", 500, 0, null);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700190ko">
「殺しちゃうからぁ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH10",0,1000,true);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Fade("攻撃フラッシュ", 100, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE01","SE_擬音_ディそーど2");
	CreateSE("SE03","SE_擬音_ディそーど同士ぶつかる");

//ＣＧ//以下の梨深ＶＳ梢のどこかにイベント絵一枚使ってください
//おがみ：EV：挿入
	CreateTexture360("絵背景200", 100, Center, Middle, "cg/ev/ev113_02_2_梨深VS梢_a.jpg");
	CreateTexture360("絵背景100", 40, Center, Middle, "cg/ev/ev113_02_2_梨深VS梢_a.jpg");
	CreateTexture360("拡大用", 150, 0, Middle, "cg/ev/ev113_01_2_梨深VS梢_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01",0,1000,0,1000,null,false);
	Move("拡大用", 300, @-80, @0, null, false);
	Fade("攻撃フラッシュ", 300, 0, null, true);

	Wait(700);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700200ri">
「――っ！？」

それは、まさしく暴風だった。

折原さんの突進は人間離れした速さで。

あたしは意表を突かれる。

杭のごとく、折原さんのディソードが振り下ろされる。

{	Shake("絵背景200", 300, 5, 5, 0, 0, 500, null, false);
	Zoom("拡大用", 500, 900, 900, Dxl1, false);
	FadeDelete("拡大用", 500, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);}
とっさに弾いた。
衝撃で身体が後ろに吹き飛ばされる。
なんとか踏ん張って。

{	CreateSE("SE01","SE_擬音_ディそーど1");
	MusicStart("SE01",0,1000,0,1000,null,false);}
直後に横凪ぎの一撃。
剣で受け流そうとした。

{	Shake("絵背景200", 300, 5, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("攻撃フラッシュ", 400, 0, null, false);
	CreateSE("SE02","SE_擬音_ディそーど落ちる");
	MusicStart("SE02",0,1000,0,1000,null,false);}
でも失敗。
衝撃をまともに受け。
腕がしびれる。

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700210ko">
「あはっ♪　死ね死ねーっ！」

圧倒的な突進力。
こっちが反撃する隙を与えてくれない。

どうしてこんなにも、戦うことに慣れているの？

巨大なディソードを、小柄な身体でめちゃくちゃに振り回してくる、その折原さんの足取りはおぼつかない。

フラフラとして。
地に足が着いていない。

剣を振り回しているというより。
剣に、振り回されている感じ――

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700220ko">
「咲畑しゃんも拓巳しゃんも、わっる～い人だったんだね～」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700230ko">
「２人とも、殺しまーす！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700240ri">
「タクは、殺させないっ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	XBOX360_LockVideo(true);

	CreateTextureEX("梢剣エフェクト", 1000, Center, Middle, "cg/bg/bg250_02_6_斬撃汎用横_a.jpg");
	CreateSE("SE02","SE_擬音_ディそーど落ちる");
	CreateSE("SE03","SE_擬音_ディそーどかまえる");
	CreateSE("SE04","SE_擬音_ディそーど同士ぶつかる");

	XBOX360_LockVideo(false);


	Shake("絵背景200", 300, 0, 7, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("梢剣エフェクト", 0, 900, null, true);
	Zoom("梢剣エフェクト", 300, 1300, 1300, null, false);
	Fade("梢剣エフェクト", 400, 0, null, false);
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Wait(500);

	Shake("絵背景200", 300, 10, 0, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("梢剣エフェクト", 0, 900, null, true);
	Zoom("梢剣エフェクト", 300, 1300, 1300, null, false);
	Fade("梢剣エフェクト", 400, 0, null, false);
	Fade("攻撃フラッシュ", 300, 0, null, false);
	MusicStart("SE02",0,1000,0,1000,null,false);

	Wait(300);

	Shake("絵背景200", 300, 5, 10, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("梢剣エフェクト", 0, 900, null, true);
	Zoom("梢剣エフェクト", 300, 1300, 1300, null, false);
	Fade("梢剣エフェクト", 400, 0, null, false);
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE04",0,1000,0,1000,null,false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
折原さんの斬撃を必死で受け止めながら。
さっきの蒼井さんと同じように。
溢れ出ている折原さんの“負の感情”を見る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_妄そうIN");
	SetVolume360("CH10", 1000, 500, null);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "BLACK");
	Fade("回想フラッシュ", 0, 0, null, true);

	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("絵背景*");
	Delete("攻撃フラッシュ");

	XBOX360_LockVideo(true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	Stand("bu梢_制服_正面","sigh", 200, @0);
	FadeStand("bu梢_制服_正面_sigh", 0, true);

	CreateColor("下敷き", 150, 0, 0, 1280, 720, "BLACK");

	XBOX360_LockVideo(false);

	CreateMovie360("消滅", 2000, center, middle, true, true, "dx/mv砂嵐.avi");
//	Request("消滅", Play);
	Fade("消滅", 0, 700, null, true);


	DrawTransition("回想フラッシュ", 2000, 1000, 500, 200, null, "cg/data/effect.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
あたしの脳裏に浮かんだイメージは――

鏡。

その妄想を、折原さんのデッドスポットへ飛ばす――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DrawTransition("回想フラッシュ", 100, 500, 1000, 200, null, "cg/data/effect.png", true);
	Delete("レンズ*");
	Delete("消滅");
	Delete("下敷き");

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	DeleteStand("bu梢_制服_正面_sigh", 0, true);

	Fade("回想フラッシュ", 2000, 0, Axl1, true);
	Delete("回想フラッシュ");


	SetVolume360("CH10", 2000, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700250ko">
「うぅ……！？」

ぴたりと、折原さんの動きが止まった。
みるみる、その目から涙がこぼれ出す。

あたしはホッと息をついた。
今のうちに、タクを連れて逃げよう――

そこで、ハッとした。

蒼井さんの姿が見当たらない。
周囲を見回す。
彼女は、屋上の縁に立っていて。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700260ri">
「蒼井さ――」

慌てて駆け寄ろうとした。でもそれより前に、彼女の身体はふらりと傾き――

{	SetVolume360("CH10", 1000, 0, null);}
縁の向こう側へ、消えていった。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700270ri">
「え……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ドスーーーーン（土の上の落ちる音）
//↑６章あやせ飛び降り時のものを流用

	Wait(1500);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE02","SE_衝撃_落下激突");
	CreateSE("SE03","SE_衝撃_どすーん");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE02",0,1000,0,1000,null,false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Wait(2000);

	CreateSE("SE10","SE_自然_風音_強_LOOP");
	MusicStart("SE10",2000,1000,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
なにかが、地面に激突する音――
なにかが、地面で潰れるような音――

その音が、遠くから、かすかに聞こえてきて。

死んだ――？

蒼井さんが、死んだ？

あたしの見せた、妄想のせいで？

違う、そんなつもりじゃ――

//◆リアルの声
//【梢】
<voice name="梢" class="梢" src="voice/chn01/01700280ko">
「あああああああああ――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	CreateSE("SE02","SE_擬音_ディそーど_コンクリート砕く");
	CreateSE("SE03","SE_擬音_ディそーど2");
	CreateSE("SE04","SE_じん体_動作_滑って転ぶ");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);


	SetVolume("SE10", 100, 0, null);

	MusicStart("SE02",0,1000,0,1000,null,false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Shake("絵背景200", 300, 5, 5, 0, 0, 500, null, false);
	Fade("攻撃フラッシュ", 0, 900, null, true);
	Fade("攻撃フラッシュ", 400, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700290ri">
「っ！？」

背後から突風。
すさまじい衝撃。
トラックに衝突でもされたかのような。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700300ri">
「あぐっ……！」

脳がぐらぐらと揺れて。
あたしはなすすべなく吹っ飛ばされる。

{	MusicStart("SE04",0,1000,0,1000,null,false);
	Shake("絵背景200", 300, 0, 10, 0, 0, 500, null, false);}
地面に叩きつけられる。
全身に、軋むような激痛が走る。

斬られてはいない。
でも、あの凶悪なディソードで、ぶん殴られた――

視界がグラグラとしている。
立ち上がろうとしたけど、足に力が入らない。

自分が何者か、分からなくなる。
軽い脳しんとう状態――

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700310ri">
「う、あ……」

必死で顔を上げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	BGMPlay360("CH06",0,1000,true);
	Stand("st梢_制服_拒絶","pinch", 200, @0);
	FadeStand("st梢_制服_拒絶_pinch", 300, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700320ko">
「私は誰私は誰私は誰私は誰私は誰私は誰――」

折原さんが、フラフラとしながら、頭を抱えている。
激しくかぶりを振っている。
あたしが見せた妄想のせいで、我を失ってる……？

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700330ko">
「私は誰なのぉ！？」

{	Stand("st梢_制服_拒絶","shout", 200, @0);
	FadeStand("st梢_制服_拒絶_shout", 300, true);
	DeleteStand("st梢_制服_拒絶_pinch", 0, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700340ko">
「誰なのぉぉーーーっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01700350ta">
「ひ、ひいい……！」

タクが、狙われていた。
タクが、殺される。

どうして逃げなかったの……。
どうして、まだそんなところにいるの……。

助けなきゃ。
手に力を込める。

でも、ディソードは手元になかった。
さっきの衝撃で、放り出してしまっていた。
少し離れたところに、転がっている。

{	Stand("st梢_制服_武器構え2","angry", 200, @0);
	FadeStand("st梢_制服_武器構え2_angry", 300, false);
	DeleteStand("st梢_制服_拒絶_shout", 300, true);}
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700360ko">
「死んじゃえ死んじゃえ死んじゃえ死んじゃえ死んじゃえ――！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/01700370ta">
「た、たた、助けて！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
タクが、あたしに助けを求めている。
助けなきゃ――

タクは、殺させない――

でも、この距離じゃ、間に合わない――

{	Fade("攻撃フラッシュ", 0, 900, null, true);
	CreateSE("SE03","SE_擬音_ディそーど1");
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);}
折原さんはすでに、ディソードを振り上げている。

タクが殺されるのなんて、一瞬だ。
へっぴり腰で、その場にへたり込んで、動くこともできない。
１秒もしないうちに、ディソードで文字通り叩き潰されるだろう。

助けなきゃ――

どうせ間に合わない――

あたしの中で、いくつもの心の声が溢れ出す。
思考が、ごちゃごちゃになる。

何人ものあたしの瞳が、心の中からあたしを射抜く。
何人ものあたしの口が、ささやく。

ささやきが重なって、声の洪水となって。
あたしの理性を奪っていく。

必死で立ち上がる。
でもそれが精一杯。

ダメ、間に合わない――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH06", 1000, 300, null);
	DeleteStand("st梢_制服_武器構え2_angry", 300, true);


	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Fade("攻撃フラッシュ", 0, 900, null, true);
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700380ri">
「殺させ……ない……！」

歯を食いしばる。

タクが死んじゃう――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――



	Fade("攻撃フラッシュ", 0, 900, null, true);
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
殺せ――

折原梢を殺せ――

タクを守ることができるなら、他の人間なんてどうでもいいんだ――

違う！　どうでもよくなんて――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――



	Fade("攻撃フラッシュ", 0, 900, null, true);
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	Fade("攻撃フラッシュ", 400, 0, null, false);
	MusicStart("SE03",0,1000,0,1000,null,false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
殺せ――

タクはむしろここで消えてもらうべきじゃ――

折原梢を殺せ――

西條拓巳を殺せ――

それが咲畑梨深と、タクミの願いでしょ――

違う――！

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700390ri">
「違うっ！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700400ri">
「あたしは、タクを――！」

{	SetVolume360("CH06", 1000, 1000, null);}
いつの間にか、手の中にディソード。
落ちていたはずなのに、持っている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700410ri">
「あたしはっ――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateColor("移動フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("移動フラッシュ", 0, 0, null, true);
	Request("移動フラッシュ", AddRender);

	CreateTextureEX("効果２", 110, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("効果３", 120, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("効果２", 0, 1000, null, true);
	Fade("効果３", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Zoom("効果２", 2000, 1050, 1050, Dxl2, false);
	Fade("効果２", 2000, 0, null, false);
	Wait(100);
	Zoom("効果３", 2000, 1050, 1050, Dxl2, false);
	Fade("効果３", 2000, 0, null, false);

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	CreateSE("SE36003","SE_擬音_ディそーど_人を切る");

	SetVolume360("CH06", 100, 0, null);

	Fade("移動フラッシュ", 0, 1000, null, true);

	Fade("攻撃フラッシュ", 0, 1000, null, true);
	MusicStart("SE03",0,1000,0,1000,null,false);
	MusicStart("SE36003",0,1000,0,1000,null,false);

	Wait(200);

	Fade("移動フラッシュ", 500, 0, null, true);

	Wait(500);

	Fade("攻撃フラッシュ", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
肉を、抉る感触。

//◆リアルの声
//◆苦痛のうめき
//【梢】
<voice name="梢" class="梢" src="voice/chn01/01700420ko">
「あ……ぅ……？」

自分が、どうやって折原さんとの距離を詰めたのか、分からない。
だけど、あたしの持つディソードは。

彼女の、華奢な背中に、深々と突き刺さっていて。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700430ri">
「あ……たし……」

意志に、反している。
殺すつもりなんて、ないのに。

それともこれがあたしの意志？　あたしの本心？

折原さんが、きょとんとした顔で振り返る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	Delete("効果*");
	Delete("攻撃フラッシュ");
	Delete("移動フラッシュ");

	Stand("bu梢_制服_正面","sad", 200, @0);
	Move("bu梢_制服_正面_sad*", 0, @0, @150, null, true);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601009]
//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700440ko">
「さきはた……しゃん……？」

//◆心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/chn01/01700450ko">
「いたい……のら……」

ダメ――

殺すつもりはないから――

これ以上はダメ――

あたしのディソードが、蠢く。

意志を持ったかのように。
命を奪う喜びに、血を浴びる歓喜に、身もだえ震えているかのように。

あたしはいやいやをするように首を振る。

{	CreateSE("SE01","SE_擬音_お腹裂く");
	MusicStart("SE01",0,1000,0,1000,null,false);}
折原さんの背中を貫いたディソードが。
その翼を――牙を――ギチギチと、鳴らして。
今にも、食い破ろうとしている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700460ri">
「だ、め……ダメだってばっ……！」

引き抜こうとした。
できなかった。

身体が動かない。
剣から手を離すこともできない。

{	DeleteStand("bu梢_制服_正面_sad", 300, false);}
//◆リアルの声
//◆血を吐く
//【梢】
<voice name="梢" class="梢" src="voice/chn01/01700470ko">
「う……かはっ……」

折原さんが血を吐く。
その血に染まった、あたしの剣が――

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700480ri">
「ダメぇぇっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateSE("SE01","SE_擬音_ディそーど同士ぶつかる");
	CreateSE("SE36001","SE_じん体_血_噴きでる_包丁でさされ");
	CreateSE("SE36002","SE_擬音_肉手を突っ込む");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01",0,1000,0,1000,null,false);
	MusicStart("SE36002",0,1000,0,1000,null,false);
	MusicStart("SE36001",0,1000,0,1000,null,false);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	DrawTransition("攻撃フラッシュ", 150, 0, 1000, 100, null, "cg/data/zoom1.png", true);


//おがみ：立ち絵：ダミー組み込み
	Stand("梢_制服_正面_血まみれ","sigh", 200, @0);
	Move("梢_制服_正面_血まみれ_sigh*", 0, @0, @120, null, true);
	FadeStand("梢_制服_正面_血まみれ_sigh", 100, true);
//	DeleteStand("bu梢_制服_正面_sad", 0, false);


	Fade("攻撃フラッシュ", 1000, 0, null, false);


	Wait(500);
	DeleteStand("bu梢_制服_正面_血まみれ_sigh", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//ＳＥ//梨深ディソードが羽を広げる
//ＳＥ//肉をえぐる、血が噴き出す
//◆リアルの声
//◆断末魔
//【梢】
<voice name="梢" class="梢" src="voice/chn01/01700490ko">
「ごぶっ――」

翼を広げるように。

折原さんの身体を、
ねじ切り――
引き裂いた――

大量の血が、飛び散る。

一瞬前まで生きていた小柄な女の子は、肉塊へと変わり。

紅い、幻想の羽根が、その場に降り注いだ――

//◆泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700500ri">
「違う、あたしは、こんなの、望んでない……」

救いを求めて、周囲を見回した。
タクが、化け物でも見るかのような目を、あたしに向けている。

//◆泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700510ri">
「あたし……は……」

//◆泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700520ri">
「殺すつもりなんて……なかった……」

//◆泣きそう
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700530ri">
「殺すつもりなんて、なかったのに……！」

でも、あたしが殺した――

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/01700540ri">
「いやあああああ――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


//ホワイトアウト
	CreateColor("フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);

	Fade("フラッシュ", 500, 1000, null, true);

	Wait(500);

	DelusionOut();

//画面エフェクト//妄想ＯＵＴ
//■インターミッションＲ１終了

//アイキャッチ
//※拓巳視点に戻る


	ClearAll(0);
	Wait(500);

	DelusionOut2();


}
