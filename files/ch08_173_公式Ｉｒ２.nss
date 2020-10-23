//<continuation number="380">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_173_公式Ｉｒ２";
		$GameContiune = 1;
		Reset();
	}

		ch08_173_公式Ｉｒ２();
}


function ch08_173_公式Ｉｒ２()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	CreateSE("SE04","SE_自然_風音_LOOP");
	SoundPlay("SE04", 2000, 1000, true);
	Wait(1000);

	Stand("stセナ_制服_通常","angry", 200, @-150);
	FadeStand("stセナ_制服_通常_angry", 500, true);

//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//ＫＵＲＥＮＡＩ会館ビル屋上//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300010sn">
「この公式をお前が生み出した瞬間……世界は分岐したんだ……」

{	DeleteStand("stセナ_制服_通常_angry", 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17300020ta">
「分岐って……」

エロゲーじゃあるまいし……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 250, @150);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17300030ri">
「タク……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17300040ri">
「もう行こう？　話、聞く必要なんてないよ」

梨深が、僕の手を引っ張って、部屋に入るよう懇願してくる。

その態度からは必死な感じがにじみ出ていた。
梨深はなにかを恐れている。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17300050ri">
「蒼井さんが言ってることは、全部ウソっぱちだし」

{	DeleteStand("bu梨深_制服_正面_sad", 300, false);
	Stand("stセナ_制服_通常","angry", 200, @-150);
	FadeStand("stセナ_制服_通常_angry", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300060sn">
「ウソはそっちだろう」

{	DeleteStand("stセナ_制服_通常_angry", 300, false);
	Stand("bu梨深_制服_正面","hard", 250, @150);
	FadeStand("bu梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17300070ri">
「蒼井さん、もう帰って！　タクの前から消えてよ！」

僕は、誰の言葉を信じればいいんだ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17300080ta">
「た、たかが、数式に、なんでそんなに、
目くじら……立てるんだよぅ……」

{	DeleteStand("bu梨深_制服_正面_hard", 300, true);
	Stand("stセナ_制服_通常","rage", 200, @-150);
	FadeStand("stセナ_制服_通常_rage", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300090sn">
「……本当になにも分かってないのか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//「イーイコールエムシーの２乗」
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300100sn">
{#TIPS_Ｅ＝ｍｃ＾２ = true;$TIPS_on_Ｅ＝ｍｃ＾２ = true;}「アインシュタインが唱えた<FONT incolor="#88abda" outcolor="BLACK">Ｅ＝ｍｃ＾２</FONT>。これが発表されたことで、核兵器が開発されるという未来が生まれたように」

{	Stand("stセナ_制服_通常","angry", 200, @-150);
	FadeStand("stセナ_制服_通常_angry", 200, false);
	DeleteStand("stセナ_制服_通常_rage", 200, false);}
{$TIPS_on_Ｅ＝ｍｃ＾２ = false;}
//◆※「ｍｃ２」は正確には「ｍｃの２乗」です
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300110sn">
「お前の生み出したＩｒ２もまた、Ｅ＝ｍｃ＾２と同じ……いや、それ以上の影響力を世界に与えている」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300120sn">
「Ｉｒ２は、沈黙の兵器を現実のものとした」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17300130ta">
「ち、沈黙の兵器……？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300140sn">
「思考盗撮、視覚投影、五感制御」

それって、前にセナに教えてもらっていろいろ調べた、あの特許の技術だ……。

{	Stand("stセナ_制服_通常","normal", 200, @-150);
	FadeStand("stセナ_制服_通常_normal", 200, false);
	DeleteStand("stセナ_制服_通常_angry", 200, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300150sn">
「ギガロマニアックスは特別――いや、異常ではなくなる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300160sn">
「これからはこの忌々しい力を、誰もが自由に使えるようになるんだ。Ｉｒ２を元に作られた装置によってな」

{	Stand("stセナ_制服_通常","rage", 200, @-150);
	FadeStand("stセナ_制服_通常_rage", 200, false);
	DeleteStand("stセナ_制服_通常_normal", 200, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300170sn">
「もっとも、その前に一握りの腐った連中に独占され、人々は気付かないうちに、家畜同然の立場になるよう洗脳されてしまうだろうが」

{	DeleteStand("stセナ_制服_通常_rage", 200, true);
	Stand("bu梨深_制服_正面","sad", 250, @150);
	FadeStand("bu梨深_制服_正面_sad", 200, false);}
//◆ブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17300180ri">
「…………」

そ、そんなの知らない。

そんなこと言われたって、僕は知らないよ……。

例えセナの言葉が事実だったとしても、僕は自覚的にそんなとんでもないものを作ろうなんて思ってなかったんだ。ただの、子供の落書きなんだ。

僕は、なにも悪くないんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_sad", 200, true);

	Wait(200);

	Stand("st梢_制服_通常","sad", 200, @150);
	FadeStand("st梢_制服_通常_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//以下、梢のセリフはすべて心の声
//ＶＦ//心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300190ko">
「ほへぇ～」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300200ko">
「それならそれならぁ。その“あいあーむつー”は――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300210sn">
「Ｉｒ２」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300220ko">
「それは～、ギガロマニアーックスの力のことをキュピーンって説明したものなんだ～」

{	Stand("st梢_制服_通常","normal", 200, @150);
	FadeStand("st梢_制服_通常_normal", 200, false);
	DeleteStand("st梢_制服_通常_sad", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300230ko">
「や～っぱり、あのおじしゃんが言ってたのは本当だったのら！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300240ko">
「一番重要なのは“その目だれの目？”を生み出した少年なんだ～って」

{	Stand("st梢_制服_通常","smile", 200, @150);
	FadeStand("st梢_制服_通常_smile", 200, false);
	DeleteStand("st梢_制服_通常_normal", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300250ko">
「それって、拓巳しゃんのこーとだったんだね！」

こずぴぃの脳天気な声。
僕は彼女みたいに無邪気にはなれない。
梨深も、なにも答えようとしない。

ただ、セナだけが。

目を見開き。

ハッと顔を上げ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","rage", 250, @-150);
	FadeStand("stセナ_制服_通常_rage", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
フラフラと立ち上がる。

足許がおぼついてないのは、どうしてだろう。
さっき梨深になにかされたせいなのかな。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300260sn">
「梢……。お前、今、なんて言った……？」

{	Stand("st梢_制服_通常","normal", 200, @150);
	FadeStand("st梢_制服_通常_normal", 200, false);
	DeleteStand("st梢_制服_通常_smile", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300270ko">
「うぴ？」

きょとんとするこずぴぃに、セナは詰め寄る。

{	Stand("stセナ_制服_通常","hard", 250, @-150);
	FadeStand("stセナ_制服_通常_hard", 200, false);
	DeleteStand("stセナ_制服_通常_rage", 200, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300280sn">
「“おじしゃん”って、誰のことだ……？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300290ko">
「う～んとね、こずぴぃにディソードの大切さを教えてくれた人～」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300300ko">
「東京に来て初めて話した人なの」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300310ko">
「なんかね、うぎゅ～って鼻つまみたくなっちゃう格好してて、ヘンテコなこと書いた板持ってたの」

{	Stand("st梢_制服_通常","smile", 200, @150);
	FadeStand("st梢_制服_通常_smile", 200, false);
	DeleteStand("st梢_制服_通常_normal", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300320ko">
「“世界は終わる”とかとかー♪」

{	Stand("stセナ_制服_通常","angry", 250, @-150);
	FadeStand("stセナ_制服_通常_angry", 200, false);
	DeleteStand("stセナ_制服_通常_hard", 200, false);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300330sn">
「…………っ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300340sn">
「な、なんで、それをっ、早く言わなかったっ」

{	Stand("st梢_制服_通常","sad", 200, @150);
	FadeStand("st梢_制服_通常_sad", 200, false);
	DeleteStand("st梢_制服_通常_smile", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17300350ko">
「ひゃう～、そ、そんなこと言われても～」

{	DeleteStand("st梢_制服_通常_sad", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300360sn">
「アイツ……だ……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300370sn">
「やっと、見つけた……！」

僕も、梨深も、こずぴぃも。
なんのことか分からずに。
セナの鬼気迫る態度を、ただ呆然と眺めていることしかできない。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17300380sn">
「私は、やっと……アイツを、殺せる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	Wait(2000);

}