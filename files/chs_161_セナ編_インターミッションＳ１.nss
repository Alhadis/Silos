//<continuation number="120">


chapter main
{

	$PreGameName = "boot_セナルート";

	if($GameStart != 1)
	{
		$GameName = "chs_161_セナ編_インターミッションＳ１";
		$GameContiune = 1;
		$セナルート=true;
		$RouteON=true;
		Reset();
	}

	chs_161_セナ編_インターミッションＳ１();
}


function chs_161_セナ編_インターミッションＳ１()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★セナ編
//■インターミッションＳ１
//ＢＧ//希ＶＩＰルーム（崩壊後）

//■アイキャッチIN
	IntermissionIn();

	DeleteAll();
	ClearAll(0);
	
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");

//■アイキャッチOUT
	IntermissionIn2();

	Wait(1000);

	Stand("st一成_浮浪者_通常","normal", 100, @-180);
	FadeStand("st一成_浮浪者_通常_normal", 500, true);

	Wait(500);

	BGMPlay360("CH20", 2000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
波多野一成は、娘と、西條拓巳を見送って、瓦礫の中に腰を下ろした。

――私は、神と、もう少し話をしたい。

そう言って、この場に１人で残ったのだ。

娘のセナは、そんな彼になにか言いたそうな
鋭い眼差しを送ってきたが、すぐに舌打ちして顔を背け、
結局はなにも言わずにこの部屋から出て行った。

波多野も、声はかけなかった。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500010ha">
「３００人委員会。まだ見ているのか？」

ブラックアウトしたまま沈黙しているモニタに向けて、波多野は呼びかけた。

しばらく反応はなかったが、見つめ続けていると、やがて自動的にモニタが点灯し、先程のチャット画面が映し出される。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st一成_浮浪者_通常_normal", 300, true);

	PrintBG(10000);

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("チャット０", 100, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	CreateTexture360("チャットかぶせ", 110, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	CreateTexture360("チャットかぶせ２", 120, 0, 0, "cg/bg/bg229_01_6_chn壊れたモニタ_a.jpg");
	Request("チャットかぶせ", MulRender);
	Request("チャットかぶせ２", AddRender);
	Fade("チャットかぶせ", 0, 600, null, true);
	Fade("チャットかぶせ２", 0, 1000, null, true);
	Fade("チャット０", 0, 1000, null, true);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("back*", 500, 0, null, true);
	Delete("back*");
//▼ウェブＣＨＡＴ開始

	Wait(500);


	DosMain(-200,0);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text002]
禁（０漸Ｖ・＄：ｙ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
ｙ、という返事。つまり“ＹＥＳ”を意味している。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500020ha">
「なぜ、セナと、西條拓巳なんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text004]
禁（０漸Ｖ・＄：現在の渋谷において、最もコンタクトできる確率が高いギガロマニアックスだったからだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601004]
禁（０漸Ｖ・＄：それ以上の意味はない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500030ha">
「３００人委員会にとって、こちらの世界はどのような定義なんだ。ゲームか。実験場か。牧場か」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text006]
禁（０漸Ｖ・＄：世界人間牧場計画のことを言っているのならば、それは一部の陰謀論者による妄想でしかない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601006]
禁（０漸Ｖ・＄：言ったはずだ。我らはそちらの世界に直接介入はしない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
世界人間牧場計画。
それは３００人委員会による陰謀が語られるとき、必ず登場する言葉だ。

３００人委員会主導によるワン・ワールド（世界に単一の）政府が樹立されることで、新たな世界の秩序を構築する。

一部の選ばれた者以外のすべての人間は、沈黙の兵器による半永久的な洗脳を施され、無自覚な奴隷と化す。さながら家畜のように、上位存在に肉も、乳も、労働力も、子も、命も奪われ続ける。

もし実現すれば、それはおそらく最も残酷で最もシステマチックな、人類にとっての理想郷となるだろう。

知らずに意志を奪われオートメーション化した家畜人間は、搾取されながらも幸せに生きていけるはずだ。“搾取されている”という自覚がないのだから、自らの境遇に不満を訴えるはずがない。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500040ha">
「世界人間牧場計画が妄想だとしても」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500050ha">
「沈黙の兵器は妄想ではない。現にノアⅡが存在している」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text008]
禁（０漸Ｖ・＄：それが今回のエラーに繋がった
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601008]
禁（０漸Ｖ・＄：君と西條拓巳、そして野呂瀬玄一が作ったエラーだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3602008]
禁（０漸Ｖ・＄：我らはそのエラーを修復しようとしているのだよ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500060ha">
「そして世界は再び、お前たちの秩序の下に置かれるのか。無自覚の奴隷として、お前たちに搾取され続けるのか」

話しながら、自分自身の言葉からとある恐ろしい可能性に思い当たり、波多野は眉をひそめた。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500070ha">
「……世界人間牧場計画は、すでに完了している？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text010]
禁（０漸Ｖ・＄：面白い発想だ。だが例えとしては、その言い方はふさわしくない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601010]
禁（０漸Ｖ・＄：神からの視点で正しく言い表すならば
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3602010]
禁（０漸Ｖ・＄：“世界が誕生した時点で君たちはすでに家畜だった”
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3603010]
禁（０漸Ｖ・＄：あくまで例えだが
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500080ha">
「最初の質問に答えろ……」

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500090ha">
「３００人委員会にとって、こちらの世界は、ゲームなのか。実験場なのか。牧場なのか」

波多野の問いかけに、『禁（０漸Ｖ・＄』は沈黙した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text012]
禁（０漸Ｖ・＄：時間だ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500100ha">
「時間？　時間とは、なんのことだ……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text014]
禁（０漸Ｖ・＄：３００人委員会はあくまで、
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601014]
禁（０漸Ｖ・＄：陰謀論の中でのみ語られる“うさんくさい存在”でなければならない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3602014]
禁（０漸Ｖ・＄：知りすぎた者は誰であろうと排除する
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3603014]
禁（０漸Ｖ・＄：猪鼻や倉持のように
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3604014]
禁（０漸Ｖ・＄：それは君たちも例外ではない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了

	CreateSE("SE09","SE_じん体_心臓_鼓動");
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);

//◆「たち」を強調してください

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500110ha">
「君たち、だと……？　まさか、セナや西條拓巳も……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text016]
禁（０漸Ｖ・＄：君たちは我らと接触した時点で駒となり
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3601016]
禁（０漸Ｖ・＄：駒には駒以上のいかなる役割も与えられない
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box04>
[text3602016]
禁（０漸Ｖ・＄：それが我らのルールだ
</PRE>
	SetDos($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeDos("500");//――――――――――――――――――――――――――――――

//▼ウェブＣＨＡＴ終了
	WaitKey();

	SetVolume360("CH*", 1000, 0, NULL);
	CreateSE("SE01","SE_き械_もにたー_消える");
	Delete("box04");//これでDOS消します

	CreateTexture360("back01", 50, 0, 0, "cg/bg/bg136_04_6_chn希ＶＩＰルーム崩壊後_a.jpg");
	Stand("st一成_浮浪者_焦り","hurry", 60, @-180);
	FadeStand("st一成_浮浪者_焦り_hurry", 0, true);


	MusicStart("SE01",0,1000,0,1000,null,false);
	FadeDelete("チャット*", 200, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
モニタがついにブラックアウトする。
それは死亡宣告に等しかった。

//【波多野】
<voice name="波多野" class="波多野" src="voice/chn02/09500120ha">
「セナ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	DeleteStand("st一成_浮浪者_通常_normal", 300, true);

	CreateSE("SE10","SE_擬音_ちを蹴る");
	CreateSE("SE11","SE_じん体_動作_足_走る_LOOP");

	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("Black", 500, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("back*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601017]
唇を噛み、波多野は慌てて立ち上がった。
今ならばまだ、渋谷駅へ向かったセナたちに追いつけるかもしれない。

やはりこれは罠だったのだ、と伝えなければならない。

娘を死なせたくなかった。

妻を、そして次女を殺してしまった自分にとって、残った唯一の家族。どれだけ恨まれようと、セナには生きていてほしかった。

だから、走った。

しかし、波多野が希テクノロジーの本社ビルから出ることは、ついにできなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//地響き
	SetVolume("SE11", 0, 0, true);
	CreateSE("SE12","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE12", 500, 1000, 0, 1000, null, false);

	CreateSE("SE13","SE_自然_じ鳴り_LOOP");
	MusicStart("SE13", 500, 1000, 0, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602017]
その前に、ビル全体を爆発音とともに激しい振動が襲った。
地震による崩落などではない。音から判断するだけでも、人為的な破壊行為による揺れだと分かる。

けれど、分かったところでどうにもならなかった。

足許の床が崩れ、さながら地獄の釜が蓋を開けたかのように、波多野というあまりに小さな存在を呑み込んだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//爆発音
	CreateSE("SE14","SE_衝撃_爆発音");
	CreateSE("SE15","SE_衝撃_爆発音");
	CreateSE("SE16","SE_衝撃_道路陥ぼつ");
	MusicStart("SE14", 0, 1000, 0, 1000, null, false);
	MusicStart("SE15", 0, 1000, 0, 1000, null, false);
	MusicStart("SE16", 0, 1000, 0, 1000, null, false);

	Wait(600);
	SetVolume360("SE*", 2000, 0, null);

	Wait(2000);
//～～Ｆ・Ｏ
	ClearAll(0);
	Wait(500);

//アイキャッチ
//インターミッションＳ１終了

}



