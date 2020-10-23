//<continuation number="20">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_136_１１月３日月";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch07_136_１１月３日月();
}


function ch07_136_１１月３日月()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//梨深ソファフラグ ＯＮ（ch03_056_妄想トリガー１２■）
if($GameDebugSelect == 1)
{
	SetChoice02("梨深ソファあり","梨深ソファなし");
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
			$妄想トリガー１２ = 1;
		}
		case @選択肢２:
		{
			ChoiceB02();
			$妄想トリガー１２ = 0;
		}
	}

	$GameDebugSelect = 0;
}



//※拓巳視点に戻る
//１１月３日（月）//日付は表示しない

	CreateColor("黒", 1000, 0, 0, 1280, 720,"Black");

//ＢＧ//神泉町の街並み
	CreateTextureEX("背景１", 200, 0, 0, "cg/bg/bg014_01_0_神泉町並み_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Fade("黒", 1000, 0, null, true);
	Delete("黒");
	
//あやべ//ＳＥ//カラスの鳴き声
	CreateSE("SE01","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
地震の日から、今日で一週間が経った。
その間、僕は学校側から停学を言い渡されていた。

たとえ停学にならなくても、精神的に学校へ行ける状態じゃなかった。

地震があった日の翌日、新たなニュージェネ事件が起きたんだ。

その事件の内容は、高科先生が殺されたときと同じく、明らかに僕へのメッセージ性がこめられていた。

右手を自ら食いちぎった女性……。

それが、七海の切断された右手首を暗示しているのは間違いない。
七海のことは『将軍』の釣りだったけど、もしかしたら殺されていたのはホントは七海だったかもしれないって思うと、ゾッとした。

それに僕は悪い意味で渋谷で有名人になっちゃったから、今まで以上に外に出ることに恐怖を覚えるようになっていた。

穴があったら入りたかった。コンビニに食事を買いに行くことすら苦痛で、一日なにも食べずに過ごした日もあった。

顔を上げて外を歩くことができない。

常に、誰かに笑われてるような気がした。

他人の視線が怖い。

誰にも会いたくなかった。

頻繁にマスコミ関係者と思われる連中が訪ねてきたけど、全部無視した。

実家にも連絡しなかったし、七海とも話してない。

エンスーもプレイを控えた。どこかでボロが出て、ナイトハルトが僕だって知られたら、それこそ最悪だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 700, null);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
一週間――

この期間が、ほとぼりを冷ますのに長いのか短いのか。

人の噂も７５日って言うけど、それは昔の話だよね。

最近の流行の変化はすごく早い。
流行語は、翌年には廃れてる。

ネットで誰もが使っているネットスラングも、ほんの数ヶ月で死語になる。

テレビは毎日のように“ヒーロー”や“アイドル”や“悪者”を求め、消費し、使い捨てる。

『ニュージェネ』事件だって、６つも起これば最初の方の事件は＠ちゃんねるでも話題にはならなくなる。

なにもかもが、あっという間に人々の記憶から消えていく。

だから、そんな流行みたいに、できればこの一週間であの騒動のこともみんなの記憶からきれいさっぱり流れ去っていればいいな、って考えていた。

{	SetVolume("SE01", 2000, 0, null);}
しょせん希望的観測……でもそう願わずにはいられない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ/公園雑踏
	CreateSE("SE02","SE_日常_松濤公園");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

//ＢＧ//松濤公園
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	DrawTransition("背景１", 1500, 1000, 0, 100, null, "cg/data/left3.png", true);
	
	Delete("背景１", 0, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
頭と胃が痛くなってきた。
いつものベンチに座り、心を落ち着かせる。

星来たんならきっと、こう言うだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒", 300, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 500, 1000, null, false);

	Stand("bu星来_覚醒後_通常","sad", 500, @0);
	FadeStand("bu星来_覚醒後_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch07/13600010se">
「そんなに苦しむぐらいなら、もう学校になんか行くのやめればいいっしょ」

{	DeleteStand("bu星来_覚醒後_通常_sad", 500, false);
	Fade("黒", 500, 0, null, true);
	Delete("黒");}
それもありかなって、ちょっと思い始めてる。

治安悪化の影響で、渋谷区内にある学校では自主的に休む学生も増えてるって聞くし。

卒業できなくたって別に構わないとは、昔から思ってたし。むしろ今すぐ自主退学しちゃってもいい。

それでも僕は、学校に行こうとしている。
優愛に遭遇する危険を冒してまで、だ。

途中の自販機で買ったコーラを飲み干し、ベンチから立ち上がった。

……自分をごまかすのは、やめよう。
僕は学校には行きたくないけど、やめたくもない。

だって、もし学校をやめたら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//梨深ソファフラグ ＯＮ（ch03_056_妄想トリガー１２■）
	if($妄想トリガー１２ == 1 || $妄想トリガー１２ == 2)
	{
	//ＳＥ//公園雑踏停止
		SetVolume("SE02", 2000, 0, null);

	//画面エフェクト//回想
	//ＣＧ//ソファに腰掛けている梨深
		CreateColor("white", 1000, 0, 0, 1280, 720, "White");
		Request("white", AddRender);
		Fade("white", 0, 0, null, false);
		Fade("white", 300, 1000, null, true);

		CreateTexture360("梨深回想１", 200, 0, @-480, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");
		Request("梨深回想１", Smoothing);
		Fade("梨深回想１", 0, 1000, null, true);
		Move("梨深回想１", 3000, 0, @+480, Axl1, false);
	
		FadeDelete("white", 300, true);
		Delete("背景２");
	}else{
	//ＳＥ//公園雑踏停止
		SetVolume("SE02", 2000, 0, null);
		CreateColor("white12", 1000, 0, 0, 1280, 720, "WHITE");
		Request("white12", AddRender);
		Fade("white12", 0, 0, null, true);
		Fade("white12", 300, 1000, null, true);
		CreateTextureEX("back220", 100, 0, 0, "cg/bg/bg043_01_2_学校中庭_a.jpg");
		CreateColor("whiteAll", 500, 0, 0, 1280, 720, "White");
		Fade("whiteAll", 0, 300, null, false);
		Stand("bu梨深_制服_通常","smile", 200, @+150);
		Fade("back220", 0, 1000, null, false);
		FadeStand("bu梨深_制服_通常_smile", 0, true);
		FadeDelete("white12", 300, true);
		Wait(1000);
	}

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
梨深に、会えなくなっちゃう……。

今は、クラスメイトだっていう繋がりがあるから、学校にさえ行けば自動的に会える。
だけどその繋がりがなくなったら……

もちろん電話したり、直接会いに行ったりすることはできるだろう。でもそれには能動的行動が必要で、決して自動的じゃない。

そして僕はきっと、能動的には動けない。

実際、もうずっと梨深に会えていない。

//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/13600020ri">
「あたしが、一緒にいてあげる」

梨深は僕にそう約束してくれたのに。
もう１０日以上、まったく連絡がないんだ。

もしかしたら僕の醜態をテレビで見て、梨深ですら愛想を尽かしちゃったんじゃないかと想像したら、すごく怖く、悲しく、寂しくなった。

誰も――七海ですら――会いに来なくて。
ネットでは祭りで誹謗中傷にさらされ。
『将軍』や優愛の影に怯えて。

誰にも会いたくないって言っておきながら、その孤独が辛かった。

梨深に、顔を見に来てもらいたかった。
大変だったね、って優しく抱きしめてもらいたかった。

結局僕は、梨深に甘えてる。

でも、梨深がいけないんだ。
僕に……三次元の温もりを教えたのは、梨深だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//森島削除部分シナリオ退避
//そして僕は、梨深のケータイ番号すら知らなかった。
//例え番号を知ってても自分から連絡できてたかどうか……。

//画面エフェクト//回想
//ＣＧ//梨深が拓巳を抱きしめる

	CreateColor("white", 1000, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("white", 0, 0, null, false);
	Fade("white", 300, 1000, null, true);

	CreateTexture360("梨深回想２", 300, 0, 0, "cg/ev/ev032_01_3_梨深だきしめ_a.jpg");
	Fade("梨深回想２", 0, 1000, null, true);
	
	FadeDelete("white", 300, true);

	if($妄想トリガー１２ == 1 || $妄想トリガー１２ == 2)
	{
	Delete("回想１");
	}else{
	Delete("back220");
	Delete("whiteAll");
	Delete("white12");
	DeleteStand("bu梨深_制服_通常_smile", 0, true);
	}

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
一度あの温もりを知っちゃったら……
何度でも求めたくなってしまう。

あんなにも心安らぐことは、二次元や妄想じゃ、もうできなくなっちゃったんだ。
妄想してるだけじゃ、耐えられないんだ。

梨深に会いたい……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);

}