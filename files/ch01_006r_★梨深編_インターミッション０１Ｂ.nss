//<continuation number="380">

chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_006r_★梨深編_インターミッション０１Ｂ";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	ch01_006r_★梨深編_インターミッション０１Ｂ();
}


function ch01_006r_★梨深編_インターミッション０１Ｂ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梨深編
//２周目梨深編追加インターミッション０１Ｂ

//梨深編突入フラグが立っている場合、“ch01_006_妄想トリガー１■”『あ、そういえばブラチューのＤＶＤ５巻って予約受付がそろそろ始まるんじゃなかったっけ。』後にアイキャッチを入れて、以下を挿入

//■インターミッション０１Ｂ


//■アイキャッチ
	IntermissionIn();

	DeleteAll();

//ＢＧ//黒
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");

	IntermissionIn2();

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg108_01_2_将軍病室_a.jpg");
	Fade("back01", 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
時間はそれから２時間ほど前にさかのぼる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
//ＢＧ//将軍病室
	FadeDelete("Black", 1000, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
夕焼けのオレンジ色に染まったその病室は、時が止まっているかのように静かだった。室内にいるのは１人。車イスに腰掛けた、少年だけ。
その彼も、眠っているのか、身動きをしようとしなかった。

病院はちょうど夕食の時間のはずで、看護師たちが慌ただしく患者に配膳をするのが普通だが、廊下の外からそんな気配はまったくしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//病室のドア開ける
//梨深は私服
	CreateSE("SE01","SE_日常_びょういんどあ_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE01", null);

	Wait(500);

	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
と、静寂を破って、病室のドアが開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_私服_正面","normal", 300, @+200);
	FadeStand("st梨深_私服_正面_normal", 500, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
入ってきたのは、１人の少女。

車イスの少年は顔を上げて彼女の姿を認めたが、特に声をかけることはない。

少女はしばらく、病室の入り口に立ち尽くしていた。
どことなく寂しげな雰囲気を漂わせて、室内を見回す。

{	DeleteStand("st梨深_私服_正面_normal", 500, true);}
狭くて、陰気で、消毒薬の匂いに満ちている、病室。
ここは、彼と彼女、２人が生活している空間だった。

誰も訪れることのない、世界から隔絶された場所。
医師も、看護師も、２人の家族や知り合いも来ない。

少女と少年、２人はそれほど会話を交わす方ではない。
本来、この病室に入院している立場である少年は、１年間ずっと眠り続けていて、つい１ヶ月ほど前に目覚めたばかりだ。

少女は居候のようなものだった。
彼女は少年のことを信頼していたが、男女の関係があるわけではなかった。ましてや恋愛感情などは皆無。

彼女はただ少年に恩返しがしたいだけ。それ以上でも以下でもなかった。

少年は彼女にわざと冷たく接しているようだった。この病室には来ない方がいい、と言ったこともある。それでも少女は居座り続けた。他に行き場所がなかった、という理由もある。

少年が眠り続けている間、少女はたった１人で彼の介護をしていた。眠るときは病室に備え付けのソファで眠った。それは、彼が目覚めた今も変わらない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_私服_正面","smile", 300, @+200);
	FadeStand("st梨深_私服_正面_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100010ri">
「ごはん、買ってきたよ」

優しさを含んだ声でそう言って、少女は持っていたコンビニの袋を掲げて見せた。

彼女の声が、それまで止まっていた病室の空気を震わせたかのような感覚。死んでいた世界に、再び息吹が与えられ、あらゆるものが動き出す。

そんな錯覚に陥った少女だったが、そのことを少年に伝えることはせず、今は無人のベッドの上にいくつものパンを並べていった。

{	Stand("st梨深_私服_通常","normal", 300, @+200);
	DeleteStand("st梨深_私服_正面_smile", 300, false);
	FadeStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100020ri">
「いつも思うんだけどさ、こんな食事で、身体は大丈夫？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100030jn">
「もともと、先は長くないから。買ってこさせて、ごめん」

{	Stand("st梨深_私服_通常","smile", 300, @+200);
	FadeStand("st梨深_私服_通常_smile", 300, false);
	DeleteStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100040ri">
「……いいのいいの。あたしの分のついでだから。気にしないで」

{	DeleteStand("st梨深_私服_通常_smile", 500, false);}
少女はわざとらしく笑う。それから、タマゴサンドを持って窓際に歩み寄った。

//▼べー：ＳＥ：08/11/18ダミーがなくなりました。リストにあるので要確認
//ＳＥ//窓を開ける
{	CreateSE("SE03","SE_じん体_動作_手_びょういん窓開ける");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
窓を開けると、秋のさわやかな風が、静かだった病室内を吹き抜けていく。少女は気持ちよさそうに目を細めて風を浴び、それから窓の縁に器用に腰掛けた。

窓の下まで、かなりの高さがある。落ちれば即死だろう。
だが少女は物怖じする気配もなく、その場でタマゴサンドをぱくつき始めた。

車イスの少年はそれを注意しようとはしない。
ベッドに並べられたパンに手を伸ばそうともしない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：演出の為、立ち絵消す
//	Stand("st梨深_私服_正面","sad", 300, @+200);
//	FadeStand("st梨深_私服_正面_sad", 500, true);
	CreateSE("SE01","SE_じん体_動作_尻餅");

	CreateTextureEX("back02", 100, 0, 0, "cg/bg/bg126_01_2_夕焼け空_a.jpg");
	Fade("back02", 500, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100050ri">
「ねえ。もう一度聞くけど……ホントに、“彼”を覚醒させるつもり？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100060jn">
「うん。昨日、チャットをしてみてはっきりした。ＮＯＺＯＭＩはすでに“彼”に目を付けている。ノアⅡも完成間近だし、急がないと」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100070ri">
「どうしても、やるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100080jn">
「……そうだよ」

//	Stand("st梨深_私服_通常","hard", 300, @+200);
//	DeleteStand("st梨深_私服_正面_sad", 300, false);
//	FadeStand("st梨深_私服_通常_hard", 300, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100090ri">
「でも、それじゃ、ＮＯＺＯＭＩと変わらない。“彼”に恐怖を与えて、追い詰めて……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100100jn">
「“彼”しかいないんだ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100110ri">
「……“彼”が覚醒すれば、あなたは死ぬのに」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100120jn">
「最初から、覚悟の上だよ。“彼”にすべての責任を押しつけようとしている僕には、相応の罰だと思う」

少女の視線は窓の外の夕焼け空へと固定されたままで、室内にいる少年を振り返ろうとはしない。
その表情は、今にも泣き出しそうなものだった。

//	Stand("st梨深_私服_通常","rage", 300, @+200);
//	FadeStand("st梨深_私服_通常_rage", 300, false);
//	DeleteStand("st梨深_私服_通常_hard", 300, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100130ri">
「“彼”を消すっていう選択肢は、ないかな？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100140jn">
「そうなったら、僕はまた１年以上昏睡する覚悟で、新しい“僕”を生み出さないとね。その頃にはノアⅡは完成して、世界には絶望が溢れているだろうけど」

少年の口調はとても穏やかだ。けれど言葉には、多少の皮肉が混じっていた。少女がそれを聞いてため息をつく。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100150ri">
「あたしは、あなたのやり方には反対だな」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100160jn">
「ノアⅡを完成させるわけにはいかない」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100170ri">
「そうだけど……。“彼”の立場を考えたら……悲しすぎるよ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100180ri">
「それに、あなたが自殺しようとしているのを、むざむざ指をくわえて見ているわけにもいかないし」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100190jn">
「自殺じゃないよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100200ri">
「……あたしが、なんとかする」

少女の、唐突な、けれど決意を込めたその言葉に、初めて少年が驚いたかのように身じろぎをした。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100210jn">
「なんとか、って？」

{	MusicStart("SE01",0,1000,0,1000,null,false);
	FadeDelete("back02", 500, true);}
//	DeleteStand("st梨深_私服_通常_rage", 300, false);
//ＢＧ//将軍の病室
少女はタマゴサンドを平らげると、窓の縁から降りて、少年に向き直った。なぜか、敬礼のようなポーズをする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_私服_通常ビシッ！","normal", 300, @+200);
	FadeStand("st梨深_私服_通常ビシッ！_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100220ri">
「あたしが、ＮＯＺＯＭＩから、“彼”を守る」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100230ri">
「そうすれば、あなたは死なないから」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100240jn">
「それじゃ、“彼”が生まれた意味がなくなるし、なんの解決にもならない。ノアⅡが――」

{	Stand("st梨深_私服_通常","normal", 300, @+200);
	DeleteStand("st梨深_私服_通常ビシッ！_normal", 300, false);
	FadeStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100250ri">
「ノアⅡも、あたしがなんとかするって」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100260jn">
「……君には、無理だよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100270ri">
「もう決めたの」

{	Stand("st梨深_私服_通常","smile", 300, @+200);
	FadeStand("st梨深_私服_通常_smile", 300, false);
	DeleteStand("st梨深_私服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100280ri">
「あたしはあなたを守るために、あなたと対立します」

とても儚げな、それでいて穏やかな微笑み。
少女のその笑みに、少年は言葉を失う。

{	Stand("st梨深_私服_通常","normal", 300, @+200);
	FadeStand("st梨深_私服_通常_normal", 300, false);
	DeleteStand("st梨深_私服_通常_smile", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100290ri">
「あなたの予言によると、今日、新しい事件が起きるんだよね？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100300jn">
「……予言じゃない。事実だよ。彼らの妄想を“見た”からね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100310ri">
「だったら、“彼”をその事件に近づけさせないようにしなくちゃ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100320ri">
「あたし、ちょっと行ってくるね」

{	DeleteStand("st梨深_私服_通常_normal", 500, true);}
少女は、病室のドアへと歩き出す。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100330jn">
「君が邪魔をしても、僕は予定通り、“彼”を目覚めさせるよ」

{	CreateSE("SE01","SE_日常_びょういんどあ_開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
少年の言葉を背中で受けた彼女は、ドアを開けたところで一度だけ立ち止まった。廊下の外は無人。誰もいない。声も、物音もしない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100340ri">
「ねえ、あたしたちって、なんなんだろう？　誰にも存在を知られずに、ここにもう１年以上いる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100350ri">
「ここにいると、自分っていう存在は幻なんじゃないかって、思えてきちゃうの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100360ri">
「たはは。ジメジメ気分になるのは、やっぱり病院だからかな？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00100370jn">
「梨深……。君はかかわるべきじゃない」

少年の懇願するような言葉にも、
やはり少女は振り返ろうとはせずに――

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00100380ri">
「パン、ちゃんと食べるんだよ？」

{	CreateSE("SE02","SE_日常_びょういんどあ_閉まる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
ぽつりと、それだけつぶやいて、病室を出ていった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(2000);
	Wait(2000);

//～～Ｆ・Ｏ

//アイキャッチ
//※拓巳視点に戻る


//この後、“ch01_007_円山町殺人現場”へ
}