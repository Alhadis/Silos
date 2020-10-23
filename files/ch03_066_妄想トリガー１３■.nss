//<continuation number="380">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_066_妄想トリガー１３■";
		$GameContiune = 1;
		Reset();
	}

		ch03_066_妄想トリガー１３■();
}


function ch03_066_妄想トリガー１３■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg129_02_1_謎の電話番号_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Delete("背景２");

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐１０へ
//ネガティブ妄想→分岐１１へ
//妄想しない→分岐１２へ

if($妄想トリガー通過１３ == 0)
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
			$妄想トリガー１３ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１３ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１３ = 0;
		}
	}
}



//=============================================================================//

if($妄想トリガー１３ == 2)
{
//☆☆☆
//分岐１０
//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 500, 0, null);

	DelusionIn();
	BoxDelete(0);
	ClearAll(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg129_02_1_謎の電話番号_a.jpg");

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
とりあえず聞いてみることにするか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//ピー
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");

	CreateSE("SE02","SE_日常_けい帯_留守でん");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	BGMPlay360("CH05",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//ＶＦ//以下、女子Ａのセリフはすべて電話の声
//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600010wa">
「あ、あのさ、私だけど」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600020wa">
「別に、あんたの声が聞きたいから電話したわけじゃないんだからねっ。なんとなく、暇だったからとかその程度の理由だから！　分かった？」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600030wa">
//◆切ないブレス
「…………」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600040wa">
「でも、クラスが別になって、最近話す機会が少なくなったね」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600050wa">
「あんた、私のことどう思ってるわけ？」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600060wa">
「例えばさ、私にコクってみようとか思わないわけ？」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600070wa">
「あ、べ、別にあんたにコクられたからって、私は嬉しくもなんともないんだからねっ」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600080wa">
「そもそも、私がＯＫする保証は万にひとつぐらいしかないんだしっ」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600090wa">
「でもさ、行動しなくちゃなんにも始まらないって思わない？」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600100wa">
「と、とにかく、あんたは試しにコクってみること！　分かった？」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600110wa">
「じゃあ、きょ、今日の放課後、で、伝説の樹の下で待ってるからっ」

//【女子Ａ】
<voice name="女子Ａ" class="女子Ａ" src="voice/ch03/06600120wa">
「急いで来なさいよっ。来なかったら、承知しないんだからねっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("@text002");

//ＳＥ//電話を乱暴に切られる
	CreateSE("SE01","SE_日常_でんわ_ぶつっと切れる");
	MusicStart("SE01", 0, 800, 0, 1000, null, false);

	Wait(800);

	SoundPlay("SE01",100,0,false);

//ＳＥ//ツーツーツー
	CreateSE("SE02","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE02", 0, 800, 0, 1000, null, true);

	Wait(3500);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	MusicStart("SE*", 0, 0, 0, 1000, null, true);

	SetVolume360("CH*", 500, 0, null);

	DelusionOut();

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	DelusionOut2();
	PositiveHuman();

	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 0, 300, 0, 1000, null, true);

	Wait(1000);


//ＢＧ//翠明学園屋上

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600130ta">
「…………」

//わざと「あるあｒ……ねーよ」です。
あるあｒ……ねーよｗｗｗ

ウチの学校に伝説の樹なんてないしｗｗｗ

っていうか誰だよこのツンデレ女子はｗｗｗ

キャラ設定の詰めが甘かったなあ。
せめて星来たんにしておくべきだった。

……妄想してる場合じゃないか。

僕は虚しくなってため息をつき、実際に留守電を聞いてみることにした。

周囲を窺って、悪魔女の姿がないか確認しつつ、ケータイを耳に当てる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流７へ

}


//=============================================================================//

if($妄想トリガー１３ == 1)
{

//☆☆☆
//分岐１１
//フラグ【３章エンドフラグ②】ＯＮ
	$３章エンドフラグ② = true;

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume360("CH*", 500, 0, null);

	DelusionIn();
	BoxDelete(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg129_02_1_謎の電話番号_a.jpg");

	DelusionIn2();


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
とりあえず聞いてみることにするか……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	Fade("背景２", 500, 1000, null, true);

	Delete("背景１");
//ＳＥ//ピー
	CreateSE("SE02","SE_日常_けい帯_留守でん");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	BGMPlay360("CH11",3000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//以下、優愛のセリフはすべて電話の声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600140yu">
「楠……優愛です」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600150yu">
「あの、ごめんなさい……突然、お電話しちゃって……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600160yu">
「ただ、どうしても、お話したいことがあって……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600170yu">
「……星来ちゃんの新しいフィギュア、わたしも……買えました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600180yu">
「西條くんの、おかげです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600190yu">
「ありがとう……ございました……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600200yu">
「とっても可愛いんですけど……ちょっと、エッチ……ですね。あはは」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600210yu">
「買うとき、すごく……恥ずかしかったです……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600220yu">
「あ、そうそう、今週のブラチュー、見ました？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600230yu">
「すごい展開でしたね……わたし、見ながらずっとドキドキしちゃって――」

{	SetVolume360("CH*", 300, 0, null);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600240yu">
//◆いきなり冷淡な声になる
「この多重人格者」

{	BGMPlay360("CH01",0,1000,true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600250yu">
「あなたが殺したの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600260yu">
「人殺し」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600270yu">
「真犯人」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600280yu">
「罪を償いなさい」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600290yu">
「逃がさないから」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch03/06600300yu">
「その目だれの目？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//おがみ：実績：その目
	Eyes();

	Delete("@text005");

//ＳＥ//電話を乱暴に切られる
	CreateSE("SE01","SE_日常_でんわ_ぶつっと切れる");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(800);

	SoundPlay("SE01",100,0,false);

//ＳＥ//ツーツーツー
	CreateSE("SE02","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	Wait(3500);

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	MusicStart("SE*", 0, 0, 0, 1000, null, true);

	SetVolume360("CH*", 500, 0, null);

	DelusionOut();

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");

	DelusionOut2();
	NegativeHuman();

	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 0, 300, 0, 1000, null, true);

	Wait(1000);

//ＢＧ//翠明学園屋上

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600310ta">
//◆恐怖でうめく
「…………っ」

自分の妄想でしかないのに、恐怖を感じた。

優愛がどこからか僕のケータイ番号を調べて実際にかけてきたっていう可能性は、じゅうぶん考えられる。

できれば留守電を聞きたくなかった。

でも、妄想で最悪の展開をシミュレーションして心の準備はしたから、聞くだけならなんとか耐えられるはず。

僕は憂鬱な気分を振り払いつつ、留守電を再生させた。周囲に悪魔女の姿がないか何度も確認しつつ、ケータイを耳に当てる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流７へ

}


//=============================================================================//

if($妄想トリガー１３ == 0)
{


//☆☆☆
//分岐１２

	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 0, 300, 0, 1000, null, true);

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
考えられる相手は誰だろう……。
やっぱり警察かな。

三住くんや悪魔女じゃない。さっき電話が鳴ったとき２人は僕の目の前にいた。

となると他に可能性があるのは……優愛？

でもあいつが僕のケータイ番号を知ってるはずがない。
それに今さら優愛と話すことなんて僕にはなにもなかった。

とりえあず留守電を聞いてみよう。
周囲を窺って、悪魔女の姿がないか確認しつつ、ケータイを耳に当てる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//合流７へ

}

//=============================================================================//

//☆☆☆
//合流７
	CreateSE("SE05","SE_日常_けい帯ボタン押す");
	SoundPlay("SE05", 0, 1000, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//ＶＦ//ケータイのアナウンスメッセージ
//【ケータイアナウンス】
<voice name="ケータイアナウンス" class="ケータイアナウンス" src="voice/ch03/06600320ia">
「こちらは留守番電話サービスセンターです。新しいメッセージは、１件、です」

//【ケータイアナウンス】
<voice name="ケータイアナウンス" class="ケータイアナウンス" src="voice/ch03/06600330ia">
「１件目。１０月１７日、金曜日、午前、８時、２８分、の、伝言です」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("@text008");

//ＳＥ//ピー
	CreateSE("SE02","SE_日常_けい帯_留守でん");
	SoundPlay("SE02", 0, 1000, false);

	Wait(3000);
	SoundPlay("SE02", 0, 0, false);

//ＳＥ//電話の向こうから聞こえてくる『通りゃんせ』のメロディ
//※真相は、２ヶ月前の地震の際に録音された音です。
	CreateSE("SE22","SE_はいけい_通りゃんせ_けい帯ごし_LOOP");
	MusicStart("SE22", 0, 1000, 0, 1000, null, true);
	CreateSE("SE21","SE_はいけい_でんわごしの喧騒_LOOP");
	MusicStart("SE21", 0, 1000, 0, 1000, null, true);

	Wait(5000);
	SetVolume("SE21", 2000, 300, null);
	SetVolume("SE22", 2000, 300, null);


	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600340ta">
//◆※わざと「なんぞこれ」です
「なんぞこれ」

聞こえてきたのは誰かの声ではなく、馴染みのあるメロディだった。

ちょっと遠くで音が鳴っているような感じだ。
電話の相手は、信号機の近くにいたのかもしれない。

横断歩道がある場所で、視覚障害者のために信号が青になったことを知らせるときによく流れてるもんね。

ちなみにこれは『通りゃんせ』っていう童謡だ。

メロディは知っている人が多くても、歌詞まで知ってる人は少ないだろう。あ、ちなみに僕は知ってるよ。小学生のときに習ったからね。まあ、完璧に覚えてる、ってわけじゃないけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE21", 2000, 1000, null);
	SetVolume("SE22", 3000, 0, null);


	Wait(1000);

//『通りゃんせ』歌詞
//※作詞者不詳。権利はどうなってるんでしょうね……？？？　ゲーム中に歌詞全文を出せるなら出したいです
//※文章（歌詞）とメロディの同期必須！　↑のモノローグのせいでメロディと同期が難しいなら、歌詞は画面中央に表示するとか
//※指定の場所まで読み進む間は永久ループするとか

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	CreateSE("とおりゃんせタイム合わせ","SE_はいけい_通りゃんせ_trim");
	CreateSE("SE20","SE_はいけい_通りゃんせ_けい帯ごし_LOOP");
	CreateSE("警告音","SE_はいけい_点滅ぴーポー_けい帯瓜し_LOOP");
	MusicStart("SE20", 500, 1000, 0, 1000, null, true);

//通りゃんせ　通りゃんせ
//ここはどこの　細道じゃ
//天神さまの　細道じゃ
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "通りゃんせ　通りゃんせ<BR>ここはどこの　細道じゃ<BR>天神さまの　細道じゃ");

	SetBacklog("通りゃんせ　通りゃんせ", "NULL", NULL);
	SetBacklog("ここはどこの　細道じゃ", "NULL", NULL);
	SetBacklog("天神さまの　細道じゃ", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	Wait(12000);

	FadeDelete("テキスト１", 1000, false);


//ちょっと通して　くだしゃんせ
//御用のないもの　通しゃせぬ
//この子の七つの　お祝いに
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "ちょっと通して　くだしゃんせ<BR>御用のないもの　通しゃせぬ<BR>この子の七つの　お祝いに");

	SetBacklog("ちょっと通して　くだしゃんせ", "NULL", NULL);
	SetBacklog("御用のないもの　通しゃせぬ", "NULL", NULL);
	SetBacklog("この子の七つの　お祝いに", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);

	Wait(12000);

	FadeDelete("テキスト１", 1000, false);


//お札を納めに　参ります
//行きはよいよい　帰りは――
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "お札を納めに　参ります<BR>行きはよいよい　帰りは――");

//▼べー：演出：SetStreamコマンドが使用不可ですので一時コメントアウト致します。

	$行きは = PassageTime("SE20");
	if($行きは < 23000)
	{
		SetVolume("SE20", 1000, 0, NULL);
//		SetStream("とおりゃんせタイム合わせ", 24300);
		MusicStart("とおりゃんせタイム合わせ", 1000, 1000, 0, 1000, null, true);
	}

	SetBacklog("お札を納めに　参ります", "NULL", NULL);
	SetBacklog("行きはよいよい　帰りは――", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
//	WaitAction("テキスト１", null);

	Wait(7200);



	MusicStart("警告音", 0, 1000, 0, 1000, null, true);
	SoundStop2("とおりゃんせタイム合わせ");
	MusicStart("SE20", 0, 0, 0, 1000, null, false);
	MusicStart("SE01", 2000, 0, 0, 1000, null, true);
	MusicStart("SE21", 1000, 0, 0, 1000, null, false);

	FadeDelete("テキスト１", 500, false);
	FadeDelete("色１", 500, false);

//ＳＥ//青信号が点滅すると鳴り出す警告音「ピーポーピーポー」
//※「行きはよいよい　帰りはピーポーピーポー」という感じで自然に音が移行していければ最高です
//ＳＥ//しばらく「ピーポー」は鳴り続ける

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600350ta">
「ちょ！」

“帰りはピーポーピーポー”って聞こえたよ。救急車みたいで縁起が悪いな。まあ、偶然なんだろうけど、それでも気味が悪い……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("地鳴","SE_自然_じ鳴り_ふぇーどいん_START");
	MusicStart("地鳴", 0, 1000, 0, 1000, null, false);

	Wait(2200);

	SetVolume("警告音", 0, 0, NULL);
	SetVolume("地鳴", 0, 0, NULL);
	SetVolume("雑踏", 0, 0, NULL);


//ＳＥ//ピーポー終了
//ＳＥ//大音量でブザーのような音「ブーーーーー！」
//ＳＥ//ブザーの音の後ろに、かすかに地鳴りのような音も混ぜる
	CreateSE("SE02","SE_はいけい_ザザー大音量_けい帯ごし_LOOP");
	CreateSE("SE03","SE_はいけい_ザザー大音量_けい帯ごし_LOOP");
//	CreateSE("SE04","SE_はいけい_ザザー大音量_けい帯ごし_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);
	MusicStart("SE03", 0, 1000, 0, 1000, null, true);
//	MusicStart("SE04", 0, 1000, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600360ta">
「わあっ！」

信号機のメロディが途切れた直後、大音量で聞こえてきたのはブザーのような音だった。

{	MusicStart("SE*", 500, 0, 0, 1000, null, true);}
あまりの音量に、たまらずケータイを耳から遠ざける。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600370ta">
「なっ、なんだ！？」

{	CreateSE("SE05","SE_自然_風音_LOOP");
	SoundPlay("SE05", 2000, 300, true);
	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 0, 200, 0, 1000, null, true);}
改めて恐る恐る受話器を耳に近づけると、留守電の再生はすでに終了していた。

なんだったんだろう。最後は、地鳴りのような轟音もわずかに聞こえていたような気がする……。

あのブザー音、信号機のメロディとはまったく別のものだ。あれだけの大音量で聞こえてきたのは意図的に電話の送話口に近づけて鳴らしたとしか思えない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06600380ta">
「イ、イタズラ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
そう思ったらドキドキしてきた。

誰かに嫌われるようなことをなにかしたかな。

そもそも、これをかけてきたのは誰だったんだろう……。

電話番号は表示されているから折り返すことはできるけど、イタズラをしかけてきた相手にかけ直すなんてとてもできない。

結局、放置するしかない。
それに今はこんなイタズラ電話よりもっとまずい事態が起こってる最中なんだ。

僕はケータイをポケットにしまうと、慎重に慎重を重ねて周囲を窺いつつ学校を脱出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);
	Wait(2000);


}