//<continuation number="790">



chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_018_妄想トリガー４■";
		$GameContiune = 1;
		Reset();
	}

	ch01_018_妄想トリガー４■();
}


function ch01_018_妄想トリガー４■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１２へ
//ネガティブ妄想→分岐１３へ
//妄想しない→分岐１４へ
if($妄想トリガー通過４ == 0)
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
			$妄想トリガー４ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー４ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー４ = 0;
		}
	}
}


//=============================================================================//

if($妄想トリガー４ == 2)
{

	SetVolume360("CH11", 0, 0, NULL);

//☆☆☆
//分岐１２
	DelusionIn();

	DeleteAll();

	CreateBG(100, 0, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Stand("st優愛_制服_通常左手下","shy", 200, @0);
	Move("st優愛_制服_通常左手下_shy", 0, @0, @50, Axl1, true);
	FadeStand("st優愛_制服_通常左手下_shy", 0, true);

	DelusionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800010yu">
「わたし……あ、あなたのことが好きなんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800020yu">
「ずっと、西條くんのこと、見てました……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800030yu">
「も、もう、見てるだけじゃいやなんです……」

顔を真っ赤にした優愛は、突然の告白の後、なぜかいきなり上着を脱ぎ出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	BGMPlay360("CH05", 3000, 1000, true);
	CreateTextureEX("優愛", 200, Center, @-1536, "cg/ev/ev019_02_3_優愛妄想_a.jpg");
//	Request("優愛", Smoothing);
	Zoom("優愛", 0, 500, 500, null, true);
	Fade("優愛", 500, 1000, null, true);
	DeleteStand("st優愛_制服_通常左手下_shy", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]

戸惑っている僕をチラリと見てはにかみ、上着だけじゃなくスカートも脱ぎ捨てる。ブラウスの裾から、チラチラとパンツが見え隠れしている。色は黒だ。

大胆なことをしながらも恥じらっている様子はポイントが高いけど……

こんな急展開には、僕の思考はついて行けない。ただただ、生唾を飲み込むのが精一杯。

優愛はさらに、ブラウスのボタンに手をかけた。上から順に、ひとつずつ外していく。

{	Move("優愛", 3000, @0, @+384, null, false);}
そしてゆっくりと、焦らすように、ブラウスを床に落とした。
中に着ていたのはなぜか、

競泳水着だった。

ピチピチだ。ハイレグだ。食い込みだ。
黒いパンツに見えたのは競泳水着だったのか。

{#TIPS_ＧＪ = true;$TIPS_on_ＧＪ = true;}
っていうか優愛っておとなしそうな顔してる割に、おっぱいが大きい。
あとハイソックスを脱がなかったのは<FONT incolor="#88abda" outcolor="BLACK">ＧＪ</FONT>と言っておこう。

{$TIPS_on_ＧＪ = false;}
でも――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	WaitAction("優愛", null);
	Move("優愛", 3000, @0, @+384, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800040yu">
「わたしのこと、好きに、してください……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800050yu">
「めちゃくちゃにして……いいですから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800060ta">
「な……な……」

絶句するしかない。

普通、初対面の男相手にこんなこと言う三次元の女子はいない。いるわけない。エロいけど、萌えない。

僕は今にも吹き飛ばされそうな理性を、必死でフル稼働させた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800070ta">
「だ、だ、だ――」

{	SetVolume360("CH05", 500, 0, NULL);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800080ta">
「だが断る！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	DelusionOut();

//ＢＧ//拓巳の部屋
	CreateBG(100, 0, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");
	Delete("優愛");

	DelusionOut2();
	PositiveHuman();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800090yu">
「キャッ！」

//ＳＥ//優愛が床のゴミに足を取られて尻餅をつく
{	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
僕が妄想にふけってボーッとしていると、優愛がいきなり豪快に尻餅をついた。少し泣きそうな顔をしながらお尻をさすっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流５へ

}

//=============================================================================//

if($妄想トリガー４ == 1)
{

	SetVolume360("CH11", 0, 0, NULL);

//☆☆☆
//分岐１３

	DelusionIn();

	DeleteAll();

	CreateBG(100, 500, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	Stand("st優愛_制服_通常左手下","shy", 200, @0);
	Move("st優愛_制服_通常左手下_shy", 0, @0, @50, Axl1, true);
	FadeStand("st優愛_制服_通常左手下_shy", 200, true);

	DelusionIn2();

	BGMPlay360("CH05", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800100yu">
「わたし、あなたのことが好きなんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800110yu">
「ずっと、西條くんのこと見てました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800120yu">
「もう、見てるだけじゃいやなんです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_shy", 500, true);
	CreateTextureEX("優愛", 200, Center, @-768, "cg/ev/ev019_01_3_優愛妄想_a.jpg");
	Zoom("優愛", 0, 500, 500, null, false);
	Fade("優愛", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
顔を真っ赤にした優愛は、突然の告白の後、持っていたバッグの中を漁り出した。なにかを探しているみたいだ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800130yu">
「あなたの全部を、わたしのものにしたいんです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800140yu">
「それでいろいろ考えて」

{	Move("優愛", 1500, @0, @-768, null, false);
	SetVolume360("CH05", 1500, 0, NULL);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800150yu">
「一番素敵な方法を、思いついたんです」

{	WaitAction("優愛", null);}
やがて取り出したのは――真新しい包丁だった。
デスクライトの明かりに照らされて、刃先がキラリと輝きを放つ。

僕はそれを、呆然と見つめることしかできない。
こんな急展開には、僕の思考はついて行けない。ただただ、生唾を飲み込むのが精一杯。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("優愛２", 200, Center, @-768, "cg/ev/ev019_01_3_優愛妄想_a.jpg");
	Zoom("優愛２", 0, 500, 500, null, false);
	Fade("優愛２"２, 500, 1000, null, true);
	Delete("優愛");

	BGMPlay360("CH10", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800160yu">
「わたし、あなたが好きだから……好き過ぎて、もう耐えられないから……」

優愛は包丁をその手に握りしめた。力を入れすぎているのか、指が白くなっている。

そして刃先をまっすぐこっちに向けた。

僕はいやいやをするように首を振り、拒絶の意志をなんとか表すけど、もはや優愛に話が通じるとは思えなかった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800170yu">
「あなたの肉とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800180yu">
「骨とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800190yu">
「皮膚とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800200yu">
「内臓とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800210yu">
「脳とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800220yu">
「目玉とか」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800230yu">
「もちろんあなたの……一番恥ずかしいところも」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800240yu">
「全部、わたしが――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	if(#下着パッチ==true)
	{
		CreateTextureEX("優愛", 200, 0, 0, "ex/hu/hu優愛_制服_冷酷_下着_mad_lip02.png");
	}else{
		CreateTextureEX("優愛", 200, 0, 0, "cg/hu/hu優愛_制服_冷酷_mad_lip02.png");
	}

	Move("優愛", 0, @-60, @-240, Dxl1, true);
	Fade("優愛", 0, 1000, null, true);

	Delete("優愛２");

//おがみ：立ち絵：優愛のmad差分使う

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601206]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800250yu">
「食べてあげますねぇぇっ、あひゃひゃひゃひゃ……！」

奇声を上げながら、優愛が僕の胸に飛び込んでくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 1000, 0, NULL);

	CreateColor("back03", 300, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 1000, 1000, null, true);

	FadeDelete("優愛", 0, false);

//ＳＥ//鈍い衝撃
	CreateSE("SE01","SE_衝撃_衝撃音03");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
鈍い衝撃。
圧迫感。
胸元を見る。

包丁の切っ先が、僕の身体に沈み込んでいて。

//恍惚の吐息
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800260yu">
「はあぁっ」

優愛が僕の耳元で、甘ったるい吐息を漏らす。
突き刺さった包丁が、僕の肉を、骨を、えぐる。

でも、痛みは感じない。

それはそうだ。
だってこれは、

妄想だから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DelusionOut();

	Delete("back03");

//ＢＧ//拓巳の部屋
	CreateBG(100, 500, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

	Delete("優愛２");

	DelusionOut2();
	NegativeHuman();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
{#TIPS_ヤンデレ=true;$TIPS_on_ヤンデレ = true;}
こえええええ。<FONT incolor="#88abda" outcolor="BLACK">ヤンデレ</FONT>こえええええ。
自分で妄想したことだけど、あまりの怖さに鳥肌が立った。

{$TIPS_on_ヤンデレ = false;}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800270yu">
「キャッ！」

//ＳＥ//優愛が床のゴミに足を取られて尻餅をつく
{	CreateSE("SE03","SE_じん体_動作_尻餅");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}

僕がひとりで震えていると、優愛がいきなり豪快に尻餅をついた。少し泣きそうな顔をしながらお尻をさすっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流５へ


}


//=============================================================================//

if($妄想トリガー４ == 0)
{



//☆☆☆
//分岐１４

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
星来たんのフィギュアをひとつ譲ってくれ、とか言うつもりか！？

だとしたらふざけるなと言いたい！

僕と嫁を引き裂こうとするなんて、とんでもない極悪非道行為だ！

誰がなんと言おうと、いくらお金を積まれようと、僕は星来たんと離れる気なんてないからな！
っていうか欲しいなら自分で買え！

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	Stand("st優愛_制服_通常","shock", 95, @-150);
	FadeStand("st優愛_制服_通常_shock", 300, false);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, true);
	Move("st優愛_制服_通常_shock", 300, @0, @50, Axl1, false);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800280yu">
「キャッ！」

//ＳＥ//優愛が床のゴミに足を取られて尻餅をつく
{	WaitAction("st優愛_制服_通常_shock", null);}
僕が心の中で悪態をついていると、優愛はいきなり豪快に尻餅をついた。少し泣きそうな顔をしながらお尻をさすっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流５へ

}


//=============================================================================//

//☆Cut-69-----------------------------
//☆☆☆
//合流５

	BGMPlay360("CH11",1000,1000,true);

	Stand("st優愛_制服_通常","worry", 200, @+100);
	FadeStand("st優愛_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800290yu">
「す、すみません……。ＣＤを、踏んづけちゃったみたいです……ケース割れたかも……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800300yu">
「本当にごめんなさい、わたし、きちんと片付けますから……っ」

{	DeleteStand("st優愛_制服_通常_worry", 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800310ta">
「い、いいよ……」

いいからさっさと帰れよ……。
それにさっき言ってた“お願い”って結局なんなんだよ。

僕が断ったにもかかわらず、優愛は足許に散乱しているゴミやＣＤを整理し始めた。その表情は申し訳なさそうだから、まるで僕が悪いみたいに思えてくる。

{	Stand("st優愛_制服_通常左手下","worry", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_worry", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800320yu">
「じゃ、じゃあ、足の踏み場だけでも……その、確保させてください。すいません……。その後で、お願い、言いますから……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
せっせと片付けていく優愛の姿は、まるで母親みたいだ。
人の都合なんておかまいなく、自分のやりたいことだけに突っ走っていく。

まさに余計なお節介……。

こういうとき、僕の立場としては優愛を手伝ってあげるべきなんだろう。

それで、互いにゴミへと伸ばした手が触れちゃって『あ……』とか言いつつ見つめ合っていい雰囲気になったりするんだろう。

どんなラブコメだよ！

僕は絶対手伝わないからな。

//優愛はこのとき、例の『杭』を見つけて拾った
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800330yu">
「あ……」

雑誌の山を神経質そうに積み重ねていた優愛の手が止まった。ちょうど僕に背中を向ける形になっていて、優愛の手許はよく見えない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800340ta">
「…………？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","worry", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601110]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800350yu">
「い、いえっ。気に、気にしないでください……」

やけに慌てている。これは怪しい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常左手下_worry", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
よく考えたら、僕の部屋の中を物色されているのと変わらない状況じゃないか。なにか盗まれるかもしれない。

フィギュアなんてあれだけ数があるからどうせ１人ぐらいいなくなってもバレないだろう、とか考えてるかも。

でもそうはいくか！

僕は自分の嫁のことは全部把握してるんだからな！
ひとりでもいなくなればすぐに分かるんだぞ！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800360ta">
「フィ、フィギュアには触らないでね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800370yu">
「は、はい。いえ、違うんです……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常左手下","shy", 200, @+100);
	FadeStand("st優愛_制服_通常左手下_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800380yu">
「その……ブラチューの同人誌、って言うんですか？　それが、落ちてまして……ちょっと中身を見てみたら……」

ブラチューの同人誌……。
エ、エロいやつだ……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800390yu">
「す、凄かったので、びっくりしました……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800400ta">
「…………か、勝手に、見ないでよっ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800410yu">
「あ、すいませんっ」

{	DeleteStand("st優愛_制服_通常左手下_shy", 500, false);}
優愛は慌てたようにまた手を動かし始めた。
そうして、なんとか座れるだけのスペースを手早く作ると、
僕に向き直った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","worry", 200, @+100);
	FadeStand("st優愛_制服_通常_worry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800420yu">
「それで、あの、さっき言った……お願い、ですけど……」

来た……！

僕はゴクリと息を呑んで、本能的に身構えてしまった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800430yu">
「さっき言った……フィギュアの予約、一緒に行ってもらえませんか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800440ta">
「え？　ええ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800450yu">
「わたし、そういう、アニメショップみたいなところって、今まで行ったことなくて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800460yu">
「って、あ、わたし、なんだかすごくぶしつけなお願いしてますよね、すいません……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800470yu">
「わたしのせいで、西條くんはケガをしたのに……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800480ta">
「…………」

危険だ。
これは迂闊に返事をしていい問題じゃない。

そもそも、優愛とは確かに趣味が合いそうだし、星来を好きだって言ってるし、僕の話も興味深そうに聞いてくれるし、オタの僕からすればかなり話しやすい相手ではある。

でもこれはきっと罠だ。
こんなエロゲみたいなご都合主義的な展開が現実に起こるなんてあり得ない。

三次元に毒されるな。
考えろ……。優愛はいったいなにが目的なんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800490yu">
「す、すいません、今のお願いは、忘れてください……っ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800500yu">
「わたし、西條くんがいろいろ話してくれるのが……
その、嬉しくて……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800510ta">
「…………」

頭を下げる優愛。

やたら威張りくさってるのがほとんどの三次元女の中じゃ、珍しいくらい控えめだ。

こんなかわいくて性格がよさそうな子が現実にいるはずがない。これは……演技だ！

断ってやる。男らしくズバンと言ってやる……！

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800520yu">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
顔を上げた優愛の、眼鏡の奥に見える目は潤んでいた。

もしかして、泣いてるの？
僕が無言だから？
僕が泣かした？

ひええ、か、勘弁してよ……。

こんな修羅場、ゲームでしか経験したことないよ。

すごくドキドキしてきた。しかも罪悪感まである。

女の涙は武器になるってよく言うけど、今ようやくその言葉が真実だって実感した。
正直、どうしたらいいか分からない。

ただ気ばかりが焦って、オロオロしてしまう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800530ta">
「い……」

一緒に行ってあげるよ、と言おうとしたけどできなかった。

もしもそう言った後で“本気にすんなよバーカ。キモい”とか言われたらどうしよう？

そんな被害妄想にとらわれて、声が出なくなった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800540yu">
「無理してくれなくていいです。わたしのワガママに、西條くんを付き合わせるのはよくないですし……ぐすっ」

なんだかさっきより瞳が潤んでるぞ……。
今にも雫が目尻からこぼれ落ちそうだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800550ta">
「い、行く……よ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH11", 3000, 1000, true);

	Stand("st優愛_制服_通常","shock", 200, @+100);
	FadeStand("st優愛_制服_通常_shock", 300, true);
	DeleteStand("st優愛_制服_通常_worry", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800560yu">
「え？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800570ta">
「…………」

{	Stand("st優愛_制服_通常左手下","worry", 200, @+100);
	DeleteStand("st優愛_制服_通常_shock", 300, false);
	FadeStand("st優愛_制服_通常左手下_worry", 300, true);}

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800580yu">
「行って、もらえるんですか？」

仕方なくうなずく。

こうするしか、優愛を泣きやませる方法を思いつかなかった。
まんまと罠にはめられた気がするけど……。

優愛はホッとしたように息をつくと、眼鏡を外して涙を拭った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","smile", 200, @+100);
	DeleteStand("st優愛_制服_通常左手下_worry", 300, false);
	FadeStand("st優愛_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800590yu">
「断られて当然だと思ってたのに……。西條くん、ありがとうございます」

お礼を言ってきた……。

なんとか本格的に泣かせるまでには至らなかったみたいだ。

助かったのはこっちだよ……。
はあ、なんでこんなに追い詰められてるんだろう。

くそぅ、三次元女め……油断大敵だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","normal", 200, @+100);
	FadeStand("st優愛_制服_通常_normal", 300, true);
	DeleteStand("st優愛_制服_通常_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800600yu">
「行くとしたら、いつがいいでしょう？」

しかも、さっきまでの悲しそうな表情がどこへやら。
すっかり嬉しそうな顔になってるし。

やっぱり、嘘泣きだったんじゃないかな……。
もしそうなら、女優なみの演技力だぞ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800610yu">
「星来ちゃんの新しいフィギュアは、もうすぐ発売なんですよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800620ta">
「う、うん。きっとすぐに完売しちゃう……だろうね」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800630yu">
「だったら、早めに行った方がよさそうですね……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800640yu">
「明日とか……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800650ta">
「…………」

確か今週の僕のスケジュールだと、明日は学校に行く日だ。今週はよりによって３回行かなくちゃいけないんだ。その分、来週は２回なんだけど。

明日はますます憂鬱な日になりそうだ。

でもすっかり行く気になってる優愛に“やっぱり行かない”なんて言ったらまた泣かれるかも……。
うう、翻弄されてる……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800660ta">
「わ、分かったよ……」

渋々、了解した。
優愛は嬉しそうだ。

そんな顔をしたって騙されないんだからな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800670yu">
「西條くんは何組？　明日、放課後に迎えに行きますよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800680ta">
「……Ｂ組」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800690yu">
「２年Ｂ組ですね。じゃあ、授業が終わったら待っててください」

早く優愛に帰ってもらいたくて、僕はコクコクとうなずく。

女の子と、一緒に遊びに行く約束……。これって、夢とか妄想じゃないよなあ……？

試しに頬をつねってみた。痛かった。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800700yu">
「それじゃあ、長い間お邪魔しちゃって、すいませんでした。足、もし痛かったらお医者さんに行ってくださいね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800710ta">
「あ、うん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_normal", 500, true);
	CreateSE("SE02","SE_日常_扉_開ける");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateBG(100, 1000, 0, 0, "cg/bg/bg026_01_3_拓巳部屋_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601018]
僕はソファに座ったまま、優愛が出ていくのを見送る。
優愛は部屋から出ていく直前、僕を振り返って小さく手を振った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st優愛_制服_通常","smile", 200, @-100);
	FadeStand("st優愛_制服_通常_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch01/01800720yu">
「西條くん、また明日」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800730ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st優愛_制服_通常_smile", 500, true);

	CreateSE("SE01","SE_日常_扉_閉まる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	SetVolume360("CH11", 500, 0, NULL);

	CreateBG(100, 1000, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Wait(3000);

	CreateBG(100, 500, 0, 0, "cg/bg/bg000_04_1_chnチャットサンプル_a.jpg");

//ＳＥ//扉が閉まる（優愛が出ていった）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800740ta">
「また明日、だってさ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800750ta">
「しかも手を振ったりして……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800760ta">
「…………ふひひ」

自然と頬が緩みそうになって、慌てて引き締めた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800770ta">
「あの女、絶対僕に惚れてる。間違いないね。ふひひ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800780ta">
「ま、付き合うか付き合わないかは僕に選択肢があるわけだし？　あの女を情け容赦なく振ってやるさ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01800790ta">
「“お前は僕の女にふさわしくない。星来よりいい女になって出直してこい。まあ一生無理だけどな。なにしろ星来は永遠の１７歳だからな”みたいな。ふひひひひひひひ」

星来たんよりいい女なんているもんか。

フィギュアを手に取って、頬ずりしてあげた。
星来たんは嬉しそうだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(1000);


	Wait(2000);
//～～Ｆ・Ｏ


}

