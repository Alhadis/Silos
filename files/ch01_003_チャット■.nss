//<continuation number="180">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_003_チャット■";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

	ch01_003_チャット■();
}



function ch01_003_チャット■()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


if($GameDebugSelect == 1)
{
	SetChoice02("１週目","２週目以降");
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
			#ClearG=false;
		}
		case @選択肢２:
		{
			ChoiceB02();
			#ClearG=true;
		}
	}
	$GameDebugSelect = 0;
}


	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

//☆Cut-4------------------------------
//イメージＢＧ//チャット画面
//チャットログは画面中央に、実際にチャットのように表示？
// ENTER_reset　チャット画面Pan & overLap
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text001]
グリム：おーい、ナイトハルト？　どうした？　応答ないけど寝オチ{#TIPS_寝オチ = true;$TIPS_on_寝オチ = true;}したか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//グリム＝旧設定では「Ｕ」です。中の人が優愛という設定はなくなりました。（中の人は第２章に出てくる看護師です）

	FadeDelete("登校シフト", 500, true);

	Wait(500);

//☆Cut-5------------------------------
// ENTER
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
あ、しまった。<k>
"視線"が気になっちゃってたせいで、グリムとチャット中だったのをすっかり忘れてた。

// ENTER_reset
{#TIPS_ハンドル名 = true;$TIPS_on_ハンドル名 = true;}
グリムっていうのはエンスーでいつもパーティを組んでる仲間の<FONT incolor="#88abda" outcolor="BLACK">ハンドル名</FONT>だ。<k>
オフでは会ったことはないけど、オンではしょっちゅう話してる。

// ENTER_reset
{$TIPS_on_ハンドル名 = false;}
しかもグリムは色々と貴重な情報を持ってきてくれる、僕にとっては情報屋のようなヤツなんだ。

// ENTER_reset
イスに座り、キーボードを叩いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-6------------------------------
//ＳＥ//キーボードを叩く//以下略
// ENTER_reset　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text004]
ナイトハルト：悪い悪い。寝オチっていうか、ボーっとしてたｗ{#TIPS_ｗ = true;$TIPS_on_ｗ = true;}ｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

// ＊演出＊拓巳以外のネームにユーザーの主導権無し
// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text005]
グリム：ずいぶんお疲れだな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");


// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text006]
グリム：寝不足？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");


// wait 1sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text007]
グリム：カノジョとヘンタイ的行為をしてるとか？ｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");


// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text008]
グリム：毎日遅くまで
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");


// ENTER　 SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text009]
ナイトハルト：三次元の女に興味ないからｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("500");


//☆Cut-7------------------------------
// ENTER
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
グリムとはこうしてチャットでいろんなことを話す。
顔が見えない相手だからなんでも気軽に話せるのだ。

もちろんリアルだと……こうはいかない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//☆Cut-8------------------------------
// ＊演出＊上記セリフ終わりで表示
//半角文字はまずいですか？
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
グリム：ということは二次元かﾌﾟﾌﾟ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
グリム：エロゲ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");


// ENTER_reset　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
	SoundChat(1,1,key);
<PRE @box01>
[text014]
ナイトハルト：どうしてもエロの方向に持って行きたいらしいなｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("1700");


// wait 0.7sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
//※わざと「おまい」です。「おまい＝お前」
グリム：だって、おまいっていつもエロい妄想してるだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");


// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：前も、熱く語ってたし
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");


// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
グリム：スク水{#TIPS_スク水 = true;$TIPS_on_スク水 = true;}っ娘とのエロ妄想をｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//▼TIPS：解除：寝オチ
	$TIPS_on_寝オチ = false;

// ENTER_　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
ナイトハルト：そうだっけ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,750);
	TypeChat("0");

//▼TIPS：解除：ｗ
	$TIPS_on_ｗ = false;

// ENTER_　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
ナイトハルト：あんまよく覚えてないなー
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,700);
	TypeChat("0");


// ENTER_　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
ナイトハルト：と言うか
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("0");


// ENTER_　SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text021]
ナイトハルト：そういう話なら、ちょっとした持論を披露してしんぜよう
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//ＳＥ//ハードデスク停止
	SoundStop("SE01");

	SetVolume360("CH03", 2000, 0, NULL);
	WaitKey();

//▼TIPS：解除：スク水
	$TIPS_on_スク水 = false;

//=============================================================================//
//☆Cut-8------------------------------
// ENTER_reset　

//■選択肢開始
	StartWhich02();

//※ＹＥＳ／ＮＯ分岐
//ＹＥＳ／ＮＯ選択肢１
//"スク水＋メガネだよね！"
//ＹＥＳ→選択肢２へ
//ＮＯ→選択肢５へ
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
スク水＋メガネだよね！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――



	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}

			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$スク水 = 1;
			}
	
		case @選択肢１:
		{
			YES02();
			$メガネ = 1;
		}
		}
		Wait(16);
	}

if($メガネ == 1)
{

//■チャット文章
<PRE @box01>
[text502]
{#TIPS_デフォ = true;$TIPS_on_デフォ = true;}
ナイトハルト：スク水＋メガネはデフォな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢２
//"胸に名札が付いてなきゃスク水じゃない！"
//ＹＥＳ→選択肢３へ
//ＮＯ→選択肢４へ


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
胸に名札が付いてなきゃスク水じゃない！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――


	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$スジ有無 = 1;
			}
	
		case @選択肢１:
		{
			YES02();
			$白黒 = 1;
		}
		}
		Wait(16);
	}
}


if($白黒 == 1)
{

//■チャット文章
<PRE @box01>
[text504]
ナイトハルト：あとスク水の本体は胸の名札。これ豆知識な
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");


//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢３
//"黒スク水より白スク水だろ！"
//ＹＥＳ→分岐１へ
//ＮＯ→分岐１へ
//おがみ：シナリオ修正　1224
//黒スク水より白スク水だろ！

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
白スク水は有り得ない。スク水と言ったら紺色だろ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
		{
				NO02();
			$白スク = 1;
		}
	
			case @選択肢１:
		{
				YES02();
			$黒スク = 1;
		}
	}
	Wait(16);
	}
}


if($スジ有無 == 1)
{

//■チャット文章
<PRE @box01>
[text508]
ナイトハルト：胸の名札なんて飾りです。偉い人にはそれが分からんのです
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢４
//"やっぱりスジだよ、スジ！"
//ＹＥＳ→分岐１へ
//ＮＯ→分岐１へ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
やっぱりスジだよ、スジ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$ＮＯスジ = 1;
			}
	
		case @選択肢１:
		{
			YES02();
			$スジ = 1;
		}
		}
		Wait(16);
	}

}



//=============================================================================//


if($スク水 == 1)
{

//■チャット文章
<PRE @box01>
[text512]
ナイトハルト：メガネ？　そんなんいらね
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢５
//"スク水より競泳水着だろ！"
//ＹＥＳ→選択肢６へ
//ＮＯ→選択肢７へ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text026]
スク水より競泳水着だろ！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$スクール = 1;
			}
	
		case @選択肢１:
		{
			YES02();
			$競泳水着 = 1;
		}
		}
		Wait(16);
	}

}


if($競泳水着 == 1)
{

//■チャット文章
<PRE @box01>
[text514]
ナイトハルト：っていうか僕はスク水より競泳水着派だけどな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢６
//"スイミングキャップはもちろん装備！"
//ＹＥＳ→分岐２へ
//ＮＯ→分岐２へ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text027]
スイミングキャップはもちろん装備！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$ＮＯキャップ = 1;
			}

		case @選択肢１:
		{
			YES02();
			$キャップ = 1;
		}
		}
		Wait(16);
	}

}


if($スクール == 1)
{

//■チャット文章
<PRE @box01>
[text518]
ナイトハルト：スク水には甘酸っぱい青春の思い出という補正がかか
っているのだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//■設定
	PreWhich02();
//ＹＥＳ／ＮＯ選択肢７
//"靴下装備！　オーバーニーソ！"
//ＹＥＳ→分岐２へ
//ＮＯ→分岐２へ

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text028]
{#TIPS_オーバーニーソ = true;$TIPS_on_オーバーニーソ = true;}
靴下装備！　<FONT incolor="#88abda" outcolor="BLACK">オーバーニーソ</FONT>！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	FadeWhich02();
	SetWhich02();
	while($WhichBreak){
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
			//SelectCursor();
			if($SelectBreak){break;}

			case @選択肢２:
			{
				NO02();
				$ＮＯオーバーニーソ = 1;
			}

		case @選択肢１:
		{
			YES02();
			$オーバーニーソ = 1;
		}
		}
		Wait(16);
	}
}

//▼TIPS：解除：オーバーニーソ
	$TIPS_on_オーバーニーソ = false;

//※以上のＹＥＳ／ＮＯ分岐の選択したテキスト内容が、以下のチャット画面上にも表示されていると嬉しいです。


//“スク水＋メガネだよね！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：スク水＋メガネはデフォな

//“スク水＋メガネだよね！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：メガネ？　そんなんいらね

//“胸に名札が付いてなきゃスク水じゃない！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：あとスク水の本体は胸の名札。これ豆知識な

//“胸に名札が付いてなきゃスク水じゃない！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：胸の名札なんて飾りです。偉い人にはそれが分からんのです

//“黒スク水より白スク水だろ！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：ちなみにスク水の色は白な

//“黒スク水より白スク水だろ！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：ちなみにスク水の色は紺色！　それ以外は認めん

//“やっぱりスジだよ、スジ！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：それとスージーさんも必須！　これ最強

//“やっぱりスジだよ、スジ！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：ま、スジはあってもいいけどそこがメインじゃないから

//“スク水より競泳水着だろ！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：っていうか僕はスク水より競泳水着派だけどな

//“スク水より競泳水着だろ！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：スク水には甘酸っぱい青春の思い出という補正がかかっているのだ

//“スイミングキャップはもちろん装備！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：それとキャップにエロさを感じるのは僕だけでいい

//“スイミングキャップはもちろん装備！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：スイミングキャップは論外な。あんなのあり得ない

//“靴下装備！　オーバーニーソ！”でＹＥＳを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：そしてオーバーニーソ着用なら破壊力は４００％だ！

//“靴下装備！　オーバーニーソ！”でＮＯを選んだ場合、ウェブＣＨＡＴに以下のテキストが表示されます
//ナイトハルト：ま、スク水さえ着てれば他に余計なものはいらないってこった


if($白スク == 1){

<PRE @box01>
[text506]
ナイトハルト：ちなみにスク水の色は白な
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($黒スク == 1){

<PRE @box01>
[text507]
ナイトハルト：ちなみにスク水の色は紺色！　それ以外は認めん
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($スジ == 1){

<PRE @box01>
[text510]
ナイトハルト：それとスージーさんも必須！　これ最強
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($ＮＯスジ == 1){

<PRE @box01>
[text511]
ナイトハルト：ま、スジはあってもいいけどそこがメインじゃないから
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($キャップ == 1){

<PRE @box01>
[text516]
ナイトハルト：それとキャップにエロさを感じるのは僕だけでいい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($ＮＯキャップ == 1){

<PRE @box01>
[text517]
ナイトハルト：スイミングキャップは論外な。あんなのあり得ない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}else if($オーバーニーソ == 1){

<PRE @box01>
[text520]
ナイトハルト：そしてオーバーニーソ着用なら破壊力は４００％だ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

//▼TIPS：定義：オーバーニーソ：チャット表示対応
	$TIPS_on_オーバーニーソ = true;

}else if($ＮＯオーバーニーソ == 1){

<PRE @box01>
[text521]
ナイトハルト：ま、スク水さえ着てれば他に余計なものはいらないってこった
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,WHITE);
	TypeChat("0");

}

//■選択肢終了
	EndWhich02();

//=============================================================================//

//分岐１

//こちらの分岐になった場合、葉月（第２章以降に登場する看護師。グリムの中の人）が登場する際メガネ装備
//Cut-8が終了後　チャット画面もどり wait0.5sec
if($メガネ == 1)
{

//☆☆☆
//フラグ【葉月メガネ】ＯＮ
	$葉月メガネ = true;

//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text029]
グリム：おいおいｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text030]
グリム：メ　ガ　ネ　っ　娘　属　性{#TIPS_属性 = true;$TIPS_on_属性 = true;}　か　！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//あえてスペース開けてます
// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
ナイトハルト：水着にメガネ←これポイント
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
ナイトハルト：水着だったらメガネを取るだろ、普通
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");


// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text033]
ナイトハルト：でもあえて取らない！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text034]
ナイトハルト：そこに妄想をふくらませるワケだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1500");

}

//合流１へ




//=============================================================================//

//☆Cut-10------------------------------
//分岐２
//☆☆☆
//こちらの分岐になった場合、葉月が登場する際メガネを装備していない
//Cut-8が終了後　チャット画面もどり wait0.5sec
if($スク水 == 1)
{

//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text035]
グリム：おいおいｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1700");

// wait 0.7sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text036]
グリム：ナイトハルトはホントに水着好きなんだな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text037]
ナイトハルト：男のロマンだろ。常識的に考えて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text038]
ナイトハルト：ちなみに露出度が高けりゃいいってもんじゃないからな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text039]
ナイトハルト："パンモロ{#TIPS_パンモロ = true;$TIPS_on_パンモロ = true;}"より"はいてない{#TIPS_はいてない = true;$TIPS_on_はいてない = true;}"の方がいいだろ？　それと同じことさ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1700");

// wait 0.7sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text040]
グリム：同じことと言われても、別にどっちでもいいし
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,red);
	SoundChat(0,0,false);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text041]
ナイトハルト：なにー！？　おぬし、"はいてない"の良さが分からんのかー！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text042]
グリム：だって漏れ{#TIPS_漏れ = true;$TIPS_on_漏れ = true;}、全裸派
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,red);
	SoundChat(0,0,false);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text043]
ナイトハルト：貴様は萌えをなにひとつ理解していない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");
	
}

//合流１へ

//=============================================================================//
//ここまで
//=============================================================================//

//☆Cut-11------------------------------
// 合流１
// wait 0.5sec\
//ＳＥ//ハードデスク
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text044]
グリム：リビドー{#TIPS_リビドー = true;$TIPS_on_リビドー = true;}全開だな。それでこそナイトハルトｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text045]
グリム：そこにシビれる、でもあこがれねー！ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//▼TIPS：解除：オーバーニーソ：定義されていた場合のみ
	$TIPS_on_オーバーニーソ = false;

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text046]
ナイトハルト：それでこそ、とか言うな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text047]
ナイトハルト：つい熱くなっちゃったけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

//▼TIPS：解除：デフォ
	$TIPS_on_デフォ = false;

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text048]
ナイトハルト：僕は、クールなキャラを目指してるんだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");

// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text049]
グリム：ＣＯＯＬ！ｗｗｗ
</PRE>	
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text050]
ナイトハルト：笑うな！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1, 200);
	TypeChat("0");

// ENTER_SEキー叩く
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text051]
ナイトハルト：それで、僕が寝オチする前はなにを話してたんだっけ
？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1500);
	TypeChat("0");

//☆Cut-12------------------------------

// ENTER
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
まあ、どうせエンスーに関する情報交換なんだろうけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-13------------------------------

//▼TIPS：解除：属性
	$TIPS_on_属性 = false;
//▼TIPS：解除：はいてない
	$TIPS_on_はいてない = false;
//▼TIPS：解除：パンモロ
	$TIPS_on_パンモロ = false;

// reset wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text053]
グリム：おいおい、忘れんなよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

// wait 0.5sec
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text054]
グリム：今、三次元で起きてる事件のことだお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

//☆Cut-14------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text055]
// ENTER
三次元で起きてる事件？

// ENTER
なんだっけ？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-15------------------------------

//イメージＢＧ//チャット画面フラッシュ
//ＳＥ//チャット参加音
	ChatPerson("003");

	CreateSE("SE02","SE_日常_PC_ちゃっと_参加音");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text056]
// wait 0.5sec
将軍さんが入室しました
現在のメンバー：３人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("2000");

//▼TIPS：解除：漏れ
	$TIPS_on_漏れ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text057]
//※顔文字大丈夫ですか？
// wait 0.5sec
グリム：はじめまして将軍殿！(^_^)v
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//▼TIPS：解除：リビドー
	$TIPS_on_リビドー = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text058]
//よろ＝よろしく
// ENTER_SEキー叩く
ナイトハルト：よろ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("0");

//☆Cut-16------------------------------

	Wait(3000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text059]
// ENTER
挨拶をしてみたけど、ハンドルネーム『<RUBY text="しょうぐん">将軍</RUBY>』からの返事はなかった。

// ENTER_reset
……なんだコイツ、シカト？

// ENTER_reset
人がせっかくフレンドリーに接してやってるって言うのに。<k>
僕を誰だか知ってこの失礼を働いてるのか？　

// ENTER
僕は疾風迅雷のナイトハルトだぞ。

// ENTER_reset
{#TIPS_ＲＯＭ = true;$TIPS_on_ＲＯＭ = true;}
そもそも<FONT incolor="#88abda" outcolor="BLACK">ＲＯＭ</FONT>オンリーは入室禁止だってルールなのに。<k>
まあいいや。気にしないでおこう。

// ENTER_reset
{$TIPS_on_ＲＯＭ = false;}
こういうところも、ネットのいいところ。<k>
無駄な人間関係に気を煩わしたりする必要がない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-17------------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text060]
// ENTER_reset  SEキー叩く
ナイトハルト：で、なんだっけ＞グリム
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1500");

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
	SoundChat(1,1,500);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text063]
// ENTER_SEキー叩く
ナイトハルト：どうせ下らないことだろ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text064]
// wait 0.5sec
グリム：まあなｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text065]
// wait 0.5sec
グリム：でもけっこうショッキングだお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");


//☆Cut-18------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text066]
// ENTER
ショッキング……っていうと、グロい殺人事件とかでも起きたのかな。
最近は物騒だからな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//☆Cut-19------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text067]
// ENTER_reset  SEキー叩く
ナイトハルト：まさかまたグロ画像か？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("2000");

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
	SoundChat(1,1,500);
	TypeChat("1000");

//☆Cut-20------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text070]
// ENTER
いや、ホントは見たくない。

// ENTER_reset
でも最近は合成とか加工モノも多いし、いろんなところに仕掛けられてる罠に引っかかって、イヤでも見てしまうことがよくある。

// ENTER_reset
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300010ta">
「ま、まあ、少しは目が慣れて来ちゃってるのかも……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-21------------------------------

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
	SoundChat(1,1,200);
	TypeChat("1000");

//☆Cut-22------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text074]
// ENTER
ＰＫっていうのは、プレイヤーキラーの略だ。

// ENTER_reset  
ネトゲで、赤の他人であるプレイヤーキャラを攻撃して装備品やマネーポイントを奪うっていう、ＤＱＮ行為をするヤツのこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-23------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text075]
// ENTER_reset  SEキー叩く
ナイトハルト：僕はそんな厨{#TIPS_厨 = true;$TIPS_on_厨 = true;}なことはしない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text076]
// ENTER_ SEキー叩く
ナイトハルト：エンスーで違反行為はしない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text077]
// ENTER_ SEキー叩く
ナイトハルト：っていうポリシーに反するからな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//☆Cut-24------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text078]
// ENTER
……ＲＭＴはしまくりだけど。ふひひ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-25------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text079]
//※わざと「もちつけ」
// reset   wait 0.5sec
グリム：まぁ、もちつけ{#TIPS_もちつけ = true;$TIPS_on_もちつけ = true;}勇者ｗｗ
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
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text082]
// ENTER_ SEキー叩く
ナイトハルト：？？？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("100");

//☆Cut-26------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text083]
// ENTER
ニュージェネ？　なんだそれ？　既出じゃないよね？

// ENTER_ reset
グリムはさも"知ってて当然"って言い方だけど。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-27------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text084]
// ENTER_ reset  SEキー叩く
ナイトハルト：なんだよ、ニュージェネって
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
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
	TypeChat("0");

//☆Cut-28------------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text088]
// ENTER
ああ、そう言えばそんな事件があったような気がする……。

// ENTER
でもなんとなく知ってるだけで、詳しくはチェックしてない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-29　------------------------------
// ENTER_ reset  SEキー叩く
// bg検索欄UP(ニュージェネ)
//ＳＥ//キーボードを叩く音
	CreateSE("SE03","SE_日常_PC_キーたたく_短");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	//320*240
	CreateTextureEX("検索", 1300, 0, 0,"cg/bg/bg011_01_1_検索欄UP_a.jpg");

	Fade("検索", 300, 1000, null, true);

//▼TIPS：解除：厨
	$TIPS_on_厨 = false;
//▼TIPS：解除：もちつけ
	$TIPS_on_もちつけ = false;

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text089]
// ENTER　bgニュースサイト
//できれば『ググる』という言葉を使いたいけど無理ですかねー？？
『ニュージェネ』でググってみると、すぐにヒットした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ニュースサイトの画面
	//320*240

	CreateSE("SE03","SE_日常_PC_マウスくりっく");
	MusicStart("SE03",0,1000,0,1000,null,false);

	CreateTextureEX("結果１", 1300, 0, 0,"cg/bg/bg012_01_1_ニュースサイト_a.jpg");
	Fade("結果１", 0, 1000, null, true);
	FadeDelete("検索", 0, 0, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text090]
// ENTER_reset
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300020ta">
「え～っと……」

// ENTER_reset
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300030ta">
「この１ヶ月の間に渋谷で発生したふたつの事件のことをニュージェネと呼ぶ……

// ENTER_reset
<voice name="拓巳" class="拓巳" src="voice/ch01/00300031ta">
その犠牲者は胎児を含めて７人。

{	CreateSE("SE03","SE_日常_PC_マウスくりっく");
	MusicStart("SE03",0,1000,0,1000,null,false);
	CreateTextureEX("結果２", 2000, 0, 0,"cg/bg/bg012_02_1_ニュースサイト_a.jpg");
	Fade("結果２", 0, 1000, null, true);
	FadeDelete("結果１", 0, 0, false);}
// ENTER_reset
<voice name="拓巳" class="拓巳" src="voice/ch01/00300032ta">
ひとつめの事件は、友人同士５人による高層ビルからの集団ダイブ……

// ENTER_reset
<voice name="拓巳" class="拓巳" src="voice/ch01/00300033ta">
ふたつめの事件では男性の体内から胎児が出てきた……」

// ENTER_reset
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300040ta">
「ちょ、これマジかよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 500, null);

// ENTER_reset　VR拓巳部屋正面Cut / in
	CubeRoom3("ルーム", 1500, 0);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text091]
背筋が、ぞわりとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

// ENTER_reset VR拓巳部屋Pan左回りに後ろ

	Fade("ルーム", 0, 1000, null, true);
	FadeDelete("結果２", 300, 0, true);

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 2000, 0, -180, 0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text092]
ついつい、また振り返って部屋を見回してしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 2000, 0, 0, 0, Dxl2, true);

	SetVolume("SE01", 1500, 1000, null);

	CreateTextureEX("結果", 2000, 0, 0,"cg/bg/bg013_01_1_Taboo_a.jpg");
	Fade("結果", 500, 1000, null, true);

	Fade("ルーム", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text093]
// ENTER_reset　bgTaboo! Cut / in
Taboo!にニュージェネについて報じた過去のニュースのリンクが色々あったので、ざっと流し読みしてみた。

//Taboo!＝Yahoo!
// ENTER_rese
連日ネット上でも騒がれている事件――それがニュージェネレーションの狂気。

// ENTER_reset
事件は過去に２回。

// ENTER_reset
ひとつはあまりに残忍な殺害方法のため、犯行の描写を口頭でさえ自粛している放送局もあるほど。

// ENTER_reset
また、最初のダイブ事件の方も殺人ではないかっていう噂があるらしい。

// ENTER_reset
死んだ５人の親や友人は揃いも揃って"あの子が自殺をするワケがない。動機のかけらも見つからない"って主張しているし、いくつかの状況証拠からも自殺をしようとしていたとは考えられないとのこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("結果", 500, true);

//☆Cut-30------------------------------

//▼TIPS：再定義：チャットウィンドウ復活により
	$TIPS_on_厨 = true;
	$TIPS_on_もちつけ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text094]
//イメージＢＧ//チャット画面
ナイトハルト：ざっと見てきた
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text095]
グリム：どうだ？　ガクブル{#TIPS_ガクブル = true;$TIPS_on_ガクブル = true;}してきた？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//▼TIPS：解除：厨：完全解除
	$TIPS_on_厨 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text096]
ナイトハルト：べっつにー。興味なし
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
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

//▼TIPS：解除：もちつけ：完全解除
	$TIPS_on_もちつけ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text099]
ナイトハルト：なにコレ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text100]
グリム：被害者の死体写真
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//☆Cut-31------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300050ta">
「グリムのヤツ、僕をバカにして楽しんでるな……」

こいつはたまにこういうことをする。

でもナメられたら、バゼラードでのナイトハルトとしての面目を失ってしまう。

リアルではともかく、エンスーでは僕は神なんだ。最強なんだ。なんでも知ってるし誰よりも強い正義の騎士なんだ。バカにされてたまるか。

僕は勇気を振り絞って、ＵＲＬをクリックした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//ＰＣ画面にネタ画像表示
//『スプー』のようなへんてこなイラストに、ヘタクソな絵で包丁が突き刺さり、赤い血しぶきが舞っている。

	CreateSE("サウンド１","SE_日常_PC_マウスくりっく");
	MusicStart("サウンド１",0,1000,0,1000,null,false);

	Wait(1000);

	CreateTexture360("スプー", 1500, Center, Middle,"cg/ev/ev014_01_1_スプー_a.jpg");
	Fade("スプー", 0, 1000, null, true);

//▼TIPS：解除：ガクブル
	$TIPS_on_ガクブル = false;

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text102]
なんだ、このヘタなイラスト。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	FadeDelete("スプー", 0, true);
//☆Cut-32------------------------------

//▼TIPS：再定義：ガクブル
	$TIPS_on_ガクブル = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text103]
ナイトハルト：ちょｗｗｗ釣られたｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text105]
ナイトハルト：この絵師、誰？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text106]
//ノシ＝手を振っているＡＡ
グリム：ノシ{#TIPS_ノシ = true;$TIPS_on_ノシ = true;}
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
	TypeChat("0");



//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text107]
ナイトハルト：天才現るｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("2000");



//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text108]
//※わざと「漏れ」です
グリム：オチがついたところで、漏れ{#TIPS_漏れ = true;}そろそろオチるわ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text109]
//「乙」＝「おつかれさま」
ナイトハルト：乙～
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,200);
	TypeChat("1700");

//▼TIPS：解除：ガクブル：完全解除
	$TIPS_on_ガクブル = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text110]
グリム：また明日バゼラードでな
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1000");

//画面エフェクト//チャット画面フラッシュ
	ChatPerson("002");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text111]
グリムさんが退室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("1000");


//☆Cut-33------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text112]
そう言えば将軍とかってヤツ、まだいたんだ。すっかり忘れてた。どうでもいいけど。

そんなに眠くはないから、エンスーでちょっと狩りでもしようかな。あ、そう言えば今日ってブラチューの放映日だったんだ！

僕の部屋にテレビはない。ＰＣで全部用は足りるんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300060ta">
「あと１５分ぐらいか。その前にトイレでも行っておこうかな」

モニタの横の星来たんを見てニヤニヤする。今日は星来たんに会えるんだ。楽しみだなあ……

そんなことを考えながら、僕は何気なくチャットウインドウを閉じようとした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//☆Cut-34------------------------------
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text113]
<pre>将軍：http://www.gazouup.com/bbs/images/168491.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-35------------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text114]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300070ta">
「あれ……？」

将軍の書き込みだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300080ta">
「な、なんだよコイツ、急に……」

ＲＯＭ厨じゃなかったの？
拡張子からして画像リンクみたいだけど……。

見知らぬ相手、しかもそれまでまったく書き込みのなかった怪しい人物からの突然のリンク。僕は思わずゴクリと息を呑んでいた。

なんでだろう。今までネットをやっていて感じたことのない、とても嫌な予感がする。もちろんクリックなんてしたくない。

舌打ちしつつ時計を見ると、星来たんとの約束の時間まで１２分になっていた。さっさと話を切り上げた方がよさそう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-36------------------------------


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text115]
ナイトハルト：あのさ、コレなんていう孔明の罠{#TIPS_孔明の罠 = true;$TIPS_on_孔明の罠 = true;}？ｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text116]
将軍：The world changes if you click it&.
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text117]
ナイトハルト：ちょｗｗｗなぜ英語？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");

//☆Cut-37------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text118]
精一杯におどけた調子を出すことで、余裕があるように見せかけた。

ホントはこんな見ず知らずのヤツとチャットしたくない。緊張するしイヤな汗も出てきた。

ましてこの将軍ってヤツが日本人じゃなかったら、もう対処のしようがない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-38------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text119]
将軍：おどかしてゴメン
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-39------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text120]
あれ、普通に話しかけてきた……。
内心ちょっとホッとした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-40------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text121]
ナイトハルト：ぜんぜん無問題
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");

//▼TIPS：解除：ノシ
	$TIPS_on_ノシ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text122]
ナイトハルト：なんでＲＯＭってたの？　半年ＲＯＭれって誰かに言われた？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text123]
将軍：考え事したり
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//▼TIPS：解除：ノシ
	$TIPS_on_漏れ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text124]
ナイトハルト：将軍はドコから参加？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("4000");

//☆Cut-41------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text125]
なぜか、妙な間があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-42------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text126]
将軍：渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-43　------------------------------
//☆☆☆☆071011
//ＳＥ//衝撃音_フラッシュバック
	CreateSE("SE04","SE_衝撃_ふらっしゅばっく");
	MusicStart("SE04", 0, 700, 0, 1000, null, false);


//イメージＢＧ//一連の事件の殺人現場や事件に関する記事が瞬間的にフラッシュバック//記事の見出し案は以下の通り。よさげなものをチョイスしてください
//・コーネリアスタワーで集団飛び降り自殺
//・高校生５人、１８０メートル転落死――自殺か
//・コーネリアスタワー飛び降り、５人即死
//・男性遺体の腹部から死亡胎児見つかる
//・胎児が腹部に入れられたのは男性死亡前か
//・殺害男性と胎児、ＤＮＡ鑑定――血縁関係なし
//・死亡胎児は妊娠８ヶ月程度の状態
//・死亡男性は生きたまま開腹か――縫合部に爪で掻きむしった跡
//・渋谷ニュージェネレーションの狂気！

	CreateColor("色１", 2000, 0, 0, 1280, 720, "WHITE");
	CreateTextureEX("結果１", 2000, 0, 0,"cg/bg/bg012_01_1_ニュースサイト_a.jpg");
	Fade("結果１", 200, 1000, null, true);

	FadeDelete("色１", 200, false);

	CreateColor("色２", 2000, 0, 0, 1280, 720, "WHITE");
	CreateTextureEX("結果２", 2000, 0, 0,"cg/bg/bg012_02_1_ニュースサイト_a.jpg");
	Fade("結果２", 200, 1000, null, true);

	FadeDelete("色２", 200, false);

	CreateColor("色３", 2000, 0, 0, 1280, 720, "WHITE");
	CreateTextureEX("結果３", 2000, 0, 0,"cg/bg/bg013_01_1_Taboo_a.jpg");
	Fade("結果３", 200, 1000, null, true);

	FadeDelete("色３", 200, false);
	FadeDelete("結果*", 0, true);

//イメージＢＧ//チャット画面に戻る

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text127]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300090ta">
「…………」

さっき読んだニュージェネのふたつの事件に関する妄想が、一瞬脳裏を駆け巡った。

僕なんかが妄想しただけでもじゅうぶんグロいんだから、きっと現実には正視に堪えられるような状況じゃなかっただろう。

裂かれた男の腹。その中に強引に詰め込まれた胎児の遺体。<k>
高層ビルからダイブした５人は、地面に叩き付けられてきっと原形をとどめていないくらいぐちゃぐちゃになったはず……。

想像するだけで吐きそうになる。<k>
急いで首を振って、そんなグロい妄想をかき消した。

この将軍っていうヤツが怪しすぎるから、余計なことまで妄想しちゃうんだ。<k>とんだとばっちりだよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-44------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text128]
ナイトハルト：（・∀・）人（・∀・）僕も渋谷
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text129]
ナイトハルト：なんか最近変な事件が多発してるらしいね
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text130]
将軍：事件はまだ起こるぞ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text131]
ナイトハルト：渋谷((((;゜Д゜)))ｶﾞｸﾌﾞﾙ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//▼TIPS：解除：孔明の罠
	$TIPS_on_孔明の罠 = false;

//※「ｆｕｎ１０」は正しくは「ｆｕｎの１０乗」です。
//※「ｉｎｔ４０」は正しくは「ｉｎｔの４０乗」です。
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text132]
<pre>将軍：ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//☆Cut-45------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text133]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300100ta">
「なんだコレ？」

もしかして将軍ってデンパ野郎か？

いきなり書き込まれた公式は、頭のいい僕でも見たことのないものだった。

//イメージＢＧ//ネットブラウザ画面
{	Wait(200);
	CreateTextureEX("検索", 1500, 0, 0,"cg/bg/bg011_01_1_検索欄UP_a.jpg");
//	Fade("box01", 0, 0, null, false);
	Fade("検索", 0, 1000, null, true);}
試しにググってみた。
こういうとき、ネットは検索すればいいから楽だよね。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300110ta">
「……あれ、ヒットしないな」

もしかしてこいつ、頭のいいフリをしようとして適当な公式を書いただけとか？
ワケ分からん。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景１", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

	FadeDelete("検索", 300, true);

	Wait(500);

//☆Cut-46------------------------------
//イメージＢＧ//チャット画面

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text134]
将軍：この公式によって世界の可能性は殺されてしまった
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text135]
ナイトハルト：意味が分からないんだけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text136]
ナイトハルト：それよりさっきの画像リンクってなに？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("0");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text137]
ナイトハルト：釣られてみた方がいいネタでつか？ｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text138]
将軍：興味があるかと思って
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text139]
<pre>将軍：http://www.gazouup.com/bbs/images/168492.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("1000");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text140]
<pre>将軍：http://www.gazouup.com/bbs/images/168493.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("800");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text141]
<pre>将軍：http://www.gazouup.com/bbs/images/168494.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("600");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text142]
<pre>将軍：http://www.gazouup.com/bbs/images/168495.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("400");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text143]
<pre>将軍：http://www.gazouup.com/bbs/images/168496.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("300");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text144]
<pre>将軍：http://www.gazouup.com/bbs/images/168497.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text145]
<pre>将軍：http://www.gazouup.com/bbs/images/168498.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text146]
<pre>将軍：http://www.gazouup.com/bbs/images/168499.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text147]
<pre>将軍：http://www.gazouup.com/bbs/images/168500.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text148]
<pre>将軍：http://www.gazouup.com/bbs/images/168501.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text149]
<pre>将軍：http://www.gazouup.com/bbs/images/168502.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text150]
<pre>将軍：http://www.gazouup.com/bbs/images/168503.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");


//=====追加======//


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text151]
<pre>将軍：http://www.gazouup.com/bbs/images/168504.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text152]
<pre>将軍：http://www.gazouup.com/bbs/images/168505.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text153]
<pre>将軍：http://www.gazouup.com/bbs/images/168506.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");


//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text154]
<pre>将軍：http://www.gazouup.com/bbs/images/168507.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text155]
<pre>将軍：http://www.gazouup.com/bbs/images/168508.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text156]
<pre>将軍：http://www.gazouup.com/bbs/images/168509.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text157]
<pre>将軍：http://www.gazouup.com/bbs/images/168510.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text158]
<pre>将軍：http://www.gazouup.com/bbs/images/168511.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text159]
<pre>将軍：http://www.gazouup.com/bbs/images/168512.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text160]
<pre>将軍：http://www.gazouup.com/bbs/images/168513.jpg</pre>
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
	SoundChat(0,0,false);
	TypeChat("100");


//☆Cut-47------------------------------

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text161]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300120ta">
「…………」

すごい速さで、いくつものＵＲＬが貼られていく。

さっきからなんなんだコイツ……。僕を脅かして楽しんでるのか？　実はグリムの知り合いかなにかで、ふたりで僕を担いでるのか？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("box01", 0, 0, null, true);

//ＢＧ//拓巳の部屋（スクロール）
	Fade("ルーム", 200, 1000, null, true);

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Rotate("ルーム", 2000, @0, @180, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text162]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300130ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 2000, @0, @90, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600001]
また"視線"を感じて、部屋の中を見回した。
でも当然のように、そこにはなんの変わりもない薄暗くて散らかっている室内の光景があるだけだ。

得体の知れない恐怖感。常に誰かに見られていると感じるせいで、心が落ち着かない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 2000, @0, @-90, @0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3600002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300140ta">
「僕を、見るな」

言葉にしてみたら、自分の声が震えているのが分かった。

いつもの散らかった部屋が別モノのように感じられる。

//おがみ：テキスト：文章分割希望
恐怖番組やホラー映画を見た後だとか、友人の怖い話を聞いた後は、見慣れたはずの自分の家の何気ない空間でさえも恐ろしく思えて、深夜ひとりでトイレに行けなくなるってよく言うけど――

今僕は、それに似た体験をしている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE05","SE_日常_家具_イス_きしむ_回転");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	Rotate("ルーム", 2000, @0, @+180, @0, Dxl2, true);

	Fade("box01", 0, 1000, null, true);
	Fade("ルーム", 500, 0, null, true);
//イメージＢＧ//チャット画面

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text163]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300150ta">
「く、くそぅ、釣られたりするもんか……っ」

動揺してモニタに向かって身を乗り出しつつ、僕は――

思わず右手の人差し指に力が入り、将軍のリンクのひとつをクリックしてしまっていた。

{	CreateSE("サウンド１","SE_日常_PC_マウスくりっく");
	MusicStart("サウンド１",0,1000,0,1000,null,false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300160ta">
「あっ！　ちょっ……！」
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//イメージＢＧ//グロ画像イメージ
//画面右下に拓巳の肩と横顔が移っているが、暗すぎてまったく見えないようにしてください。（２章への伏線）

//グロ画像のアップは一瞬だけ表示させ、すぐにＰＣ画面に戻る。そのＰＣ画面内の小さなウインドウにグロ画像が表示されている

	CreateBG(2000, 0, 0, 0, "cg/ev/ev006_01_3_グロ画像_a.jpg");
	Wait(300);
	CreateBG(2000, 0, 0, 0, "cg/ev/ev048_01_1_張り付けグロ絵アップ_a.jpg");
	Wait(300);
	Rotate("ルーム", 0, 0, 0, 0, Dxl2, true);
	Fade("ルーム", 0, 1000, null, true);
	Fade("back*", 0, 0, null, true);

	Rotate("ルーム", 500, -30, 60, 0, Dxl2, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text164]
どうしてそうしてしまったのか、正直自分でも理解できない。手が勝手に動いたとかそんなことじゃない。"思わず"としか表現のしようがない。

完全に間違った行動に思えるけど、ごく自然に近いモーションでそれをクリックしてしまっていた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300170ta">
「うっ、なんだよ、コレ……」

モニタ画面いっぱいに表示されたのは、
オブジェを撮影した画像らしかった。

ハリネズミか剣山みたいなものが壁に十字架型に張り付けられている。その剣山の下に、赤黒い色の水だまりができていた。さらになんだかよく分からない、小さなゴミらしき塊もいくつか転がっている。

ホントになんなんだろう、これは。
どこかの気取った自称前衛芸術家の作品かな？

よくいるんだよな、こういうグロそうに見えるものを作って、恥ずかしげもなく"この世の混沌を表現したかった"とか言うヤツ。
僕はそんなバカみたいな芸術を理解するつもりはないぞ……。

っていうか、不思議な画像だった。
直接的なグロじゃない。なんとなくグロっぽい、という程度のものなんだ。

それなのに、どうして――

こんなにも生々しく感じるんだろう。
こんなにも、臨場感を感じるんだろう。

むせ返るほどの血の匂いが鼻をつく錯覚があるんだろう。
吐き気をもよおすぐらい強烈な匂いの幻覚があるんだろう。

こめかみあたりがズキズキと痛み出してきた。
吐き気も止まらない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00300180ta">
「う、うう……」

必死でマウスをつかもうとするけど、手が震えてうまくいかない。焦ったせいでつかみそこね、机の上から滑り落ちてコードだけで引っかかる。そのコードをたぐり寄せてマウスパッドに乗せ直し、画像を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//☆Cut-48------------------------------

//イメージＢＧ//チャットログの『将軍：その目だれの目？』という一文のアップ
//ＳＥ//ハードデスク停止
	SoundStop("SE01");
	Rotate("ルーム", 1000, 0, 0, 0, Dxl1, 1000);
	FadeDelete("ルーム", 500, 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text165]
そして、ホッとした僕の目に飛び込んできたのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CreateSE("心臓","SE_じん体_心臓_鼓動_LOOP");
	CreateSE("衝撃","SE_衝撃_衝撃音01");
	CreateMovie360("ムービー１", 2000, Center, Middle, false, false, "dx/mv目01.avi");
	CreateMovie360("ムービー２", 1900, Center, Middle, true, false, "dx/mv目02.avi");

	Delete("背景１");
	MusicStart("心臓", 0, 1000, 0, 1000, null, true);

	WaitPlay("ムービー１", null);
	Fade("ムービー１", 300, 0, null, true);
	Delete("ムービー１");


	SoundStop2("心臓");

	MusicStart("衝撃", 0, 1000, 0, 1000, null, false);

	Wait(2500);

//おがみ：360上の表示がおかしくなるのでコメントアウト
//――――――――――――――――――――――――――――――――――――――
//<PRE @box01>
//[text166]
//将軍：その目だれの目？
//</PRE>
//	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#AAFF2D);
//	SoundChat(0,0,false);
//	TypeChat("0");

//	WaitKey();
if(!#ClearG){

//しばらくウェイトしてＦ・Ｏ～～
	ClearAll(2000);
	Wait(1000);

}else{

	Wait(2000);
}


}




