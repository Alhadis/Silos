//<continuation number="600">




chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_071_スクランブル交差点";
		$GameContiune = 1;
		Reset();
	}

		ch03_071_スクランブル交差点();
}


function ch03_071_スクランブル交差点()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//神泉駅踏切//夜
	CreateSE("SE02","SE_日常_びょういん_自動どあ開く");
	SoundPlay("SE02", 0, 1000, false);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/cblind.png", true);
	Wait(500);

	SoundPlay("SE02", 1000, 0, false);
	Wait(1000);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg046_01_3_神泉駅踏切_a.jpg");
	DrawTransition("背景２", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);
	Delete("色１");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
駅のすぐ横にある踏切に行ってみる。
そこからは神泉駅のホームがよく見えた。

さすがにそこが無人っていうことはないだろう、
と期待したんだけど……

やっぱり、誰も、いない。

電車が来るのを待ってみる。
そうすれば降りる客がいるはずだ。

例え誰も降りなくても、僕の目の前を通り過ぎる電車の中には乗客がいるはずだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 500, 1000, null, true);
	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100010ta">
「…………」

１０分待っても、電車は来なかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("色１", 2000, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
きっと人身事故かなにかがあってダイヤが乱れてるんだと思おうとしたけど、ホームにはさっきから誰ひとりとして客が現れる気配がない。

ここに来てようやく僕は、事態の深刻さに気付いた。
おかしい。こんなの変だ。

そうだ、渋谷駅に行ってみよう。
あそこなら絶対に人がいる。間違いない。
渋谷駅前は２４時間いつだろうと必ず人がいるんだ。

たまらず僕は走り出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE01", 0, 1000, true);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);
	Wait(1000);

//ＢＧ//神泉の町並み//夜
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg014_02_3_神泉町並み_a.jpg");
	Fade("色１", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100020ta">
「ハァ、ハァ、ハァ、ハァ……！」

とにかく必死で走った。
息が切れても立ち止まりたくなかった。

こんなに精一杯走ったのは生まれて初めてかもしれない。

走りながら、品のない夢であってほしいと願った。
だけどこれは夢じゃない。

心臓と肺が破裂しそうなくらいに痛い。
痛みが夢の次元を超えている。

自分がものすごい勢いで呼吸しているのに驚かされる。

それなのにどれだけ息を吸っても苦しいままだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100030ta">
「ハァ、ハァ、ハァ、ハァ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	Wait(1000);
//ＢＧ//道玄坂//夜
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg027_02_3_道玄坂_a.jpg");

	Fade("色１", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
道玄坂を駆け下りていくと、やがて１０７が見えてくる。

その頃にはもう足がフラフラだった。
身体がすごく重い。

それでも足を前に進ませ続けた。
もう周囲を見回す余裕もない。

むしろ意識はすべて、渋谷の象徴であるスクランブル交差点へと向いていた。

あと少し。あと少しだ。
１０７の横を過ぎればすぐなんだ……

日本一……日本一多くの人が、シグナルと同時に一斉に混ざり合う場所、だから……だからスクランブルなんだよ、スクランブル……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100040ta">
「ハァ、ハァ、ハァ、ハァッ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1500, 1000, null, true);

	SoundPlay("SE01", 2000, 0, true);

	Wait(1500);

//ＢＧ//スクランブル交差点//夜
//※拓巳の後頭部を中心として魚眼で無人の交差点を左右にスクロールして見せる、とか
//おがみ：演出後で相談



	if(Platform()==100){
	CreateTextureEX("背景２", 100, -120, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
	CreateTextureEX("背景３", 100, 80, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");

	}else{
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");

	}


	Request("背景２", Smoothing);
	Request("背景３", Smoothing);
	Zoom("背景２", 0, 2000, 2000, null, true);
	Zoom("背景３", 0, 2000, 2000, null, true);

	Fade("背景２", 1000, 1000, null, false);
	Move("背景２", 2000, @320, @0, Dxl2, true);
	Fade("背景３", 1000, 1000, null, false);
	Move("背景３", 2000, @-320, @0, Dxl2, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
//	CreateTextureEX("ブレ１", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
//	CreateTextureEX("ブレ２", 100, 0, 0, "cg/bg/bg085_02_3_スクランブル交差点_a.jpg");
	Request("背景１", Smoothing);
	Zoom("背景１", 0, 2000, 2000, null, true);
	SetBlur("背景１", true, 2, 300, 100);

	Zoom("背景１", 3000, 1000, 1000, Dxl2, false);
	Fade("背景１", 1000, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
――無人。

１０７前のＹ字路から見通せる、渋谷駅前は。

音がない世界。
死んでしまったような世界。

音が洪水のように溢れていたこの空間は今、静寂に支配されている。

聞こえるのは、自分の荒い息だけ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100050ta">
「そん……な……」

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	SoundPlay("SE01", 0, 1000, false);}
広い道の真ん中に、ガックリと膝をつく。
これ以上は歩けなかった。
でもそれ以上に、ショックで全身の力が抜けてしまった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100060ta">
「ここ、渋谷だろ……？」

右も左も前も後ろも、どこにも、人がいない……。
土曜の夜７時と言えば渋谷が一番混雑する時間なのに。

ど、どうなってんだよ……？
嘘だ。こんなの嘘だっ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 200, 0, 1000, 100, null, "cg/data/center.png", true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
僕は目を閉じて、頭を抱えた。
これは夢だ。幻だ。
これが現実のはずがない。

僕は確かにひとりで静かに平穏に暮らしたいって思ってる。
誰にも干渉してほしくないし、なににも巻き込まれたくない。

でも、だからって誰もいない世界なんて望んでない！

誰もいなかったら、誰が僕に生活費を払ってくれるんだ！

誰もいなかったら、誰が僕の食べるコンビニ弁当を作ってくれるんだ！

誰もいなかったら、誰が僕と一緒にエンスーをやってくれるんだ！

誰もいなかったら――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音「キィ……」
//おがみ：SEダミー組み込み状態
	CreateSE("SE01","SE_日常_車椅す");
	SoundPlay("SE01", 0, 300, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100070ta">
「――！」

音――

音がした。
僕じゃない。誰かの立てた音。

誰かいる！
僕以外に、誰かがこの近くにいる！

救われた気分になった。

やっぱり誰もいないように見えたのはたまたまだったんだ。
実は誰も消えていないんだ。
僕はひとりで世界に取り残されたわけじゃないんだ。

ホッとしたら涙が出そうになった。
音のする方に視線を向ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//無人のスクランブル交差点に車椅子に乗った将軍
//視界が歪んでいたりぼやけていたり、視点が定まっていなかったりという感じにして、将軍の姿をはっきり見せないようにしたい
//視界が不鮮明なのは、拓巳の涙のせいなのか、これが妄想だからなのかについては言及しません
//おがみ：演出相談

	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev052_01_3_将軍車椅子_a.jpg");
	DrawTransition("背景１", 2000, 0, 1000, 200, null, "cg/data/lcenter.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100080ta">
「キミ……は……」

そこにいたのは、車椅子に乗った少年……だった。

僕からは少し距離があるところ――それでも交差点の
真ん中には変わりない――に静かにたたずんでいる。

年齢はどれくらいなのか、いまいちつかみづらい。身体の大きさだけから推測すれば小学生ぐらいにしか見えない。

帽子を目深にかぶっているから、その表情もよく見えなかった。

ただ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆※可能なら将軍の声は耳元でささやいている感じに
//◆将軍のテンションは深刻な感じ
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100090jn">
「やっと、会えたね」

少年の声は、やけにはっきりと聞こえてきた。
まるですぐ耳元でささやかれているような気がして、つい振り返ってしまう。でも当然ながらそこには誰もいない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100100ta">
「あ、あの……これ、ど、どうなってる、んですか……？」

年下相手なのに、つい敬語になってしまう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100110ta">
「どうして、だ、誰も……いないのか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100120ta">
「キミ……キミは、理由を……し、知ってますか……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100130jn">
「知ってるよ」

幼さを残す声なのに、その雰囲気からは子供っぽさがあまり感じられない。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100140jn">
「それより」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100150jn">
「僕のメッセージは、受け取ってくれた？」

メッセージ？
なんのことか分からない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100160ta">
「だ、誰だ？　キミは……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE01","SE_日常_車椅す");
	SoundPlay("SE01", 0, 500, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
少年が、車椅子の車輪をわずかに進ませた。
その車椅子は古いものなのか、前に進むだけで錆び付いた音を立てる。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100170jn">
「――その目だれの目？」

//ＳＥ//心臓の鼓動
{	CreateSE("SE02","SE_じん体_心臓_鼓動_LOOP");
	SoundPlay("SE02", 0, 500, true);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100180jn">
「……でしょ？」

戸惑う。

“その目だれの目？”という言葉をどうして今ここでこの少年はつぶやいたのか。
この少年は何者なのか。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100190jn">
「目覚めるんだ……早く」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100200jn">
「でないと――」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100210jn">
「もっとたくさんの人が、死んじゃうことになるから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100220ta">
「キ、キミはいったい……」

僕は目を擦って涙を拭う。
そのおかげで、ようやく、
少年の顔を、はっきりと見ることができた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//スクランブル交差点のど真ん中に車椅子に乗った将軍//拡大
//ここで将軍の“老人顔”をプレイヤーに見せたいです

	Wait(500);

	CreateSE("SE01","SE_衝撃_衝撃音02");
	CreateTexture360("背景２", 100, 0, 0, "cg/ev/ev052_02_3_将軍車椅子_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Fade("背景２", 0, 1000, null, true);

	Wait(300);
	SoundPlay("SE01", 0, 1000, false);

	Wait(1500);

	BGMPlay360("CH01",5000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//◆怯え
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100230ta">
「ひ……！」

少年は、少年じゃなかった。
彼の肌は、老人のように皺だらけだった。

頬はこけ、
目の周囲が病的に落ちくぼみ、

瞳は白濁し、
眉毛はなく、

そして身体は子供のように小さい……。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100240jn">
「僕は――」

{	SetVolume360("CH*", 200, 0, null);
	SoundPlay("SE02", 200, 0, true);
	Wait(500);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100250jn">
「『将軍』だよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	CreateSE("SE01","SE_じん体_心臓_鼓動");
	SoundPlay("SE01", 0, 1000, false);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Fade("回想フラッシュ", 3000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
一瞬、呼吸を忘れた。
頭をハンマーで殴られたような衝撃に見舞われる。
グラリと地面が揺れた。

いや、僕の身体が傾いていた。
アスファルトに手を突いて支える。

今……
なんて言った……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 3000, 1000, null, false);

//ＳＥ//車椅子の軋む音「キィ……」以下しばらく続く（将軍が遠ざかっていく）
//おがみ：SEダミー組み込み状態
	CreateSE("SE01","SE_日常_車椅す");
	SoundPlay("SE01", 0, 600, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
『将軍』……

あいつが……

『将軍』だって……？

{	SetVolume("SE01", 2000, 450, NULL);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100260jn">
「忘れないで」

{	SetVolume("SE01", 2000, 400, NULL);}
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch03/07100270jn">
「君は、逃げちゃいけない」

{	SetVolume("SE01", 2000, 300, NULL);}
顔を上げ、すでに僕に背を向けていた『将軍』を見送る。
車椅子が、軋んだ音を立てながらゆっくりと遠ざかっていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音が徐々にフェードアウト
	SetVolume("SE01", 6000, 0, NULL);

	Wait(3000);
	Delete("背景２");

//ＳＥ//街中のいろいろなノイズがフェードインしてくる
//おがみ：SEダミー組み込み状態
	CreateSE("SE03","SE_日常_のいず");
	CreateSE("SE04","SE_日常_校門前_朝");
	CreateSE("SE05","SE_日常_雑踏01");
	SoundPlay("SE03", 1000, 1000, true);
	SoundPlay("SE04", 1000, 1000, true);
	SoundPlay("SE05", 1000, 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
追いかけて色々問い詰めてやろうっていう考えは思い浮かばなかった。

よくも僕を巻き込んだなって、殴りつけてやろうとも思わなかった。
そういうのは苦手だ……。

頭が、痛くなってきた。
こめかみのあたりが、ズキズキとうずく。
その場にうずくまったまま、痛みに耐える。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100280ri">
「タク――」

{	SetVolume("SE03", 2000, 1000, NULL);}
無音だった世界に、
ノイズが、広がり始めた。

その声は、誰？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※ガヤ挿入
//※テキスト表示しなくてもいいです
//◆※お経のようなつぶやき
//【ガヤ】
//<voice name="ガヤ" class="ガヤ" src="voice/ch03/07100290aa">
//「その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？その目だれの目？」

	CreateSE("その目","SE_はいけい_その目だれの目");
	SoundPlay("その目", 2000, 1000, true);

	Wait(5000);

//おがみ：テキストPREの外に出しました
//――僕を、見るな。

	CreateSE("SE06","SE_日常_雑踏01");
	SoundPlay("SE06", 2000, 1000, true);

	Wait(2000);

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	SetFont("ＭＳ ゴシック", 26, #FFFFFF, #000000, 500, LIGHTDOWN);
	CreateText("テキスト１", 600, center, middle, Auto, Auto, "――僕を、見るな。");

	SetBacklog("――僕を、見るな。", "NULL", NULL);
	Request("テキスト１", NoLog);
	Request("テキスト１", Erase);
	Request("テキスト１", Enter);
	WaitAction("テキスト１", null);

	Wait(500);

	FadeDelete("テキスト１", 1000, false);
	Wait(300);

	SoundPlay("その目", 2000, 0, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100300ri">
「タクっ」

{	SoundPlay("SE03", 3000, 0, false);
	SoundPlay("SE04", 3000, 0, false);
	SoundPlay("SE06", 3000, 0, false);
	SetVolume("SE05", 3000, 1000, NULL);}
ノイズだったものが、徐々にリアルな声へと変化していく。
誰かが、僕の肩にそっと手をかけてきた。

//【通行人Ａ】
<voice name="通行人Ａ" class="通行人Ａ" src="voice/ch03/07100310za">
「っち、邪魔なんだっつーの」

//【通行人Ｂ】
<voice name="通行人Ｂ" class="通行人Ｂ" src="voice/ch03/07100320zb">
「なにしてんだろーねぇ」

//【通行人Ｃ】
<voice name="通行人Ｃ" class="通行人Ｃ" src="voice/ch03/07100330zc">
「最近の若いもんは……」

//【通行人Ｄ】
<voice name="通行人Ｄ" class="通行人Ｄ" src="voice/ch03/07100340zd">
「なんかのパフォーマンスじゃないの？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100350ri">
「タク……」

頭痛に耐えながら、視線を上げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg085_03_3_スクランブル交差点_a.jpg");
	Stand("bu梨深_制服_正面","sad", 200, @-10);
	FadeStand("bu梨深_制服_正面_sad", 0, true);
	DrawTransition("色１", 2000, 1000, 0, 100, null, "cg/data/center.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
悪魔女――梨深が、覆い被さるようにしながら僕の顔をのぞき込んできていた。

生命力に満ちた、透き通った瞳。
僕を、僕だけを一心に見つめてくる、瞳。

まただ。
また、この女はこうして突然現れる――

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100360ri">
「歩ける？　歩いて……」

僕のわきの下に手を差し入れて、立ち上がらせようとしてきた。
僕は悲鳴を上げながらそれを振り払う。

我に返って周囲を見回した。

相変わらずここは道のど真ん中。
でも、もう無人じゃなかった。

３６０度すべての方向に人がいて、誰もが僕に関心を示すこともなく好き勝手な方向へと歩いていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601014]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100370ri">
「タク……」

梨深が泣きそうな顔をして、僕に手を差しのべてくる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100380ri">
「今はあたしの言うことを聞いて」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100390ta">
「よ、よ、寄るなぁっ！」

叫ぶと、頭の中のうずきが刺すような痛みに変わる。
それでもなりふり構わず、僕は這うようにして梨深との距離を取る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100400ta">
「お、お、お、おま、お前だろっ……！　おま、えが、見せたんだ！　お前の、も、妄想……だっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100410ta">
「ぼ、僕の心を、し、支配して、精神攻撃……を……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100420ta">
「この、こ、この、悪魔めっ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100430ta">
「お前なんて、け、剣で、ころ、殺してやる……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100440ta">
「ベ、ベースに、帰れば僕、僕には、ディソー……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Delete("@text3601014");

	CreateColor("色１", 1000, 0, 0, 1280, 720, "White");
	Stand("bu梨深_制服_正面","hard", 200, @-10);
	FadeStand("bu梨深_制服_正面_hard", 0, true);
	DeleteStand("bu梨深_制服_正面_sad", 0, true);

//ＳＥ//ビンタされる
	CreateSE("SE06","SE_にん間_動作_手_はたく");
	SoundPlay("SE06", 0, 1000, false);

	Shake("背景１", 300, 0, 3, 0, 0, 500, null, false);
	Shake("bu梨深_制服_正面_hard", 300, 0, 3, 0, 0, 500, null, false);

	Fade("色１", 1000, 0, null, true);
	Delete("色１");
	Wait(500);

	CreateSE("SE10","SE_じん体_動作_手_梨深を振り払う");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
いきなり頬に衝撃が走った。
ヒリヒリとして、熱を帯び始める。
僕は梨深にビンタされていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100450ta">
「ひ、ひぃぃ……」

今度こそ殺される……！

地面に這いつくばったまま僕は逃げ惑った。
{	SoundPlay("SE10", 0, 1000, false);}
でもあっさりと梨深に手をつかまれた。
女とは思えない力強さで、ぐいっと引き寄せられ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_hard", 300, true);
	SoundPlay("SE*", 500, 0, false);

//ＣＧ//梨深が拓巳を抱きしめる
	Wait(300);

	CreateSE("SE06","SE_じん体_動作_抱く1");
	SoundPlay("SE06", 0, 1000, false);

	CreateTextureEX("だきしめ", 300, 0, 0, "cg/ev/ev032_01_3_梨深だきしめ_a.jpg");
	Fade("だきしめ", 2000, 1000, null, true);

	BGMPlay360("CH22",0,1000,true);

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
抱きしめられていた――

柔らかい梨深の身体が、僕を優しく包み込む。

とてもあたたかで。
少しだけ汗の匂いがして。
彼女のサラサラとした髪が、僕の鼻先をくすぐる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100460ri">
「しっかりして」

拍子抜けして、全身から力が抜けそうになる。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100470ri">
「ここにいたら、危ないよ……」

その声が、少し濡れていた。
泣いているのかどうかは分からない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100480ri">
「信号、赤になっちゃってるから……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("色１", 300, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 3000, 1000, null, true);
	Delete("だきしめ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
戸惑う――

僕を殺すつもりじゃなかったの？

どうして、助けてくれるんだろう。
渋谷から人が消えるっていうさっきの幻覚は、この女が見せたものじゃなかったんだろうか。

こんなにも優しい温もりを感じ取ってしまったら、
なんの邪気もなく抱きしめられたら、

これまでの考えが揺らいじゃうじゃないか。

もしかして咲畑梨深は、

悪魔なんかじゃないのかもしれない、って――

こんな僕は、愚かだろうか。
まんまと、騙されてしまってるんだろうか。

ただ、ひとつだけ確かなのは。
梨深に抱きしめられて、僕はすごく、安心したんだ。
この奇妙な感覚は、いったいなんなんだろう。

梨深は身体を離すと、僕の頬を両手で挟み込んで、またじっと見つめてきた。
彼女の目は少し赤くなっている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100490ri">
「お願い」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100500ri">
「今は、あたしについてきて」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100510ri">
「いい？」

なんとなく、うなずいてしまう。

僕らは今、人がいなくなった交差点の真ん中にふたりきりで立ち尽くしていた。

{	CreateSE("SE01","SE_日常_雑踏01");
	SoundPlay("SE01", 2000, 500, true);}
歩道で信号待ちをしているたくさんの人たちが、僕らに注目している。ところどころから笑い声も聞こえてくる。

{	CreateSE("SE02","SE_日常_クラクション多数_LOOP");
	SoundPlay("SE02", 1000, 500, true);}
多くの車が、ヘッドライトを僕らに向けて、クラクションを鳴らし始めている。

梨深は僕の手をしっかりと握ると、歩道に向かって走り出した。
僕も文字通り彼女に引っ張られて、後に続く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);

//ＢＧ//渋谷駅前//夜
	SoundPlay("SE01", 2000, 1000, true);
	SoundPlay("SE02", 2000, 0, false);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg079_01_3_渋谷駅前_a.jpg");
	Fade("色１", 2000, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
クラクションを散々鳴らされながらも、歩道へと辿り着いた。
梨深がホッと息をついて、立ち止まる。

手は握られたまま。

そうされているだけで、僕の心はますます落ち着いた気分になる。
その気分に身を任せたくなる。
いつまでも、こうしていたくなる。

梨深が僕の方を振り向いて、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","smile", 200, @-10);
	FadeStand("bu梨深_制服_正面_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100520ri">
「無事でよかったね」

すごく嬉しそうに微笑む。
その表情が嘘や演技とは思えない。

でも――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100530ta">
「は、離して……よ……」

今までさんざん敵視していたから――
悪魔だと思っていた女の子だから――

このまま引き込まれたら僕は僕じゃなくなってしまう。そんな気がした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","normal", 200, @-10);
	FadeStand("bu梨深_制服_正面_normal", 300, true);
	DeleteStand("bu梨深_制服_正面_smile", 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100540ri">
「あ、ゴメンゴメン。たはは」

あっさりと手を離してくれた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100550ri">
「それにしてもビックリしたー。タクが道の真ん中でうずくまってるんだもん」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100560ri">
「信号が赤になったときはどうなることかと――」

楽しそうに話し出した梨深に、僕は背を向けた。
人混みをかき分けて歩き出す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100570ta">
「僕……帰る……」

{	Stand("bu梨深_制服_正面","smile", 200, @-10);
	FadeStand("bu梨深_制服_正面_smile", 300, true);
	DeleteStand("bu梨深_制服_正面_normal", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100580ri">
「あ、じゃあ送るよっ。具合悪いんでしょ？」

背中から声が追いかけてきたけど、それに首を振って拒絶する。

{	Stand("bu梨深_制服_正面","sad", 200, @-10);
	FadeStand("bu梨深_制服_正面_sad", 300, true);
	DeleteStand("bu梨深_制服_正面_smile", 0, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch03/07100590ri">
「タク……」

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
梨深の声から、明らかにさっきまでの元気が消えた。
せっかく助けてくれたのに、すごく申し訳ない気分になる。だから……

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/07100600ta">
「あ、あり、が、とう……」

かろうじて、その一言だけを絞り出すことができた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 1000, 0, false);

	Wait(2000);

}