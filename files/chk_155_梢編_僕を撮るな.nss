//<continuation number="20">

chapter main
{

	$PreGameName = "boot_梢ルート";

	if($GameStart != 1)
	{
		$GameName = "chk_155_梢編_僕を撮るな";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	chk_155_梢編_僕を撮るな();
}


function chk_155_梢編_僕を撮るな()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//ＢＧ//Ｒｏｆｔ前・夕方
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg058_01_2_Ｒｏｆｔ前_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	CreateSE("SE3601","SE_日常_雑踏01");
	MusicStart("SE3601",2000,1000,0,1000,null,true);


	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
こずぴぃに遅れてＲｏｆｔを出ると、もう彼女の姿はどこにも見当たらなかった。別に一緒に帰ろうって言ったわけじゃないけど、僕としては今やこずぴぃだけが頼りなわけで。

見失ったとなると、焦るし、不安になってしまう。
ましてやこの渋谷のど真ん中で１人でいるのは、すごくイヤだ。
道を歩いている人波を見るだけで、じわりと汗がにじんできた。

こずぴぃを探すのはあきらめて、早くベースに帰ろう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ写真のシャッター音
	CreateSE("SE01","SE_はいけい_ケータイ_しゃったー");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(700);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
――音が、聞こえた。

やけに仰々しいシャッター音。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	Wait(500);
	Fade("黒", 500, 0, null, true);
	Delete("黒");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
音のした方へ視線を巡らせてみる。
でもカメラを持っている人なんていない。

そこで気付く。

今の音は、カメラじゃなくて、ケータイのカメラ機能だ。
だからあんなにもはっきりした音が聞こえたんだ。

だけどケータイを僕の方に向けている人の姿も、どこにも確認できない。

……敏感になりすぎてるだけだろうか。

いや、そうは思わない。
例のエスパー騒動で僕は日本中に醜態をさらしたんだ。
面白がって僕を撮ってくるヤツがいてもおかしくない。

道を歩く、たくさんの人たち。
今は誰も、僕を見ていないけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――僕を見るな。
	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――僕を見るな。");

	SetBacklog("――僕を見るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603001]
唇を噛んで、僕は歩き出した。
顔はうなだれて。なるべく誰にも気付かれないように。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ケータイ写真のシャッター音
	CreateSE("SE01","SE_はいけい_ケータイ_しゃったー");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

//	BGMPlay360("CH12", 1000, 1000, true);

	Wait(700);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/00800010ta">
「……っ！」

まただ……！

また誰かが僕を撮った。
今度ははっきりした視線も感じた。

いつもの“神の視線”じゃなくて、すぐ近くからの、悪意に満ちた視線。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Request("back01", Smoothing);
	Zoom("back01", 300, 1200, 1200, Dxl1, true);
	Wait(300);
	Move("back01", 300, @80, @0, Dxl1, true);
	Wait(300);
	Move("back01", 300, @-160, @0, Dxl1, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
周囲を見回した。
でもやっぱり、僕を見ている人はいない。

{
	Move("back01", 300, @80, @0, Dxl1, false);
	Zoom("back01", 300, 1000, 1000, Dxl1, true);
}
誰だよ……。
こそこそ盗撮しやがって。
肖像権の侵害で訴えるぞ。

心の中でどれだけ悪態をついたって、誰にも届かない。
その悪態を口に出す勇気はない。そんなことをすればますます注目を浴びてしまう。

再び歩き出した。今度は少し駆け足気味で、人波の間をすり抜けていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//センター街・夕方
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg084_01_2_渋谷センター街_a.jpg");
	DrawTransition("back02", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back01");

//ＳＥ//ケータイ写真のシャッター音（連続）
	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
音が、増えた。

シャッター音が、僕を追いかけてくる。
クスクスという笑い声も聞こえる気がする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Request("back02", Smoothing);
	Zoom("back02", 300, 1200, 1200, Dxl1, true);
	Wait(150);
	Move("back02", 300, @80, @0, Dxl1, true);
	Wait(150);
	Move("back02", 300, @-160, @0, Dxl1, true);
	Wait(150);
	Move("back02", 300, @80, @0, Dxl1, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
周囲を見る。

ケータイを目の高さに掲げているヤツらが何人かいる。
サラリーマンの中年男だったり、スーツを着た女だったり、男子高校生だったり、ＤＱＮっぽい女だったり、まちまちだけど。

そいつらが、僕の姿を追いかけるようにケータイを向けていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 500, 0, null);


//――僕を見るな。僕を撮るな。

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――僕を見るな。僕を撮るな。");

	SetBacklog("――僕を見るな。僕を撮るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, false);

	Wait(300);

	CreateSE("SE走","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE走", 1000, 1000, 0, 1000, null, true);

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
耐えきれなくなって、走り出す。

//ＳＥ//ケータイ写真のシャッター音（連続）
{	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
どれだけ走っても。
どれだけ逃げ回っても。
どれだけ人の間を縫うように走り抜けても。

//ＳＥ//ケータイ写真のシャッター音（連続）
{	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
//※１０月３日修正、以下
//音は僕を見逃してくれない。
//※１０月３日修正、以上
音は僕を逃してくれない。
視線が、追いかけてくる。

いくつかの音を引き離したと思ったら、別の、でも同じ音が前や横から現れて。

まるで無限に敵が増殖しているかのような錯覚を覚える。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//道玄坂・夕方
	#bg027_02_2_chn道玄坂_a=true;
	SetVolume("SE走", 2000, 0, null);
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg027_01_2_chn道玄坂_a.jpg");
	DrawTransition("back03", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
信号が赤だと立ち止まるしかない。

//ＳＥ//ケータイ写真のシャッター音（連続）
{	CreateSE("SE02","SE_はいけい_ケータイ_しゃったー_LOOP");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);}
//以後、ＳＥはずっと続く
膝に手を突き息を整えている間にも、シャッター音はしつこく聞こえてくる。

視線は伏せ、拳をギュッと握りしめて、辱めに耐えるしかない。

そこで、ふと疑問に思う。

ホントに、この音は、不特定多数の人々によるものなの？
いくらなんでもみんな、撮りすぎじゃないか？

確かに僕は今や有名人だ。
でもそれはネガティブな意味であって、写真に撮られる価値なんてない。

っていうかほとんどの人は僕をキモいと思ってるはずだ。
そんな僕を、今日に限ってみんなあからさまに撮ってくるなんて、おかしい。

『将軍』か……？
あいつが、また攻撃を仕掛けてきてるのか？

うぅ、もう勘弁してよ……。
あいつ、なんなんだよ、僕がお前になにをしたって言うんだ……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――殺してやりたい。

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――殺してやりたい。");

	SetBacklog("――殺してやりたい。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
こんな陰湿な方法で僕を追い詰めて、いつも監視して、そして最後に殺しに来るんだろ。僕をニュージェネの被害者にするつもりだろ。猟奇的に殺すつもりだろ。

――だから、殺される前に殺してやりたい。

僕は頭を抱えた。
頭痛がする。

だけど“神の視線”はやっぱり感じない。
ケータイで周囲からこれだけ撮られているのに、『将軍』のいつもの視線だけがない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//――殺してやりたい。

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 100, center, middle, Auto, Auto, "――殺してやりたい。");

	SetBacklog("――殺してやりたい。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	FadeDelete("色１", 1000, true);

	Wait(500);

//ＳＥ//ケータイのシャッター音はここで終了
	SetVolume("SE02", 200, 0, null);
	SetVolume360("@CH*", 200, 0, null);


	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
……唐突に訪れる静けさ。
あんなにパシャパシャ鳴っていたシャッター音が、示し合わせたように一斉に消えた。

ハッとして顔を上げようとして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("黒幕", 800, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);

//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE03","SE_日常_車椅す");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Wait(1500);

	CreateSE("SE走","SE_じん体_動作_足_走る_LOOP");
	CreateSE("SE04","SE_日常_クラクション多数_START");

	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01",0,1000,0,1000,null,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
今度こそ聞き覚えのある音が、すぐ背後から聞こえた。
静寂の中で、決して大きくはないその軋んだ音が聞こえる。

//※１０月３日修正、以下
//気配で感じる。
//※１０月３日修正、以上
気配を感じる。
車椅子に乗った誰かが、僕の真後ろにいる……！

誰か、だって？
僕は自分のおめでたい思考に笑ってしまった。
誰なのかなんて、はっきりしてる。

あいつだ！　『将軍』だ！

{	MusicStart("SE走", 1000, 1000, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn04/00800020ta">
「うわあああ！」

赤信号を無視して横断歩道に飛び出した。

//ＳＥ//車のクラクション（複数）
{	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	Fade("黒幕", 0, 1000, null, true);
	Wait(500);}
クラクションを鳴らされたけど、轢かれる寸前で車は止まってくれて。
僕は後ろを振り返ることができず、とにかく全力で走った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1000);
}
