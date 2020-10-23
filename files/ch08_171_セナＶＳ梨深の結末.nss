//<continuation number="340">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_171_セナＶＳ梨深の結末";
		$GameContiune = 1;
		Reset();
	}

		ch08_171_セナＶＳ梨深の結末();
}


function ch08_171_セナＶＳ梨深の結末()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//※拓巳視点に戻る

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	BGMPlay360("CH06", 2000, 1000, true);
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景１", 1000, 1000, null, true);

	DelusionOut2();

	Wait(1000);

//ＢＧ//ＫＵＲＥＮＡＩ会館ビル屋上//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕はただ、それを訳も分からず眺めている。

突然屋上の縁へと走っていったセナが、
ひとりで勝手にバランスを崩して、
今まさに、転落しようとしている。

彼女の身体が、縁の向こうに消えようとしている。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17100010ta">
「落ちる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 100, 0, 1000, 100, null, "cg/data/lcenter2.png", true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
つぶやくことしかできない。
僕は目をきつく閉じる。

自殺だ。セナは投身自殺を図ったんだ。

理由は分からない。
分かってたまるか。

僕に急に襲いかかってきた。
その天罰が下ったんだ。

あの女も敵だったんだ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 3000, 0, true);
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17100020ta">
「…………」

下に転落した音は、いつまで経っても聞こえてこなかった。

恐る恐る、目を開いて様子を窺ってみる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DrawTransition("色１", 1500, 1000, 800, 100, null, "cg/data/lcenter2.png", true);
	DrawTransition("色１", 500, 800, 0, 100, null, "cg/data/lcenter2.png", true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17100030ta">
「あ……」

セナは、落ちてはいなくて。
へたり込んでいて。

梨深がそのすぐ横に立ち。
セナの腕をつかんでいる。

梨深が、助けたの？

{	BGMPlay360("CH22", 2000, 1000, true);}
//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100040sn">
「う……ぐすっ……」

セナはディソードを放り捨てて、子供みたいに泣いている。

いったい、今の一連の出来事はなんだったのか……。

少なくとも僕には、セナが勝手に死のうとしたようにしか見えなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","sad", 250, @0);
	FadeStand("bu梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100050ri">
「辛い思いさせて、ごめんね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100060ri">
「でも、しょうがなかったの」

梨深が、セナになにかをしたんだ――

いつもの明るい梨深とは、まるで別人だった。

思い詰めた表情。
悲しそうなつぶやき。
揺れる瞳。

僕の知らない梨深が、そこにいる。

{	DeleteStand("bu梨深_制服_正面_sad", 500, true);}
//以下、梢のセリフはすべて心の声
//ＶＦ//心の声
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100070ko">
「咲畑しゃ～ん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","shy", 200, @0);
	FadeStand("bu梢_制服_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
心の中に、声が響く。
こずぴぃは相変わらず、コンテナハウスの上から僕らの様子を眺めていた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100080ko">
「もう、しゅ～りょ～、だよね？」

{	Stand("bu梢_制服_通常","normal", 200, @0);
	FadeStand("bu梢_制服_通常_normal", 200, false);
	DeleteStand("bu梢_制服_通常_shy", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100090ko">
「もっしもぉ、セナしゃんのことグシャバキーッってしようとしてるなら」

{	Stand("bu梢_制服_通常","smile", 200, @0);
	FadeStand("bu梢_制服_通常_smile", 200, false);
	DeleteStand("bu梢_制服_通常_normal", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100100ko">
「こずぴぃ、許さないぽーん♪」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100110ko">
「咲畑しゃんのこと……」

{	BGMPlay360("CH*", 500, 0, true);
	Stand("bu梢_制服_正面","sigh", 200, @0);
	FadeStand("bu梢_制服_正面_sigh", 200, false);
	DeleteStand("bu梢_制服_通常_smile", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100120ko">
「バラバラにしちゃうよ？」

ゾクリと、背筋が凍る。
こずぴぃの声はいつもみたいに脳天気なアニメ声だけど。
言っていることは、本気だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 500, 1000, true);
	DeleteStand("bu梢_制服_正面_sigh", 500, true);
	Wait(500);
	Stand("bu梨深_制服_正面","hard", 250, @0);
	FadeStand("bu梨深_制服_正面_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100130ri">
「…………」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100140ri">
「うん。もう終わり」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100150ri">
「もともと、蒼井さんのことどうこうするつもりはないし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100160ri">
「タクの前から消えてくれるなら、このまま解放する」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu梨深_制服_正面_hard", 500, true);
	Wait(300);
	Stand("bu梢_制服_通常","angry", 200, @0);
	FadeStand("bu梢_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//◆むぅーり＝無理
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100170ko">
「それはそれは～、むぅーり！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100180ko">
「だってこずぴぃとセナしゃんと拓巳しゃんは、お友達だも～ん」

{	Stand("bu梢_制服_通常","normal", 200, @0);
	FadeStand("bu梢_制服_通常_normal", 200, false);
	DeleteStand("bu梢_制服_通常_angry", 200, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100190ko">
「ね？　ね？　そうでしょー拓巳しゃん」

{	DeleteStand("bu梢_制服_通常_normal", 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/17100200ta">
「…………」

なにも考えられない。
今起きていることのすべてが夢だって言われたら、きっとそれを信じちゃうだろう。

そもそも、どうしてセナは急に、僕に襲いかかってきたんだ。
やっぱりセナは僕の敵だったの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100210sn">
「お、まえのせいだ……っ！」

泣きじゃくっていたセナが顔を上げた。
涙を拭おうともせず。へたり込んだままで。
僕をキッと見据えてくる。

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100220sn">
「お前のせいで、私の家族は……！」

//◆泣く
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100230sn">
「ぐすっ……」

困惑する。
叩き付けられてくる、むき出しの感情。

僕が、なにをしたって言うんだ。

誰にも迷惑をかけてない。
ましてやセナの家族なんて知るわけがない。

僕はとても無害な人間なんだ。

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100240sn">
「無害だと……？」

心を、読まれた。

//◆涙声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100250sn">
「お前が生み出したものが、
世界を滅ぼすかもしれないって言うのに……！」

世界を……滅ぼす……？
また中２病か？

助けを求めて梨深へと視線をやった。
でも梨深は、僕たちに背中を向けて、ぼんやりと暮れゆく空を眺めている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","sad", 250, @240);
	FadeStand("st梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100260ri">
「無駄だよ」

その姿が。その声が。
やけに寂しそうなのは、気のせい？

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100270ri">
「タクは……なにも知らないから」

それはまるで、梨深はなにもかもを知っているような口振りだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","angry", 210, @-240);
	FadeStand("stセナ_制服_通常_angry", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100280sn">
「ふざけるなっ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100290sn">
「今、渋谷を襲っている混乱は、全部あの公式が発端なんだぞ」

公式――

{	Stand("st梨深_制服_正面","hard", 250, @240);
	FadeStand("st梨深_制服_正面_hard", 200, false);
	DeleteStand("st梨深_制服_正面_sad", 200, false);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100300ri">
「それ以上言わないで」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/17100310ri">
「タクは本当になにも知らないの」

僕のことが話されているみたいだけど。
当の僕自身が、話についていけない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("stセナ_制服_通常_angry", 500, false);
	DeleteStand("st梨深_制服_正面_hard", 500, false);

	CreateSE("SE05","SE_じん体_動作_のぞく");
	CreateSE("SE06","SE_じん体_動作_座る七海");
	SoundPlay("SE05", 0, 1000, false);

	Wait(1000);
	SoundPlay("SE06", 0, 1000, false);

	Stand("bu梢_制服_通常","normal", 200, @0);
	FadeStand("bu梢_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆こーしき＝公式
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/17100320ko">
「こーしきって、こーれのこと？」

{	DeleteStand("bu梢_制服_通常_normal", 500, true);}
こずぴぃが、僕の作文用紙を持ってコンテナハウスから降りてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 500, 0, 0, "cg/bg/bg155_01_1_Ir2_a.jpg");
	CreateSE("SE05","SE_衝撃_生と手帳落ちる");
	SoundPlay("SE05", 0, 1000, false);
	Fade("背景２", 400, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
そこに描かれたもの。
僕が小学生の頃に書いた落書き。

Ｉｒ２。

それが、今渋谷を襲っている混乱の発端だって？

言いがかりもいいところだ。
あんな落書きにそんな力があるはずない。

僕がこの落書きを書いたのは、ホントに軽い気持ちだった……はずだ。

昔のことだから、よくは思い出せないけど……。

意味なんてなにもなかった。
夢に出てきた数字を、ただ書き写しただけ。

表に書かれてある『その目だれの目？』と関連した夢だ。

その言葉を僕は昔から使ってて、それがあるとき、夢の中でどんどん形になっていった。

その中にその数字があった。

//読み方「エフユーエヌの１０乗かけるアイエヌティーの４０乗イコールアイアールツー」
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100330sn">
「ｆｕｎ＾１０×ｉｎｔ＾４０＝Ｉｒ２」

ようやく涙を拭ったセナの目は、真っ赤だった。

それでもまだへたり込んだまま、悔しそうにうなだれてセナは言葉を紡ぐ。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/17100340sn">
「この公式をお前が生み出した瞬間……世界は分岐したんだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 2000, 0, true);
	SoundPlay("SE*",2000,0,false);
	Wait(2000);

//～～Ｆ・Ｏ



}