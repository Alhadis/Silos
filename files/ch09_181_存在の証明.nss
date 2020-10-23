//<continuation number="220">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_181_存在の証明";
		$GameContiune = 1;
		Reset();
	}

		ch09_181_存在の証明();
}


function ch09_181_存在の証明()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg015_01_3_松濤公園_a.jpg");
	Fade("back05", 1000, 1000, null, true);
	Delete("back03");

//※拓巳視点に戻る

//ＢＧ//松濤の街並み//夜

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕の足は、自然とベースに向かっていた。

かかとに鉛でも詰められたんじゃないかって思えるくらい、足は重い。

足だけじゃない。全身が重い。

でもこの重さこそ、僕の身体が確かにここに存在していて、自分が妄想の存在じゃないことの証明だって、言い聞かせた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg039_03_3_松濤_a.jpg");
	Fade("back04", 1000, 1000, null, true);
	Delete("back05");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
日が暮れた街には、フラフラとした足取りで歩く僕なんかに注意を向けてくる人は誰もいなかった。

ついさっきまでは、自分が注目されること、笑い者になることを恐れて、僕を見るなって悪態をついていたのに。

今は、誰でもいいから僕を見てほしい。
僕をその視界に入れてほしい。

僕がここにいることを誰かに認識してほしい。
そんな都合のいいことを求めている。

でも誰も見てくれない。
奇声でも上げれば、蔑んだ視線を向けてもらえるんだろうけど、それを実行するだけの気力はなかった。

汗だくの手には、ケータイを握りしめていた。
七海と一緒に買いにいったケータイ。

そこに登録されている電話番号は、わずか４つ。

梨深のケータイ。<k>
七海のケータイ。<k>
三住くんのケータイ。

そして実家の電話。

このたった４つの番号から、自分がニセモノじゃないと証明する方法を必死で考えてみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");
	Fade("back10", 0, 0, null, false);
	Fade("back10", 0, 1000, null, true);
//ＶＦ//回想セリフ
//【梨深】
//<voice name="梨深" class="梨深" src="voice/ch09/18100010ri">
//「あなたは……妄想の存在なんだよ」
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 1000, center, middle, Auto, Auto, "「あなたは……妄想の存在なんだよ」");
	Move("テキスト１", 0, @10, @0, null, true);

//	CreateVOICE("梨深","ch09/18100010ri");
//	SoundPlay("梨深",0,1000,false);

	CreateVOICE("梨深","ch09/18100010ri");
	SoundPlay("梨深",0,1000,false);

	SetBacklog("「あなたは……妄想の存在なんだよ」", "voice/ch09/18100010ri", 梨深);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);
	Wait(2000);

	Request("テキスト１", Enter);
	$待ち時間 = RemainTime ("梨深");
	$待ち時間 += 2000;
	WaitKey($待ち時間);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("back10", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
違う……。

僕は、妄想の存在なんかじゃない。

僕は本物だ。

僕は西條拓巳だ。

僕は１７歳だ。

僕は翠明学園２年生だ。

僕は４人家族だ。

僕は――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100020ta">
「助けて……僕を証明して……」

震えで、歯が噛み合わない。

ガチガチと鳴る。
寒いわけじゃない。
なのに震えてしまっている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100030ta">
「助けてよ……」

僕が４つの登録番号の中から選んだのは、三住くんの番号だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_日常_けい帯操作");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

	WaitAction("SE03", null);

//ＳＥ//電話呼び出し音
	CreateSE("SE02","SE_日常_でんわ_呼びだし音_LOOP");
	MusicStart("SE02", 0, 800, 0, 1000, null, false);

	Wait(3000);

	SetVolume360("SE02", 0, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＶＦ//三住のセリフは以下すべて電話の声
//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100040mi">
「はい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100050ta">
「あ、み、みす……」

//※※３６０以下
//ＶＦ//電話の声
//【三住】
<voice name="三住" class="三住" src="voice/chn00/01100010mi">
「タクだろ？　どうしたんだ？」

//※※３６０以上
//【三住】
//<voice name="三住" class="三住" src="voice/ch09/18100060mi">
//「拓巳だろ？　どうしたんだ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100070mi">
「梨深とうまいこといったか？　ちゃんと童貞卒業できたんだろうな。ははは」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100080mi">
「感謝しろよ。気を遣って２人にしてやったんだからよ」

三住くんはいつも通りだ。そのことにホッとする。

彼が僕のことをちゃんと知っている。
西條拓巳として認識している。

だから、僕は妄想の存在なんかじゃないんだ。
やっぱり梨深が嘘をついていただけだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100090mi">
「そう言えば、ついさっき、ミナコから言われたんだけどよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100100ta">
「え、ミナコ……？」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100110mi">
「ああ、俺の女」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100120mi">
「で、ミナコが言うんだよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100130mi">
「ここ１ヶ月ぐらい西條と急に仲よくなったけどなんで？　って」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_心臓_鼓動");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//ＳＥ//心臓の鼓動
//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100140mi">
「こいつなに言ってんだ、って最初は思ったんだけど」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100150mi">
「そもそも俺、普通だったらお前みたいなヤツとは絶対関わろうとしねえんだよな」

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100160mi">
「梨深を通して知り合ったってのは、なんとなく記憶にあるんだけどよ、細かいことはなぜか思い出せねえんだよな」

同じ、だ……。
僕がついさっき体験した状態と同じ。

イヤだ。そんなのイヤだ。
それ以上なにも言わないでくれ……。

いつもと同じように、女のことを話しておいてくれればそれでいいのに、どうして今日に限って――

//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100170mi">
「お前さあ――」

//◆ダチ＝友達
//【三住】
<voice name="三住" class="三住" src="voice/ch09/18100180mi">
「いつ、俺とダチになったんだっけ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ切る
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100190ta">
「……っ」

怖くなって。
とっさに、通話を切っていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100200ta">
「う、うう……」

泣きそうになった。
でも涙は出なかった。
ただ、心がズタズタに引き裂かれたような気分だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

	WaitAction("SE01", null);

	CreateSE("SE01","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE01", 500, 300, 0, 1000, null, true);

//ＢＧ//山手通り//夜
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg196_01_3_山手通り_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
次は実家の番号にかけてみることにする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_日常_けい帯操作");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

	WaitAction("SE03", null);

	CreateSE("SE02","SE_日常_でんわ_呼びだし音_LOOP");
	MusicStart("SE02", 0, 800, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
震える指先でなんとかその番号を指定し、コールボタンを押す。

実家の番号は、七海が登録したものだ。
僕が思い込みで登録した番号じゃない。
だから、間違いなく繋がるはずだ。

この時間なら、父親は帰ってきているだろうか。
それとも母親が出るだろうか。
七海はそこにいるんだろうか。

//ＳＥ//電話呼び出し音
もし繋がったら、なんて言えばいいんだろう……。

僕はあなたたちの息子だよね、って聞くの？

バカみたいに思われるかもしれない。
実際、バカみたいな問いかけだ。

もし“違う”って言われたら？

“私たちの息子の拓巳は今、妹とリビングで夕食を食べている”って言われたら？

自分が本物だと証明するためにかけた電話で、ニセモノだという証明がされてしまったら？

“お前は誰だ？”って言われたら？

ネガティブな考えが次々と浮かんで、恐ろしくなる。

結果を知りたくない。
怖くて仕方がない。

頭がどうにかなりそうだ。
息が苦しくなる。うまく呼吸できない。

そんなときに――

{	SetVolume("SE02", 0, 0, NULL);}
//ＳＥ//電話が繋がる
電話が繋がった。
僕はケータイを耳に当てたまま、身構える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateVOICE("携帯アナウンス","ch09/18100210ia");
	SoundPlay("携帯アナウンス",0,1000,false);

	SetBacklog("「あなたがおかけになった電話番号は、現在使われておりません。番号をご確認の上、もう一度お掛け直しくだ――」", "voice/ch09/18100210ia", ケータイアナウンス);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆「お掛け直しください」というアナウンスの途中で切った
//【ケータイアナウンス】
//<voice name="ケータイアナウンス" class="ケータイアナウンス" src="voice/ch09/18100210ia">
「あなたがおかけになった電話番号は、現在使われておりません。番号をご確認の上、もう一度お掛け直しくだ――」
{	$待ち時間 = RemainTime ("携帯アナウンス");
	$待ち時間 -= 300;
	WaitKey($待ち時間);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin10();//――――――――――――――――――――――――――――――


	CreateSE("SE02","SE_日常_でんわ_つーつーつー_LOOP");

	SoundStop2("携帯アナウンス");
	MusicStart("SE02", 0, 800, 0, 1000, null, true);

	WaitAction("SE02", 3000);

	SetVolume("SE02", 0, 0, NULL);

//「お掛け直しください」というアナウンスの途中で切った
//ＳＥ//ケータイを切る
	CreateSE("SE03","SE_日常_けい帯ボタン押す");
	MusicStart("SE03", 0, 800, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18100220ta">
「ふひ……ひひ……」

誰も、僕を僕だと証明してくれない。
証明してくれる人がいない。
死にたい……。

{	SetVolume("SE01", 500, 800, NULL);}
//ＳＥ//車が行き交う音
目を上げれば、目の前には、多くの車が行き交う山手通りがあった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, NULL);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
僕は、死んだ方がいいかもしれない。
ニセモノには、生きてる価値なんてない。

化け物は、この世の中にいても迫害されるだけ。

夢も希望もない。

自分の存在が見苦しい。

楽に、なりたい。

死ねば楽になれる。

だって、なにも考える必要がなくなるから。
なにかに苦しめられることもなくなるから。

誰かが僕を笑うこともなくなるから。
誰かに裏切られることもなくなるから。

無が、ほしい。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４１");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

}


//■TypeBegin10
