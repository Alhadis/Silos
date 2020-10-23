//<continuation number="40">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_013_１０月１日水";
		$GameContiune = 1;
		Reset();
	}

	ch01_013_１０月１日水();
}


function ch01_013_１０月１日水()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//☆Cut-65-----------------------------
//ＢＧ//神泉町の町並み//朝
//１０月１日（水）//日付は表示しない
	CreateBG(100, 500, 0, 0, "cg/bg/bg014_01_0_神泉町並み_a.jpg");

//ＳＥ//カラス鳴き声
	CreateSE("SE01","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE01", 0, 800, 0, 1000, null, true);

	Delete("背景*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
早朝、ベースから外に出た途端、回復しかけていた僕の精神状態は最悪な状況にまでまた落ち込んでしまった。
どうして、学校へなんか行かなくちゃいけないんだろう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01300010ta">
「なんで今日なんだよ、最低最悪だ……」

でも休むワケにはいかない。１日でも休めば『最低登校シフト表』に関するシステムが異常をきたしてしまう。そうなれば卒業できない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01300020ta">
「卒業卒業って……何を卒業するっていうんだよ」

自分で決めたこととはいえ、愚痴らずにはいられなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	FadeDelete("back*", 1000, true);

//ＳＥ//カラス鳴き声_3secF/50%Down
	SetVolume("SE01", 3000, 500, null);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text502]
松濤の高級住宅街にさしかかったところで、ふと気付いた。
さっきからずっと、視線を感じていることに。

でも、いつもの"神の視線"じゃない。首筋がゾワゾワする感覚がない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "BLACK");

//ＢＧ//松濤の町並み//朝
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg039_02_1_松濤_a.jpg");
	CreateTexture360("back04", 250, 0, 0, "cg/bg/bg039_02_1_松濤_b.png");

	if(#下着パッチ==true)
	{
		CreateTexture360("back05", 200, 0, 0, "ex/bg/bg039_02_1_松濤_優愛.png");
	}
	else
	{
		CreateTexture360("back05", 200, 0, 0, "cg/bg/bg039_02_1_松濤_優愛.png");
	}

//おがみ：バーテックス修正　本番素材後に位置調整　//コメントアウト済み
//	SetVertex("back05", 0, 0);//コメントアウト済み
	Request("back05", Smoothing);
//	Zoom("back05", 0, 800, 800, null, true);

	Zoom("back05", 0, 500, 500, null, true);
	Move("back05", 0, @-520, @-384, null, true);

//	DrawTransition("色１", 300, 1000, 0, 100, null, "cg/data/right2.png", true);
	FadeDelete("色１", 300, false);
//	Wait(100);

	Move("back05", 500, @+128, @0, Axl1, true);

	Delete("back05");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
角を曲がるときに、振り返らずに目だけでそれとなく背後を見ると、翠明の制服を着た女子の姿が一瞬チラリと見えた。

まさか、昨日の悪魔……！？

とたんに、心が冷静さを失って暴れ出す。
極度の緊張に支配されて、歩き方がギクシャクとなってしまう。

穏やかな早朝の景色は一変して、すべてが僕を拒絶しているように感じられてくる。

電線の上で小鳥がさえずり、通り過ぎる家々からは朝のニュース番組の脳天気なＢＧＭがかすかに聞こえてくる。

こんな、殺人事件なんかとはおよそ縁のない風景の中にいながら、僕は自分が無惨に殺されるのを妄想しそうになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
いや、落ち着け……。

はっきり顔を確認したわけじゃない。
それに、翠明の生徒なら僕の後ろをずっとついてくるのも当然だ。なにしろ目的地が同じなんだから。

……よし。

{	CreateColor("色１", 500, 0, 0, 1280, 720, "BLACK");
	DrawTransition("色１", 300, 0, 1000, 100, null, "cg/data/left2.png", false);}
本来はまっすぐ進めば学校にたどり着けるところを、あえて右に曲がってみることにした。

背後が気になるけど、振り返りたくなる衝動を必死に抑え、自然な態度を心がけて僕はそれを実行した。

ドキドキしながら、なおも歩き続ける。
１分ほどそうした後、思い切ってそっと振り返ってみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg039_01_2_松濤_a.jpg");
	CreateTexture360("back04", 250, 0, 0, "cg/bg/bg039_01_2_松濤_b.png");


	if(#下着パッチ==true)
	{
		CreateTexture360("back05", 200, 0, 0, "ex/bg/bg039_01_2_松濤_優愛.png");
	}
	else
	{
		CreateTexture360("back05", 200, 0, 0, "cg/bg/bg039_01_2_松濤_優愛.png");
	}

//おがみ：バーテックス修正　//コメントアウト済み
//	SetVertex("back05", 0, 0);//コメントアウト済み
	Request("back05", Smoothing);
	Move("back05", 0, @-512, @-384, null, true);
	Zoom("back05", 0, 500, 500, null, true);

	FadeDelete("色１", 300, true);
	Move("back05", 600, @-256, @0, Axl1, true);

	Delete("back05");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//ＣＨ//優愛
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01300030ta">
「……！」

目が合いそうになって、慌てて前に向き直る。

どうして、ついてくるんだ！？

こっちの道は、明らかに学校に行くのに遠回りなのに。

やっぱり尾行されてるのかな……。
とにかく見覚えのない顔だった。一昨日の悪魔とは別人なのは、眼鏡をかけていたことからも一目瞭然だ。

それが分かっただけでもかなりホッとした。こうなったらさっさと学校へ行っちゃおう。

公園で朝食を食べるっていう日課はキャンセルせざるを得ないけど、しょうがない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/01300040ta">
「くそう、女子Ａめ……！」

僕にとってはお前なんか、『通行人その１』とか『女子Ａ』みたいな存在でしかないんだ。だから出しゃばるなよ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	SoundStop("SE01");

	CreateColor("back06", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("back06", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back03");
	Delete("back04");

//ＢＧ//廊下
	CreateColor("back04", 100, 0, 0, 1280, 720, "Black");
	Fade("back04", 0, 0, null, false);
	Fade("back04", 500, 1000, null, true);

	Delete("back06");

	CreateSE("SE02","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE02", 500, 700, 0, 1000, null, true);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back04");
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
僕を尾行していたらしい女子Ａは、校舎の昇降口のところでいなくなった。

どうやら目的地が違ったらしくて、
３年生の教室の方へ歩いて行っちゃったんだ。

尾行されてたのは僕の考えすぎだったんだろうか。
でも遠回りしたのについてきたのは絶対おかしい。

僕への嫌がらせか？　なにか恨みを買うようなことをしたっけ？　いや、してない。するわけがない。だって僕は学校じゃ、空気みたいな存在なんだから。

じゃあ、いったいなにが目的なんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

//ＳＥ//教室2secF/out
	SetVolume("SE02",1200,0,null);


	ClearAll(1000);

//～～Ｆ・Ｏ


}
