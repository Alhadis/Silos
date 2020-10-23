//<continuation number="650">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_169_妄想トリガー３９■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch08_169_妄想トリガー３９■();
}


function ch08_169_妄想トリガー３９■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Stand("bu梨深_制服_通常","normal", 250, @50);
	FadeStand("bu梨深_制服_通常_normal", 0, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１３へ
//ネガティブ妄想→分岐１４へ
//妄想しない→分岐１５へ

if($妄想トリガー通過３９ == 0)
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
			$妄想トリガー３９ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー３９ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー３９ = 0;
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
			$RouteON=true;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$梨深ルート=false;
		}
	}
	$GameDebugSelect = 0;
}


//=============================================================================//

if($妄想トリガー３９ == 2)
{
//☆☆☆
//分岐１３
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionIn();

	BoxDelete(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");

	Stand("bu梨深_制服_通常","normal", 250, @50);
	FadeStand("bu梨深_制服_通常_normal", 0, true);

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900010ri">
「うん、分かった」

{	Stand("bu梨深_制服_通常","happy", 250, @50);
	FadeStand("bu梨深_制服_通常_happy", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900020ri">
「ねえ、あたしのこと、ご家族に紹介してくれる？」

{	BGMPlay360("CH05", 0, 1000, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900030ta">
「え？」

梨深は少しいたずらげな表情で、僕の顔をのぞき込んでくる。

{	Stand("bu梨深_制服_通常","normal", 250, @50);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_happy", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900040ri">
「タクのお家にお邪魔することになれば、
顔を合わせることになるでしょ？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900050ri">
「タクはどうするつもりなのかなあ、って思って」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900060ri">
「ね、どう？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900070ta">
「えっと……」

そういうイベントって、恋人になってからするものじゃないのかな。
僕と梨深は、今のところ恋人でもなんでもないのに。

っていうか、“今のところ”ってなんだ？

今後、恋人になる可能性があるって僕は考えてるのか？

確かに梨深はすごく親しげに接してくれるけど、僕はしょせんキモオタなんだぞ？

期待するだけ無駄だよ。
うぬぼれるのもいい加減にしろよ、僕。

{	Stand("bu梨深_制服_正面","hard", 250, @50);
	FadeStand("bu梨深_制服_正面_hard", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900080ri">
「タク。教えてってば」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900090ta">
「あ、え、そのぅ……」

なんて答えればいいんだろう。

紹介するって答えたら、明らかに調子に乗りすぎてる気がするし。

紹介しないって言ったら、梨深が傷つきそうだし……。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900100ri">
「あーもう、じれったいなあ。こうなったら、はっきり言わせてもらっちゃおうかな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH05", 500, 0, true);
	Stand("bu梨深_制服_通常","rage", 250, @50);
	FadeStand("bu梨深_制服_通常_rage", 200, false);
	DeleteStand("bu梨深_制服_正面_hard", 200, true);
	Move("bu梨深_制服_通常*", 100, @0, @-20, Dxl1, true);
	Move("bu梨深_制服_通常*", 100, @0, @20, Axl1, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900110ri">
「紹介して！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900120ta">
「は、はいっ」

勢いに負けて、ついうなずいてしまった。
でも梨深は、その僕の答えに満足そうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_rage", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900130na">
「計算どーり！」

と、いきなり聞き覚えのある声が僕の耳に届いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_席を立つ_勢いよく");
	SoundPlay("SE03", 0, 1000, false);
	Wait(500);
	Stand("st七海_制服_通常","normal", 200, @-50);
	FadeStand("st七海_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
驚いて声のした方を見ると、なぜか七海がコンテナハウスの陰から、ひょっこりと笑顔をのぞかせていた。

{	BGMPlay360("CH08", 0, 1000, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900140ta">
「な、な、七海……！？」

七海が、なんでここにいるんだ。

しかもさっきの深刻そうな電話の声とはまるで別人のように、笑顔ではしゃいだ態度。

僕は困惑し、頭の中が真っ白になった。
そんな僕の混乱をよそに、七海は足取りも軽く駆け寄ってくると、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_制服_通常_normal", 300, true);
	CreateSE("SE03","SE_にん間_動作_手_はたく");
	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev080_01_1_梨深七海ハイタッチ_a.jpg");
	DrawTransition("背景２", 300, 0, 1000, 100, null, "cg/data/light6.png", true);
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900150na">
「いえーい！」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900160ri">
「いえーい！」

梨深とハイタッチを交わした。

え、なんで？

まるで梨深と知り合いみたいな態度じゃないか。
この２人が知り合いだったなんて、聞いてないぞ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900170na">
「おにぃ、びっくりした？」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900180na">
「実は、ぜーんぶナナと梨深さんの作戦だったんだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900190ta">
「さ、作戦……？」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900200na">
「そ！　名付けて
“おにぃと梨深さんの仲を既成事実にしちゃおう作戦”」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900210na">
「おにぃがあんまりにも奥手で、全然梨深さんの気持ちに気付こうとしないから、ナナが協力したの」

ま、まさか……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900220ta">
「じゃ、じゃあ、お前……手首の包帯とか、さっきの電話とかは……」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900230na">
「全部作戦のうち。おにぃったら本気でナナの心配してるから、ちょっと笑いそうになっちゃった。あはは」

悪びれる様子もなく、七海は笑う。
思わずカッとなった。このクソ妹め……！

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900240ri">
「ごめんね、タク。騙すようなことしちゃって」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900250na">
「梨深さんは謝らなくてもいいの。おにぃが超鈍感なのが悪いんだから」

がっくりとその場に膝をつく。
してやられたという悔しさ。僕が本気で心配していたのをバカにするような言い草。

気に入らない。七海のやり方はホントに気に入らない。

でも、それ以上に。
僕の心配が杞憂で終わったこと。
七海は無事で、いたってピンピンしてること。

そのことへの安堵感の方が強くて、緊張の糸がぷっつりと切れた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景２", 1000, 0, null, true);

	Wait(500);

	Stand("bu梨深_制服_正面","sad", 250, @240);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900260ri">
「タク、大丈夫？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu七海_制服_通常","normal", 210, @-240);
	FadeStand("bu七海_制服_通常_normal", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900270na">
「おにぃ、落ち込んでないで、ほら、立って」

//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900280na">
「これからお父さんとお母さんに、梨深さんを紹介しに行かなくちゃいけないんだから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 250, @240);
	Stand("bu七海_制服_通常","smile", 210, @-240);
	FadeStand("bu梨深_制服_正面_smile", 500, false);
	FadeStand("bu七海_制服_通常_smile", 500, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);
	DeleteStand("bu七海_制服_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//◆帰ろ＝帰ろう
//【七海】
<voice name="七海" class="七海" src="voice/ch08/16900290na">
「３人で一緒に、帰ろ！」

ホントに、七海は生意気な妹だ。
いつもいつも兄のことをバカにして。

僕は少し拗ねながら、仕方なく立ち上がる。

{	DeleteStand("bu梨深_制服_正面_smile", 500, false);
	DeleteStand("bu七海_制服_通常_smile", 500, false);}
梨深と七海が、楽しそうに笑い合って、僕の手を左右から握ってくる。

２人に手を引かれて、歩き出す。
楽しくなりそうな予感。

平和で、明るい未来が待っていそうな、そんな気がした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ


	BGMPlay360("CH*", 0, 0, false);
	SoundPlay("SE*", 0, 0, false);

	DelusionOut();

//ＢＧ//ＫＵＲＥＮＡＩ会館屋上//夕方
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	DelusionOut2();
	PositiveHuman();

	Wait(1000);

//ＳＥ//女性の悲鳴のような共鳴音
	CreateSE("SE01","SE_擬音_共鳴音_女性悲鳴のよう");
	MusicStart("SE01", 100, 1000, 0, 1000, null, false);

//※セナがリアルブート中

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
突如――

甲高い音が耳に突き刺さった。

それはまるで、女性の悲鳴のような――

その音で僕は我に返り、七海の登場やら作戦やらが、自分にとって都合のいい妄想だったことを思い知らされた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//合流６へ
}


//=============================================================================//

if($妄想トリガー３９ == 1)
{
//☆☆☆
//分岐１４

	Stand("bu梨深_制服_正面","sad", 250, @50);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);

	Wait(200);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆申し訳なさそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900300ri">
「イヤだよ……」

はっきりと、拒否された。

//◆申し訳なさそうに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900310ri">
「あたし……行きたくない」

まさかそう言われるとは思いもよらなかった僕は、自分の耳を疑う。

今まで、梨深は僕のワガママをなんでも聞いてくれた。
いつも、僕を助けてくれた。僕を支えてくれた。

だから無条件に、なにを言っても肯定してくれるって思ってた。

でも、そもそも拒否されるはずがないって思い込んでいた僕の方が異常なんだと、考え直す。

僕は、調子に乗ってたんだ。
梨深に、甘えすぎていたんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900320ta">
「そう……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900330ri">
「それに――」

梨深は僕に背を向ける。
そして自分自身を抱きしめるようにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","hard", 250, @50);
	FadeStand("bu梨深_制服_正面_hard", 300, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900340ri">
「それに、タクも、行かない方がいい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900350ta">
「それって、どういう……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900360ri">
「実家には、戻らないで」

きっぱりとした口調。
まるで命令されているような。

僕は戸惑う。
梨深がどういう意図でそう言うのか理解できない。

今、梨深はどんな顔をしているんだろう。

分からない……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900370ta">
「わ、訳が、分からな――」

//◆（前の拓巳のセリフを）遮って
//おがみ：↑演出として組む？
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900380ri">
「あなたはなにも知らなくていい」

その声音には、切迫感があった。
ついさっきまでの梨深とはまるで別人だ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900390ri">
「ここで、このコンテナハウスだけでずっと生きていけばいいの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900400ri">
「そうしてもらわないと……困るんだ」

困る……？

っていうか、これは妄想……だよね？
違う……の？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(100);

//ＳＥ//女性の悲鳴のような共鳴音
//※セナがリアルブート中
	CreateSE("SE01","SE_擬音_共鳴音_女性悲鳴のよう");
	DeleteStand("bu梨深_制服_正面_hard", 200, false);

	Wait(500);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
突如――

甲高い音が耳に突き刺さった。

それはまるで、女性の悲鳴のような――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	NegativeHuman();


//合流６へ
}


//=============================================================================//

if($妄想トリガー３９ == 0)
{
//☆☆☆
//分岐１５

	Stand("bu梨深_制服_通常","rage", 250, @50);
	FadeStand("bu梨深_制服_通常_rage", 300, true);
	DeleteStand("bu梨深_制服_通常_normal", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900410ri">
「それって」

梨深は難しい顔をして考え込んだ。

{	Stand("bu梨深_制服_通常","shock", 250, @50);
	FadeStand("bu梨深_制服_通常_shock", 300, true);
	DeleteStand("bu梨深_制服_通常_rage", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900420ri">
「もしかして、ご、ご両親に紹介する、みたいな流れ？」

//◆呆然
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900430ta">
「…………」

梨深があまりにバカなことを言い出したから、思わずポカーンとしてしまった。

//◆苦笑
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900440ri">
「だとしたら心の準備がまだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900450ta">
「ち、ちがっ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900460ta">
「そうじゃなくて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//女性の悲鳴のような共鳴音
//※セナがリアルブート中

	SoundPlay("SE01", 200, 0, false);
	Wait(300);

	CreateSE("SE01","SE_擬音_共鳴音_女性悲鳴のよう");
	DeleteStand("bu梨深_制服_通常_shock", 200, true);

	Wait(500);

	MusicStart("SE01", 100, 1000, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
突如――

甲高い音が耳に突き刺さった。

それはまるで、女性の悲鳴のような――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//合流６へ
}


//=============================================================================//

//☆☆☆
//合流６

	Stand("bu梨深_制服_通常","shock", 250, @50);
	FadeStand("bu梨深_制服_通常_shock", 400, true);
	CreateTextureEX("背景２", 110, 0, 0, "cg/ev/ev060_01_3_セナコンテナ登場_a.jpg");
	Request("背景２", AddRender);

	CreateColor("色１", 150, 0, 0, 1280, 720, "RED");
	Fade("色１", 0, 0, null, true);
	Request("色１", AddRender);
	CreateColor("色２", 130, 0, 0, 1280, 720, "RED");
	Fade("色２", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆驚く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900470ri">
「……！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_通常_shock", 500, true);

	CreateTextureEX("Blur", 100, Center, Middle, "SCREEN");
	Request("Blur", Smoothing);
	SetAlias("Blur", "Blur");
	Fade("Blur", 0, 300, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Blur3");
	Request("プロセス１", Start);

	CreateSE("SE03","SE_自然_じ鳴り_LOOP");
	CreateSE("SE04","SE_自然_風音_強_LOOP");
	SoundPlay("SE03", 0, 500, true);
	SoundPlay("SE04", 0, 1000, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text111]
風が激しく吹き荒れ、
空気が震え、

{	Fade("色１", 0, 800, null, true);
	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/lightn7.png", true);}
真紅の輝きが視界を奪う。

なにが起こったのか分からないまま、僕は光の方へと顔を向ける。

{	Fade("色２", 500, 1000, null, true);}
コンテナハウスの上。
見上げれば、そこに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev060_01_3_セナコンテナ登場_a.jpg");
	Fade("背景２", 10, 1000, null, true);
	Fade("背景２", 3000, 0, null, false);
	Fade("色２", 1000, 0, null, false);
	Fade("色１", 1500, 0, null, false);
	DrawTransition("色１", 1500, 1000, 0, 100, null, "cg/data/zoom1.png", true);
	Wait(1500);
	Delete("プロセス１");
	Delete("Blur");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text211]
ディソードを持った、蒼井セナの姿。

光の正体は、ディソードの明滅。
だけど妙だ。

前に見たときは、セナのディソードは、青い光を放っていたはずなのに。

{	Wait(500);
	SoundPlay("SE03", 1000, 0, false);
	SoundPlay("SE04", 1000, 0, false);}
音はすぐに消え失せる。
風もやむ。

{	Wait(700);
	BGMPlay360("CH06", 3000, 1000, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900480sn">
「答えろ――」

鋭い声。
冷たい視線。
セナの瞳に浮かぶのは、明確な敵意。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900490sn">
「これを書いたのは、お前か？」

そう言って突き出したのは、あの『Ｉｒ２』の落書きがされた作文用紙だった。
なぜかしわくちゃになっている。

どうして、セナがあれを持っているんだ。
どうして、セナがここにいるんだ。

不法侵入。
その言葉が頭に浮かび。
自分の部屋を物色されたことに気付く。

どういうつもりだ？

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900500sn">
「答えろと言っている」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900510ta">
「そ、そう、だけど……だから？」

//以下、梢の声は心の声
//ＶＦ//心の声
//◆緊迫
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16900520ko">
「拓巳しゃん！」

今のはこずぴぃの心の声だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev060_02_3_セナコンテナ登場_a.jpg");
	Fade("背景２", 200, 1000, null, true);
	Move("背景２", 300, @0, @-80, Dxl1, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
彼女はセナの背後にいた。

//■３６０
//四つん這いになっていて、こっちに顔を突き出している。その表情はやけに切迫していて――
セナの足にしがみつくようにして、こっちに顔を突き出している。その表情はやけに切迫していて――

{	BGMPlay360("CH*", 100, 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16900530ko">
「逃げるの！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE04","SE_衝撃_衝撃音03");
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");

	SoundPlay("SE04", 0, 1000, false);
	Fade("背景１", 0, 1000, null, true);
	Wait(300);
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900540ta">
「え……？」

こずぴぃが叫ぶのとほぼ同時に、
セナがその場から跳んでいた。

剣を振りかぶり、

{	Stand("bu梨深_制服_正面","hard", 250, @0);
	FadeStand("bu梨深_制服_正面_hard", 100, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900550ri">
「危ないっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_hard", 100, true);

//ＳＥ//剣が空を切る音
//ＳＥ//剣がコンクリートを砕く音
	CreateSE("SE03","SE_擬音_ディそーど_空を切る2");
	CreateSE("SE04","SE_擬音_ディそーど_コンクリート砕く");
	CreateSE("SE05","SE_じん体_動作_滑って転ぶ");
	CreateSE("SE06","SE_じん体_動作_棚にぶつかり倒れる");
	CreateTextureEX("セナ剣", 100, 0, 0, "cg/bg/bg250_01_6_斬撃汎用縦_a.jpg");

	SoundPlay("SE03", 0, 1000, false);

	Shake("セナ剣", 500, 0, 15, 0, 0, 500, null, false);
	Fade("セナ剣", 100, 1000, null, true);

	Wait(300);

	SoundPlay("SE04", 0, 1000, false);

	FadeDelete("セナ剣", 1000, true);

	SoundPlay("SE05", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE06", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
梨深に腕を強く引かれ、僕は後ろ向きに倒れ込んだ。

とっさに顔を上げ、それまで自分が立っていた場所を見る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("色１", 1500, 0, null, true);

	CreateTextureEX("セナ剣", 100, 0, 0, "cg/bg/bg243_01_6_chnディソード全体_セナ_a.jpg");
	Wait(100);
	BGMPlay360("CH13", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
セナの剣が、屋上の床を抉っていた。

すさまじいまでの、そして現実離れした切れ味と破壊力。

コンクリートを砕くほどの衝撃だったのに、剣の方には傷ひとつない。

ディソードは、人に見えず、
触れることさえできない剣じゃなかったの！？

僕の脳裏を、ある言葉がよぎった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("セナ剣", 1000, 1000, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602013]
あの剣は、リアルブートされている――

この場にいる４人の周囲共通認識となったセナのディソードは、妄想ではなく現実。
実際に人を斬ることができる大剣。

もし梨深に引っ張ってもらわなかったら。
僕はあの美しい剣に頭からキレイにスライスされ。
即死だった。

{	Fade("セナ剣", 1000, 0, null, false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900560ta">
「あ、あ、あああ……」

震えが全身を駆け巡る。
セナは今、間違いなく僕を、
殺そうとした――

どうして。

頭の中が疑問でいっぱいになる。
この前は、こずぴぃも入れて３人で一緒に、ガルガリ君を食べた。

確かに僕らは友達と呼べるほどの仲じゃなかったし、この前だって最後まで怖い態度のままだったけど。

それでも、いきなりディソードで襲われるような、険悪な関係じゃなかったはず――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("セナ剣");

	Stand("stセナ_制服_武器構え","angry", 200, @0);
	FadeStand("stセナ_制服_武器構え_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//◆静かに
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900570sn">
「殺して……やる」

{	DeleteStand("stセナ_制服_武器構え_angry", 200, true);}
セナが顔を上げ。
なおも僕をにらみつけてくる。

その動きは速かった。

あんな巨大な剣を持っているにもかかわらず。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE04","SE_衝撃_衝撃音03");
	CreateSE("SE05","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE04", 0, 1000, false);
	Wait(500);
	SoundPlay("SE03", 0, 1000, false);
	Wait(300);
	SoundPlay("SE05", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
短距離走のクラウチングスタートのように、地面を蹴り。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SoundPlay("SE05", 2000, 0, false);
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Fade("背景３", 0, 1000, null, true);
	Zoom("背景２", 1000, 1050, 1050, Dxl2, false);
	Fade("背景２", 1000, 0, null, false);
	Wait(100);
	Zoom("背景３", 1000, 1050, 1050, Dxl2, false);
	Fade("背景３", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602014]
剣の切っ先を、地面に擦らせるようにして振り回して。
僕への距離を詰めながら、上段の構えへ。

{	Stand("buセナ_制服_武器構え","angry", 200, @0);
	FadeStand("buセナ_制服_武器構え_angry", 200, true);}
本能が、一瞬で状況を悟る。

本気だ。
セナは、本気だ――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16900580ta">
「わあああああ――」

僕は無様に仰向けに倒れたまま。

絶叫する。

逃げられない。

あまりにも理不尽。

あまりにも突然。

これでゲームオーバーなんて。
必死で『将軍』から逃げてきた結果が、セナによる奇襲なんて。

イヤだ――
死にたくない――

死にたくないよぉ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("buセナ_制服_武器構え_angry", 200, true);

	Stand("bu梨深_制服_正面","hard", 250, @0);
	FadeStand("bu梨深_制服_正面_hard", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900590ri">
「――っ」

そこへ――

ひとつの人影が飛び込んできて。
僕とセナとの間に立ちはだかった。

見れば、その背中は梨深のもので。
僕に迫り来るセナの行く手を塞ぐように、両手を広げている。

身を挺して、僕を庇ってくれるの……？

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900600sn">
「どけっ」

でも、これじゃ梨深が死んじゃうよ……！
そんなのイヤだ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色７", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色７", 100, 0, 1000, 100, null, "cg/data/effect.png", true);
	BGMPlay360("CH*", 500, 0, false);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601015]
//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16900610ko">
「咲畑しゃんには、気をつけて」

ふと。

こずぴぃに以前言われた言葉を思い出した。

梨深の広げた両手に、淡い光が溢れ出す――

//ＶＦ//回想セリフ
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16900620ko">
「咲畑しゃんは、よく分かんないのら……」

梨深は――

//◆静かに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900630ri">
「タクに、手を出さないで」

溢れた光を束ねるように、両手を重ね合わせて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//画面エフェクト//羽が舞う
	CreateSE("SE04","SE_衝撃_衝撃は_リアルぶーと");
	SoundPlay("SE04", 0, 1000, false);
	CreateColor("光明度", 1000, 0, 0, 1280, 720, "#FFFFFF");
	Fade("光明度", 0, 0, null, true);
	CreateColor("色１", 500, 0, 0, 1280, 720, "#FF00FF");
	Fade("色１", 0, 0, null, true);
	CreateColor("色２", 500, 0, 0, 1280, 720, "Blue");
	Fade("色２", 0, 0, null, true);
	CreateColor("色３", 500, 0, 0, 1280, 720, "RED");
	Fade("色３", 0, 0, null, true);
	CreateColor("色４", 500, 0, 0, 1280, 720, "GREEN");
	Fade("色４", 0, 0, null, true);
	CreateColor("色５", 500, 0, 0, 1280, 720, "White");
	Fade("色５", 0, 0, null, true);
	Request("色５", AddRender);
	Fade("光明度", 200, 800, null, false);
	Fade("色１", 200, 1000, null, true);
	Fade("色７", 50, 0, null, false);
	DrawTransition("色１", 50, 0, 1000, 100, null, "cg/data/爆発.png", true);
	Fade("色２", 0, 1000, null, true);
	DrawTransition("色２", 50, 0, 1000, 100, null, "cg/data/爆発.png", true);
	Fade("色３", 0, 1000, null, true);
	DrawTransition("色３", 50, 0, 1000, 100, null, "cg/data/爆発.png", true);
	Fade("色４", 0, 1000, null, true);
	DrawTransition("色４", 50, 0, 1000, 100, null, "cg/data/爆発.png", true);
	Fade("色５", 0, 1000, null, true);
	DrawTransition("色５", 50, 0, 1000, 100, null, "cg/data/爆発.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
空気が震えた。

どこから出てきたのか、
キラキラと輝く光の羽根が、
梨深の周囲を舞う。

彼女の手に現れたそれは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//剣と剣が激突する剣戟の音
	CreateSE("SE06","SE_擬音_ディそーど同士ぶつかる");
	CreateSE("SE05","SE_擬音_ディそーど2");
	CreateSE("SE07","SE_擬音_共鳴音_激しい_LOOP");
	SoundPlay("SE06", 0, 1000, false);
	Wait(500);
	SoundPlay("SE07", 1000, 1000, true);
	SoundPlay("SE05", 0, 1000, false);
	FadeDelete("光明度", 0, 0, null, true);
	FadeDelete("色１", 0, 0, null, true);
	FadeDelete("色２", 0, 0, null, true);
	FadeDelete("色３", 0, 0, null, true);
	FadeDelete("色４", 0, 0, null, true);

//おがみ：後で位置調整
	CreateTexture360("背景２", 100, @0, @-160, "cg/ev/ev079_01_3_梨深セナ対決_a.jpg");
	Request("背景２", Smoothing);
	Fade("色５", 3000, 0, null, true);


	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16900640sn">
「なん……だと……」

勢いよく振り下ろしたセナの巨大なディソードを、難なく受け止めていた。

//◆静かに
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16900650ri">
「タクを、追い詰めないで」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景２", 2000, @-384, @-256, AxlDxl, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
それは、剣と呼ぶには、
あまりに優美で。
あまりに神々しく。

天使の翼かと見紛うほどだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("背景２", 1000, @-384, @256, AxlDxl, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
そして僕は理解した。

彼女も、
咲畑梨深も……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	SetBlur("背景２", true, 2, 200, 100);
	Fade("回想フラッシュ", 1000, 0, null, false);
	Move("背景２", 1000, @256, @-200, Dxl2, false);
	Zoom("背景２", 1000, 500, 500, Dxl2, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text117]
ギガロマニアックスだという事実を。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//★梨深編
if(!$梨深ルート){
	BGMPlay360("CH*", 2000, 0, true);
	SoundPlay("SE*",2000,0,false);
	Wait(2000);
}else{
	BGMPlay360("CH*", 2000, 0, true);
	SoundPlay("SE*",2000,0,false);
	Wait(1000);
	ClearAll(2000);
	Wait(2000);
//	IntermissionIn();
}

}

..//振動用
function Blur3()
{
	Shake("@Blur", 1000, 0, 0, 5, 5, 1000, null, true);
	while(1)
	{
	Shake("@Blur", 500, 5, 5, 5, 5, 1000, null, true);
	}

}