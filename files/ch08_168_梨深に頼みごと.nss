//<continuation number="80">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_168_梨深に頼みごと";
		$GameContiune = 1;
		Reset();
	}

		ch08_168_梨深に頼みごと();
}


function ch08_168_梨深に頼みごと()
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

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg005_01_2_KURENAI見上げ_a.jpg");
	Fade("背景１", 2000, 1000, null, true);

	Wait(1000);

	CreateSE("SE01","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE01", 2000, 1000, 0, 1000, null, true);

//ＢＧ//ＫＵＲＥＮＡＩ会館ビル・外観//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
三住くんとは駅で別れ、ベースまで戻ってきた。

その間、ずっと悪夢の中をさまよっているような気分だった。

頭の中で、七海のいろいろな表情が浮かんでは消えていく。

七海はストレートに感情を表に出すヤツだ。

怒ったときはブスーッと頬を膨らませるし、嬉しいときは見ているこっちが恥ずかしくなるくらいニコニコする。

記憶の中にあるそうした表情のひとつひとつが、僕の心をざわつかせる。

さっきの電話。
七海が伝えてきた言葉の意味は、いったいなんなのか……。

やっぱり、この前学校で見たときに七海が腕に巻いていた、あの包帯は……。

七海は、今どこにいるんだろう。
学校……？
それとももう家に帰ってるのかな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ＫＵＲＥＮＡＩ会館屋上//夕方


	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, true);
	Fade("色１", 1000, 1000, null, true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");

	Wait(1000);
	Fade("色１", 1000, 0, null, true);
	Delete("色１");

	Wait(1000);
	Stand("bu梨深_制服_正面","normal", 250, @50);
	Stand("bu梨深_制服_通常","normal", 250, @50);

	FadeStand("bu梨深_制服_正面_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16800010ri">
「タク、ほら、前見て歩かないと。転んじゃうよ」

梨深に支えられるようにして、屋上に出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16800020ta">
「あ、の……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16800030ri">
「どうしたの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16800040ta">
「……こ、これから、実家に、か、帰ってみようと、おも、思うんだ」

{	DeleteStand("bu梨深_制服_正面_normal", 200, false);
	FadeStand("bu梨深_制服_通常_normal", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch08/16800050ri">
「これから？　急だね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16800060ta">
「あ、歩いても、３０分も、かからないところなんだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16800070ta">
「そ、それで、その……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/16800080ta">
「一緒に、つ、ついてきて、ほしい……」

心臓が飛び出すぐらい緊張しながら、梨深にそうお願いする。口に出してそう言えたことに自分でも少し驚いた。

人になにかを頼むなんて、今までの僕にはできなかったことだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("３９");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();
}