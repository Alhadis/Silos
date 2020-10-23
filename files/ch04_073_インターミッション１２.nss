//<continuation number="330">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_073_インターミッション１２";
		$GameContiune = 1;
		Reset();
	}

		ch04_073_インターミッション１２();
}


function ch04_073_インターミッション１２()
{

	$SYSTEM_last_text="第４章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//Ｃｈａｏｓ；Ｈｅａｄ　第４章

//――――――――――――――――
//■第４章【Di-Sword】
	ChapterIn("dx/mvC.avi");

		Delete("*");
		CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg072_01_1_サインシティ１Ｆ入り口_a.jpg");
		Fade("back04", 0, 1000, null, false);

	ChapterIn2();

//アイキャッチ
//■インターミッション１２

//ＢＧ//サインシティ１Ｆ入り口//昼
//１０月１９日（日）//日付は表示しない

	CreateSE("SE01","SE_日常_雑踏01");
	MusicStart("SE01", 500, 700, 0, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//「サインシティ」＝「マークシティ」
サインシティは渋谷スクランブル交差点のすぐ南に位置する、ふたつのビルだ。

駅と隣接するＥＡＳＴ棟１階の入り口は小さな広場になっており、ハチ公前やモヤイ像ほどではないものの、待ち合わせ場所としてよく利用される。

今も十数人程度の人たちが、約束の時間を待ちつつケータイとにらめっこしていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateBG(100, 500, 0, 0, "cg/ev/ev033_01_1_INT12セナ会話意識集中_a.jpg");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
その中に、ひとりだけ妙に厳しい表情をしてたたずんでいる
女子高生――蒼井セナの姿があった。

//井乃頭線＝井の頭線
サインシティ２階にある井乃頭線の駅から降りてくる
下りエスカレーター。

そのすぐ横にある白い柱に背中を預け、視線をぬかりなく周囲へと走らせている。

//棒アイス＝ガリガリ君
だがその視線の鋭さとは対照的に、なぜかこんな季節に棒アイスを
かじっているため、傍目にはひどく微笑ましく映る。

もっとも、彼女は決して待ち合わせをしているわけではなく、
道行く人々を静かに観察しているのだった。

ちょうど彼女の立つ位置からは、スクランブル交差点の大型ビジョンまで見通すことができる。

ビジョンには有名歌手のＰＶが流れている。
その画面下方で、俗に言う『ニュージェネ』事件の続報をテロップにて伝えていた。

『ニュージェネ』関連のニュースを目にしない日はない。
テレビ、新聞、ネット、週刊誌、さらには街頭の大型ビジョンや電光掲示板。

セナはそうした報道にまったく興味がなかったが、渋谷を歩いていればその手の話題を口にしている人間とよくすれ違った。

『その目だれの目？』

胸元にそう書かれたＴシャツを着ている人間なども、ここ数日で見かけるようになった。

渋谷ではアングラネタとしてその言葉が流行し、独り歩きを始めている。

原宿の土産店で売り出されてけっこう売れているらしい、と道行く人々が笑顔のまま話しているという今の状況は、人々がいかに自分以外に興味がないかということを端的に象徴していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateBG(100, 500, 0, 0, "cg/bg/bg072_01_1_サインシティ１Ｆ入り口_a.jpg");
	Stand("buセナ_制服_食事棒","rage", 200, @+200);
	FadeStand("buセナ_制服_食事棒_rage", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
セナは嘲るように小さく鼻を鳴らすと、棒アイスの最後の一口を食べきり、厳しい表情は変えないままそっと目を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateColor("背景２", 500, 0, 0, 1280, 720, "Black");
	Fade("背景２", 0, 0, null, false);
	Fade("背景２", 500, 1000, null, true);

	DeleteStand("buセナ_制服_食事棒_rage", 0, false);
	Delete("back*");

	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 0, 1000, null, true);
	Fade("背景２", 500, 0, null, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
町のノイズに耳を澄ませる。
日曜日の駅前には様々な音が溢れかえっていた。

{	SetVolume("SE01", 1000, 1000, NULL);}
電車がホームに到着する轟音、タクシーのクラクション、人々が歩きながらお喋りする声、大型ビジョンやサインシティ店内から流れてくるＢＧＭ、エスカレーターの安全な乗り方を伝えるアナウンス音声……

音は途切れることがなく、ひとつの音が終わる前に別の音が出現し、それらが多層的に積み重なって不協和音のようなノイズを奏でていた。

そのノイズの中から、セナは人々の声だけに注意を向けていく。

他の音は彼女の脳内で遮断され、
言葉がクリアに聞こえるようになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



/*========================================================================
//以下のガヤのセリフ、名前表示なし
//例えば画面のあちこちに縦書きだったり横書きだったり斜め書きだったりフォント変えたりして表示させる、とか
//しかも３つの話題のセリフがそれぞれ同時に出現するとか
//ガヤのセリフ音声聞き取れなくてもいいぐらいです
//会話パターン１。男２人と女１人。若者
//【若い女Ａ】
<voice name="若い女Ａ" class="若い女Ａ" src="voice/ch04/07300010yg">
「結局全部同じ犯人なのかな？」

//【若い男Ａ】
<voice name="若い男Ａ" class="若い男Ａ" src="voice/ch04/07300020y1">
「違うってニュースで言ってたぞ。手口が違い過ぎるって」

//【若い男Ｂ】
<voice name="若い男Ｂ" class="若い男Ｂ" src="voice/ch04/07300030y2">
「っつーか、殺人が流行ったりしたら怖くね？」

//【若い男Ｂ】
<voice name="若い男Ｂ" class="若い男Ｂ" src="voice/ch04/07300040y2">
「なんとかっつーバンドの歌詞と一緒らしいじゃん。ま、どうせ後からこじつけて歌詞にしただけだろうけどよ」

//【若い男Ａ】
<voice name="若い男Ａ" class="若い男Ａ" src="voice/ch04/07300050y1">
「ばっか、おめーファンタズムなめんな。あれは預言だって」

//【若い男Ｂ】
<voice name="若い男Ｂ" class="若い男Ｂ" src="voice/ch04/07300060y2">
「げ、お前あのバンド好きなん？　マジきめえんだけど」

//【若い女Ａ】
<voice name="若い女Ａ" class="若い女Ａ" src="voice/ch04/07300070yg">
「きもくねーよ。あたしあの曲の歌詞にマジ共感したんだけど」

//【若い男Ｂ】
<voice name="若い男Ｂ" class="若い男Ｂ" src="voice/ch04/07300080y2">
「え、お、お前もあのバンドのファンなの？」

//【若い男Ａ】
<voice name="若い男Ａ" class="若い男Ａ" src="voice/ch04/07300090y1">
「今どきファンタズム知らないなんてさ、マジ遅れてるよな」

//【若い男Ｂ】
<voice name="若い男Ｂ" class="若い男Ｂ" src="voice/ch04/07300100y2">
「んだよ、じゃあＣＤ貸せよ」


//会話パターン２。男２人。若者
//【男子高校生Ａ】
<voice name="男子高校生Ａ" class="男子高校生Ａ" src="voice/ch04/07300110da">
「ほらこれ見てくれよ」

//【男子高校生Ｂ】
<voice name="男子高校生Ｂ" class="男子高校生Ｂ" src="voice/ch04/07300120db">
「げ、なにこれ超ウケるんだけど」

//【男子高校生Ａ】
<voice name="男子高校生Ａ" class="男子高校生Ａ" src="voice/ch04/07300130da">
「この前買ってきた。『その目だれの目』Ｔシャツ」

//【男子高校生Ｂ】
<voice name="男子高校生Ｂ" class="男子高校生Ｂ" src="voice/ch04/07300140db">
「これ普通に売ってたんだな。でもマジで着てるヤツ初めて見た。ぎゃはは」

//【男子高校生Ａ】
<voice name="男子高校生Ａ" class="男子高校生Ａ" src="voice/ch04/07300150da">
「けっこうクールじゃね？」

//【男子高校生Ｂ】
<voice name="男子高校生Ｂ" class="男子高校生Ｂ" src="voice/ch04/07300160db">
「超クール。俺にくれよ」

//【男子高校生Ａ】
<voice name="男子高校生Ａ" class="男子高校生Ａ" src="voice/ch04/07300170da">
「ざけんな。自分で買ってこい」

//【男子高校生Ｂ】
<voice name="男子高校生Ｂ" class="男子高校生Ｂ" src="voice/ch04/07300180db">
「でもあれじゃね？　これってニュージェネの犯人に、殺してくださいってアピールしてるようなもんじゃん」

//【男子高校生Ａ】
<voice name="男子高校生Ａ" class="男子高校生Ａ" src="voice/ch04/07300190da">
「俺の顔がニュースで全国に流れるかもな。俺もいよいよ全国デビューか。ぎゃはは」



//会話パターン３。女２人。若者
//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300200ja">
「最近渋谷超コワくない？」

//【女子高生Ｂ】
<voice name="女子高生Ｂ" class="女子高生Ｂ" src="voice/ch04/07300210jb">
「怖い怖い～。夜ひとりで歩けねーし」

//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300220ja">
「マジウザいんだけど、ニュージェネ」

//【女子高生Ｂ】
<voice name="女子高生Ｂ" class="女子高生Ｂ" src="voice/ch04/07300230jb">
「犯人さっさと捕まってほしいよねー」

//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300240ja">
「でも犯人オンナらしいよ」

//【女子高生Ｂ】
<voice name="女子高生Ｂ" class="女子高生Ｂ" src="voice/ch04/07300250jb">
「えっ、マジマジマジ？　なにそれすげーじゃん。ってゆーかマコ、犯人見たの！？」

//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300260ja">
「見てねーよ。見てたらとっくに殺されてんじゃん。ぎゃはは」

//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300270ja">
「なんかそーゆー噂があるらしいってだけ」

//【女子高生Ｂ】
<voice name="女子高生Ｂ" class="女子高生Ｂ" src="voice/ch04/07300280jb">
「じゃウチら殺される可能性低いんじゃない？　同じオンナだし」

//【女子高生Ａ】
<voice name="女子高生Ａ" class="女子高生Ａ" src="voice/ch04/07300290ja">
「どうせならさ、くせーオジさんとかキモい男とかだけ殺してほしいよね」

//【女子高生Ｂ】
<voice name="女子高生Ｂ" class="女子高生Ｂ" src="voice/ch04/07300300jb">
「もしそうならあたしマジ応援する～」

========================================================================*/


	CreateColor("back05", 2000, 0, 0, 1280, 720, "Black");

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta01", 1900, center, 80, Auto, Auto, "結");
	Move("texta01", 0, @240, @8, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta02", 1900, center, 80, Auto, Auto, "局");
	Move("texta02", 0, @240, @24, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta03", 1900, center, 80, Auto, Auto, "全");
	Move("texta03", 0, @240, @40, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta04", 1900, center, 80, Auto, Auto, "部");
	Move("texta04", 0, @240, @56, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta05", 1900, center, 80, Auto, Auto, "同");
	Move("texta05", 0, @240, @72, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta06", 1900, center, 80, Auto, Auto, "じ");
	Move("texta06", 0, @240, @88, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta07", 1900, center, 80, Auto, Auto, "犯");
	Move("texta07", 0, @240, @104, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta08", 1900, center, 80, Auto, Auto, "人");
	Move("texta08", 0, @240, @120, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta09", 1900, center, 80, Auto, Auto, "な");
	Move("texta09", 0, @240, @136, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta10", 1900, center, 80, Auto, Auto, "の");
	Move("texta10", 0, @240, @152, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta11", 1900, center, 80, Auto, Auto, "か");
	Move("texta11", 0, @240, @168, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta12", 1900, center, 80, Auto, Auto, "な");
	Move("texta12", 0, @240, @184, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta13", 1900, center, 80, Auto, Auto, "？");
	Move("texta13", 0, @240, @200, null, true);

	Request("texta*", NoLog);
	Request("texta*", Erase);

//森島ボイスネーム違い
	CreateVOICE("若い女Ａ","ch04/07300001yg");
	SoundPlay("若い女Ａ", 0, 1000, false);

	Move("texta*", 0, @240, @48, null, true);
	Request("texta*", Enter);

	SetBacklog("「結局全部同じ犯人なのかな？」", "voice/ch04/07300001yg", 若い女Ａ);

	FadeDelete("back05", 500, true);

	CreateColor("back06", 1800, 0, 0, 1280, 720, "Black");

	Wait(200);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textb01", 1700, 40, 40, Auto, Auto, "違うってニュースで言ってたぞ。手口が違い過ぎるって");
	Move("textb01", 0, @0, @8, null, true);
	Request("textb*", NoLog);
	Request("textb*", Erase);
	Move("textb*", 0, @240, @48, null, true);
	Request("textb*", Enter);

	CreateVOICE("若い男Ａ","ch04/07300020y1");
	SoundPlay("若い男Ａ", 0, 1000, false);

	SetBacklog("「違うってニュースで言ってたぞ。手口が違い過ぎるって」", "voice/ch04/07300020y1", 若い男Ａ);

	FadeDelete("back06", 300, true);

	FadeDelete("texta*", 3000, false);
	Wait(500);

	CreateColor("back07", 1600, 0, 0, 1280, 720, "Black");
	CreateColor("back08", 1500, 0, 0, 1280, 720, "Black");

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc01", 1500, 40, 80, Auto, Auto, "っ");
	Move("textc01", 0, @-240, @8, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc02", 1500, center, 80, Auto, Auto, "つ");
	Move("textc02", 0, @-240, @24, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc03", 1500, center, 80, Auto, Auto, "｜");
	Move("textc03", 0, @-240, @40, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc04", 1500, center, 80, Auto, Auto, "か");
	Move("textc04", 0, @-240, @56, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc05", 1500, center, 80, Auto, Auto, "、");
	Move("textc05", 0, @-232, @72, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc06", 1500, center, 80, Auto, Auto, "殺");
	Move("textc06", 0, @-240, @88, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc07", 1500, center, 80, Auto, Auto, "人");
	Move("textc07", 0, @-240, @104, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc08", 1500, center, 80, Auto, Auto, "が");
	Move("textc08", 0, @-240, @120, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc09", 1500, center, 80, Auto, Auto, "流");
	Move("textc09", 0, @-240, @136, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc10", 1500, center, 80, Auto, Auto, "行");
	Move("textc10", 0, @-240, @152, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc11", 1500, center, 80, Auto, Auto, "っ");
	Move("textc11", 0, @-240, @168, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc12", 1500, center, 80, Auto, Auto, "た");
	Move("textc12", 0, @-240, @184, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc13", 1500, center, 80, Auto, Auto, "ら");
	Move("textc13", 0, @-240, @200, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc14", 1500, center, 80, Auto, Auto, "怖");
	Move("textc14", 0, @-240, @216, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc15", 1500, center, 80, Auto, Auto, "く");
	Move("textc15", 0, @-240, @232, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc16", 1500, center, 80, Auto, Auto, "ね");
	Move("textc16", 0, @-240, @248, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc17", 1500, center, 80, Auto, Auto, "？");
	Move("textc17", 0, @-240, @264, null, true);

	Request("textc*", NoLog);
	Request("textc*", Erase);
	Move("textc*", 0, @240, @48, null, true);
	Request("textc*", Enter);

	CreateVOICE("若い男Ｂ","ch04/07300030y2");
	SoundPlay("若い男Ｂ", 0, 1000, false);

	SetBacklog("「っつーか、殺人が流行ったりしたら怖くね？」", "voice/ch04/07300030y2", 若い男Ｂ);

	FadeDelete("back07", 1000, true);
	FadeDelete("textb*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textd01", 1400, 240, 80, Auto, Auto, "なんとかっつーバンドの歌詞と一緒らしいじゃん。");
	Move("textd01", 0, 200, 380, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textd02", 1400, 240, 80, Auto, Auto, "ま、どうせ後からこじつけて歌詞にしただけだろうけどよ");
	Move("textd02", 0, 200, 400, null, true);
	Request("textd*", NoLog);
	Request("textd*", Erase);
	Move("textd*", 0, @240, @48, null, true);
	Request("textd*", Enter);

	CreateVOICE("若い男Ｂ","ch04/07300040y2");
	SoundPlay("若い男Ｂ", 0, 1000, false);

	SetBacklog("「なんとかっつーバンドの歌詞と一緒らしいじゃん。ま、どうせ後からこじつけて歌詞にしただけだろうけどよ」", "voice/ch04/07300040y2", 若い男Ｂ);

	FadeDelete("back08", 1000, true);
	CreateColor("back09", 1300, 0, 0, 1280, 720, "Black");

	FadeDelete("textc*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte01", 1300, center, Middle, Auto, Auto, "ばっか、おめーファンタズムなめんな。あれは預言だって");
	Move("texte01", 0, @0, @0, null, true);
	Request("texte*", NoLog);
	Request("texte*", Erase);
	Move("texte*", 0, @240, @48, null, true);
	Request("texte*", Enter);

	CreateVOICE("若い男Ａ","ch04/07300050y1");
	SoundPlay("若い男Ａ", 0, 1000, false);

	SetBacklog("「ばっか、おめーファンタズムなめんな。あれは預言だって」", "voice/ch04/07300050y1", 若い男Ａ);

	FadeDelete("textd*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textf01", 1300, 240, 80, Auto, Auto, "げ、お前あのバンド好きなん？　マジきめえんだけど");
	Move("textf01", 0, @0, @0, null, true);
	Request("textf*", NoLog);
	Request("textf*", Erase);
	Move("textf*", 0, @240, @48, null, true);
	Request("textf*", Enter);

	CreateVOICE("若い男Ｂ","ch04/07300060y2");
	SoundPlay("若い男Ｂ", 0, 1000, false);

	SetBacklog("「げ、お前あのバンド好きなん？　マジきめえんだけど」", "voice/ch04/07300060y2", 若い男Ｂ);

	WaitAction("texte*", null);

	FadeDelete("texte*", 1000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textg01", 1300, 40, 320, Auto, Auto, "きもくねーよ。あたしあの曲の歌詞にマジ共感したんだけど");
	Move("textg01", 0, @0, @0, null, true);
	Request("textg*", NoLog);
	Request("textg*", Erase);
	Move("textg*", 0, @240, @48, null, true);
	Request("textg*", Enter);

	CreateVOICE("若い女Ａ","ch04/07300070yg");
	SoundPlay("若い女Ａ", 0, 1000, false);

	SetBacklog("「きもくねーよ。あたしあの曲の歌詞にマジ共感したんだけど」", "voice/ch04/07300070yg", 若い女Ａ);

	FadeDelete("textf*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth01", 1200, 560, 40, Auto, Auto, "え");
	Move("texth01", 0, @0, @0, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth02", 1200, 568, 40, Auto, Auto, "、");
	Move("texth02", 0, @0, @16, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth03", 1200, 560, 40, Auto, Auto, "お");
	Move("texth03", 0, @0, @32, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth04", 1200, 568, 40, Auto, Auto, "、");
	Move("texth04", 0, @0, @48, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth05", 1200, 560, 40, Auto, Auto, "お");
	Move("texth05", 0, @0, @64, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth06", 1200, 560, 40, Auto, Auto, "前");
	Move("texth06", 0, @0, @80, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth07", 1200, 560, 40, Auto, Auto, "も");
	Move("texth07", 0, @0, @96, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth08", 1200, 560, 40, Auto, Auto, "あ");
	Move("texth08", 0, @0, @112, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth09", 1200, 560, 40, Auto, Auto, "の");
	Move("texth09", 0, @0, @128, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth10", 1200, 560, 40, Auto, Auto, "バ");
	Move("texth10", 0, @0, @144, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth11", 1200, 560, 40, Auto, Auto, "ン");
	Move("texth11", 0, @0, @160, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth12", 1200, 560, 40, Auto, Auto, "ド");
	Move("texth12", 0, @0, @176, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth13", 1200, 560, 40, Auto, Auto, "の");
	Move("texth13", 0, @0, @192, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth14", 1200, 560, 40, Auto, Auto, "フ");
	Move("texth14", 0, @0, @208, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth15", 1200, 560, 40, Auto, Auto, "ァ");
	Move("texth15", 0, @0, @224, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth16", 1200, 560, 40, Auto, Auto, "ン");
	Move("texth16", 0, @0, @240, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth17", 1200, 560, 40, Auto, Auto, "な");
	Move("texth17", 0, @0, @256, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth18", 1200, 560, 40, Auto, Auto, "の");
	Move("texth18", 0, @0, @272, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth19", 1200, 560, 40, Auto, Auto, "？");
	Move("texth19", 0, @0, @288, null, true);
	Request("texth*", NoLog);
	Request("texth*", Erase);
	Move("texth*", 0, @240, @48, null, true);
	Request("texth*", Enter);

	CreateVOICE("若い男Ｂ","ch04/07300080y2");
	SoundPlay("若い男Ｂ", 0, 1000, false);

	SetBacklog("「え、お、お前もあのバンドのファンなの？」", "voice/ch04/07300080y2", NULL);

	WaitAction("texth*", null);

	FadeDelete("back09", 2000, true);

	FadeDelete("textg*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texti01", 1100, 40, 80, Auto, Auto, "今どきファンタズム知らないなんてさ、マジ遅れてるよな");
	Move("texti01", 0, @0, @0, null, true);
	Request("texti*", NoLog);
	Request("texti*", Erase);
	Move("texti*", 0, @240, @48, null, true);
	Request("texti*", Enter);

	CreateVOICE("若い男Ａ","ch04/07300090y1");
	SoundPlay("若い男Ａ", 0, 1000, false);

	SetBacklog("「今どきファンタズム知らないなんてさ、マジ遅れてるよな」", "voice/ch04/07300090y1", 若い男Ａ);

	FadeDelete("texth*", 2000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textj01", 1100, 80, 160, Auto, Auto, "んだよ、じゃあＣＤ貸せよ");
	Move("textj01", 0, @0, @0, null, true);
	Request("textj*", NoLog);
	Request("textj*", Erase);

	Move("textj*", 0, @240, @48, null, true);
	Request("textj*", Enter);

	CreateVOICE("若い男Ｂ","ch04/07300100y2");
	SoundPlay("若い男Ｂ", 0, 1000, false);

	SetBacklog("「んだよ、じゃあＣＤ貸せよ」", "voice/ch04/07300100y2", 若い男Ｂ);

	FadeDelete("texti*", 2000, false);

	WaitAction("若い男Ｂ", null);

	CreateColor("back05", 2000, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 500, 1000, null, true);
	FadeDelete("textj*", 0, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta01", 1900, 40, 80, Auto, Auto, "ほ");
	Move("texta01", 0, @96, @8, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta02", 1900, 40, 80, Auto, Auto, "ら");
	Move("texta02", 0, @112, @24, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta03", 1900, 40, 80, Auto, Auto, "こ");
	Move("texta03", 0, @128, @40, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta04", 1900, 40, 80, Auto, Auto, "れ");
	Move("texta04", 0, @144, @56, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta05", 1900, 40, 80, Auto, Auto, "見");
	Move("texta05", 0, @160, @72, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta06", 1900, 40, 80, Auto, Auto, "て");
	Move("texta06", 0, @176, @88, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta07", 1900, 40, 80, Auto, Auto, "く");
	Move("texta07", 0, @192, @104, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta08", 1900, 40, 80, Auto, Auto, "れ");
	Move("texta08", 0, @208, @120, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta09", 1900, 40, 80, Auto, Auto, "よ");
	Move("texta09", 0, @224, @136, null, true);

	Request("texta*", NoLog);
	Request("texta*", Erase);
	Move("texta*", 0, @192, @38, null, true);
	Request("texta*", Enter);

	CreateVOICE("男子高校生Ａ","ch04/07300110da");
	SoundPlay("男子高校生Ａ", 0, 1000, false);

	SetBacklog("「ほらこれ見てくれよ」", "voice/ch04/07300110da", 男子高校生Ａ);

	WaitAction("texta*", null);

	FadeDelete("back05", 500, true);

	CreateColor("back06", 1800, 0, 0, 1280, 720, "Black");

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textb01", 1700, 40, 40, Auto, Auto, "げ、なにこれ超ウケるんだけど");
	Move("textb01", 0, @0, @8, null, true);
	Request("textb*", NoLog);
	Request("textb*", Erase);
	Move("textb*", 0, @192, @38, null, true);
	Request("textb*", Enter);

	CreateVOICE("男子高校生Ｂ","ch04/07300120db");
	SoundPlay("男子高校生Ｂ", 0, 1000, false);

	SetBacklog("「げ、なにこれ超ウケるんだけど」", "voice/ch04/07300120db", 男子高校生Ｂ);

	WaitAction("textb*", null);

	FadeDelete("back06", 300, true);

	FadeDelete("texta*", 3000, false);
	Wait(500);

	CreateColor("back08", 1500, 0, 0, 1280, 720, "Black");

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc01", 1500, 40, 240, Auto, Auto, "この前買ってきた。『その目だれの目』Ｔシャツ");
	Move("textc01", 0, @192, @38, null, true);

	Request("textc*", NoLog);

	CreateVOICE("男子高校生Ａ１","ch04/07300130da");
	SoundPlay("男子高校生Ａ１", 0, 1000, false);

	SetBacklog("「この前買ってきた。『その目だれの目』Ｔシャツ」", "voice/ch04/07300130da", 男子高校生Ａ);

	FadeDelete("textb*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textd01", 1400, 40, 80, Auto, Auto, "これ普通に売ってたんだな。");
	Move("textd01", 0, 0, 0, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textd02", 1400, 240, 80, Auto, Auto, "でもマジで着てるヤツ初めて見た。ぎゃはは");
	Move("textd02",0, 200, 400, null, true);

	Request("textd*", NoLog);
	Request("textd*", Erase);
	Move("textd*", 0, @192, @38, null, true);
	Request("textd*", Enter);

	CreateVOICE("男子高校生Ｂ１","ch04/07300140db");
	SoundPlay("男子高校生Ｂ１", 0, 1000, false);

	SetBacklog("「これ普通に売ってたんだな。でもマジで着てるヤツ初めて見た。ぎゃはは」", "voice/ch04/07300140db", 男子高校生Ｂ);

	FadeDelete("back08", 1000, true);
	CreateColor("back09", 1300, 0, 0, 1280, 720, "Black");

	FadeDelete("textc*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte01", 1300, center, Middle, Auto, Auto, "けっこうクールじゃね？");
	Move("texte01", 0, @192, @38, null, true);
	Request("texte*", NoLog);

	CreateVOICE("男子高校生Ａ２","ch04/07300150da");
	SoundPlay("男子高校生Ａ２", 0, 1000, false);

	SetBacklog("「けっこうクールじゃね？」", "voice/ch04/07300150da", 男子高校生Ａ);

	FadeDelete("textd*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textf01", 1300, 400, 80, Auto, Auto, "超クール。俺にくれよ");
	Move("textf01", 0, @192, @38, null, true);
	Request("textf*", NoLog);

	CreateVOICE("男子高校生Ｂ３","ch04/07300160db");
	SoundPlay("男子高校生Ｂ３", 0, 1000, false);

	SetBacklog("「超クール。俺にくれよ」", "voice/ch04/07300160db", 男子高校生Ｂ);

	WaitAction("texte*", null);

	FadeDelete("texte*", 1000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textg01", 1300, 40, 200, Auto, Auto, "ざけんな。自分で買ってこい");
	Move("textg01", 0, @192, @38, null, true);
	Request("textg*", NoLog);

	CreateVOICE("男子高校生Ａ４","ch04/07300170da");
	SoundPlay("男子高校生Ａ４", 0, 1000, false);

	SetBacklog("「ざけんな。自分で買ってこい」", "voice/ch04/07300170da", 男子高校生Ａ);

	FadeDelete("textf*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth01", 1200, 80, 40, Auto, Auto, "でもあれじゃね？これってニュージェネの犯人に、");
	Move("texth01", 0, @192, @38, null, true);
	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth02", 1200, 80, 40, Auto, Auto, "殺してくださいってアピールしてるようなもんじゃん");
	Move("texth02", 0, @192, @64, null, true);

	Request("texth*", NoLog);

	FadeDelete("back09", 2000, true);

	CreateVOICE("男子高校生Ｂ５","ch04/07300180db");
	SoundPlay("男子高校生Ｂ５", 0, 1000, false);

	SetBacklog("「でもあれじゃね？　これってニュージェネの犯人に、殺してくださいってアピールしてるようなもんじゃん」", "voice/ch04/07300180db", 男子高校生Ｂ);

	CreateColor("back10", 1100, 0, 0, 1280, 720, "Black");

	FadeDelete("textg*", 3000, false);
	Wait(500);

	WaitAction("男子高校生Ｂ５", 3000);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texti01", 1100, 240, 320, Auto, Auto, "俺の顔がニュースで全国に流れるかもな。");
	Move("texti01", 0, @192, @48, null, false);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texti02", 1100, 240, 320, Auto, Auto, "俺もいよいよ全国デビューか。ぎゃはは");
	Move("texti02", 0, @192, @64, null, true);
	Request("texti*", NoLog);

	CreateVOICE("男子高校生Ａ６","ch04/07300190da");
	SoundPlay("男子高校生Ａ６", 0, 1000, false);

	SetBacklog("「俺の顔がニュースで全国に流れるかもな。俺もいよいよ全国デビューか。ぎゃはは」", "voice/ch04/07300190da", 男子高校生Ａ);

	FadeDelete("texth*", 2000, false);
	Wait(500);

	WaitAction("男子高校生Ａ６", null);

	FadeDelete("texti*", 300, false);

	CreateColor("back05", 2000, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 500, 1000, null, true);



	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta01", 1900, 40, 80, Auto, Auto, "最");
	Move("texta01", 0, @0, @8, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta02", 1900, 40, 80, Auto, Auto, "近");
	Move("texta02", 0, @0, @24, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta03", 1900, 40, 80, Auto, Auto, "渋");
	Move("texta03", 0, @0, @40, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta04", 1900, 40, 80, Auto, Auto, "谷");
	Move("texta04", 0, @0, @56, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta05", 1900, 40, 80, Auto, Auto, "超");
	Move("texta05", 0, @0, @72, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta06", 1900, 40, 80, Auto, Auto, "コ");
	Move("texta06", 0, @0, @88, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta07", 1900, 40, 80, Auto, Auto, "ワ");
	Move("texta07", 0, @0, @104, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta08", 1900, 40, 80, Auto, Auto, "く");
	Move("texta08", 0, @0, @120, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta09", 1900, 40, 80, Auto, Auto, "な");
	Move("texta09", 0, @0, @136, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta10", 1900, 40, 80, Auto, Auto, "い");
	Move("texta10", 0, @0, @152, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texta11", 1900, 40, 80, Auto, Auto, "？");
	Move("texta11", 0, @0, @168, null, true);

	Request("texta*", NoLog);
	Request("texta*", Erase);
	Move("texta*", 0, @192, @38, null, true);
	Request("texta*", Enter);

	CreateVOICE("女子高生Ａ１","ch04/07300200ja");
	SoundPlay("女子高生Ａ１", 0, 1000, false);

	SetBacklog("「最近渋谷超コワくない？」", "voice/ch04/07300200ja", 女子高生Ａ);

	FadeDelete("back05", 500, true);
	CreateColor("back06", 1800, 0, 0, 1280, 720, "Black");
	CreateColor("back07", 1700, 0, 0, 1280, 720, "Black");

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textb01", 1800, 40, 40, Auto, Auto, "怖い怖い～。夜ひとりで歩けねーし");
	Move("textb01", 0, @0, @8, null, true);
	Request("textb*", NoLog);
	Request("textb*", Erase);
	Move("textb*", 0, @192, @38, null, true);
	Request("textb*", Enter);
	WaitAction("textb*", null);

	CreateVOICE("女子高生Ｂ２","ch04/07300210jb");
	SoundPlay("女子高生Ｂ２", 0, 1000, false);

	SetBacklog("「怖い怖い～。夜ひとりで歩けねーし」", "voice/ch04/07300210jb", 女子高生Ｂ);

	FadeDelete("texta*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textc01", 1800, 240, 320, Auto, Auto, "マジウザいんだけど、ニュージェネ");
	Move("textc01", 0, @192, @38, null, true);

	Request("textc*", NoLog);

	CreateVOICE("女子高生Ａ３","ch04/07300220ja");
	SoundPlay("女子高生Ａ３", 0, 1000, false);

	SetBacklog("「マジウザいんだけど、ニュージェネ」", "voice/ch04/07300220ja", 女子高生Ａ);

	FadeDelete("textb*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textd01", 1800, 40, 80, Auto, Auto, "犯人さっさと捕まってほしいよねー");
	Move("textd01", 0, @192, @38, null, true);

	Request("textd*", NoLog);

	CreateVOICE("女子高生Ｂ４","ch04/07300230jb");
	SoundPlay("女子高生Ｂ４", 0, 1000, false);

	SetBacklog("「犯人さっさと捕まってほしいよねー」", "voice/ch04/07300230jb", 女子高生Ｂ);

	FadeDelete("textc*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte01", 1700, 240, 80, Auto, Auto, "で");
	Move("texte01", 0, @+16, @8, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte02", 1700, 240, 80, Auto, Auto, "も");
	Move("texte02", 0, @+32, @24, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte03", 1700, 240, 80, Auto, Auto, "犯");
	Move("texte03", 0, @+48, @40, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte04", 1700, 240, 80, Auto, Auto, "人");
	Move("texte04", 0, @+64, @56, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte05", 1700, 240, 80, Auto, Auto, "オ");
	Move("texte05", 0, @+80, @72, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte06", 1700, 240, 80, Auto, Auto, "ン");
	Move("texte06", 0, @+96, @88, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte07", 1700, 240, 80, Auto, Auto, "ナ");
	Move("texte07", 0, @+112, @104, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte08", 1700, 240, 80, Auto, Auto, "ら");
	Move("texte08", 0, @+128, @120, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte09", 1700, 240, 80, Auto, Auto, "し");
	Move("texte09", 0, @144, @136, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte10", 1700, 240, 80, Auto, Auto, "い");
	Move("texte10", 0, @160, @152, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texte11", 1700, 240, 80, Auto, Auto, "よ");
	Move("texte11", 0, @176, @168, null, true);

	Request("texte*", NoLog);
	Request("texte*", Erase);
	Move("texte*", 0, @192, @38, null, true);
	Request("texte*", Enter);

	FadeDelete("back06", 1000, false);

	CreateVOICE("女子高生Ａ５","ch04/07300240ja");
	SoundPlay("女子高生Ａ５", 0, 1000, false);

	SetBacklog("「でも犯人オンナらしいよ」", "voice/ch04/07300240ja", 女子高生Ａ);

	FadeDelete("textd*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textf01", 1700, 40, 80, Auto, Auto, "えっ、マジマジマジ？");
	Move("textf01", 0, @0, @0, null, true);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textf02", 1700, 40, 80, Auto, Auto, "なにそれすげーじゃん。ってゆーかマコ、犯人見たの！？");
	Move("textf01", 0, @192, @38, null, true);
	Move("textf02", 0, @192, @64, null, true);

	Request("textf*", NoLog);

	CreateVOICE("女子高生Ｂ６","ch04/07300250jb");
	SoundPlay("女子高生Ｂ６", 0, 1000, false);

	SetBacklog("「えっ、マジマジマジ？　なにそれすげーじゃん。ってゆーかマコ、犯人見たの！？」", "voice/ch04/07300250jb", 女子高生Ｂ);

	FadeDelete("texte*", 1000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textg01", 1700, 40, 200, Auto, Auto, "見てねーよ。見てたらとっくに殺されてんじゃん。ぎゃはは");
	Move("textg01", 0, @192, @38, null, true);

	Request("textg*", NoLog);

	CreateVOICE("女子高生Ａ７","ch04/07300260ja");
	SoundPlay("女子高生Ａ７", 0, 1000, false);

	SetBacklog("「見てねーよ。見てたらとっくに殺されてんじゃん。ぎゃはは」", "voice/ch04/07300260ja", 女子高生Ａ);

	FadeDelete("textf*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texth01", 1700, 80, 40, Auto, Auto, "なんかそーゆー噂があるらしいってだけ");
	Move("texth01", 0, @192, @38, null, true);

	Request("texth*", NoLog);

	CreateVOICE("女子高生Ａ８","ch04/07300270ja");
	SoundPlay("女子高生Ａ８", 0, 1000, false);

	SetBacklog("「なんかそーゆー噂があるらしいってだけ」", "voice/ch04/07300270ja", 女子高生Ａ);

	FadeDelete("back07", 500, true);

	FadeDelete("textg*", 3000, false);
	Wait(1000);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("texti01", 1100, 80, 320, Auto, Auto, "じゃウチら殺される可能性低いんじゃない？　同じオンナだし");
	Move("texti01", 0, @192, @48, null, false);

	Request("texti*", NoLog);

	CreateVOICE("女子高生Ｂ９","ch04/07300280jb");
	SoundPlay("女子高生Ｂ９", 0, 1000, false);

	SetBacklog("「じゃウチら殺される可能性低いんじゃない？　同じオンナだし」", "voice/ch04/07300280jb", 女子高生Ｂ);

	FadeDelete("texth*", 3000, false);
	Wait(500);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textj01", 1100, 40, 160, Auto, Auto, "どうせならさ、くっせーオジさんとかキモい男とかだけ殺してほしいよね");
	Move("textj01", 0, @192, @48, null, false);;

	Request("textj*", NoLog);

	CreateVOICE("女子高生Ａ１０","ch04/07300290ja");
	SoundPlay("女子高生Ａ１０", 0, 1000, false);

	SetBacklog("「どうせならさ、くっせーオジさんとかキモい男とかだけ殺してほしいよね」", "voice/ch04/07300290ja", 女子高生Ａ);

	FadeDelete("texti*", 3000, false);
	Wait(1000);

	SetFont("ＭＳ ゴシック", 16, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("textk01", 1100, Center, Middle, Auto, Auto, "もしそうならあたしマジ応援する～");
	Move("textk01", 0, @192, @48, null, false);

	Request("textk*", NoLog);

	WaitAction("女子高生Ａ１０", 3000);

	CreateVOICE("女子高生Ｂ１１","ch04/07300300jb");
	SoundPlay("女子高生Ｂ１１", 0, 1000, false);

	SetBacklog("「もしそうならあたしマジ応援する～」", "voice/ch04/07300300jb", 女子高生Ｂ);

	FadeDelete("textj*", 3000, false);

	Wait(500);

	FadeDelete("textk*", 2000, false);
	WaitAction("textk*", null);

	WaitAction("女子高生Ｂ１１", null);

	FadeDelete("back10", 1000, true);

	SetVolume("SE01", 500, 700, NULL);

	CreateBG(100, 1000, 0, 0, "cg/bg/bg072_01_1_サインシティ１Ｆ入り口_a.jpg");
	Stand("buセナ_制服_食事棒","sigh", 200, @+200);
	FadeStand("buセナ_制服_食事棒_sigh", 500, true);

	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆軽く舌打ち
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/07300310sn">
「…………」

セナの口から、小さく舌打ちが漏れる。

彼女はすぐに耳を澄ませるのを中断した。

いずれのノイズにも価値らしいものは見出せなかった。
ノイズはしょせんノイズでしかない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/07300320sn">
「この視線の感覚……気のせいか？」

もう一度だけ、セナは周囲を見回した。

背筋を冷たい指で撫でられたようなおぞましさを、彼女は先ほどから感じていた。

何者かから投げかけられる“視線”。

だがその正体を探り当てることはできなかった。

セナはもたれかかっていた柱から身を離し――

{	Stand("buセナ_制服_食事棒","normal", 200, @+200);
	FadeStand("buセナ_制服_食事棒_normal", 300, true);
	DeleteStand("buセナ_制服_食事棒_sigh", 0, true);}
それからふと思い出したかのように、手に残っていた棒アイスの棒をじっと眺めた。

{	Stand("buセナ_制服_食事棒","sigh", 200, @+200);
	FadeStand("buセナ_制服_食事棒_sigh", 300, true);
	DeleteStand("buセナ_制服_食事棒_normal", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch04/07300330sn">
「ハズレか」

{	DeleteStand("buセナ_制服_食事棒_sigh", 500, true);}
ますます不機嫌そうに眉間にしわを寄せると、足早に駅前の方へと向かって歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

	ClearAll(2000);

	Wait(2000);

//～～Ｆ・Ｏ

//■インターミッション１２終了


}