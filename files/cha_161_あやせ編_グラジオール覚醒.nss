//<continuation number="280">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_161_あやせ編_グラジオール覚醒";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_161_あやせ編_グラジオール覚醒();
}


function cha_161_あやせ編_グラジオール覚醒()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
//ＢＧ//外来棟屋上・夜

	Wait(500);
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	Fade("back01", 0, 0, null, true);


	CreateSE("SE01","SE_日常_屋上扉_開く");
	CreateSE("SE3602","SE_自然_風音_LOOP");

	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(500);

	MusicStart("SE3602",2000,1000,0,1000,null,true);

	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
あやせはまっすぐに屋上へ向かった。
まるで、銃声がどこから聞こえたのか知っているようだった。
その足取りに、なんの迷いも感じられない。

病院の屋上は、庭園風になっている。
植え込みが作られ、花が咲き誇っているけど、暗くてその色までは確かめることができない。

僕はあやせの背中に隠れつつ、周囲をうかがった。

人の気配はしない。
動いているものはなにもない。

ホントに、さっきの銃声はここから聞こえてきたんだろうか。

そもそももしそうだとして、いったい誰が……？
普通の日本人は銃なんて持ってないぞ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000010ta">
「や、やっぱり、戻ろうよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000020ta">
「もし、う、撃たれたら、まずいよ……」

あやせは僕の訴えに耳を貸してくれなかった。

さらに庭園の奥へと進んでいく。
僕も付いて行かざるを得ない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("青い光", 1000, 0, 0, 1280, 720, "Blue");
	Fade("青い光", 0, 0, null, true);
	Request("青い光", AddRender);

	Fade("青い光", 0, 300, null, true);
	Fade("青い光", 500, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
と、前方にぼうっとした青い光が見えた。
それはとても淡くて、今にも消えてしまいそうなほどのかすかなものだけど、間違いなくなにかが光っていて、しかも明滅している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_通常","hard", 250, @-50);
	FadeStand("buあやせ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000030ay">
「ディソードだわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("buあやせ_制服_通常_hard", 300, true);

	CreateSE("SE3601","SE_えい像_ゆあでぃそーど");
	MusicStart("SE3601",3000,700,0,1000,null,true);


	CreateColor("青い光", 1000, 0, 0, 1280, 720, "Blue");
	Fade("青い光", 0, 0, null, true);
	Request("青い光", AddRender);
	DrawTransition("Black", 0, 0, 500, 200, null, "cg/data/right3.png", true);

//ＢＧ//優愛のディソード（青く発光）
	CreateTexture360("優愛ソード", 2000, 0, 96, "cg/bg/bg223_01_6_chn優愛のディソード_a.jpg");
	Fade("優愛ソード", 0, 0, null, true);
	Fade("青い光", 1000, 700, null, false);
	Move("優愛ソード", 2000, @0, @-80, Dxl1, false);
	Fade("優愛ソード", 1000, 1000, null, true);
	Fade("青い光", 3000, 0, null, false);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
それはとても優雅で。同時にあらゆるものを拒絶するかのような刺々しさを合わせ持ち。この世のものとは思えない、異質な存在感を放っている。

//ＢＧ//外来棟屋上・夜
{	SetVolume("SE3601", 1000, 300, null);
	FadeDelete("優愛ソード", 500, true);}
コンクリートに突き立てられているそのディソードの傍らに、２人の人間が倒れていた。

２人とも、見覚えがあった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000040ta">
「優愛……！」

翠明の制服を着て、仰向けに倒れている少女は、間違いなく優愛だ。
いったいなんで彼女がここに？

もう１人は、中年のおっさんだった。
こいつは確か、『張り付け』事件の後、僕に職務質問をしてきた刑事だ。

２人とも倒れたまま動かない。

恐る恐る、近寄ってみる。
倒れている２人の下には、血溜まりができていた。

慌てて飛びずさったけど、手遅れだった。
僕の靴裏に、べったりと紅い液体がこびりついてしまった。

刑事のおっさんの身体が、特にひどく血に染まっていた。
優愛の方は外傷らしいものは見当たらない。

いったい、なにがあったんだ……？
なんで、刑事と優愛が一緒にいる……？

刑事なら銃を持っていたのもうなずけるけど、そもそもこの刑事を撃ったのは誰なんだ？　優愛なのか？

疑問ばかりが頭の中に浮かんできて、うまく整理できない。
なにがなんだか分からなくて、僕はあやせに救いを求めた。

あやせは厳しい表情のまま、刑事には見向きもせずに、優愛へと歩み寄った。血を踏まないように傍らにひざまずき、優愛の首へ指先を添える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("青い光");

	Stand("buあやせ_制服_通常","normal", 250, @-50);
	FadeStand("buあやせ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000050ay">
「脈はある。まだ生きているわ」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000060ay">
「だけど……死んでいる。心は」

//■３６０
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000070ay">
//「そっちの男の人は、もうダメのようね」
「そっちの男の人は、もうダメなようね」

いつも通りの、淡々とした口調。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000080ta">
「な、なんで、そ、そんな、お、落ち着いていられるんだ！？　ひ、ひと、人が、し、し、死んでるんだぞ……！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000090ay">
「言ったでしょう。予言されていたからよ」

予言ってなんだよ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000100ta">
「あやせが、望んだ妄想じゃないの？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000110ay">
「……そうかもしれないわね。それを確かめる術はないけれど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000120ta">
「そんな……！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000130ay">
「構わないわ。原因がなんだろうと」

あやせは立ち上がり――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3602", 1000, 1, null);

//あやせが剣を出す。剣はリアルブート済み
	CreateSE("SE01","SE_擬音_ディそーど出現");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);


	CreateColor("赤い光",2000, 0, 0, 1280, 720, "RED");
	Fade("赤い光", 0, 0, null, true);
	Request("赤い光", AddRender);

	CreateColor("フラッシュ",2000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);

	Fade("赤い光", 0, 1000, null, true);

	DeleteStand("buあやせ_制服_通常_normal", 0, true);
	Stand("stあやせ_制服_武器構え","hard", 250, @-50);
	FadeStand("stあやせ_制服_武器構え_hard", 0, true);

	CreateSE("SE02","SE_擬音_共鳴音_激しい_LOOP");
	CreateSE("SE03","SE_擬音_ディそーど_衝撃は");

	Fade("フラッシュ", 1000, 0, null, true);
	Fade("赤い光", 1000, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
自らのディソードを、なにもない場所から取り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("stあやせ_制服_武器構え_hard", 500, true);
	CreateTextureEX("優愛ソード", 2000, center, middle, "cg/bg/bg223_01_6_chn優愛のディソード_a.jpg");
	Fade("優愛ソード", 500, 1000, null, true);

	Wait(1000);
	Fade("優愛ソード", 1000, 0, null, true);
	Delete("優愛ソード");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3607004]
赤い光を放つそれを、突き立てられたもうひとつのディソードへと近づける。

//ＳＥ//共鳴音
{	MusicStart("SE02", 1000, 1000, 0, 1000, null, true);}
激しい共鳴音が鳴り響いた。キーンとした高周波。
まるで耳の穴に錐を刺されて、グリグリとほじくられているかのような錯覚を覚えた。

直後、２本のディソードの形がぐにゃりと歪んだ。
その様は、物理法則を完全に無視していて。液体のようにも見えるし、粘土のようにも見える。

２本の剣は激しく身もだえるように変形を繰り返す。
共鳴音はさらに激しくなる。僕はたまらず耳を塞いだけど、まったく効果はなくて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Delete("赤い光");

//ＳＥ//衝撃音
	SetVolume("SE3601", 1000, 0, null);
	SetVolume("SE02", 350, 0, null);
	Wait(500);

	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Wait(200);
	Fade("フラッシュ", 0, 1000, null, true);
	DrawTransition("フラッシュ", 200, 0, 1000, 200, null, "cg/data/zoom1.png", true);
	CreateTexture360("あやせディソード", 500, 0, 0, "cg/bg/bg242_01_6_chnディソード全体_あやせ_a.jpg");
	Request("あやせディソード", Smoothing);
	Zoom("あやせディソード", 0, 1200, 1200, null, true);


	Zoom("あやせディソード", 3000, 1000, 1000, Dxl1, false);
	DrawTransition("フラッシュ", 1000, 1000, 0, 200, null, "cg/data/zoom2.png", false);
	FadeDelete("フラッシュ", 1000, true);
	Wait(2000);

	SetVolume("SE3602", 3000, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
空気が弾けた。

気が付くと、たった今まで突き立てられていたディソードが、あやせの左手に収まっていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("あやせディソード", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000140ay">
「はぁ……はぁ……」

あやせは、どこか苦しそうに見える。珍しく苦痛に表情を歪めていた。

けれどすぐに、僕に対して微笑みかけてきた。
興奮しているのか、わずかに頬を上気させている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_武器構え","smile", 250, @-50);
	FadeStand("stあやせ_制服_武器構え_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000150ay">
「４本目よ、これで」

目の前で人が死んでいるのに。
近くにこの中年刑事を撃ったかもしれない犯人がいるはずなのに。

なんで、それよりも剣を優先させるんだ？
それはあやせが望む結末に必要なことだから？
７本のディソードによってグラジオールを倒す？

グラジオールなんて、ホントにいるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SetVolume("SE3602", 100, 1, null);

	CreateColor("回想フラッシュ", 2500, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	MusicStart("SE回想in",0,1000,0,1000,null,false);
	Fade("回想フラッシュ", 100, 1000, null, true);

	DeleteStand("stあやせ_制服_武器構え_smile", 0, true);

	CreateColor("回想明度", 2400, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("背景１", 2000, 0, 0, "cg/bg/bg079_01_2_渋谷駅前_a.jpg");
	Stand("buセナ_制服_通常","angry", 2200, @+100);
	FadeStand("buセナ_制服_通常_angry", 0, false);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(500);

//■３６０：ボイスエフェクト：ファイル名、タグ調整
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn07/14900130sn">
「ギガロマニアックスとなった者は、誰だろうと一度は壊れているんだよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想明度");
	Delete("背景１");
	DeleteStand("buセナ_制服_通常_angry", 0, true);

	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	SetVolume("SE3602", 2000, 1000, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
セナの言葉を思い出す。
あやせもまた、壊れてしまっているんだ。

ということは、僕もいずれ……？

いや、いずれ、じゃないな。
僕だってもう、とっくに壊れているような気がする。

あやせはすぐに、ディソードを消した。
空気の中へ溶け込むようにして、２本の剣は霧散していった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000160ta">
「あ、あの……このこと、け、警察に、通報するの……？」

優愛は僕の敵だ。ここで死人と一緒にほったらかしにしておいても、僕の心は痛まない。

だけど僕はさっき血を踏んでしまった。足許を見ると、コンクリートの床の上に僕の靴の足跡がべったりと残ってしまっている。

僕が犯人だって疑われてもしょうがないレベル。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stあやせ_制服_武器構え","normal", 250, @-50);
	FadeStand("stあやせ_制服_武器構え_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000170ay">
「通報はしないわ」

その言葉に、僕はホッとした。
あやせは夜空を見上げている。
表情は厳しいままだ。

{	Stand("stあやせ_制服_武器構え","hard", 250, @-50);
	FadeStand("stあやせ_制服_武器構え_hard", 300, true);
	DeleteStand("stあやせ_制服_武器構え_normal", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000180ay">
「そろそろね……」

そろそろ？　って、なにが……？

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000190ay">
「グラジオールはまもなく目覚めるわ。ツィーグラーの予言によれば」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000200ay">
「心して、拓巳」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000210ay">
「災厄に包まれるのよ、世界は」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000220ay">
「キミは、見たこともない世界を見ることになる」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000230ay">
「でも、乗り越えて」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000240ay">
「そうしなければ、グラジオールを倒せない」

あやせの声は珍しく震えている。
あのあやせが、怯えている。

それほどのことが、これから起きるって言うのか？
あるいは、あやせが妄想して起こそうとしてるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01000250ta">
「ま、まだ、心の、準備が……」

{	Stand("stあやせ_制服_武器構え","angry", 250, @-50);
	FadeStand("stあやせ_制服_武器構え_angry", 300, true);
	DeleteStand("stあやせ_制服_武器構え_hard", 0, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000260ay">
「だったら急いで。もう時間がないわ」

そうは言うがな、大佐！
なにが起こるか分からないのに、どうしたらいいんだよ……。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000270ay">
「世界は融解し、連結が始まる……」

あやせは空を見上げたまま、誰にともなくつぶやいた。

僕もつられて顔を上げると。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("夜空", 2000, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	CreateColor("空の光", 2500, 0, 0, 1280, 720, "WHITE");
	Fade("空の光", 0, 0, null, true);
	Request("空の光", AddRender);


	Fade("夜空", 500, 1000, null, true);
	DeleteStand("stあやせ_制服_武器構え_angry", 0, true);

	Fade("空の光", 0, 500, null, true);
	DrawTransition("空の光", 1000, 0, 200, 200, Dxl1, "cg/data/爆発.png", false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
空のある一点が、白く染まっていた。
夜空にはあまりにも不釣り合いな、鮮やかな白。

なんだろう、あれ？

すぐに、ギクリとした。

そう言えば、“空が白く染まる”っていう現象は、この前の地震のときにも起きてなかったか？

{	Fade("空の光", 5000, 800, null, false);
	DrawTransition("空の光", 5000, 200, 400, 200, AxlDxl, "cg/data/爆発.png", false);}
その白い染みは徐々に広がっていく。
得体の知れない焦り。
僕は息を呑む。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01000280ay">
「グラジオールが、目覚めた……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("空の光", 1000, 0, null, false);
	Fade("夜空", 1000, 0, null, true);

//ＳＥ//地響き
	CreateSE("SE10","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	CreateSE("SE11","SE_自然_じ鳴り_LOOP");
	CreateSE("SE02","SE_擬音_共鳴音_激しい_LOOP");

	MusicStart("SE10", 500, 1000, 0, 1000, null, false);
	MusicStart("SE11", 500, 1000, 0, 1000, null, true);

	CreateTexture360("shake01", 110, 0, 0, "cg/bg/bg107_01_3_外来棟屋上_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");
	Fade("shake01", 0, 1000, null, true);


	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);


	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
地響き。
ビルが揺れる。

違う、ビルだけじゃなくてすべてが揺れている。

空の“白”はますます広がっていく。

//ＳＥ//共鳴音
{	MusicStart("SE02", 1000, 1000, 0, 1000, null, true);}
次いで、さっきのディソードが発した共鳴音にも似た、激しい耳鳴りに襲われた。頭が内部から破裂してしまいそうだった。

そして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	Fade("夜空", 1000, 1000, null, false);
	Fade("空の光", 1000, 500, null, true);

	Delete("プロセス１");
	Delete("shake01");

	Wait(500);

//ＳＥ//衝撃音
//ＢＧ//白
//ＳＥ//爆発音
	CreateSE("SE12","SE_衝撃_爆発音");
	CreateSE("SE13","SE_衝撃_爆発音");
	CreateSE("SE14","SE_衝撃_道路陥ぼつ");
	MusicStart("SE12", 0, 1000, 0, 1000, null, false);
	MusicStart("SE13", 0, 1000, 0, 1000, null, false);
	MusicStart("SE14", 0, 1000, 0, 1000, null, false);

	DrawTransition("空の光", 400, 400, 1000, 200, Axl1, "cg/data/爆発.png", false);
	Fade("空の光", 500, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
世界が、白一色に染まった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ホワイトアウト
//ゆっくりＦ・Ｏ
	SetVolume("SE*", 4000, 0, null);
	ClearAll(5000);
	Wait(2000);


}

//shake用function
function Shaker()
{
	Shake("@shake01", 1000, 0, 0, 10, 10, 1000, null, true);
	while(1)
	{
	Shake("@shake01", 500, 10, 10, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 20, 20, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 10, 10, 20, 20, 1000, null, true);
	}

}
