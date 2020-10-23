//<continuation number="130">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_143_梢に連れられて";
		$GameContiune = 1;
		Reset();
	}

		ch07_143_梢に連れられて();
}


function ch07_143_梢に連れられて()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//※拓巳視点に戻る	
//ＢＧ//黒
	CreateColor("背景１", 500, 0, 0, 1280, 720, "Black");

//あやべ：渋谷雑踏の遠く、がなければ音量下げることで対応
	CreateSE("SE01","SE_日常_雑踏_遠い");
	MusicStart("SE01", 0, 1000, 0, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
肩を、そっと揺すられた。

それはとても遠慮がちで、しかも一度揺すっただけで僕の肩から離れていった。

//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300010ko">
「…………」

//※以上のセリフのみリアルの声
誰かが、僕の顔をのぞき込んでいる……そんな気配がする。

僕の意識は、少しずつ覚醒していく。

それにともなって、身体の痛みもよみがえってくる。

鼻をつく匂い。生々しくて、吐き気を覚えるようなそれは、血の匂いだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14300020ta">
「う……」

上唇のあたりが、ヒリヒリとした。
口の中に、鉄を舐めたような味が広がった。

ゆっくりと、目を開く。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//路地裏//夕方
	CreateTextureEX("背景２", 400, 0, 0, "cg/bg/bg090_01_2_路地裏_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	Stand("bu梢_制服_通常","sad", 450, @-150);
	FadeStand("bu梢_制服_通常_sad", 0, true);

	DrawTransition("背景１", 1500, 1000, 0, 100, null, "cg/data/center.png", true);
		
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そこはさっきの路地裏だった。

僕はアスファルトの上にうつぶせに倒れていて、すぐ目の前に、生ゴミからしみ出したと思われる茶褐色の小さな水たまりが見えた。

鼻をつく匂いに顔をしかめ、身体を起こす。

全身が痛む。

特に顔面がすごく痛い。火のついたライターでも近づけられたみたいに、熱を帯びてヒリヒリしている。

//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300030ko">
「…………」

//※以上のセリフのみリアルの声
すぐ傍らに、見覚えのある女子が膝をつき、泣きそうな顔で僕を見ていた。

転校生……だ。僕のクラスに転校してきた女子。

えーっと、名前は、お、大原？　押原？

なんでここに、転校生がいるんだろう。

{	Stand("bu梢_制服_正面","sad", 450, @-150);
	DeleteStand("bu梢_制服_通常_sad", 200, true);
	FadeStand("bu梢_制服_正面_sad", 200, true);}
//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300040ko">
「…………」

//※以上のセリフのみリアルの声
と、転校生が僕になにかを差し出してきた。

僕の財布だ。どうしてこれを、この子が……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu梢_制服_正面_sad", 500, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕はまだボーッとする頭で、さらに周囲を見回した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14300050ta">
「ひっ……」

さっき僕に絡んできたＤＱＮ３人組が、血まみれになって倒れていた。

な、な、なんだ、これ？
フルボッコじゃないか。
３人とも、顔面が原形をとどめていない。

し、死んでるのかな？
ピクリとも動かない。

まさか……ニュージェネ第７の事件……！？

いったい、誰がこんなことを……？

僕……なの……？
僕が……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 450, @-150);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//※以下のセリフのみリアルの声
//◆焦っているブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300060ko">
「…………っ」

//※以上のセリフのみリアルの声
と、転校生が立ち上がり、蒼白な顔のまま僕に手招きした。

戸惑っている僕と、倒れている３人とを交互に見て、目尻に涙を浮かべる。

そしていきなり僕の手をつかむと、よたよたと走り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果１", 500, center, middle, "SCREEN")

	Delete("SE*");
	DeleteStand("bu梢_制服_正面_sad", 0, true);
	
//あやべ：渋谷雑踏
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
//ＢＧ//１０７前//夕方
	CreateTextureEX("背景３", 400, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	DrawTransition("効果１", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("効果１", 0, true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
表通りに出たところで、転校生は手を離した。
そう大した距離を走っていないのに、彼女はもう息切れしている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 450, @+150);
	FadeStand("bu梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//※以下のセリフはリアルの声
//◆息切れ
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300070ko">
「……っ、……っ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14300080ta">
「え、と……」

//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14300090ko">
「…………」

//※以上のセリフはリアルの声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14300100ta">
「…………」

互いに黙り込んでしまった。

転校生は、僕と同じで口ベタなのかもしれない。

//■３６０
//そう言えば、たまたまかもしれないけど、彼女の喋る声を僕は今まで聞いたことがなかった。

いや、そんなことはどうでもいいんだ。
それより、状況がよく分からない。

僕はあのＤＱＮ３人に因縁を付けられて、暴力を振るわれてたはず。

どうやら気絶しちゃってたみたいだけど、どれぐらいの間意識を失ってたんだろう……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮエフェクト
//ＳＥ//妄想ＩＮ
	DelusionFakeIn()
	
//ＢＧ//１０７前//夕方
	CreateTextureEX("背景３", 400, 0, 0, "cg/bg/bg009_02_2_107_a.jpg");
	Fade("背景３", 0, 1000, null, true);
	Stand("bu梢_制服_正面","normal", 450, @+150);
	Stand("bu梢_制服_通常","normal", 450, @+150);

	DelusionFakeIn2();
//※↑フェイクの妄想ＩＮエフェクト。本当は妄想じゃないです。

//※以下、梢のセリフはすべて心の声です
//※梢が心の声で喋る際、汎用立ち絵は口パクしません

	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14300110ko">
「５分くらいなのら」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14300120ta">
「な……！？」

ま、まただ……！
また、聞こえた！

僕の知っている誰かが近くにいて、話しかけてきているのかと思ったけど、それらしい人影は見当たらない。

くそぅ。なんで今日になって急に幻聴が聞こえ始めたんだ。

{	DeleteStand("bu梢_制服_正面_normal", 300, true);
	FadeStand("bu梢_制服_通常_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14300130ko">
「幻聴じゃ、なーいよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３２");
	FadeStand("bu梢_制服_正面_normal", 300, false);
	DeleteStand("bu梢_制服_正面_sad", 300, true);
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

//おがみ：360ちらつき防止のため次スクリプトへ
//	PrintBG(1000);

}