//<continuation number="100">

chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_003a_★共通_インターミッション０１Ａ";
		$GameContiune = 1;
		#ClearG=true;
		Reset();
	}

	ch01_003a_★共通_インターミッション０１Ａ();
}

function ch01_003a_★共通_インターミッション０１Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//２周目追加インターミッション０１Ａ
//シナリオ２周目、“ch01_003_チャット”終了後にアイキャッチを入れて、以下を挿入

//■インターミッション０１Ａ
//ＢＧ//＠カフェＲＯＯＭ３７

//■アイキャッチIN
	IntermissionIn();

	Delete("*");

	CreateSE("SE01","SE_日常_ねっとかふぇ_空調_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

	CreateTexture360("背景０", 10000, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");

//■アイキャッチOUT
	IntermissionIn2();

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
日曜日の午前３時過ぎ、＠カフェ。
週末ということもあって、深夜にもかかわらずキーボードを叩く音が店内のあちこちから聞こえてくる。

その＠カフェのＲＯＯＭ３７、微動だにせず静かにＰＣモニタに向かっている少年の姿があった。“彼”が座っているのは、備え付けのリクライニングチェアーではなく……車イス。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：チャット画面　名前と名前色のところ修正
//チャット画面
//▼ウェブＣＨＡＴ開始
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg219_01_6_chnネットカフェチャット_a.jpg");
	ChatMain2(420,-54,"003");

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text061]
// wait 0.5sec
グリム：だから最近の事件の話だよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text062]
// ENTER_SEキー叩く
ナイトハルト：三次元なんてシラネ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text063]
// ENTER_SEキー叩く
ナイトハルト：どうせ下らないことだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text064]
// wait 0.5sec
グリム：まあなｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text065]
// wait 0.5sec
グリム：でもけっこうショッキングだお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text067]
// ENTER_reset  SEキー叩く
ナイトハルト：まさかまたグロ画像か？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text068]
// wait 0.5sec
グリム：ナイトハルトはグロはダメダメちゃんだっけかｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text069]
// ENTER_SEキー叩く
ナイトハルト：ダメってことはないけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text072]
// reset   wait 0.5sec
グリム：バゼラードじゃ最強のパラディンなのにｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text073]
// ENTER_reset  SEキー叩く
ナイトハルト：ＰＫはしてないぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text075]
// ENTER_reset  SEキー叩く
ナイトハルト：僕はそんな厨{#TIPS_厨 = true;$TIPS_on_厨 = true;}なことはしない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text076]
// ENTER_ SEキー叩く
ナイトハルト：エンスーで違反行為はしない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text077]
// ENTER_ SEキー叩く
ナイトハルト：っていうポリシーに反するからな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


	FadeDelete("背景０", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text079]
//※わざと「もちつけ」
// reset   wait 0.5sec
グリム：まぁ、もちつけ勇者ｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text080]
// wait 0.5sec
グリム：ニュージェネ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1700");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text081]
// wait 0.5sec
グリム：知ってるよな？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text082]
// ENTER_ SEキー叩く
ナイトハルト：？？？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text084]
// ENTER_ reset  SEキー叩く
ナイトハルト：なんだよ、ニュージェネって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text085]
// wait 1sec
グリム：ニュージェネレーションの狂気。ネット上では略してニュージェネって呼ばれてる
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text086]
// wait 0.5sec
グリム：渋谷で起こってる連続不可解事件の通称
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text087]
// wait 0.5sec
グリム：全部おまいん家の近所だぞｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("6000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text094]
//イメージＢＧ//チャット画面
ナイトハルト：ざっと見てきた
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text095]
グリム：どうだ？　ガクブルしてきた？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//▼べー：「TIPS_厨」解除。表示がずれるようなら調整。
	$TIPS_on_厨 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text096]
ナイトハルト：べっつにー。興味なし
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("2000");


//あえて「つ」を付けてます
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text097]
<pre>グリム：つhttp://www.gurodaisuki.com/data/img/11841554610003.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text098]
グリム：見てみｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//グリム：まぁ、もちつけ勇者ｗｗ
//グリム：ニュージェネ
//グリム：知ってるよな？
//ナイトハルト：？？？
//ナイトハルト：なんだよ、ニュージェネって
//グリム：ニュージェネレーションの狂気。ネット上では略してニュージェネって呼ばれてる
//グリム：渋谷で起こってる連続不可解事件の通称
//グリム：全部おまいん家の近所だぞｗ
//ナイトハルト：ざっと見てきた
//グリム：どうだ？　ガクブルしてきた？
//ナイトハルト：べっつにー。興味なし
//グリム：つhttp://www.gurodaisuki.com/data/img/11841554610003.jpg
//グリム：見てみｗ
//▼ウェブＣＨＡＴ終了


	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆小声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900010jn">
「……これは」

それまで指先ひとつ動かなかった“彼”の身体が、初めて反応した。

目深にかぶった帽子の下で、眼光がモニタを射抜く。そして誰にも聞こえないほどかすかなつぶやきを漏らす。

//◆小声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900020jn">
「これが、次のニュージェネの“妄想”なんだね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――




//▼ウェブＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text099]
ナイトハルト：なにコレ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text100]
グリム：被害者の死体写真
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("6000");

//ナイトハルト：なにコレ？
//グリム：被害者の死体写真

//少し間を取る

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text103]
ナイトハルト：ちょｗｗｗ釣られたｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text105]
ナイトハルト：この絵師、誰？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text106]
//ノシ＝手を振っているＡＡ
グリム：ノシ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text104]
グリム：さっき２分で描いた
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");



//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text107]
ナイトハルト：天才現るｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("2000");



//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text108]
//※わざと「漏れ」です
グリム：オチがついたところで、漏れそろそろオチるわ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text109]
//「乙」＝「おつかれさま」
ナイトハルト：乙～
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1700");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text110]
グリム：また明日バゼラードでな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//画面エフェクト//チャット画面フラッシュ
	ChatPerson2("002");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text111]
グリムさんが退室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("1000");

//ナイトハルト：ちょｗｗｗ釣られたｗｗｗ
//ナイトハルト：この絵師、誰？ｗｗｗ
//グリム：ノシ
//グリム：さっき２分で描いた
//ナイトハルト：天才現るｗｗｗ
//グリム：オチがついたところで、漏れそろそろオチるわ
//ナイトハルト：乙～
//グリム：また明日バゼラードでな

//画面エフェクト//チャット画面フラッシュ
//グリムさんが退室しました
//現在のメンバー：２人
//▼ウェブＣＨＡＴ終了

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
グリムというハンドルネームの人間がチャットルームから消えたのを確認して、“彼”は行動を開始した。しわだらけの両手をキーボードに添える。

“彼”の目的はナイトハルトと接触すること。
ナイトハルトに警告するために。そしてもうひとつ。

恐怖を与えるため――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text113]
<pre>将軍：http://www.gazouup.com/bbs/images/168491.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,key);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text115]
ナイトハルト：あのさ、コレなんていう孔明の罠{#TIPS_孔明の罠 = true;$TIPS_on_孔明の罠 = true;}？ｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1000");


//▼ウェブＣＨＡＴ開始
//将軍：http://www.gazouup.com/bbs/images/168491.jpg
//ナイトハルト：あのさ、コレなんていう孔明の罠？ｗｗ
//▼ウェブＣＨＡＴ終了


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
“彼”は唇をかすかに歪めた。傍目からは苦痛の表情に見えたが、“彼”は笑っているのだった。

ナイトハルトが自分の書き込みに反応してきたこと。
この何気ない出来事が、“彼”にとっては奇跡のような体験に思えるのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text116]
将軍：The world changes if you click it&.
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text117]
ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text119]
将軍：おどかしてゴメン
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,1000);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text121]
ナイトハルト：ぜんぜん無問題
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text122]
ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text123]
将軍：考え事したり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,700);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text124]
ナイトハルト：将軍はドコから参加？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text126]
将軍：渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,500);
	TypeChat("3000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text128]
ナイトハルト：（・∀・）人（・∀・）僕も渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text129]
ナイトハルト：なんか最近変な事件が多発してるらしいね
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text130]
将軍：事件はまだ起こるぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,700);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text131]
ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1000");

//▼ウェブＣＨＡＴ開始
//将軍：The world changes if you click it.
//ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ
//将軍：おどかしてゴメン
//ナイトハルト：ぜんぜん無問題
//ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？
//将軍：考え事したり
//ナイトハルト：将軍はドコから参加？
//将軍：渋谷
//ナイトハルト：（・∀・）人（・∀・）僕も渋谷
//ナイトハルト：なんか最近変な事件が多発してるらしいね
//将軍：事件はまだ起こるぞ
//ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ
//▼ウェブＣＨＡＴ終了

	Wait(1000);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
“彼”はそこで、ふと手を止めた。

//◆小声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900030jn">
「思い出して……」

//◆小声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900040jn">
「君は、知らないだろうけど……知っているんだ」

意味不明のささやき。モニタの向こうにいるナイトハルトに向けたような。

そして“彼”は、キーボードを軽やかに叩き、ひとつの公式を入力した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	$TIPS_on_孔明の罠 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text132]
<pre>将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,1500);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text134]
将軍：この公式によって世界の可能性は殺されてしまった
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text135]
ナイトハルト：意味が分からないんだけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text136]
ナイトハルト：それよりさっきの画像リンクってなに？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text137]
ナイトハルト：釣られてみた方がいいネタでつか？ｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text138]
将軍：興味があるかと思って
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,key);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text139]
<pre>将軍：http://www.gazouup.com/bbs/images/168492.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,500);
	TypeChat("500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text140]
<pre>将軍：http://www.gazouup.com/bbs/images/168493.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,400);
	TypeChat("400");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text141]
<pre>将軍：http://www.gazouup.com/bbs/images/168494.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,300);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text142]
<pre>将軍：http://www.gazouup.com/bbs/images/168495.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,200);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text143]
<pre>将軍：http://www.gazouup.com/bbs/images/168496.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,200);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text144]
<pre>将軍：http://www.gazouup.com/bbs/images/168497.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,100);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text145]
<pre>将軍：http://www.gazouup.com/bbs/images/168498.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,100);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text146]
<pre>将軍：http://www.gazouup.com/bbs/images/168499.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text147]
<pre>将軍：http://www.gazouup.com/bbs/images/168500.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text148]
<pre>将軍：http://www.gazouup.com/bbs/images/168501.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text149]
<pre>将軍：http://www.gazouup.com/bbs/images/168502.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text150]
<pre>将軍：http://www.gazouup.com/bbs/images/168503.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");


//=====追加======//


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text151]
<pre>将軍：http://www.gazouup.com/bbs/images/168504.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text152]
<pre>将軍：http://www.gazouup.com/bbs/images/168505.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text153]
<pre>将軍：http://www.gazouup.com/bbs/images/168506.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text154]
<pre>将軍：http://www.gazouup.com/bbs/images/168507.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text155]
<pre>将軍：http://www.gazouup.com/bbs/images/168508.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text156]
<pre>将軍：http://www.gazouup.com/bbs/images/168509.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text157]
<pre>将軍：http://www.gazouup.com/bbs/images/168510.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text158]
<pre>将軍：http://www.gazouup.com/bbs/images/168511.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text159]
<pre>将軍：http://www.gazouup.com/bbs/images/168512.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text160]
<pre>将軍：http://www.gazouup.com/bbs/images/168513.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,0);
	TypeChat("0");


//▼ウェブＣＨＡＴ開始
//将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２
//将軍：この公式によって世界の可能性は殺されてしまった
//ナイトハルト：意味が分からないんだけど
//ナイトハルト：それよりさっきの画像リンクってなに？
//ナイトハルト：釣られてみた方がいいネタでつか？ｗｗ
//将軍：興味があるかと思って
//将軍：http://www.gazouup.com/bbs/images/168492.jpg
//将軍：http://www.gazouup.com/bbs/images/168493.jpg
//将軍：http://www.gazouup.com/bbs/images/168494.jpg
//将軍：http://www.gazouup.com/bbs/images/168495.jpg
//将軍：http://www.gazouup.com/bbs/images/168496.jpg
//将軍：http://www.gazouup.com/bbs/images/168497.jpg
//将軍：http://www.gazouup.com/bbs/images/168498.jpg
//将軍：http://www.gazouup.com/bbs/images/168499.jpg
//将軍：http://www.gazouup.com/bbs/images/168500.jpg
//将軍：http://www.gazouup.com/bbs/images/168501.jpg
//将軍：http://www.gazouup.com/bbs/images/168502.jpg
//将軍：http://www.gazouup.com/bbs/images/168503.jpg
//▼ウェブＣＨＡＴ終了


	Wait(500);
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ナイトハルトのリアクションがなくなった。
コピペでたたみかけるように打ち込んだリンク先の画像を見ているのだろうと、“彼”は予測する。

それはナイトハルトにとっては辛いことなのかもしれなかったが、“彼”にはその画像を見てもらわなければならない理由があった。

//◆小声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900050jn">
「怖いかい……？　でもだからこそ、君は目覚めることができるんだ」

独り言を続けながら、“彼”は最後の言葉を打ち込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text3601132]
<pre>将軍：その目だれの目？</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(1,3,1500);
	TypeChat("0");

	Wait(1000);

	CreateSE("SE3602","SE_日常_PC_マウスくりっく");
	MusicStart("SE3602",0,1000,0,1000,null,false);


	CreateTexture360("背景０", 1000, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
	Delete("背景１");
	Delete("box01");
	Delete("ムービー１");

	Wait(1000);

	CreateSE("SE3601","SE_じん体_動作_手_のっく_LOOP");
	CreateSE("SE3603","SE_じん体_動作_のぞく");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
『その目だれの目？』

その言葉に対するナイトハルトのリアクションは確認せずに、チャットルームからログアウトする。

{	MusicStart("SE3601",0,700,0,1000,null,true);
	Wait(1000);
	SetVolume360("SE3601", 100, 0, null);
}
それから小さく息をつくと、個室の壁を、ノックするように軽くたたいた。

{	MusicStart("SE3603",0,500,0,1000,null,false);}
隣の個室で、人が立ち上がる気配がした。
すぐに、“彼”がいるＲＯＯＭ３７の扉が外から開かれる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ＲＯＯＭ３７
//キャラ表示//梨深//私服
	CreateTextureEX("背景１", 1000, 0, 0, "cg/bg/bg035_02_3_ネットカフェ隣室_a.jpg");
	Fade("背景１", 500, 1000, null, true);
	Delete("背景０");
	Wait(500);
	CreateSE("SE3601","SE_日常_車椅す");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
その少女は、ニコリともせず、厳しい表情で“彼”の座る車イスのグリップをつかんだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn00/09900060ri">
「……もう１人のあなたとは、接触できた？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900070jn">
「うん」

なんの前置きもない少女の問いかけに、“彼”は平然と答える。
だが少女は、敏感に“彼”のわずかに緊張した態度を感じ取った。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn00/09900080ri">
「なにかあったの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn00/09900090jn">
「……ニシジョウタクミに接触してきたのは僕だけじゃなかった。おそらく、監視がついている」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn00/09900100ri">
「……そっか」

{	MusicStart("SE3601",0,1000,0,1000,null,true);}
少女は、それ以上はなにも言わなかった。
黙って、“彼”の車イスを押しながら＠カフェのレジへと向かった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
//アイキャッチ
//※拓巳視点に戻る
//この後、“ch01_004_９月２９日月”へ

	SetVolume("SE01", 2000, 0, NULL);
	SetVolume("SE3601", 2000, 0, NULL);
	ClearAll(2000);

	Wait(2000);
}
