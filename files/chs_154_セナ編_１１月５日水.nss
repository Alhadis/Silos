//<continuation number="380">

chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_154_セナ編_１１月５日水";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_154_セナ編_１１月５日水();
}


function chs_154_セナ編_１１月５日水()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//１１月５日（水）
//ＢＧ//電車カットボディ前（昼）
	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 1000, 500, 0, 1000, null, true);

	CreateTexture360("back01", 300, 0, 0, "cg/bg/bg080_01_1_電車カットボディ前_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
翌日。僕は駅前に足を運んだ。

ホントは、ここに来たくはなかった。
この前のエスパー騒動のせいで、今の僕は渋谷の駅前にはトラウマしかない。

しかも、相変わらず人が多い……。ましてやハチ公前となれば、待ち合わせ中のリア充でごった返している。

みんな、チラチラと僕を見てはニヤニヤしたり、ケータイのカメラを向けてきたりする。

背後へと視線を振り仰げば、あの夜、僕が醜態をさらしたＯ－ＦＲＯＮＴがそびえ立っている。

あのときの様子は動画としてネットに出回り、世界中を永遠に漂い続けるだろう。すべてを集めて消去、なんてことはもう不可能だ。
僕はこれから死ぬまで、その動画によってバカにされ続けるんだ。

悔しくて、悲しくて、イライラして、逃げ出したくなったけど、ここで逃げたら将軍に殺されると思って、必死で踏みとどまった。

できるだけ周囲を見ないようにして、通称“青ガエル”と呼ばれる電車の中に、恐る恐る足を踏み入れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＥＶ：ダミーがないですが、差分作成でしょうか？
//おがみ：EV：差分追加：鎖なしが欲しい、あとアップも欲しい
//ＣＧ//セナ白い鎖（鎖無しの差分が欲しいです）

	if(Platform()==100){
	CreateTexture360("セナ鎖２", 270, 160, 160, "cg/ev/ev036_02_2_セナ白い鎖_a.jpg");
	Fade("セナ鎖２", 0, 1000, null, true);
	Request("セナ鎖２", Smoothing);
	Zoom("セナ鎖２", 0, 2000, 2000, null, true);

	}else{
	CreateTexture360("セナ鎖２", 270, 320, 296, "cg/ev/ev036_02_2_セナ白い鎖_a.jpg");
	Fade("セナ鎖２", 0, 1000, null, true);
	Request("セナ鎖２", Smoothing);
	Zoom("セナ鎖２", 0, 2000, 2000, null, true);

	}

	SetVolume360("SE01", 2000, 0, null);

	DrawTransition("back01", 500, 1000, 0, 100, null, "cg/data/right3.png", true);

	Delete("back01");
	Wait(1000);


	BGMPlay360("CH12",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そこに、やっぱり蒼井セナは座っていた。
車内には、彼女だけだ。

今になって気付いたけど、他の人が誰も入ってこないのは、もしかしたらセナがなにか細工しているせいなのかもしれない。

ギガロマニアックスの力……なんだろうか。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500010sn">
「お前か。エラーを見つけたのか？」

僕は小さく首を左右に振ってから、あらかじめコンビニで買っておいたガルガリ君を差し出した。
これはいわゆる“つまらない物”だ。

――これ、つまらない物ですが。
――あら、悪いわねえ。

そんな日本人のバカっぽい風習に合わせたってわけ。
僕だって、なにもタダで守ってくれって頼むつもりはない。

報酬は１日３本のガルガリ君。
これならセナだってきっと食いついてくるはず……！

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500020sn">
「くれるのか？　ありがとう」

セナは意外と素直に受け取ってくれた。
ふひひ……、僕の作戦にまんまと引っかかったな。

//◆西條＝にしじょう
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500030sn">
「西條は何味が好きだ？　私は断然ソーダ味だな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("セナ鎖１", 250, 0, 0, "cg/ev/ev036_02_2_セナ白い鎖_a.jpg");
	Fade("セナ鎖１", 0, 1000, null, true);

	Fade("セナ鎖２", 500, 0, null, true);
	Delete("セナ鎖２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
セナは、いそいそと袋を破いて、中のアイスを取り出している。
気のせいだろうか、心なしか、その口元が綻んでいるような……。
どんだけガルガリ君好きなんだよ。食べ過ぎるとお腹壊すぞ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500040ta">
「ぼ、僕は、コーラ味……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500050sn">
「なん……だと？　コーラ味なんて邪道だ。ふざけるな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500060ta">
「す、すいません……」

怒られた。そんなことで怒るなよって思ったけど、機嫌を損ねるのはまずい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg081_01_1_電車カットボディ窓_a.jpg");
	Fade("back01", 0, 1000, null, true);
	
	Stand("stセナ_制服_食事","normal", 200, @+150);
	FadeStand("stセナ_制服_食事_normal", 0, false);

	FadeDelete("セナ鎖１", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500070sn">
「それで」

セナはさっそくガルガリ君をかじりながら、探るような視線を僕へ向けてきた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500080sn">
「私になにか用か？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500090ta">
「……ぼ、ぼ、ぼ」

うう、セナのこの威圧感はなんとかならないのか。目付きも悪いし。

助けを求めるだけなのに、緊張して死にそうだ。ただでさえ三次元女子と話すのは苦手なのに……。

僕は何度か深呼吸をして、かろうじて自分の心を落ち着かせた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500100ta">
「……ぼ、僕を、た、助けてほしい」

{	Stand("stセナ_制服_食事かじる","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事かじる_sigh", 300, true);
	DeleteStand("stセナ_制服_食事_normal", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500110sn">
「どういう意味だ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500120ta">
「ぼ、僕は、ニュージェネの真犯人に、ね、ね、狙われてる……っ。こ、この前、話したでしょ？『将軍』っていうヤツなんだ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500130ta">
「僕は、き、きっとそいつに、思考を、と、盗撮、されてる！」

{	Stand("stセナ_制服_食事減る","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事減る_sigh", 300, true);
	DeleteStand("stセナ_制服_食事かじる_sigh", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500140sn">
「思考盗撮か……。そいつ、何者だ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500150ta">
「し、知るもんかっ！　ぼ、ぼ、僕が、聞きたいぐらいだっ！」

//◆希＝のぞみ
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500160sn">
「この渋谷で思考盗撮できる連中なんて、限られてる。ギガロマニアックスか、あるいは、希の連中か……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500170ta">
「の、のぞみ？」

{	Stand("stセナ_制服_食事減る","normal", 200, @+150);
	FadeStand("stセナ_制服_食事減る_normal", 300, true);
	DeleteStand("stセナ_制服_食事減る_hard", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500180sn">
「希テクノロジー。プロジェクト・ノアによって、世界を手に入れようとしてる」

な、なんだそれ……。
陰謀論、ってヤツだろうか。
『将軍』も、その組織の一員なのかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500190ta">
「ぼ、僕を、助けてよ……。頼むよ……」

どんどん、絶望的な気持ちになってくる。
とにかく、すがれるものがほしい。助けてほしい……。

セナはガルガリ君をもう一口かじり、それから目を細めた。

{	Stand("stセナ_制服_食事かじる","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事かじる_sigh", 300, true);
	DeleteStand("stセナ_制服_食事減る_normal", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500200sn">
「……言ったはずだ。中途半端な気持ちで踏み込むなら、妄想に食われると」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500210sn">
「お前には、覚悟があるか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500220ta">
「な、ないよっ。あるわけ、な、ないだろ……っ。ぼ、ぼ、僕はただ、助けてくれって言ってるんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500230ta">
「こんなの、もう、うんざりなんだ……っ。
なんで、ぼ、僕、ばっかり……」

たまらず、その場にがっくりと膝を突いてしまった。

僕に構わないで。
僕を守って。

僕がなにをしたって言うんだ。
僕はなにもしたくない。

{	Stand("stセナ_制服_食事減る","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事減る_sigh", 300, true);
	DeleteStand("stセナ_制服_食事かじる_sigh", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500240sn">
「覚悟は、なしか」

冷たい視線を投げかけられているのを感じる。
自分でも情けないって分かってるから、うなだれるしかない。

{	Stand("stセナ_制服_食事かじる","sigh", 200, @+150);
	FadeStand("stセナ_制服_食事かじる_sigh", 300, true);
	DeleteStand("stセナ_制服_食事減る_sigh", 0, true);}
//◆独り言
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500250sn">
「だが、その『将軍』というヤツは気になるな……。もし希の人間なら、ニュージェネ事件も連中が起こしてるということか？　だとしたら、それを捨て置くわけには……」

{	DeleteStand("stセナ_制服_食事かじる_sigh", 500, true);}
セナは窓の外を眺めて、ブツブツ言っている。
難しい顔をして――でもガルガリ君をかじりながら、考えを巡らせてる様子だった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500260ta">
「あ……の……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_食事棒","normal", 500, @+150);
	FadeStand("buセナ_制服_食事棒_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
しばらくして、セナは不意に座席から腰を上げ、僕の前に立つ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500270sn">
「私に守ってほしいのか？」

く、そ……。毎回毎回、なんていう上から目線なんだ。この女は、女王様気質でもあるのか。

心の中ではそんな悪態をつきつつも、僕はただコクコクとうなずいていた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500280sn">
「それはつまり、私とお前はこれから行動を共にする、という意味だ」

{	Stand("buセナ_制服_食事棒","sigh", 200, @+150);
	FadeStand("buセナ_制服_食事棒_sigh", 300, true);
	DeleteStand("buセナ_制服_食事棒_normal", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500290sn">
「それでもいいんだな？」

守ってくれるなら、なんだって、いいよ……。
今は、一番の敵である『将軍』の攻撃から身を守るのが、最優先なんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500300ta">
「ほ、ホントに、守ってくれるなら、も、文句は、言わない……」

{	Stand("buセナ_制服_通常","normal", 200, @+150);
	FadeStand("buセナ_制服_通常_normal", 300, true);
	DeleteStand("buセナ_制服_食事棒_sigh", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500310sn">
「決まりだ」

セナが、僕に手を差し出してくる。

{	DeleteStand("buセナ_制服_通常_normal", 500, true);
	CreateSE("SE01","SE_じん体_動作_のぞく");
	MusicStart("SE01",0,1000,0,1000,null,false);}
意味が分からなくて、そのしなやかな指をぼんやり見つめてしまった。
セナはじれったそうに僕の手を引っ張り、立ち上がらせてくれる。

一瞬、目が合った。
至近距離で見つめ合う形になり、僕は慌てて目を伏せる。
セナが手を離し――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH12", 2000, 0, null);

	Stand("stセナ_制服_横向","normal_r", 500, @+150);
	FadeStand("stセナ_制服_横向_normal_r", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500320sn">
「じゃあ、行くぞ」

僕を促すように、背を向けた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500330ta">
「え、い、行くって、どこへ……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500340sn">
「希テクノロジーの本社だ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500350ta">
「は……！？」

{	Stand("stセナ_制服_通常","hard", 500, @+150);
	DeleteStand("stセナ_制服_横向_normal_r", 300, true);
	FadeStand("stセナ_制服_通常_hard", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500360sn">
「これから乗り込む」

の、乗り込むって……つまり敵の本拠地に！？

いやいやいや！　なに考えてるんだ、このバカ女……！
自殺願望でも持ってるのか！？
失敗だ、この女を頼った僕がバカだった！

い、行くもんか！　そんなところに行くのはゴメンだ！

僕は“ムチャしやがって”って見送る方であって、断じて星になる方じゃない！　そういうタイプの人間じゃないんだ！

{	DeleteStand("stセナ_制服_通常_hard", 500, true);}
口をパクパクさせている僕に構わず、セナはさっさとドアから出て行った。僕は断固としてこの場から動かないと決める。

……ふと、腕がうまく動かないことに気付いて。
自分の身体に視線を落としてみる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn02/00500370ta">
「な、な、な……！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：SEまだない
//ＳＥ//鎖の鳴る音
	CreateSE("SE360101","SE_擬音_鎖");
	MusicStart("SE360101", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
いつの間にか、僕の身体に白い鎖が巻き付いていた。
しかもかなりきつい。無理矢理外そうとしても、びくともしない。

誰が、いつこれを！？　どうなってるんだ！？

//【セナ】
<voice name="セナ" class="セナ" src="voice/chn02/00500380sn">
「グズグズするな」

窓の外から顔だけのぞかせて、セナが急かしてくる。
僕の身体に巻き付いている鎖が引っ張られた。
踏ん張ろうとしても、身体の自由が効かなくてうまくいかない。

鎖の先は、電車の外――セナの手まで繋がっていた。

握られている。あの女の手に、鎖が。
引っ張っているのは、あの女か。

女王様とその奴隷による公開羞恥プレイですね、分かります。

って、分かるわけないだろっ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//青空
	CreateTexture360("back02", 1000, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Fade("back02", 0, 0, null, true);
	Fade("back02", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
うう、セナに頼ろうとした僕がバカだった……。
完全に人選を誤った。誰か、助けてくれ。こんなの、あんまりだよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ

	ClearAll(2000);
	Wait(1000);
}
