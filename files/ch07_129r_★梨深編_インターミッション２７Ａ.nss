//<continuation number="150">

chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_129r_★梨深編_インターミッション２７Ａ";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	ch07_129r_★梨深編_インターミッション２７Ａ();
}


function ch07_129r_★梨深編_インターミッション２７Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梨深編
//２周目梨深編追加インターミッション２７Ａ

//梨深編突入フラグが立っている場合、“ch07_129_インターミッション２７”を以下のものへと差し替え。

//※※３６０以下
//アイキャッチ
//■インターミッション２７Ａ

	ChapterIn("dx/mvF.avi");	

//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_03_4_拓巳部屋_a.jpg");
	Fade("back01", 0, 1000, null, true);

	ChapterIn2();

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
咲畑梨深は、薄暗い部屋の真ん中で、うなだれ、立ち尽くしていた。
部屋の主である西條拓巳――タクは、今はここにはいない。
扉の鍵はかかっていなくて、簡単に侵入できた。

梨深はケータイで時間を確かめる。午後１０時少し前。

――まだタクは、スクランブル交差点にいるのかな。

できれば助けに行きたかった。実際に助けに行こうとした。

だがスクランブル交差点に近づこうとすればするほど、人の数は多くなっていって、ついにはほとんど身動きが取れないような状況になった。

結局、Ｏ－ＦＲＯＮＴにたどり着く前に“エスパー少年のショー”は終わってしまい、それと時を同じくして、タクミからの声が聞こえてきたのだ。

七海の手首を取り戻してきてほしい、という懇願。

タクミが梨深になにかを頼んでくるなんて、珍しいことだった。
七海は今、ＮＯＺＯＭＩに連れ去られて酷い目に遭わされている。タクミは思考盗撮の末に、その事実を突き止めていた。

梨深も七海とは過去に面識があったから、それを知ったときには胸が張り裂けそうな想いだった。

ソファの上に置かれた段ボール。その中に収められている、手首と、七海のケータイと、かわいらしいバングル。
それを見て、梨深は言葉を失ってしまった。

悔しくて、悲しくて、七海が心配で。

そして同時に、かつて自分が味わった苦しみの記憶が、頭の中でフラッシュバックしてきて。

梨深はきつく唇を噛み、その手首をしばらくの間、見つめ続けた。

一度深く深呼吸して、なんとか落ち着きを取り戻すと、段ボールのふたをそっと閉める。ガムテープでしっかりと封をしてから、脇に抱えて部屋を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360201","SE_日常_扉_開ける");
	MusicStart("SE360201",0,1000,0,1000,null,false);


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Wait(2000);

	CreateSE("SE360301","SE_日常_扉_閉まる");
	MusicStart("SE360301",0,1000,0,1000,null,false);

	Delete("back01");

	Wait(2000);

//～～Ｆ・Ｏ


//ＢＧ//コンテナ外観・夜
//ＳＥ//ケータイ操作音
	CreateSE("SE01","SE_日常_けい帯操作");
	MusicStart("SE01", 500, 1000, 0, 1000, null, false);
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");
	Fade("back02", 0, 1000, null, true);

	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
ケータイを取り出し、ワンセグでテレビに繋ぐ。
ついさっきまで、スクランブル交差点からの生中継をやっていた。それを確認したかった。

けれど、該当するチャンネルに合わせても、延々とＣＭが流れ続けるだけ。

どうやら生中継は終わってしまったらしい。

ということは、タクはもうあのスクランブル交差点にはいないだろう。
やむなく梨深はタクミのいる、いつもの病室へ戻るしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//将軍の病室・夜
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Delete("back02");

//▼べー：ＢＧ：要差し替え
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg108_01_3_chn将軍病室_a.jpg");
	Fade("back03", 0, 1000, null, true);

	FadeDelete("Black", 1000, true);

	Stand("st将軍_車椅子_通常","normal", 200, @-280);
	FadeStand("st将軍_車椅子_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
明かりが消されて、暗いままの病室。
タクミはいつものように、ベッドではなく車イスに腰掛けていた。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500010jn">
「七海の腕は……？」

{	Stand("st梨深_制服_正面","sad", 300, @+280);
	FadeStand("st梨深_制服_正面_sad", 500, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500020ri">
「うん。持ってきた」

梨深はそれが入った段ボールを、タクミに差し出す。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500030jn">
「ありがとう」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500040ri">
「治せるかな？　治せるよね？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500050jn">
「分からない……。でもこの病院なら、冷凍保存しておける設備がある」

ただ放置しておくよりは、冷凍保存する方がずっとマシだろう。
それでも治る保証なんてまったくない。
“彼”が暗にそう言っているように思えて――

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500060ri">
「大丈夫。きっと、治るよ」

梨深はあえて、前向きなことを口にした。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500070ri">
「きっと治るって、信じる」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500080ri">
「もっとも、その前に、七海ちゃんを助け出さなきゃいけないけど」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500090jn">
「……七海は殺されることはないと思う。焦って動くことはないよ」

{	Stand("st梨深_制服_正面","hard", 300, @+280);
	FadeStand("st梨深_制服_正面_hard", 300, false);
	DeleteStand("st梨深_制服_正面_sad", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500100ri">
「冷静なんだね」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500110jn">
「…………」

{	Stand("st梨深_制服_正面","sad", 300, @+280);
	FadeStand("st梨深_制服_正面_sad", 300, false);
	DeleteStand("st梨深_制服_正面_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500120ri">
「……ごめん。今言った言葉は、忘れて」

{	Stand("st梨深_制服_通常","hard", 300, @+280);
	DeleteStand("st梨深_制服_正面_sad", 300, false);
	FadeStand("st梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500130ri">
「それより、タクは今どこにいるか、分かる？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/00500140jn">
「この病院に搬送されてきたよ。精神科の病室で眠ってる」

{	Stand("st梨深_制服_通常","shock", 300, @+280);
	FadeStand("st梨深_制服_通常_shock", 300, false);
	DeleteStand("st梨深_制服_通常_hard", 300, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/00500150ri">
「そうなの！？」

梨深は目を丸くすると、すぐさま病室を飛び出していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＢＧ//ＡＨ廊下・夜
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Delete("back03");

	DeleteStand("st梨深_制服_通常_shock", 0, false);
	DeleteStand("st将軍_車椅子_通常_normal", 0, false);

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg099_01_3_AH廊下_a.jpg");
	Fade("back04", 0, 1000, null, true);

	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
すでに面会時間が過ぎて照明が落とされた廊下を、足音を忍ばせて歩く。
この病院のスタッフに、ＮＯＺＯＭＩや天成神光会の関係者がいることは、すでに知っていた。だから目立つ行動はできない。

タクミから教えてもらった病室にたどり着くと、周囲に誰もいないことを確かめてから、梨深はゆっくりとドアを開いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360201","SE_日常_びょういんどあ_開く");
	MusicStart("SE360201",0,1000,0,1000,null,false);

	CreateSE("SE360202","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE360202",0,1000,0,1000,null,true);

//ＢＧ//白い病室
	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg103_01_1_白い病室_a.jpg");
	DrawTransition("back05", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("back04");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
そこは内装が白で統一された、温かみがこれっぽっちもない部屋だった。

梨深は音もなく、中央のベッドに歩み寄った。

そこで、タクが眠っていた。苦しげに眉根を寄せ、たまにうめき声を漏らしている。額は汗でびっしょりだ。

梨深はそんなタクの頬を、そっと撫でて――

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch07/13000220ri">
「ごめんね、あなたを、守ってあげられなくて」

いたたまれない気持ちで、そうつぶやいていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 1000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);

//アイキャッチ
//※拓巳視点に戻る
//※※３６０以上

//この後、“ch07_130_１０月２８日火”へ
	Delete("*");
}
