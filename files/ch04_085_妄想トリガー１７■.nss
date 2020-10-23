//<continuation number="820">




chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_085_妄想トリガー１７■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch04_085_妄想トリガー１７■();
}


function ch04_085_妄想トリガー１７■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CreateBG(100, 0, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
	Request("back*", Smoothing);

	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	MusicStart("SE01", 1000, 700, 0, 1000, null, true);
	MusicStart("SE02", 1000, 700, 0, 1000, null, true);

	BGMPlay360("CH10", 500, 1000, true);

//☆☆☆
//妄想トリガー分岐
//ポジティブ妄想→分岐７へ
//ネガティブ妄想→分岐８へ
//妄想しない→分岐９へ

if($妄想トリガー通過１７ == 0)
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
			$妄想トリガー１７ = 2;
		}
		case @選択肢２:
		{
			ChoiceB03();
			$妄想トリガー１７ = 1;
		}
		case @選択肢３:
		{
			ChoiceC03();
			$妄想トリガー１７ = 0;
		}
	}
}


if($GameDebugSelect == 1 && $妄想トリガー１７ == 1)
{
	SetChoice02("ＲＯＯＭ３６有り","ＲＯＯＭ３６無し");
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
			$ＲＯＯＭ３６ = true;
		}
		case @選択肢２:
		{
			ChoiceB02();
		}
	}

	$GameDebugSelect = 0;
}

//=============================================================================//

if($妄想トリガー１７ == 2)
{
//☆☆☆
//分岐７

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
逆らったら殺される……。
そんな気がして、僕は抵抗せずただただ優愛の言葉にうなずいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ

	SetVolume("SE01", 0, 0, NULL);
	SetVolume("SE02", 0, 0, NULL);
	SetVolume360("CH10", 0, 500, NULL);

	DelusionIn();

	Stand("bu優愛_制服_冷酷","cool", 200, @0);
	FadeStand("bu優愛_制服_冷酷_cool", 0, true);

	DelusionIn2();

	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 1000, 700, 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 1000, 700, 0, 1000, null, true);

	SetVolume360("CH10", 500, 1000, NULL);
//	BGMPlay360("CH10", 500, 1000, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆以下、優愛のセリフは冷徹、小声なままで
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500010yu">
「どうしても伝えたかった」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500020yu">
「好き」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500030yu">
「好きなの」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500040yu">
「分かって」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500050yu">
「大好き」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500060yu">
「分かってよ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500070yu">
「わたしのものになって」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500080yu">
「お願い」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
愛の告白は――
もっとロマンチックで、切なくて、嬉しいものだと思ってた。

でもこれは違う。
恐ろしい。
背筋が凍る。

愛の告白をされているはずなのに、
死刑宣告を受けているかのような気分だ。

もうはっきりと断るしかない！
こいつはただのストーカーだっ！
このままだと本気で取り返しが付かなくなる！

{	DeleteStand("bu優愛_制服_冷酷_cool", 300, true);
	CreateSE("SE01","SE_じん体_動作_手_梨深を振り払う");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
僕は強引に優愛の手を振り払った。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500090ta">
「お、お断りだ！　警察に、つ、つつ、突き出すぞ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH10", 500, 0, NULL);

//ＢＧ//＠カフェ・ＲＯＯＭ３７

	Stand("bu優愛_制服_通常左手下","shock", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆ショックを受ける
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500100yu">
「……！」

//おがみ：シナリオ修正1220
//優愛はショックを受けたかのように、表情を青ざめさせた。
{	Stand("bu優愛_制服_通常左手下","sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("bu優愛_制服_通常左手下_shock", 0, true);}
優愛はショックを受けたかのように、表情を強張らせた。

うなだれ、みるみるうちに弱気な態度になっていく。

//◆以下、口調は弱気なものに戻る
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500110yu">
「そんなに嫌われてたなんて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500120yu">
「ごめんなさい、もう、付きまといません……」

//◆涙声
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500130yu">
「さようなら……西條くん……」

{	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);}
僕から身を離し、肩を落としつつ背中を向ける。

おぼつかない足取りで個室から出て行った。

い、言ってやった……。
ははは、言ってやったぞ……。

優愛が泣いているのを見て、むしろ清々した気分になった。

やっとあのストーカーから解放されたかと思うと嬉しくてしょうがない。ついついひとりでガッツポーズをしていた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＯＵＴエフェクト
//ＳＥ//妄想ＯＵＴ

	SetVolume("SE01", 0, 0, NULL);
	SetVolume("SE02", 0, 0, NULL);

	DelusionOut();

//	Stand("bu優愛_制服_冷酷","cool", 200, @0);
//	FadeStand("bu優愛_制服_冷酷_cool", 0, true);
	Stand("bu優愛_制服_通常左手下", "worry", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_worry", 300, true);

	DelusionOut2();
	PositiveHuman();

//ＣＧ//ＲＯＯＭ３７に乱入してくる優愛

	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 1000, 700, 0, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 1000, 700, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ハッと我に返る。

相変わらず優愛は目の前にいて、僕の口を塞いでいた。

//◆※「わたし、西條くんのこと騙してたわけだし……」と言っている最中
//※拓巳妄想中に優愛がなにを話していたかは、分岐８ｏｒ９で描いています
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500140yu">
「――のこと、騙してたわけだし……」

なにかを小声でつぶやいている。

なにを話していたのかまったく聞いてなかった。

現実逃避をしていた。
今の妄想が現実だったら、どんなによかっただろう。

そんな僕の願いが届くはずもなく、優愛はなおも話を続ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500150yu">
「でも、お願いです……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500160yu">
「ひ、ひとつだけ、言わせてください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500170yu">
「これ以上、あなたが傷つくのも、あなたが不幸になるのも、あなたのせいで不幸になる人が出るのも、見たくないんです」

なにを言っているんだ？

僕のことならなんでも知っているかのような口振り。

優愛と僕が触れ合った時間なんて延べ２４時間にも満たないのに。

この女は僕のなにを理解しているって言うんだ？

またお得意のトンデモ妄想か？

{	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Shake("back*", 200, 0, 10, 0, 0, 500, null, false);}
戦慄を覚えて僕は手足をばたつかせる。
それでも優愛は離してくれない。

このままだとこの女に殺されかねない。

『将軍』は僕を罠にはめることをあきらめて、優愛を刺客として送り込んできたのか？

死にたくない……。
死にたくない！
死にたくないよぉ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

/*森島ＳＥダミー*/
	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Shake("back*", 200, 0, 10, 0, 0, 500, null, true);

/*森島ＳＥダミー*/
	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Shake("back*", 200, 0, 15, 0, 0, 500, null, true);

	Wait(500);

	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	DeleteStand("bu優愛_制服_通常左手下_worry", 500, false);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500180yu">
「ごめ、ごめんなさい、お願いだから、静かにしてください……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500190yu">
「話は、す、すぐ、終わりますから……」

{	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);}
口調は弱々しいのに、僕を押さえつける優愛の手の力は、抵抗してもびくともしないほど強い。

この細い手でこれだけの力を出せるなんて信じられない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500200yu">
「西條くん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
優愛がますます顔を近づけてくる。
僕は必死で顔をそむける。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500210yu">
「もう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流６へ


}


//=============================================================================//

if($妄想トリガー１７ == 1)
{

//☆☆☆
//分岐８

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
優愛の手が、ゆっくりと離される――

//◆叫ぶ
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500220ta">
「助け――」

{	Shake("back*", 300, 0, 20, 0, 0, 500, null, false);
	CreateSE("SE01","SE_にん間_動作_手_はたく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Stand("bu優愛_制服_冷酷","cool", 200, @0);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);}
叫ぼうとして、すぐにまた塞がれた。

息が、苦しい……っ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500230yu">
「どうして声を出すの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500240yu">
「約束したのに」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500250yu">
「したよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500260yu">
「したって言って」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500270yu">
「したでしょ？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500280yu">
「したよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
優愛の握力は尋常じゃなかった。

僕の口を塞ぐと同時に、ギリギリと顎を強く締め付けてくる。

恐怖は頂点に達して、膝が震え出した。

優愛の感情を押し殺したような静かな言葉に、僕はもはや必死でうなずくしかない。

それでやっと優愛は顎を締め付ける力を弱めてくれたけど、さっきみたいに手を離してくれることはなかった。

くそぅ、こいつは真性のストーカーだ……！
まさかここに現れるなんて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――





//=============================================================================//
//フラグ判定
//フラグ【ＲＯＯＭ３６】ＯＮの場合
if($ＲＯＯＭ３６ == true)
{

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
いや、よく考えてみれば予想できたことだ。

今思い出したけど、優愛と初めて会った日にもここで姿を見かけた。
隣のＲＯＯＭ３６で僕の様子を窺っていた。

ここに避難しても無意味だった。
なんて迂闊なことをしちゃったんだ、僕は……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//合流５へ

}

//フラグ【ＲＯＯＭ３６】ＯＦＦの場合
//※テキストなし
//合流５へ
//=============================================================================//



//合流５

	SetVolume360("CH10", 1000, 0, NULL);

	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//◆以下、優愛の口調は弱気なものに変化
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500290yu">
「ごめんなさい……」

周囲に聞かれないようにするためか、小声でささやいた優愛の口調は、いつもの弱気なものに戻っていた。

まるで二重人格……！
この女は病んでいる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500300yu">
「驚かせちゃいましたよね……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500310yu">
「でも、西條くんとお話するには、こうするしかなかったんです」

ホントに申し訳なさそうな表情。
なぜか見ているこっちが罪悪感を覚えそうなくらいだ。
大した演技力だよ……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500320yu">
「昨日、あなたの家に、行ったんですけど、いませんでしたよね……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500330yu">
「よ、夜まで……待ってたんですけど……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500340yu">
「ううん、で、でも、わたしを避けようとする西條くんの気持ちは……よく、分かります……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500350yu">
「わたし、西條くんのこと騙してたわけだし……」

それを分かってるなら、もう僕に関わらないでくれ……。<k>
『将軍』の手下と話すことなんてなにもない。
弱者の僕を罠にはめるようなヤツは外道だっ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500360yu">
「でも、お願いです……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500370yu">
「ひ、ひとつだけ、言わせてください」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500380yu">
「これ以上、あなたが傷つくのも、あなたが不幸になるのも、あなたのせいで不幸になる人が出るのも、見たくないんです」

なにを言っているんだ？

僕のことならなんでも知っているかのような口振り。

優愛と僕が触れ合った時間なんて延べ２４時間にも満たないのに。

この女は僕のなにを理解しているって言うんだ？
またお得意のトンデモ妄想か？

{/*森島ＳＥダミー*/
	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Shake("back*", 200, 0, 20, 0, 0, 500, null, false);}
戦慄を覚えて僕は手足をばたつかせる。

それでも優愛は離してくれない。
このままだとこの女に殺されかねない。

『将軍』は僕を罠にはめることをあきらめて、優愛を刺客として送り込んできたのか？

死にたくない……。<k>
死にたくない！<k>
死にたくないよぉ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

/*森島ＳＥダミー*/
	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Shake("back*", 300, 0, 20, 0, 0, 500, null, true);


/*森島ＳＥダミー*/
	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Shake("back*", 300, 0, 30, 0, 0, 500, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500390yu">
「ごめ、ごめんなさい、お願いだから、静かにしてください……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500400yu">
「話は、す、すぐ、終わりますから……」

口調は弱々しいのに、僕を押さえつける優愛の手の力は、抵抗してもびくともしないほど強い。

この細い手でこれだけの力を出せるなんて信じられない。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500410yu">
「西條くん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);
	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
優愛がますます顔を近づけてくる。
僕は必死で顔をそむける。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500420yu">
「もう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	NegativeHuman();

//合流６へ



}


//=============================================================================//

if($妄想トリガー１７ == 0)
{

//☆☆☆
//分岐９
//フラグ【４章エンドフラグ①】ＯＮ
	$４章エンドフラグ① = true;

	Stand("bu優愛_制服_冷酷", "cool", 200, @0);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
どうする……。どうしたらいい……？

この状況から逃げ出す方法を必死で考えようとした。でもダメだった。冷静な思考が保てない。

完全な不意打ちを食らって、頭の中が真っ白だった。

//◆以下、優愛の口調は弱気なものに戻る
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500430yu">
「昨日、あなたの家に、行ったんですけど、いませんでしたよね……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500440yu">
「よ、夜まで……待ってたんですけど……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500450yu">
「ううん、で、でも、わたしを避けようとする西條くんの気持ちは……よく、分かります……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500460yu">
「わたし、西條くんのこと騙してたわけだし……」

それを分かってるなら、もう僕に関わらないでくれ……。

『将軍』の手下と話すことなんてなにもない。
弱者の僕を罠にはめるようなヤツは外道だっ。

優愛は一度目を伏せてから、少し躊躇するような仕草を見せた。
それから、はっきりと、ひとつの言葉をつぶやく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500470yu">
「――その目だれの目？」

{
//おがみ：実績：その目
	Eyes();
}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500480ta">
「……！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500490yu">
「知って……ますよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500500yu">
「知らないなんて、言わせません」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500510yu">
「……『ヴァンパイ屋』の、ダイイングメッセージです」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500520yu">
「ネットで公表されたことで、渋谷で、大流行中の言葉……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500530yu">
「でもわたし、流行る前から……知ってました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500540yu">
「『ヴァンパイ屋』より前に、こ、この言葉を使っている人が、いたから」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500550yu">
「『将軍』」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500560ta">
「…………っ」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500570yu">
「前に見せましたよね？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500580yu">
「ナイトハルト……西條くんと『将軍』のチャットログ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//チャットの過去ログが印刷されたプリント
//フラッシュバックで一瞬表示

	CreateSE("SE01","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE01", 0, 500, 0, 1000, null, false);
	CreateTextureEX("back05", 500, 0, 0, "cg/bg/bg042_01_2_ログプリント_a.jpg");
	Fade("back05", 100, 1000, null, true);
	FadeDelete("back05", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500590yu">
「そこで『将軍』が書き込んでました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500600yu">
「その目だれの目？　……って」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500610yu">
「そして――」

{	DeleteStand("bu優愛_制服_冷酷_cool", 500, true);
	Stand("bu優愛_制服_冷酷", "cool", 200, @0);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);}
優愛がますます顔を近づけてくる。

口調は穏やかなものだけど、眼鏡の奥に光る瞳は凍るように冷たい。

じっと見つめてくる。
僕は目をそらす。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500620yu">
「『将軍』は、あなた」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500630yu">
「つまり……」

つまり……なに？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, true);
	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601016]
//◆切ないブレス
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500640yu">
「…………」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500650yu">
「お願いです、西條くん……もう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//合流６へ


}

//=============================================================================//

//☆☆☆
//合流６

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
ふと気付いた。
優愛の手が震えている。

いや、それとも僕の震えが優愛の手に伝わっているだけ？

僕が戸惑っている間に、優愛の口からとんでもない言葉が紡がれた――

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500660yu">
「人を殺すのは、やめてください……っ」

{	SetVolume360("CH10", 1000, 0, NULL);}
は……？

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500670yu">
「自覚が、ないんですね……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500680yu">
「でも、それもわたしには理解できます……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500690yu">
「西條くんに、自覚があるはず、ないから」

なにを……

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500700yu">
「あなたは――」

{	DeleteStand("bu優愛_制服_通常左手下_sad", 500, true);}
優愛の瞳に、哀しみの色が浮かんだ。

それまで僕をじっと凝視していたのに、不意にその目が伏せられる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_通常左手下", "sad", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500710yu">
「ＤＩＤ……多重人格、なんです」

僕が――

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);}
多重人格だって……？

{	BGMPlay360("CH01",0,1000,true);
	Stand("bu優愛_制服_通常左手下", "hard", 200, @0);
	DeleteStand("bu優愛_制服_通常左手下_sad", 500, false);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500720yu">
「最初は、あなたのこと、警察に突き出すつもり、でした」

僕の困惑をよそに、優愛はなおも話を続ける。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500730yu">
「それが無理なら、この手で……とも、思ってました」

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500740yu">
「だけど、あなたのこと、調べていくうちに……」

{	Stand("bu優愛_制服_通常左手下", "worry", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_worry", 500, true);
	DeleteStand("bu優愛_制服_通常左手下_hard", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500750yu">
「あなたも、苦しんでるんだって、分かって……」

優愛の眼鏡の奥の瞳が再び僕を捉える。
訴えるような目をしていた。

どう見ても、僕のことを
心配してくれているようにしか思えないその態度に――

僕はゾッとした。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500760yu">
「わたし、あなたを、助けたい……」

この女の妄想は、暴走し始めている……！
言ってることが支離滅裂だ……！

…………………………………………ホントに？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//心臓の鼓動
	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
ホントに、支離滅裂なのかな……？

{	Stand("bu優愛_制服_通常左手下", "hard", 200, @0);
	FadeStand("bu優愛_制服_通常左手下_hard", 500, true);
	DeleteStand("bu優愛_制服_通常左手下_worry", 0, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500770yu">
「だから、病院に行きましょう……っ」

僕は、僕自身について、よく分からない。

知らない間にチャットに『将軍』っていうハンドルネームで書き込みをした。

僕の記憶にないのに、梨深っていう女子といつの間にか友達になっていた。

僕は夢遊病なんかじゃなくて――<k>
僕を操る高次の存在がいるわけでもなくて――<k>

“僕の中の人”は――<k>
文字通り、心の中に、いたのかもしれない――

僕じゃない、僕。<k>
僕じゃない、別の人格。<k>
多重人格……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
頭痛が、する。
ズキズキと、こめかみを襲う刺すような痛み。

そんなはずない……！
そんな話はでたらめだ……！

誰が信じるもんか……！
これも優愛の妄想だっ！

こいつは僕の敵だ。

僕の邪魔をする。
僕を罠にはめようとする。
僕の心を壊そうとする。

それに病院だって『将軍』の息がかかってる。

僕が唯一信頼してた高科先生は不自然すぎるくらい唐突にいなくなった。

{	CreateColor("back03", 1000, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 500, 1000, null, true);}
『将軍』に消されたに違いないんだ！　優愛の言葉に従ってついていったら僕も消されるぞ！

僕は、この女を、信じない！

信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない信じない

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	FadeDelete("back03", 300, false);

	Request("back*", Smoothing);
	Request("bu優愛_制服_通常左手下_hard", Smoothing);

	SetVolume360("CH01", 200, 0, null);

//ＳＥ//優愛を突き飛ばす
	CreateSE("SE03","SE_衝撃_衝撃音03");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
無我夢中だった。
僕は優愛の身体を全力で突き飛ばしていた。

{	Shake("bu優愛_制服_通常左手下_hard", 100, 10, 10, 0, 0, 500, null, false);
	DeleteStand("bu優愛_制服_通常左手下_hard", 200, true);}
//◆以下、優愛の小声指定解除。普通の声で
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500780yu">
「キャッ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//優愛が仕切り戸にぶつかって倒れる

	Shake("back*", 100, 0, 20, 0, 0, 500, null, false);

	CreateSE("SE03","SE_衝撃_倒れる梨深_し切り戸ぶつかり");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
すぐ後ろの木製の仕切り戸に背中をぶつけ、優愛は顔をしかめながらその場に崩れ落ちた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500790ta">
「はあっはあっはあっはあっ――」

ようやく優愛の手から解放された僕は、自分のカバンを手に取ると優愛の身体をまたいで通路に出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, NULL);

//ＢＧ//＠カフェ・ＲＯＯＭ３７付近
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg035_02_3_ネットカフェ隣室_a.jpg");
	Fade("back04", 500, 1000, null, false);
	Request("back*", Smoothing);

	CreateSE("SE04","SE_じん体_動作_足_走る_LOOP");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch04/08500800yu">
「待って……っ」

{	CreateSE("SE03","SE_にん間_動作_手_はたく");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Shake("back*", 300, 20, 20, 0, 0, 500, null, false);}
しゃがみ込んだままの優愛が、僕の足首をつかんでくる。

髪を振り乱し、ずり下がった眼鏡を直そうともせず、必死の形相ですがりついてくるその姿に僕は恐怖しか覚えず、情けない悲鳴が口から漏れ出た。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500810ta">
「ひいいっ！」

こいつは敵だ！
『将軍』の手下だ！

騙されないぞ！　二度と騙されるもんか！

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch04/08500820ta">
「さ、触るなぁっ！」

大声で叫ぶと、優愛はあっさり手を離した。
{	MusicStart("SE04", 500, 1000, 0, 1000, null, true);}
その隙に、僕は店内を走り出す。

{	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg036_01_3_ネットカフェトイレ_a.jpg");
	DrawTransition("背景１", 300, 0, 1000, 100, null, "cg/data/right2.png", true);
	Wait(300);
	Delete("back*");}
//ＢＧ//＠カフェ・カウンターホール
//＠カフェはビルの４階とか５階あたりを想定してます
受付カウンターであ然としている店員を前にして、
財布から取り出した５０００円札をカウンターに叩き付ける。

{	MusicStart("SE04", 1000, 0, 0, 1000, null, false);}
お釣りも受け取らず、僕はそのまま外へ通じるエレベーターに乗り込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

	ClearAll(250);
	Wait(250);

//～～Ｆ・Ｏ


}