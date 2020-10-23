//<continuation number="1300">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_147_ギガロマニアックスとは";
		$GameContiune = 1;
		Reset();
	}

		ch07_147_ギガロマニアックスとは();
}


function ch07_147_ギガロマニアックスとは()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る
	CreateColor("黒", 1000, 0, 0, 1280, 720, "Black");

//ＳＥあやべ：Ｒｏｆｔ店内音量下げ
	CreateSE("SE01","SE_はいけい_しーでーしょっぷ店内_LOOP");
	MusicStart("SE01", 3000, 400, 0, 1000, null, true);

//ＢＧ//Ｒｏｆｔ店内階段	
	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg061_01_2_Ｒｏｆｔ店内階段_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	Stand("bu梢_制服_通常","normal", 500, @-150);
	FadeStand("bu梢_制服_通常_normal", 0, true);

	Fade("黒", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
こずぴぃの話を聞いて、僕は首をひねった。

その男はいったい何者なんだろう。
メッセージボードを持ったホームレス。

そう言えば僕も何度か見かけたことがあるような……。
あれって全部同一人物だったかな？

分からないのは、そんなホームレスのおっさんがどうしてディソードのことを知っているのかっていうこと。

もしかして僕がなにも知らなかっただけで、実はディソードは日本じゃメジャーな存在だったりするのかな？

……そんなわけないよな。

こずぴぃの様子を窺う。

さっき、殺すとか物騒なことを口走ったとは思えないくらい、穏やかな表情をしていた。

ディソードの表面に指をそっと滑らせている。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700010ko">
「そう言えば、あのおじしゃん、別れ際にこんなこと言ってたのら」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700020ko">
「“君たちは特別な存在だ”」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700030ko">
「“中でも一番特別なのは”」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700040ko">
「“その目だれの目？を産み落とした少年”」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700050ko">
「らしいんだってー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE36001","SE_衝撃_衝撃音02");
	MusicStart("SE36001",0,1000,0,1000,null,false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
絶句する。

なんだ、それ……。

{	Stand("bu梢_制服_正面","normal", 500, @-150);
	DeleteStand("bu梢_制服_通常_normal", 500, false);
	FadeStand("bu梢_制服_正面_normal", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700060ko">
「んん？　西條くん、心当たりあーるの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700070ta">
「え？　いや、別に……」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700080ko">
「ウソらー。心は正直なんだよ。西條くんは今、もんのすごーく関係ありまーすって考えてる」

くそっ、やっぱり筒抜けなのはやりにくい……。

{	Stand("bu梢_制服_正面","sad", 500, @-150);
	FadeStand("bu梢_制服_正面_sad", 300, false);
	DeleteStand("bu梢_制服_正面_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700090ko">
「なんかこわーい顔になってるー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700100ko">
「“その目だれの目？”って、西條くんが最初にかんがーえたの？」

僕は唇を噛んで、立ち上がった。

鼻に詰めたティッシュを抜く。鼻血は止まっていた。

こずぴぃが首を傾げて見上げてくる。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700110ko">
「どこへ……」

僕、帰るよ……。

{	Stand("bu梢_制服_通常","sad", 500, @-150);
	DeleteStand("bu梢_制服_正面_sad", 500, false);
	FadeStand("bu梢_制服_通常_sad", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700120ko">
「ふえぇ！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE01");
	Delete("SE*");
	
//あやべ：渋谷雑踏
	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	
//ＢＧ//Ｒｏｆｔ前//夕方
	CreateColor("黒", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 1000, 1000, null, true);
	
	Delete("背景１");
	DeleteStand("bu梢_制服_通常_sad", 0, true);
	
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg058_01_2_Ｒｏｆｔ前_a.jpg");
	Fade("背景２", 0, 1000, null, true);

	Fade("黒", 1000, 0, null, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
まだ脇腹は痛かったけど、僕はエスカレーターやエレベータは使わずに、階段を使って１階まで降りた。おかげで人混みを避けて外に出ることができた。

こずぴぃが泣きそうな顔をしながら、遠慮がちについてくる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_武器構え青","sad", 500, @+150);
	FadeStand("bu梢_制服_武器構え青_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700130ko">
「あのあのー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700140ko">
「こずぴぃ、なにか怒らせるよーうなこと、言ったかなー？」

こずぴぃの問いかけは無視し、僕は頭の中で必死に考えを巡らせた。

こずぴぃが会ったっていう、そのホームレスのこと。『将軍』の仲間か？
どうして“その目だれの目？”なんだ。

“その目だれの目？を産み落とした少年”って誰のことだ。

僕？

いや、違う。
僕は“特別な少年”なんかじゃない。勇者じゃない。

だってディソードを手に入れられなかった。

ただの凡人。村人Ａだ。そうでありたい。特別になんかなりたくない。もう二度と、Ｏ－ＦＲＯＮＴであったようなことはゴメンだ。

じゃあ、その“少年”って誰だ？

考えられるのは、ニュージェネ事件の真犯人……『将軍』だ。

『将軍』はどう見ても老人だけど、声や背格好はむしろ少年に近いし、明らかに普通じゃない。あいつは“特別”だ。

６件起きているニュージェネ事件のうち２件で登場する“その目だれの目？”というメッセージ。

僕も自分の脳内だけでよく使っていた言葉。

この何気ない言葉に、いったいなにがあるっていうんだ……。

そこに『将軍』が僕を執拗に狙う理由も隠されてるの？

探すべきなのかな、そのホームレスの男を。今もこの街のどこかにいるはずだ。相変わらず訳の分からないメッセージが書かれたボードを持って。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("効果０",700, center, middle, "SCREEN");

	DeleteStand("bu梢_制服_武器構え青_sad", 0, true);
	Delete("背景２");

//ＢＧ//井の頭通り交番前//夕方
	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
	DrawTransition("効果０", 1000, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("効果０");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700150ta">
「…………」

探して、どうする？

僕は立ち止まった。
それから、自分の考えを否定するように首を振る。

探したからどうなるって言うんだ。
むしろ自分から危険に飛び込むことになるかもしれないのに。

その男が『将軍』の手下で、これは僕を誘い込むための罠かもしれないんだぞ。

のこのことその男に会いに行って、またクエストが始まっちゃったりしたらどうするつもりだ。

もうこの間みたいな恐怖や苦しみはうんざりだ。

こずぴぃだってそうだ。

こずぴぃが今、このタイミングで僕に心の声で話しかけてきたのはどうして？

彼女も優愛みたいに『将軍』の指示で僕に近づいてきたかもしれない。

殺すとか、半殺しとか、物騒なことを言うところからすると、もしかするとニュージェネの共犯ってことも考えられる。

Ｏ－ＦＲＯＮＴでの騒動の後、梨深は忽然と消えた。いっさい連絡が来なくなった。

あやせも自殺未遂を起こして入院中。
七海は無事だったけど、僕の味方だった２人はいなくなった。

梨深が帰ってくるっていう保証はある？

そもそも梨深はホントに“最近は学校を休んでいる”だけなの？

僕はそのことをこずぴぃからしか聞いてない。

こずぴぃが嘘をついているのかどうか判断できない。

ゾワリと、全身の産毛が逆立つような感覚。

やっぱり、僕っていう世界はあまりにも虚ろだ。

信じるべき拠り所がない。
なにもかもが嘘に見えてしまう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_武器構え青","sad", 500, @+150);
	FadeStand("bu梢_制服_武器構え青_sad", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700160ko">
「そーれーは、被害妄想なのら」

こずぴぃが、すぐ後ろに立っていた。

心の声は相変わらず脳天気。

両手で、凶悪そうなディソードを抱え。
上目遣いで僕を見ている。

{	Move("bu梢_制服_武器構え青_sad", 300, @+100, @0, Axl1, false);
	DeleteStand("bu梢_制服_武器構え青_sad", 300, true);}
僕はそんな彼女から目をそらした。

君は……僕の味方？
それとも、敵？
どっちなの？

//※以下のセリフのみリアルの声
//◆ブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700170ko">
「……っ」

//※以上のセリフのみリアルの声
君は、僕を殺しに来たの？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700180ko">
「こずぴぃは、ただ――」

ただ……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//３秒ほどウエイト
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700190ko">
「あー！」

いきなりこずぴぃは奇声をあげた。

びっくりして顔を上げると、彼女は僕を見ていなくて、あらぬ方へ手を振っていた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700200ko">
「セナしゃんみっけー」

セナ……しゃん？
まさか……

こずぴぃの視線を追っていくと、そこにいたのは案の定――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 1000, 500, null);


	CreateColor("黒", 800, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 500, 0, 1000, 200, null, "cg/data/left3.png", true);

	Stand("stセナ_制服_横向剣持ち青","normal_r", 300, @-180);
	FadeStand("stセナ_制服_横向剣持ち青_normal_r", 0, true);


	DrawTransition("黒", 500, 1000, 0, 200, null, "cg/data/right3.png", true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//ＣＨ//セナ
//※セナは普通に喋っている。心の声ではない
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700210sn">
「……梢か」

不機嫌きわまりないと言った表情で、ディソードを担いだ蒼井セナが歩いてくるところだった。

僕はついつい身構えてしまう。

なぜセナがここで現れる？
これも偶然？
それとも……計算された罠？

２人は知り合いなの？
だとしたらこずぴぃが呼び込んだ？
２人がかりで僕を殺すため？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_武器構え青","normal", 500, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700220ko">
「だーからー、それは被害妄想だよー」

だって、なにを信じていいのか……。

セナはこれまでにも何度か遭遇してるけど、僕を攻撃しようとはしなかった。

だからって、僕の味方だとは限らない。
それに……怖いし。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700230ko">
「セナしゃんは怖くなーいよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700240ta">
「ちょ……！」

こずぴぃ、そういう余計なこと言わないでくれよぅ！

{	DeleteStand("stセナ_制服_横向剣持ち青_normal_r", 500, true);
	Stand("buセナ_制服_通常","hard", 510, @-250);
	FadeStand("buセナ_制服_通常_hard", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700250sn">
「怖い？　なんのことだ？」

案の定、セナにもこずぴぃの“心の声”が聞こえるらしい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700260ta">
「な、なな、なんでも、ない、です……」

焦る僕を尻目に、こずぴぃはやけに嬉しそうだ。

{	Stand("bu梢_制服_通常","shy", 200, @+150);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);
	FadeStand("bu梢_制服_通常_shy", 300, true);}
うつむきがちながらも、セナの服の裾をそっと握りしめはにかんでいる。

あまりにも２人の組み合わせが微笑ましくて、自分が緊張しているのがバカみたいに思えてきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 100, 0, NULL);

	CreateSE("SE00","SE_衝撃_ふらっしゅばっく");
	SoundPlay("@SE00",0,800,false);

	CreateColor("BLACK", 500, 0, 0, 1280, 720, "BLACK");
	Fade("BLACK", 0, 0, null, true);

	CreateColor("WHITE", 10000, 0, 0, 1280, 720, "WHITE");
	Request("WHITE", AddRender);
	Fade("WHITE", 0, 0, null, false);

	CreateColor("漆黒", 10000, 0, 0, 1280, 720, "BLACK");
	Fade("漆黒", 0, 0, null, false);

	Fade("WHITE", 200, 1000, null, true);
	Fade("BLACK", 0, 1000, null, true);
	BGMPlay360("CH03",0,1000,true);

	DeleteStand("bu梢_制服_通常_shy", 0, false);
	DeleteStand("buセナ_制服_通常_hard", 0, true);

	MemoryPre1();
	CreateProcess("プロセス１", 3000, 0, 0, "Memory1");
	Request("プロセス１", Start);

	Fade("WHITE", 200, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text507]
２人は、まるで姉妹だ。気が強くてしっかり者の姉と、姉のことが大好きなおとなしい妹。

しかも２人とも貧乳とかもうね、ＧＪすぎる――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01",300,1000,true);

	Fade("漆黒", 200, 1000, null, true);
	Fade("BLACK", 0, 0, null, true);

	Request("プロセス１", Stop);
	Delete("プロセス１");
	Draw();
	WaitAction("プロセス１", null);
	Delete("@BlackMemory*");
	Delete("@BlackMemory*");
	Delete("@MemoryBack*");
	Delete("@セナ*");
	Delete("@梢*");

	Stand("bu梢_制服_武器構え青","shy", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_shy", 0, true);
	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	Fade("漆黒", 200, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text607]
って、ダメだダメだ、自重しろ！　こずぴぃにまた心を読まれる！
それに、油断すると命取りになるぞ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 100, 0, NULL);

	CreateSE("SE00","SE_衝撃_ふらっしゅばっく");
	SoundPlay("@SE00",0,800,false);

	Fade("WHITE", 200, 1000, null, true);
	Fade("BLACK", 0, 1000, null, true);

	DeleteStand("bu梢_制服_武器構え青_shy", 0, false);
	DeleteStand("buセナ_制服_通常_hard", 0, true);

	MemoryPre2();
	CreateProcess("プロセス２", 3000, 0, 0, "Memory2");
	Request("プロセス２", Start);

	Fade("WHITE", 200, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
２人はいったいどういう繋がりなんだろう。学校で知り合ったのかな？　でも学年が違うし……。

剣を持つ者同士の繋がりみたいなものがあるのか。２人とも『将軍』の手下なのか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01",300,1000,true);

	Fade("漆黒", 200, 1000, null, true);
	Fade("BLACK", 0, 0, null, true);

	Request("プロセス２", Stop);
	Delete("プロセス２");
	Draw();
	WaitAction("プロセス２", null);
	Delete("@BlackMemory*");
	Delete("@BlackMemory*");
	Delete("@MemoryBack*");
	Delete("@セナ*");
	Delete("@梢*");

	Stand("bu梢_制服_武器構え青","shy", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_shy", 0, true);
	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	Fade("漆黒", 200, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text906]
僕はいつでも逃げ出せるように、猫足立ちの姿勢を取った。

具体的には、足のかかとを上げて立つこと。こうすることで猫のように素早く動き出すことができる……らしい。昔、マンガで読んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 100, 0, NULL);

	CreateSE("SE00","SE_衝撃_ふらっしゅばっく");
	SoundPlay("@SE00",0,800,false);

	Fade("WHITE", 200, 1000, null, true);
	Fade("BLACK", 0, 1000, null, true);

	DeleteStand("bu梢_制服_武器構え青_shy", 0, false);
	DeleteStand("buセナ_制服_通常_hard", 0, true);

	MemoryPre3();
	CreateProcess("プロセス３", 3000, 0, 0, "Memory3");
	Request("プロセス３", Start);

	Fade("WHITE", 200, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text907]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700270ko">
「セナしゃんはねー、こずぴぃが東京に来てから最初のお友達なのらー。ね？　ね？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700280sn">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01",300,500,true);

	Fade("漆黒", 200, 1000, null, true);
	Fade("BLACK", 0, 0, null, true);

	Request("プロセス３", Stop);
	Delete("プロセス３");
	Draw();
	WaitAction("プロセス３", null);
	Delete("@BlackMemory*");
	Delete("@BlackMemory*");
	Delete("@MemoryBack*");
	Delete("@セナ*");
	Delete("@梢*");

	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 0, true);
	Stand("buセナ_制服_通常","angry", 300, @-250);
	FadeStand("buセナ_制服_通常_angry", 0, true);

	Fade("漆黒", 200, 0, null, true);

	Delete("漆黒");
	Delete("WHITE");
	Delete("BLACK");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text908]
それには答えず、セナは僕をギロリとにらみつけてくる。

持っている剣で襲いかかってこられるのかと思ったけど、なにもなかった。
怖いって言ったことを特に怒る様子もない。

{	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 300, true);
	DeleteStand("buセナ_制服_通常_angry", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700290sn">
「梢、どうしてこいつと？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700300ko">
「拓巳しゃんは、クラスメイトでーす」

た、拓巳しゃん……って……

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700310ko">
「ほいでね、拓巳しゃんはこずぴぃの剣が見えるんだよ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700320sn">
「それは知っている。こいつもギガロマニアックスだ」

ギガロ……なんだって？

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700330ko">
「ギガロマニアックス」

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700340ko">
「ディソードが見える人のことー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700350ko">
「拓巳しゃんもそうだよ」

ギガロマニアックス……。

その名称を決めたのは、どこの誰？

呼び名があるっていうことは、その力は珍しくないものなの？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700360ko">
「あ、セナしゃんは『ガルガリ君』買いーにいくとこなんですねー？」

//■３６０
//「あ、セナしゃんは『ガルガリ君』買ーいにいくとこなんですねー？」

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_通常_hard", 500, false);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
//◆焦る
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700370sn">
「う、そ、それは……」

どうやらこずぴぃはセナの心を読んだらしい。

そう言えばセナは、前もガルガリ君を食べていた。

もうすぐ冬。だいぶ寒くなってきたっていうのに、よく外でアイスなんて食べられるもんだ。
よっぽど好きなのかな。

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700380ko">
「ほいじゃ、みんなで一緒に行きましょー」

こずぴぃは心の声でそう宣言すると、セナにじゃれつくように手を引っ張って歩き出した。

//◆はーやく＝早く
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700390ko">
「拓巳しゃんもはーやく」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700400ta">
「あ、え、いや、僕は……」

辞退してさっさと帰ろうとしたけど、

{	Stand("bu梢_制服_武器構え青","sad", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_sad", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);}
//※以下のセリフのみリアルの声
//◆泣きそう
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700410ko">
「……っ」

//※以上のセリフのみリアルの声
途端にこずぴぃが涙目になった。潤んだ眼差しで僕に無言で訴えかけてくる。

{	Stand("buセナ_制服_通常","hard", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, false);
	FadeStand("buセナ_制服_通常_hard", 500, true);}
その隣では、セナが今にも噛みつきそうなくらいに睨んでくるし。

//◆梢が泣くので仕方なく
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700420sn">
「……ついてこい」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700430sn">
「お前にもおごってやる」

どうやらセナも、こずぴぃの涙目攻撃には弱いらしかった。渋々といった感じで僕を促し、交番のすぐ裏にあるコンビニへ向かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SetVolume360("SE01", 3000, 1000, null);


//あやべ//時間経過
	CreateColor("黒", 10000, 0, 0, 1280, 720, "Black");
	Fade("黒", 0, 0, null, true);
	Fade("黒", 1000, 1000, null, true);

	Stand("buセナ_制服_食事","normal", 300, @-250);
	FadeStand("buセナ_制服_食事_normal", 0, false);
	DeleteStand("buセナ_制服_通常_hard", 500, true);

	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 0, false);
	DeleteStand("bu梢_制服_武器構え青_sad", 0, true);

	Fade("黒", 2000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
ガルガリ君を１本ずつ買い、交番前の手すりに腰かけて２人はかじり始める。

こずぴぃはやっぱり嬉しそうだ。一方のセナは澄ました顔。

僕は気が気じゃなかった。
目の前の交番には警官がいる。

なのに、銃刀法を現在進行形で違反中の２人は、まったくそれに注意を払う素振りも見せない。

警官も警官だ。
明らかに僕らのことが見えているはずなのに、逮捕どころか、注意しに出てくることすらなかった。

{	Stand("bu梢_制服_正面","normal", 200, @+250);
	DeleteStand("bu梢_制服_武器構え青_smile", 500, false);
	FadeStand("bu梢_制服_正面_normal", 500, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700440ko">
「食べないのー？」

こずぴぃに指摘されて、手に持っているガルガリ君を仕方なくかじる。

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	DeleteStand("bu梢_制服_正面_normal", 500, false);
	FadeStand("bu梢_制服_武器構え青_smile", 500, true);}
周囲の視線が気になる。

セナとこずぴぃはかわいい。こんなかわいい“貧乳姉妹”と僕みたいなキモオタが３人一緒にいて、しかも３人とも寒空の下でガルガリ君を食べているのは、あまりにシュールすぎて目立ってしまう。

自意識過剰かな？

クスクスというバカにしたような笑い声がずっと聞こえている。幻聴？　こずぴぃが笑ってるだけ？

目立ちたくない。
見られたくない。

他人の視線に対する恐怖。
帽子でも被ってくればよかった……。

とにかく一刻も早くこの場から立ち去りたい。

そのために必死でガルガリ君を食べ進めるうちに、身体が冷えてきた。後で絶対下痢になるぞこれ……。２人は寒くないんだろうか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700450sn">
「で、梢。なぜこいつと一緒なんだ？」

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700460ko">
「こいつーじゃなくて拓巳しゃんでーすよ」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700470ko">
「拓巳しゃんが悪い人にいじめられてて、倒れてたのら。だからこずぴぃが介抱してあげたの」

介抱……されたかな？

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700480sn">
「ディソードを使ったのか」

//◆梢はＤＱＮ３人組に手を出していない。単に願望を言っているだけ。
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700490ko">
「殺したかったぁ。ドカバキィッて！」

こずぴぃは身振り手振りで表現しようとしたらしい。

でも左手には巨大なディソードを持っていたから、もう片方の手を振り回す。

でもそっちには当然ながらガルガリ君が握られていたわけで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","normal", 200, @+250);
	DeleteStand("bu梢_制服_武器構え青_normal", 500, true);
	FadeStand("bu梢_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
//※以下のセリフのみリアルの声
//◆びっくりしてブレス
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700500ko">
「……っ！」

//※以上のセリフのみリアルの声
まだ一口しかかじっていなかったこずぴぃのガルガリ君が、キレイな弧を描いて飛んでいった。そして道路の上に落ち、砕けた。

{	Stand("bu梢_制服_正面","sad", 200, @+250);
	FadeStand("bu梢_制服_正面_sad", 300, false);
	DeleteStand("bu梢_制服_正面_normal", 300, true);}
//※以下のセリフのみリアルの声
//◆泣きそう
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700510ko">
「……っ、……っ」

//※以上のセリフのみリアルの声
こずぴぃは泣きそうになって、その残骸となったアイスを見つめている。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700520sn">
「……迂闊なマネは避けろと言っただろう」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700530ko">
「うう、ごめーんなさい……。もったいないないオバケが出ちゃう……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700540sn">
「アイスのことじゃない。ディソードのことだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_通常","hard", 300, @-250);
	FadeStand("buセナ_制服_通常_hard", 300, false);
	DeleteStand("buセナ_制服_食事_normal", 300, false);
	Stand("bu梢_制服_武器構え青","shy2", 200, @+250);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	FadeStand("bu梢_制服_武器構え青_shy2", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
セナがこずぴぃに、自分の食べかけのガルガリ君を渡した。どうやらこずぴぃにあげるらしい。受け取ったこずぴぃは泣きながらはにかんで、ペコペコと頭を下げた。

セナにもこんな優しいところがあるなんて。意外だ。

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, false);
	DeleteStand("bu梢_制服_武器構え青_shy2", 300, true);}
//◆あったーり前＝当たり前
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700550ko">
「でもでも、悪い人には罰ゲームをするのがあったーり前だよぉ」

//■３６０
//「でもでも、悪い人には罰ゲームするのがあったーり前だよぉ」

あの連中を血祭りに上げたのは……誰なんだろう。
こずぴぃなんだろうか。
それとも……僕？

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_normal", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700560ko">
「拓巳しゃん拓巳しゃん」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700570ko">
「セナしゃんはねぇ、すごーくなんでも知ってるんだよー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700580ko">
「ディソードっていう名前も、セナしゃんに教えてもらったのら」

//◆混乱
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700590ko">
「あとあと、リアルブータ？　あれれ？　ブタ？　ブッダ？」

//◆渋々補足する
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700600sn">
「……リアルブート」

//◆そそ＝そうそう
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700610ko">
「あ、そそ」

なんだそれ。そんな言葉、初めて聞いたぞ……。
さっきの、ギガロなんとかもそうだし。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700620ko">
「リアルブートしてない剣は、誰にも見えなかったはずなのにね、セナしゃんにだけ見えてたの！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700630ko">
「ディソードが見える人に会ったの、セナしゃんがはーじめてだったんだ」

//◆ほひゃー＝驚いたときの擬音
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700640ko">
「そのときはほひゃーって思って、なんで見えるんですかーって聞いちゃった」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700650ko">
「ギガロマニアックスだからなんだって」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700660ta">
「ギガロマニアックスって……なんなの？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700670ko">
「さっき言ったのらー」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700680ko">
「剣が見える人だよ」

いや、もっと詳しく、えっと、原理とか……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700690sn">
{#TIPS_ディラックの海 = true;$TIPS_on_ディラックの海 = true;}「“<FONT incolor="#88abda" outcolor="BLACK">ディラックの海</FONT>”に干渉できる力を持つ者」

{$TIPS_on_ディラックの海 = false;}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700700sn">
「それが、ギガロマニアックスだ」

代わりにセナが答えてくれた。

{	Stand("bu梢_制服_正面","normal", 200, @+250);
	DeleteStand("bu梢_制服_武器構え青_smile", 500, true);
	FadeStand("bu梢_制服_正面_normal", 500, true);}
//※以下のセリフのみリアルの声
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700710ko">
「？？？」

//※以上のセリフのみリアルの声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700720ta">
「ディラックの海……？」

首を傾げる僕に、セナは蔑むような一瞥をくれた。

な、なんだよ、その目は……。
こう見えても僕は頭がいいんだぞ。

確か“ディラックの海”って、量子力学の概念かなにかだったような気がする。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700730ta">
「負の、エ、エネルギーでいっぱいに満たされた……観測不能の境界面……とか、だっけ？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700740sn">
「大ざっぱに言えばそんなようなものだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700750sn">
「そしてそこに干渉するための端末が、ディソード。ディラックの海に突っ込んだパイプの先端と考えればいい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700760sn">
{#TIPS_負の物質 = true;$TIPS_on_負の物質 = true;}「ディラックの海と繋がっているから、ディソードも<FONT incolor="#88abda" outcolor="BLACK">負の物質</FONT>で構成されている。無限に崩壊している存在なんだ」

{$TIPS_on_負の物質 = false;}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700770sn">
「だから普段は普通の人間には触れることも見ることもできない、妄想のようなものでしかない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700780sn">
「このディソードこそ、あらゆるリアルブートのためのショートカット的役割を果たす」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700790sn">
「ディソードとディラックの海とのチャネルを大きくすることで――」

//◆「空孔」＝「くうこう」
//◆「対生成」＝「ついせいせい」
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700800sn">
{#TIPS_空孔理論 = true;$TIPS_on_空孔理論 = true;#TIPS_対生成 = true;$TIPS_on_対生成 = true;#TIPS_素粒子 = true;$TIPS_on_素粒子 = true;}
「ディラック方程式の<FONT incolor="#88abda" outcolor="BLACK">空孔理論</FONT>によって<FONT incolor="#88abda" outcolor="BLACK">対生成</FONT>が起き、<FONT incolor="#88abda" outcolor="BLACK">粒子</FONT>と反粒子を作り出せる」

{$TIPS_on_空孔理論 = false;$TIPS_on_対生成 = false;$TIPS_on_素粒子 = false;}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700810sn">
「この粒子が、ギガロマニアックスが生み出す妄想、世界にとってのエラー」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700820sn">
「そのエラーを現実とするには、作り出した粒子を他人のデッドスポットに送り込めばいい」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700830sn">
「粒子は即座に電気信号に変換され、周囲の人間に共通の認識――現実として成立する」

//◆「対消滅」＝「ついしょうめつ」
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700840sn">
「逆に消したいときは、粒子を送り込んだデッドスポットに、今度は反粒子を送り込み、対消滅してやればいい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_正面","sad", 200, @+250);
	FadeStand("bu梢_制服_正面_sad", 300, true);
	DeleteStand("bu梢_制服_正面_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text014]
//※以下のセリフのみリアルの声
//【梢】
<voice name="梢" class="梢" src="voice/ch07/14700850ko">
「？？？」

//※以上のセリフのみリアルの声
そういえば、前にもセナは言っていたっけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("色１", 1500, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, false);
	Fade("色１", 100, 1000, null, true);
	CreateColor("色２", 1400, 0, 0, 1280, 720, "Black");
	Fade("色２", 0, 300, null, true);
	CreateTexture360("背景１", 1000, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	Stand("buセナ_制服_通常","normal", 1200, @-50);
	FadeStand("buセナ_制服_通常_normal", 0, true);

	Fade("色１", 300, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700860sn">
「世界の仕組みは、３つの数字ですべて説明できる。
０と１、そして－１」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700870sn">
「ディソードはその－１を生み出すためのショートカットになる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("色１", 300, 1000, null, true);
	Delete("背景１");
	Delete("色２");
	DeleteStand("buセナ_制服_通常_normal", 0, true);
	Fade("色１", 300, 0, null, true);
	Delete("色１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601900]
なんだか頭がこんがらがっちゃいそうだよ……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700880ta">
「周囲の人間に共通の認識となると、
妄想が現実になるって……どういうこと？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700890sn">
「例えばお前が今手にしている、ガルガリ君。お前にはどう見える」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700900ta">
「え、どうって……水色をしたアイス……」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700910sn">
「その水色のアイスは本当に“現実”だと証明できるか？」

ガルガリ君はガルガリ君じゃないか。目で見ればすぐ分かるし、食べれば冷たい。そんなの分かりきったことだと思うけど……。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700920sn">
「人は目で見たものを脳が認識して初めて“それが水色のアイス”と理解できる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700930sn">
「でも、脳が本人の意識しないままに“ウソをついている”可能性だってあるんだぞ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700940sn">
「“脳が生み出した、自分ひとりだけがそう思い込んでいる妄想”かもしれないんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602900]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14700950ta">
「じゃ、じゃあ、どうやって、現実だって、しょ、証明、するの？」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700960sn">
「他の人も、お前の持っているものが水色のアイスであると観測すれば、それは２人以上の人間の共通の認識となる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700970sn">
「お前ひとりだけの妄想じゃなくなるんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14700980sn">
「妄想を現実にするときには、それを逆説的に捉えればいい」

つまり、自分１人だけの妄想――ディソードによって作り出した粒子を、周囲の人間に強制的に“見せる”ことで、妄想は現実となる……っていうことか。

で、その力は、僕にもある……のか？

//◆ふみゅー＝落ち込む
//◆さっぱり～＝さっぱり分からない
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14700990ko">
「ふみゅー。こずぴぃ、さっぱり～」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701000ko">
「とにかく、この剣は普通の人には見えないのー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buセナ_制服_食事減る","normal", 300, @-250);
	FadeStand("buセナ_制服_食事減る_normal", 300, true);
	DeleteStand("buセナ_制服_通常_hard", 0, true);
	DeleteStand("bu梢_制服_正面_sad", 500, true);
	Stand("st梢_制服_武器構え青","normal", 200, @+150);
	FadeStand("st梢_制服_武器構え青_normal", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text015]
こずぴぃはガルガリ君をセナに返すと、とてとてと道路へと走り出た。

道を歩いている人たちを前にして、なにを思ったか、いきなり持っているディソードを豪快に振り回す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//黒
	CreateColor("黒", 10000, 0, 0, 1280, 720, "Black");
	DrawTransition("黒", 200, 0, 1000, 100, null, "cg/data/center.png", true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text016]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14701010ta">
「やめっ……！」

僕は目を覆った。

ついに本性を現した――！
実はとんでもない殺人鬼だったんだ！

今頃道路が血の海になってる。

あの巨大な剣で斬りつけられたら、胴体ごとまっぷたつだ。

こずぴぃは現行犯逮捕だ。なにしろ目の前は交番。警官がしっかり目撃してる。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701020ko">
「拓巳しゃん、そんなことにはなってなーいよ？」

……どうして、こんなに静かなんだろう。
白昼堂々、渋谷のど真ん中で人が剣でぶった斬られたのに。

誰も悲鳴をあげない。
警官の怒声も聞こえない。

目を、ゆっくりと開いてみた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_武器構え青","shy", 200, @+150);
	FadeStand("st梢_制服_武器構え青_shy", 0, false);
	DeleteStand("st梢_制服_武器構え青_normal", 0, true);

//ＢＧ//井の頭通り交番前//夕方
	Fade("黒", 1500, 0, null, true);
	Delete("黒");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
……なにも起きていなかった。

こずぴぃはなおも――少し恥ずかしそうに――巨大な剣を振り回している。

明らかに通行人や柵、地面にも剣はぶつかってるはずなのに、なにも起きない。なにも斬れない。

それどころか、剣が――
ものを、すり抜けている。
まるで、それらが幻であるかのように。

いや、違う。逆だ。
剣の方に実体がないんだ。

周囲を歩く人たちはまったく動じてない。
この剣が見えていない。

{	Stand("st梢_制服_武器構え青","smile", 200, @+150);
	FadeStand("st梢_制服_武器構え青_smile", 0, false);
	DeleteStand("st梢_制服_武器構え青_shy", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701030ko">
「ピンポンピンポーン」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701040ko">
「ディソードは、妄想の剣なのだ」

そう言えば、以前あやせもそんなようなことを言ってた。剣は力を持つ人の目にしか映らない、って。

僕の隣でセナが面倒くさそうにため息をつき、ガルガリ君をかじった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701050sn">
「あのディソードは今は梢の作ったエラーでしかない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701060sn">
「周囲共通認識はまだ成立していない」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701070ko">
「リアルブートしたら、みんなに見えるようになるのでーす」

リアルブート……。

それが“周囲の人間のデッドスポットに粒子を送り込む”行為なのか。
デッドスポットっていうのがなんなのかは分からないけど。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701080ko">
「ズシャァッてしたりドガァッてできるようにもなるよ」

擬音じゃなくてもっと分かりやすく説明してくれ……。

でも、なんとなくニュアンスは伝わった。
ズシャァッは、たぶん……剣で斬ること。
ドガァッは、殴ること？

なにを、斬ったり殴ったり……しているんだろう。
そんなおっかないことを、こずぴぃはやってるの？

僕も……
僕にもそんな力があるのかな……

いや……僕は特別じゃない。
ギガロマニアックスなんかじゃない。

だって、結局、ディソードを手に入れることはできなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	DeleteStand("st梢_制服_武器構え青_smile", 500, true);

	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701090ko">
「剣は見えたーよね？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701100ko">
「だからそのうち拓巳しゃんも持てるのー」

無理だよ……。
あのＯ－ＦＲＯＮＴのときだって、無理だった。
剣は見えてたけど、つかむ方法が分からなくて……

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701110ko">
「えーと、どうやって手に入れるかって言うとー」

{	Stand("bu梢_制服_武器構え青","sad", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_sad", 300, false);
	DeleteStand("bu梢_制服_武器構え青_smile", 300, true);}
こずぴぃが指をくわえてセナを見る。
セナはまたため息をついた。

{	Stand("buセナ_制服_食事減る","sigh", 300, @-250);
	FadeStand("buセナ_制服_食事減る_sigh", 300, false);
	DeleteStand("buセナ_制服_食事減る_normal", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701120sn">
{#TIPS_ニューロン = true;$TIPS_on_ニューロン = true;}「バイオリズムの上昇によって、中脳辺縁系<FONT incolor="#88abda" outcolor="BLACK">ニューロン</FONT>のドーパミンが過剰分泌されたとき、ディソードは現れる」

{$TIPS_on_ニューロン = false;}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701130sn">
「それは危機的な状況や、興奮、悲しみ、憎しみ、笑いなど人それぞれだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701140sn">
「ドーパミン分泌量が多ければそれだけ観測しやすくなる」

{	Stand("bu梢_制服_武器構え青","smile", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_smile", 300, false);
	DeleteStand("bu梢_制服_武器構え青_sad", 300, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701150ko">
「拓巳しゃん、そういうことなのらー」

セナの知識の広さは異常。もしかしてとんでもなく頭いいのかも。

っていうか、まるで“ギガロマニアックス学”でもあるかのような詳しさじゃないか。

そもそもこんな複雑怪奇な理論や専門用語をそらで語れる女子高生なんて、日本中探してもいないんじゃないかな……。

彼女はいったいどこで勉強したんだろう。

僕の周りには、どうしてこんなにも謎の人物ばかりが集まってくるんだ。

誰か答えを提示してくれ。

考えるのももう疲れた。

分からないままのこんな中途半端な状態でいるのも気持ち悪い。

だけど自分で調べる気にはならない。
だって、みんな……普通じゃないから。

苦々しい思いを抱きつつ、溶けかけたガルガリ君の最後の一口をかじる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14701160ta">
「あ……。あたりだ」

残った棒部分に“あたり！”という文字が刻まれていた。
こずぴぃが戻ってきて、僕の手許をのぞき込んでくる。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701170ko">
「拓巳しゃん、すーごいねー」

{	Stand("buセナ_制服_食事減る","normal", 300, @-250);
	FadeStand("buセナ_制服_食事減る_normal", 300, false);
	DeleteStand("buセナ_制服_食事減る_sigh", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701180sn">
「大した運だな」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701190ko">
「セナしゃん、自分も当たりが出てほしかったって羨ましがってるのら♪」

{	Stand("buセナ_制服_食事減る","sigh", 300, @-250);
	FadeStand("buセナ_制服_食事減る_sigh", 300, false);
	DeleteStand("buセナ_制服_食事減る_normal", 300, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701200sn">
「……そんなことは思っていない」

こずぴぃ相手にそんなごまかしは通用しないと思うけど。なにしろ、考えていることを全部読まれちゃうんだから。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701210ko">
「セナしゃんはいっつもー、当たりが出ないかなーとワクワクしながらガルガリ君を食べてるのらー」

{	Stand("bu梢_制服_武器構え青","normal", 200, @+250);
	FadeStand("bu梢_制服_武器構え青_normal", 300, true);
	DeleteStand("bu梢_制服_武器構え青_smile", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701220ko">
「当たりを引いたのはどれくらーい？」

{	Stand("buセナ_制服_横向","shy", 300, @-250);
	DeleteStand("buセナ_制服_食事減る_sigh", 500, true);
	FadeStand("buセナ_制服_横向_shy", 500, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701230sn">
「…………１割３分７厘」

や、やけに細かく把握してるんだな……。
食べるたびに計算してるってことか……。

{	Stand("buセナ_制服_食事棒","sigh", 300, @-250);
	DeleteStand("buセナ_制服_横向_shy", 500, true);
	FadeStand("buセナ_制服_食事棒_sigh", 500, true);}
セナもガルガリ君を食べ終わった。棒をまじまじとにらみつけ、それから小さく鼻を鳴らす。
ハズレ、だな。あの顔は。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("SE*", 500, 0, null);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601020]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14701240ta">
「あ、あの……よ、よかったら、どうぞ……」

当たり棒を恐る恐る差し出す。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701250sn">
「他人に施しを受けるつもりはない」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701260sn">
「私は自分の可能性を試してるだけだ」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch07/14701270ko">
「でも本心では欲しーいって言ってるねー」

//◆ため息混じりのブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch07/14701280sn">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14701290ta">
「あ、あげます、よ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch07/14701300ta">
「ぼ、僕、アイスはあんまり、た、食べないし……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３４");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

//おがみ：スクリプト：↓PrintBGはずしたい
//おがみ：360ちらつき防止のため次スクリプトへ
//	PrintBG(1000);

	CreateSE("SE01","SE_日常_雑踏02");
	SoundPlay("SE01",300,500,true);


//SE01次cutへ引き続き再生
//背景３引き続き表示


}


function MemoryPre1()
{
	CreateColor("BlackMemory", 6000, 0, 0, 1280, 720, "WHITE");
	Request("BlackMemory", AddRender);
	SetAlias("BlackMemory", "BlackMemory");
	CreateColor("BlackMemory000", 4000, 0, 0, 1280, 720, "Black");
	SetAlias("BlackMemory000", "BlackMemory000");
	CreateTexture360("MemoryBack01", 1000, 0, 0, "cg/bg/bg058_01_2_Ｒｏｆｔ前_a.jpg");
	SetAlias("MemoryBack01", "MemoryBack01");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ１", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_hard.png");
	}
	Fade("セナ１", 0, 0, null, true);
	Move("セナ１", 0, @0, @136, null, true);
	SetAlias("セナ１", "セナ１");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_sad.png");
	}
	else
	{
		CreateTexture("梢１", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_sad.png");
	}
	Fade("梢１", 0, 0, null, true);
	Move("梢１", 0, @0, @136, null, true);
	SetAlias("梢１", "梢１");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ２", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("セナ２", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_normal.png");
	}
	Fade("セナ２", 0, 0, null, true);
	Move("セナ２", 0, @0, @136, null, true);
	SetAlias("セナ２", "セナ２");

	if(#下着パッチ==true)
	{
		CreateTexture("梢２", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_shy.png");
	}
	else
	{
		CreateTexture("梢２", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_shy.png");
	}
	Fade("梢２", 0, 0, null, true);
	Move("梢２", 0, @0, @136, null, true);
	SetAlias("梢２", "梢２");

	if(#下着パッチ==true)
	{
		CreateTexture("梢３", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_sad.png");
	}
	else
	{
		CreateTexture("梢３", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_sad.png");
	}
	Fade("梢３", 0, 0, null, true);
	Move("梢３", 0, @0, @136, null, true);
	SetAlias("梢３", "梢３");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ３", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ３", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_hard.png");
	}
	Fade("セナ３", 0, 0, null, true);
	Move("セナ３", 0, @0, @136, null, true);
	SetAlias("セナ３", "セナ３");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ４", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ４", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_hard.png");
	}
	Fade("セナ４", 0, 0, null, true);
	Move("セナ４", 0, @0, @136, null, true);
	SetAlias("セナ４", "セナ４");

	if(#下着パッチ==true)
	{
		CreateTexture("梢４", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_smile.png");
	}
	else
	{
		CreateTexture("梢４", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_smile.png");
	}
	Fade("梢４", 0, 0, null, true);
	Move("梢４", 0, @0, @136, null, true);
	SetAlias("梢４", "梢４");

}


function MemoryPre2()
{
	CreateColor("BlackMemory1", 6000, 0, 0, 1280, 720, "WHITE");
	Request("BlackMemory1", AddRender);
	SetAlias("BlackMemory1", "BlackMemory1");
	CreateColor("BlackMemory002", 4000, 0, 0, 1280, 720, "Black");
	SetAlias("BlackMemory002", "BlackMemory002");
	CreateTexture360("MemoryBack02", 1000, 0, 0, "cg/bg/bg074_01_2_ＭＨＶ前_a.jpg");
	SetAlias("MemoryBack02", "MemoryBack02");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１１", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("セナ１１", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_normal.png");
	}
	Fade("セナ１１", 0, 0, null, true);
	Move("セナ１１", 0, @0, @128, null, true);
	SetAlias("セナ１１", "セナ１１");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１１", 1000, Center, InBottom, "ex/st/st梢_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("梢１１", 1000, Center, InBottom, "cg/st/st梢_私服_通常_normal.png");
	}
	Fade("梢１１", 0, 0, null, true);
	Move("梢１１", 0, @0, @128, null, true);
	SetAlias("梢１１", "梢１１");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１２", 1000, Center, InBottom, "ex/st/st梢_私服_通常_下着_smile.png");
	}
	else
	{
		CreateTexture("梢１２", 1000, Center, InBottom, "cg/st/st梢_私服_通常_smile.png");
	}
	Fade("梢１２", 0, 0, null, true);
	Move("梢１２", 0, @0, @128, null, true);
	SetAlias("梢１２", "梢１２");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１２", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ１２", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_hard.png");
	}
	Fade("セナ１２", 0, 0, null, true);
	Move("セナ１２", 0, @0, @128, null, true);
	SetAlias("セナ１２", "セナ１２");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１３", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_angry.png");
	}
	else
	{
		CreateTexture("セナ１３", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_angry.png");
	}
	Fade("セナ１３", 0, 0, null, true);
	Move("セナ１３", 0, @0, @128, null, true);
	SetAlias("セナ１３", "セナ１３");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１３", 1000, Center, InBottom, "ex/st/st梢_私服_通常_下着_angry.png");
	}
	else
	{
		CreateTexture("梢１３", 1000, Center, InBottom, "cg/st/st梢_私服_通常_angry.png");
	}
	Fade("梢１３", 0, 0, null, true);
	Move("梢１３", 0, @0, @128, null, true);
	SetAlias("梢１３", "梢１３");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１４", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ１４", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_hard.png");
	}
	Fade("セナ１４", 0, 0, null, true);
	Move("セナ１４", 0, @0, @128, null, true);
	SetAlias("セナ１４", "セナ１４");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１４", 1000, Center, InBottom, "ex/st/st梢_私服_通常_下着_sad.png");
	}
	else
	{
		CreateTexture("梢１４", 1000, Center, InBottom, "cg/st/st梢_私服_通常_sad.png");
	}
	Fade("梢１４", 0, 0, null, true);
	Move("梢１４", 0, @0, @128, null, true);
	SetAlias("梢１４", "梢１４");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１５", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_rage.png");
	}
	else
	{
		CreateTexture("セナ１５", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_rage.png");
	}
	Fade("セナ１５", 0, 0, null, true);
	Move("セナ１５", 0, @0, @128, null, true);
	SetAlias("セナ１５", "セナ１５");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ１６", 1001, Center, InBottom, "ex/st/stセナ_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("セナ１６", 1001, Center, InBottom, "cg/st/stセナ_私服_通常_normal.png");
	}
	Fade("セナ１６", 0, 0, null, true);
	Move("セナ１６", 0, @0, @128, null, true);
	SetAlias("セナ１６", "セナ１６");

	if(#下着パッチ==true)
	{
		CreateTexture("梢１５", 1000, Center, InBottom, "ex/st/st梢_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("梢１５", 1000, Center, InBottom, "cg/st/st梢_私服_通常_normal.png");
	}
	Fade("梢１５", 0, 0, null, true);
	Move("梢１５", 0, @0, @128, null, true);
	SetAlias("梢１５", "梢１５");
}



function MemoryPre3()
{
	CreateColor("BlackMemory3", 6000, 0, 0, 1280, 720, "WHITE");
	Request("BlackMemory3", AddRender);
	SetAlias("BlackMemory3", "BlackMemory3");
	CreateColor("BlackMemory006", 4000, 0, 0, 1280, 720, "Black");
	SetAlias("BlackMemory006", "BlackMemory006");
	CreateTexture360("MemoryBack03", 1000, 0, 0, "cg/bg/bg077_01_1_渋谷マクディ店内_a.jpg");
	SetAlias("MemoryBack03", "MemoryBack03");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ２１", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("セナ２１", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_normal.png");
	}
	Fade("セナ２１", 0, 0, null, true);
	Move("セナ２１", 0, @0, @136, null, true);
	SetAlias("セナ２１", "セナ２１");

	if(#下着パッチ==true)
	{
		CreateTexture("梢２１", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("梢２１", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_normal.png");
	}
	Fade("梢２１", 0, 0, null, true);
	Move("梢２１", 0, @0, @136, null, true);
	SetAlias("梢２１", "梢２１");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ２２", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_angry.png");
	}
	else
	{
		CreateTexture("セナ２２", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_angry.png");
	}
	Fade("セナ２２", 0, 0, null, true);
	Move("セナ２２", 0, @0, @136, null, true);
	SetAlias("セナ２２", "セナ２２");

	if(#下着パッチ==true)
	{
		CreateTexture("梢２２", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_shy2.png");
	}
	else
	{
		CreateTexture("梢２２", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_shy2.png");
	}
	Fade("梢２２", 0, 0, null, true);
	Move("梢２２", 0, @0, @136, null, true);
	SetAlias("梢２２", "梢２２");

	if(#下着パッチ==true)
	{
		CreateTexture("梢２３", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_sad.png");
	}
	else
	{
		CreateTexture("梢２３", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_sad.png");
	}
	Fade("梢２３", 0, 0, null, true);
	Move("梢２３", 0, @0, @136, null, true);
	SetAlias("梢２３", "梢２３");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ２３", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_hard.png");
	}
	else
	{
		CreateTexture("セナ２３", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_hard.png");
	}
	Fade("セナ２３", 0, 0, null, true);
	Move("セナ２３", 0, @0, @136, null, true);
	SetAlias("セナ２３", "セナ２３");

	if(#下着パッチ==true)
	{
		CreateTexture("セナ２４", 1001, Center, InBottom, "ex/bu/buセナ_私服_通常_下着_normal.png");
	}
	else
	{
		CreateTexture("セナ２４", 1001, Center, InBottom, "cg/bu/buセナ_私服_通常_normal.png");
	}
	Fade("セナ２４", 0, 0, null, true);
	Move("セナ２４", 0, @0, @136, null, true);
	SetAlias("セナ２４", "セナ２４");

	if(#下着パッチ==true)
	{
		CreateTexture("梢２４", 1000, Center, InBottom, "ex/bu/bu梢_私服_通常_下着_shy.png");
	}
	else
	{
		CreateTexture("梢２４", 1000, Center, InBottom, "cg/bu/bu梢_私服_通常_shy.png");
	}
	Fade("梢２４", 0, 0, null, true);
	Move("梢２４", 0, @0, @136, null, true);
	SetAlias("梢２４", "梢２４");
}




/*回想プロセス作成*/
function Memory1()
{
	Fade("@BlackMemory", 0, 1000, null, true);
	Fade("@BlackMemory000", 0, 400, null, true);
	Fade("@MemoryBack01", 0, 400, null, true);

	Move("@セナ１", 0, @-176, @0, null, true);
	Move("@梢１", 0, @+176, @0, null, true);
	Fade("@セナ１", 0, 1000, null, true);
	Fade("@梢１", 0, 1000, null, true);
	Fade("@BlackMemory", 500, 0, null, true);


	Move("@セナ２", 0, @-176, @0, null, true);
	Fade("@セナ２", 500, 1000, null, true);
	Delete("@セナ１");
	Wait(1000);

	Move("@梢２", 0, @+176, @0, null, true);
	Fade("@梢２", 500, 1000, null, true);
	Delete("@梢１");
	Wait(1500);

	Move("@梢３", 0, @+176, @0, null, true);
	Fade("@梢３", 500, 1000, null, true);
	Delete("@梢２");
	Wait(1500);

	Move("@セナ３", 0, @-176, @0, null, true);
	Fade("@セナ３", 500, 1000, null, true);
	Delete("@セナ２");
	Wait(1500);

	Move("@セナ４", 0, @-176, @0, null, true);
	Fade("@セナ４", 500, 1000, null, true);
	Delete("@セナ３");
	Wait(1500);

	Move("@梢４", 0, @+176, @0, null, true);
	Fade("@梢４", 500, 1000, null, true);
	Delete("@梢３");
}


function Memory2()
{
	Fade("@BlackMemory1", 0, 1000, null, true);
	Fade("@BlackMemory002", 0, 400, null, true);
	Fade("@MemoryBack02", 0, 400, null, true);

	Move("@セナ１１", 0, @-120, @0, null, true);
	Move("@梢１１", 0, @+120, @0, null, true);
	Fade("@セナ１１", 0, 1000, null, true);
	Fade("@梢１１", 0, 1000, null, true);
	Fade("@BlackMemory1", 500, 0, null, true);


	Move("@梢１２", 0, @+120, @0, null, true);
	Fade("@梢１２", 500, 1000, null, true);
	Delete("@梢１１");
	Wait(1500);

	Move("@セナ１２", 0, @-120, @0, null, true);
	Fade("@セナ１２", 500, 1000, null, true);
	Delete("@セナ１１");
	Wait(1500);

	Move("@セナ１３", 0, @-120, @0, null, true);
	Fade("@セナ１３", 500, 1000, null, true);
	Delete("@セナ１２");
	Wait(1500);

	Move("@梢１３", 0, @+120, @0, null, true);
	Fade("@梢１３", 500, 1000, null, true);
	Delete("@梢１２");
	Wait(1500);

	Move("@セナ１４", 0, @-120, @0, null, true);
	Fade("@セナ１４", 500, 1000, null, true);
	Delete("@セナ１３");
	Wait(1500);

	Move("@梢１４", 0, @+120, @0, null, true);
	Fade("@梢１４", 500, 1000, null, true);
	Delete("@梢１３");
	Wait(1500);

	Move("@セナ１５", 0, @-120, @0, null, true);
	Fade("@セナ１５", 500, 1000, null, true);
	Delete("@セナ１４");
	Wait(1500);

	Move("@セナ１６", 0, @-120, @0, null, true);
	Fade("@セナ１６", 500, 1000, null, true);
	Delete("@セナ１５");
	Wait(1500);

	Move("@梢１５", 0, @+120, @0, null, true);
	Fade("@梢１５", 500, 1000, null, true);
	Delete("@梢１４");
}

function Memory3()
{
	Fade("@BlackMemory3", 0, 1000, null, true);
	Fade("@BlackMemory006", 0, 400, null, true);

	Move("@セナ２１", 0, @-176, @0, null, true);
	Move("@梢２１", 0, @+176, @0, null, true);
	Fade("@セナ２１", 0, 1000, null, true);
	Fade("@梢２１", 0, 1000, null, true);
	Fade("@BlackMemory3", 500, 0, null, true);


	Move("@セナ２２", 0, @-176, @0, null, true);
	Fade("@セナ２２", 500, 1000, null, true);
	Delete("@セナ２１");
	Wait(1000);

	Move("@梢２２", 0, @+176, @0, null, true);
	Fade("@梢２２", 500, 1000, null, true);
	Delete("@梢２１");
	Wait(1500);

	Move("@梢２３", 0, @+176, @0, null, true);
	Fade("@梢２３", 500, 1000, null, true);
	Delete("@梢２２");
	Wait(1500);

	Move("@セナ２３", 0, @-176, @0, null, true);
	Fade("@セナ２３", 500, 1000, null, true);
	Delete("@セナ２２");
	Wait(1500);

	Move("@セナ２４", 0, @-176, @0, null, true);
	Fade("@セナ２４", 500, 1000, null, true);
	Delete("@セナ２３");
	Wait(1500);

	Move("@梢２４", 0, @+176, @0, null, true);
	Fade("@梢２４", 500, 1000, null, true);
	Delete("@梢２３");
}