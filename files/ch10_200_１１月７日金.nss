//<continuation number="960">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_200_１１月７日金";
		$GameContiune = 1;
		Reset();
	}

		ch10_200_１１月７日金();
}


function ch10_200_１１月７日金()
{

	$SYSTEM_last_text="第１０章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//Ｃｈａｏｓ；Ｈｅａｄ　第１０章

//――――――――――――――――
//■第１０章【blue sky】


//１１月７日（金）//日付は表示しない
//ＳＥ//波の音
//ＢＧ//海と青い空
//※将軍の精神世界です

	if($Ｂルート||$ChapterJump){
		ChapterIn("dx/mvK.avi");
	}else{
		ChapterIn("dx/mvJ.avi");
	}
		DeleteAll();

		CreateTextureEX("back01", 100, 0, 0, "cg/bg/bg113_01_6_海と青い空_a.jpg");
		Fade("back01", 0, 1000, null, true);

		CreateSE("SE01","SE_自然_なみ音_LOOP");
		MusicStart("SE01", 1200, 1000, 0, 1000, null, true);

	ChapterIn2();

	WaitKey(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕は、水の上に立っていた。
とても澄んだ、透明な水。

くるぶしまでしかない、浅瀬。
冷たさは感じない。

波の音が、耳に断続的にささやきかけてくる。

手に握りしめているのは、車椅子のグリップ。

『将軍』……いや、本物の西條拓巳の、ニット帽を被った頭が、すぐ目の前にある。
彼は、少し猫背気味に車椅子に座っていた。

周囲には、なにもなかった。

例えば砂の中に埋もれている貝殻とか、空を優雅に飛んでいる海鳥とか、そうしたものもまったく見られない。

生命の気配がないんだ。
あるのは、青い海と、澄み切った空だけ。

地形はフラットで、３６０度、どっちを向いても水平線を見渡すことができる。

ここは、現実の世界じゃない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu将軍_車椅子_通常","normal", 200, @0);
	FadeStand("bu将軍_車椅子_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000010jn">
「僕はね、近いうちに、死ぬんだ」

砕ける波濤の音に混じって、将軍の声が聞こえた。

僕の立っている位置からは、彼の表情はうかがい知れない。

特に悲壮感に満ちた声音でもなく。
ホントに、何気なく言ったっていう感じだった。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000020jn">
「この身体を見てもらえれば、分かると思うけど」

小さくて、皺だらけで、痩せ細り。
髪はすべて抜け落ちてしまっている。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000030jn">
「先天的な病なんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000040jn">
「僕の身体の成長は、発症した１０歳の段階で止まってる」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000050jn">
「そして……老化してる」

いわゆる早老症っていうものかな。
８００万人にひとりぐらいの割合で発症する、珍しい病だったはずだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000060ta">
「１０歳、って……」

記憶に刻まれている、ある凄惨な光景が浮かび上がってくる。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000070jn">
「あのバス事故の、３ヶ月ぐらい前だよ。僕が発症したのは」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000080ta">
「バス事故は、君が……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000090jn">
「……そうかもしれない。あのときはまだ、自分の力についてほとんど自覚はなかったけど」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000100ta">
「…………」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000110jn">
「病が発症するよりずっと前……それこそ、物心ついたときから、僕はギガロマニアックスとしての力を使うことができた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000120jn">
「それが、普通のことだと思ってたよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000130jn">
「意識的にしろ、無意識的にしろ、僕はこれまで何度も力を使ってきた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000140jn">
「だから、僕の存在としての“矛盾”が大きくなりすぎちゃったんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000150jn">
「蒼井セナから、聞いてるだろう？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);

	CreateColor("back10", 600, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 300, 1000, null, true);

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back03", 300, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
	Stand("bu梢_制服_正面","normal", 400, @+320);
	FadeStand("bu梢_制服_正面_normal", 0, false);
	Stand("buセナ_制服_通常","hard", 450, @-320);
	FadeStand("buセナ_制服_通常_hard", 0, true);

	Fade("back10", 300, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000160sn">
「粒子とともに対生成される反粒子は、ディソードにストックされていくんだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000170sn">
「反粒子は数学的に言えば“過去へ向かうもの”だから」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000180sn">
「ストックすればするほど、ギガロマニアックスには“現在の状態とのずれ”が発生し――」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000190sn">
「やがてその矛盾により、存在としての自己崩壊へ至る」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 100, 1000, null, true);
	Delete("back03");
	Delete("back11");
	DeleteStand("bu梢_制服_正面_normal", 0, false);
	DeleteStand("buセナ_制服_通常_hard", 0, false);
	Fade("back10", 500, 0, null, true);
	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
将軍は車椅子の上で、微動だにしない。
なにを、見ているんだろう。
見えているんだろうか。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000200jn">
「力を使えば使うほど、この病は進行しちゃうんだ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000210ta">
「ギガロマニアックスの力で治せばいいじゃないか」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000220jn">
「力を使えば病は進行する。端的に言えば、力を使っても、プラスマイナスゼロっていうことさ。なにも変わらない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000230ta">
「……どうして」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000240ta">
「どうして、僕みたいな、キモオタの、ヘタレ野郎を作ったの？　もっと、強くて、行動的で、かっこいいイケメンにすればよかったのに……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000250jn">
「人をひとり――しかもギガロマニアックスの力を使える人間を生み出すのは、簡単なことじゃなかった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000260jn">
「君を生み出したことで、１年近く昏睡しちゃったくらいだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000270ta">
「……僕は未完成だったってわけ？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000280jn">
「だからこそ、君はとても人間らしい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000290ta">
「フォローしなくてもいい」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000300jn">
「本心だよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
僕は舌打ちした。
やっぱり、僕は、こいつが嫌いだ。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000310jn">
「梨深にはいつも、力を使うなって怒られたよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000320ta">
「彼女は、君を、助けたいんでしょ？」

//◆かすかに笑う
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000330jn">
「…………」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000340jn">
「でも、僕は梨深の忠告に従うわけにはいかない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000350jn">
「今の危機的状況は、僕のＩｒ２がきっかけなんだから」

Ｉｒ２……。
あの、作文用紙の裏に描かれた、奇妙な落書き。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000360jn">
「Ｉｒ２は、ある科学者の目に留まり、やがて希テクノロジー社によって研究が始められた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000370jn">
「それが、プロジェクト・ノア」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000380jn">
「言ってみれば、人工的にギガロマニアックスの能力を発生させる装置」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000390jn">
「僕が計画に気付くことができたのは、梨深と出会ったからなんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000400jn">
「彼女がひどい拷問を受けていたのは、そのプロジェクトの一環だった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000410jn">
「ノアのシステムを効率化するために必要だったのが、ＣＯＤＥサンプル」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000420jn">
「ギガロマニアックスが力を使う過程で放出する、特殊な脳波のこと」

//◆希＝のぞみ
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000430jn">
「それを手に入れるために、希の社長――野呂瀬は、梨深に過酷な拷問を加えた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000440jn">
「強烈な負の感情を抱くとき、ギガロマニアックスは力に覚醒し、ディソードを獲得するからね」

また、僕はセナの言葉を思い出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);

	CreateColor("back10", 600, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 300, 1000, null, true);

	CreateColor("back11", 500, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back03", 300, 0, 0, "cg/bg/bg093_01_2_井の頭通り交番前_a.jpg");
	Stand("bu梢_制服_武器構え青","sad", 400, @+320);
	FadeStand("bu梢_制服_武器構え青_sad", 0, false);
	Stand("buセナ_制服_食事減る","sigh", 450, @-320);
	FadeStand("buセナ_制服_食事減る_sigh", 0, true);

	Fade("back10", 300, 0, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//ＶＦ//回想セリフ
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000450sn">
「バイオリズムの上昇によって、中脳辺縁系ニューロンのドーパミンが過剰分泌されたとき、ディソードは現れる」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000460sn">
「それは危機的な状況や、興奮、悲しみ、憎しみ、笑いなど人それぞれだ」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch10/20000470sn">
「ドーパミン分泌量が多ければそれだけ観測しやすくなる」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 100, 1000, null, true);
	Delete("back03");
	Delete("back11");
	DeleteStand("bu梢_制服_武器構え青_sad", 0, false);
	DeleteStand("buセナ_制服_食事減る_sigh", 0, false);
	Fade("back10", 500, 0, null, true);
	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000480ta">
「君が、僕にちょっかいをかけてきたのも、そのため？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000490jn">
「うん。君を覚醒させるためにね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000500jn">
「ごめん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000510ta">
「…………」

梨深や僕だけじゃない。

プロジェクト・ノアのせいで精神的、あるいは肉体的拷問にかけられ、ギガロマニアックスとして覚醒させられたのは。

//◆※優愛は除外してあります
あやせだって。セナだって。こずぴぃだって。そして七海だって。ひどい目にあわされた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000520jn">
「Ｉｒ２から生み出されたノアⅡは、僕が、自分の手で、止めなくちゃならない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000530jn">
「でも僕はこんな身体だ。満足に動くこともできない」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000540jn">
「それに、僕のＣＯＤＥサンプルを欲しがる希から、
狙われるようにもなっちゃって」

ましてや、彼が入院していたのは、ＡＨ東京総合病院。
希グループと、裏で繋がりがある。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000550jn">
「だから、身を隠さなくちゃいけなかった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000560ta">
「幻の病室の“あみぃちゃん”か……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000570jn">
「あそこに入ってこられたのは、梨深だけだったよ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000580jn">
「僕は身動きが取れなくなって、それで――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000590ta">
「僕を、作ったのか……」

『将軍』は、かすかにうなずいた。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000600jn">
「梨深には、君を消すように何度も言われたんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000610jn">
「命を削る行為だから、やめろって」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000620jn">
「でも、僕に残された命は長くないから。力を使わなくたって、あまり差はないんだよね」

彼の声は、とても落ち着いていた。
何年も前から死を宣告された者だけが持つ、達観っていうものだろうか。

//※※３６０以下
//◆「保たない」＝「もたない」と読んでください
//【将軍】
//<voice name="将軍" class="将軍" src="voice/ch10/20000630jn">
<voice name="将軍" class="将軍" src="voice/chn00/01200010jn">
「それに、君が覚醒して力を使えるようになれば、僕の命はきっと、保たないだろうから」

//※※３６０以上
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000640ta">
「僕と君は、一心同体……っていうこと？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000650jn">
「そうだね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);
	CreateColor("back10", 400, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 300, 1000, null, true);
	CreateColor("back11", 300, 0, 0, 1280, 720, "Black");
	Fade("back11", 0, 300, null, false);
	CreateTexture360("back03", 200, 0, 0, "cg/bg/bg056_01_2_下北沢住宅街_a.jpg");
	Stand("bu梨深_制服_通常","hard", 200, @+150);
	FadeStand("bu梨深_制服_通常_hard", 0, false);
	Fade("back10", 300, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//ＶＦ//回想セリフ
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20000660ri">
「でも、ひとつだけ、約束」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20000670ri">
「“もう、妄想はしない”」

{	Stand("bu梨深_制服_通常","normal", 200, @+150);
	FadeStand("bu梨深_制服_通常_normal", 300, true);
	DeleteStand("bu梨深_制服_通常_hard", 0, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20000680ri">
「ね？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20000690ri">
「タクの妄想力は、とっても強いから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/20000700ri">
「妄想すればするほど、本物のあなたの命が、削られていっちゃうんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("back10", 500, 1000, null, true);
	Delete("back03");
	Delete("back11");
	DeleteStand("bu梨深_制服_通常_normal", 0, false);
	Fade("back10", 500, 0, null, true);
	CreateSE("SE01","SE_自然_なみ音_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);
	Delete("back10");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
梨深との約束を守ろうとすれば、僕は梨深を助けに行けない。行ったとしても、なにもできずに返り討ちにあうだろう。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000710ta">
「君の命は、あとどれぐらい保つ？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000720jn">
「きっと……今日か明日まで、じゃないかな」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000730ta">
「そこまで……！？」

予想以上に残された時間は短くて、呆然となった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000740ta">
「僕が、覚醒しちゃったから？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000750jn">
「気にしなくていいよ。君の覚醒は、僕にとって本望だから」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000760ta">
「君が死んだら、僕はどうなる？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000770jn">
「君は、僕と一心同体であると同時に、リアルブートされたことによって現実の人間になった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000780jn">
「生まれ方は特殊かもしれないけど、君は人間だよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000790ta">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000800ta">
「僕が消えれば、君は助かるの？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000810jn">
「無駄だよ。せいぜい、寿命が数日から数週間延びるぐらいじゃないかな」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000820jn">
「でも、そんな愚かな選択肢を選ぶのはやめるんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000830jn">
「君には、ノアⅡを破壊してほしい。そのために、力を使うことを遠慮しないでほしい」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000840ta">
「……言われなくても、分かってる」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000850ta">
「君に遠慮するほど、僕はお人好しじゃない」

//◆笑う
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000860jn">
「…………」

『将軍』が、わずかに肩を震わせて、笑った。
笑わせるつもりはなかったから、カチンと来る。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000870jn">
「君が、目覚めてくれて、よかった」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000880jn">
「勝手な話で迷惑かもしれないけど、後は、君に託すよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu将軍_車椅子_通常_normal", 500, true);
	Stand("st将軍_車椅子_通常","normal", 200, @0);
	FadeStand("st将軍_車椅子_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
ふと、握っていた車椅子のグリップの感触が消える。

{	DeleteStand("st将軍_車椅子_通常_normal", 500, true);}
いつの間にか、彼の座る車椅子が、ひとりでに僕から離れ、水の上を滑るように進んでいく。

ふたつの車輪が水を切り、波を作る。
追いかけるつもりはなかった。
僕はぼんやりと彼を見送る。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000890jn">
「僕の役目は、終わった」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000900ta">
「勝手だね。僕に丸投げ？」

//◆苦笑
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000910jn">
「少し、疲れちゃって。眠らせてよ」

彼が、車椅子の上で僕を振り返る。
相変わらず表情は読めない。
でも、声は切迫していた。

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000920jn">
「時間がない。急いで。野呂瀬は、ノアⅡを本格的に稼働させた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000930jn">
「こうなったら、ノアⅡを直接破壊するしかないんだ」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/20000940jn">
「頼んだよ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 2000, 500, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
そして彼の姿は、霧に包まれたかのように、消えていく。
この精神世界の色そのものが、ゆっくりと薄れていく。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000950ta">
「君に頼まれる筋合いなんてない」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20000960ta">
「僕は、僕自身が決めたことをやるだけ」

波の音が、遠ざかる。

どこまでも澄み切っている空を、かつての梨深のように、記憶に焼き付けてから。

僕はそっと、目を閉じた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, null);

	CreateColor("back11", 100, 0, 0, 1280, 720, "White");
	Fade("back11", 0, 0, null, false);
	Fade("back11", 1000, 1000, null, true);
	Delete("back01");
	Delete("back10");

	Wait(1000);

//ホワイトアウト
}