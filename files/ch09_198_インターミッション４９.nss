//<continuation number="230">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_198_インターミッション４９";
		$GameContiune = 1;
		Reset();
	}

		ch09_198_インターミッション４９();
}


function ch09_198_インターミッション４９()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	DeleteAll();

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

	IntermissionIn2();


//アイキャッチ
//■インターミッション４９

//ＢＧ//黒

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800010hd">
「神光の救いあれ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 300, 0, 1000, 500, null, "cg/data/爆発.png", true);
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);
	CreateBG(100, 800, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//ＢＧ//ＡＨ東京総合病院・手術室
葉月志乃は、勤務するＡＨ東京総合病院の手術室に立っている。
深夜。外科の手術室。

ベッドの上には、若い男――近衛千鶴男――の姿がある。
彼は睡眠薬を盛られて意識混濁状態だった。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800020hd">
「神光の救いあれ……」

念仏のように同じ言葉を何度もつぶやき、葉月は自らの大きく膨らんだお腹をさすった。

{	CreateSE("SE05","SE_じん体_動作_のぞく");
	MusicStart("SE05", 0, 500, 0, 1000, null, false);}
おもむろに白衣をはだけ。
手術台に腰掛けて、メスを手にする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	if($葉月メガネ == 1)
	{
		CreateBG(100, 500, 0, 0, "cg/ev/ev088_02_4_葉月救いあれ_a.jpg");
	}else
	{
		CreateBG(100, 500, 0, 0, "cg/ev/ev088_01_4_葉月救いあれ_a.jpg");
	}

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆恍惚
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800030hd">
「はあ、はあ……救いあれ……」

{	CreateSE("SE05","SE_擬音_杭_突きささる");
	MusicStart("SE05", 0, 500, 0, 1000, null, false);}
そして麻酔もなしに、自らの腹を切り裂いた。

それは、外科や産科の医師が見れば、
誰もが天才的だと賞賛するような手腕だった。

看護師でありながら、驚くほどの外科施術能力を有し、しかも自らの身体を麻酔なしで切り裂くことによる痛みに耐えながら、葉月は見事な手際で腹部を切開していく。

{	CreateSE("SE02","SE_じん体_手首_たれる血");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
血と、羊水を傷口から垂れ流し。
苦痛に顔を歪めながら。
やがて葉月は、自らの手を腹部へと挿入し。

血まみれの胎児を、取り上げた。

その胎児は、まだ完全には成長しておらず、無理矢理取り上げられたことで、すでに息絶えていた。

葉月はヘソの緒を切り、自らの子供を愛おしげに抱きしめてから、手術台の横にある台に置き、傷口の縫合にかかる。

１時間もかからずにその措置を終えた彼女は、腹部に尋常ではないほどの――常人ならとっくに気絶していただろう――激痛を抱えながら、

手術台から立ち上がり、胎児を抱いて、ベッドに横たわる男の傍らに立った。

{	CreateSE("SE360101","SE_じん体_血_噴きでる_包丁でさされ");
	MusicStart("SE360101",0,1000,0,1000,null,false);}
充血した目で、意識のない男の顔を見下ろすと。
おもむろに、メスを男の腹に突き刺す。

それは、自らの腹を裂いたときの繊細さや正確さとはおよそかけ離れた、乱暴な手つきだった。

{	CreateSE("SE360201","SE_日常_物音");
	MusicStart("SE360201",0,1000,0,1000,null,false);}
痛みで男が目を覚ます。
しかし彼の両手両足は、ベッドの足にしっかりと結ばれているため、逃れる術はなかった。

泣き叫ぶ男に構わず、葉月は突き刺したメスを引く。
肉を、皮膚を、切り裂く。
血が噴き出し、彼女の顔にかかる。

//◆恍惚
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800040hd">
「ふふ……神光の救いを、あなたに……」

被害者の傷口に、彼女の両手がかかる。

無理矢理、と言っていいほどの強引さで、左右に傷口を広げる。肉が裂ける音が手術室に響く。

男は身体を痙攣させ、気絶しては痛みで目を覚ますのを繰り返した。

十分に開いた傷口を見て、葉月は優しく微笑む。
そして、ついさっき取り上げた自らの子を、その傷口の中に――

強引に、押し込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 1000, 0, NULL);
	SetVolume("SE360201", 1000, 0, NULL);


//ＳＥ//ブチュブチュグチャグチャ
	CreateSE("SE01","SE_擬音_肉手を突っ込む");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(4000);

	SetVolume("SE01", 1000, 0, NULL);

//アイキャッチ
	IntermissionIn();

	DeleteAll();

//ＢＧ//黒
	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

	IntermissionIn2();

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800050hd">
「神光の救いあれ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 300, 0, 1000, 500, null, "cg/data/爆発.png", true);
	CreateSE("SE01","SE_はいけい_白いびょう室_LOOP");
	MusicStart("SE01", 500, 500, 0, 1000, null, true);
	CreateBG(100, 800, 0, 0, "cg/bg/bg191_01_4_手術台上_a.jpg");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//ＢＧ//ＡＨ東京総合病院・手術室
葉月志乃は、勤務するＡＨ東京総合病院の手術室に立っている。
深夜。外科の手術室。

ベッドの上には、彼女の同僚でもある精神科医――高科史男――の姿がある。

彼はベッドに縛り付けられていた。
だが、ただ縛り付けられているだけではなかった。

その頭部は、脳がむき出しになっている。
頭蓋骨は目の上でキレイにカットされていた。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800060hd">
「高科先生に、神光の救いあれ……」

//【高科】
<voice name="高科" class="高科" src="voice/ch09/19800070tk">
「は、葉月くん……こ、こんなことは……やめろ……」

高科には意識があった。
麻酔が効いているため、頭部の痛みは感じていないようだった。
その目は恐怖に見開かれ、全身から脂汗を流している。

//◆恍惚
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800070hd">
「はあ、はあ……救いあれ……」

高科の命乞いを無視し、葉月はおもむろに、銀色に光る器具を白衣のポケットから取り出す。

それは、正しくは器具ではなかった。

スプーン。
食卓にあるような、なんの変哲もない食器。

//【高科】
<voice name="高科" class="高科" src="voice/ch09/19800090tk">
「なにを……するつもりだ……」

//【高科】
<voice name="高科" class="高科" src="voice/ch09/19800100tk">
「よせ、やめろ……」

葉月は恍惚の表情を浮かべると、
カレーライスをすくうかのように、高科の脳をスプーンで削り取った。

//【高科】
<voice name="高科" class="高科" src="voice/ch09/19800110tk">
「あ……あ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ベチャッ！
	CreateSE("SE02","SE_擬音_脳みそ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
それを、ステンレス製トレーの上に、叩き付けるようにスプーンから振り落とす。
ピンク色をした脳組織が、トレーの上でゼリー状に潰れた。

葉月は再び、脳にスプーンを突き刺す。
今度は最初よりも山盛りにして、脳組織を削り取った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//ＳＥ//ベチャッ！
	CreateSE("SE02","SE_擬音_脳みそ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
高科は自らの脳をこそぎ取られていきながらも、痛みも感じず、意識を失うこともできない。麻酔によって身体の自由も効かないため、ただ恐怖に打ち震えるしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//ベチャッ！
	CreateSE("SE02","SE_擬音_脳みそ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);


	SetVolume("SE01", 1000, 0, NULL);

	Wait(1000);


	ClearAll(1000);
//～～Ｆ・Ｏ

//ＢＧ//黒

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800120ta">
「これが、あなたの記憶……なんですね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE360101","SE_はいけい_すくらんぶる交差点ガヤ_ぴりぴり_LOOP");
	MusicStart("SE360101",2000,200,0,1000,null,true);

//ＣＧ管理用フラグ
	#bg165_03_3_OFRONT見上げ_a=true;

	CreateBG(100, 500, 0, 0, "cg/bg/bg165_03_3_O-FRONT見上げ_a.jpg");
	Stand("st志乃_白衣_通常","cool", 200, @0);
	FadeStand("st志乃_白衣_通常_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//ＢＧ//スクランブル交差点//夜
葉月志乃は、愕然とした想いで、その映像を見上げていた。

スクランブル交差点の、４つの巨大街頭ビジョン。

そこに、彼女自身の記憶が、映像として流されている。
いったいどうやったのか、彼女には理解できなかった。
おそらくは、ギガロマニアックスの、西條拓巳の、力。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800130ta">
「あなたの……記憶です……」

ディソードを手にした西條拓巳が、うなだれたまま、つぶやく。

暴動は、あっという間に収束していた。
今は静寂に支配されている。

ついさっきまで誰彼構わず殴り合っていた何千人という人々は、皆、一様に街頭ビジョンを見上げていた。

蒼白になり、目をそらす者。
あまりのおぞましさに、嘔吐する者。

マスコミたちは、カメラで葉月の姿を捉えようとする。
まばゆいフラッシュが何度もたかれる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800140ta">
「あなたが、ニュージェネ事件の、真犯人、だったんだ……っ」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800150hd">
「……私の記憶を、映像に投影したんですね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800160ta">
「もう、言い逃れは、できませんよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800170ta">
「胎児と、あなたの、ＤＮＡを鑑定すれば、分かることです……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800180hd">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800190ta">
「どうして、あんなことを……？　ねえ、グリム……！」

{	SetVolume("SE360101", 2000, 0, null);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800200hd">
「……ナイトハルト……」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800210hd">
「すべては、教祖様のお言葉なんですよ」

葉月は肩にかけていたハンドバッグの中に、おもむろに手を突っ込んだ。

そこには、ノアⅡの端末ポートと、
手術用のメスが入っていた。

メスをつかみ、その刃先を自らの首に添える。
看護師という職業柄、頸動脈の場所はよく知っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st志乃_白衣_通常_cool", 500, true);
	Stand("bu志乃_白衣_通常","cool2", 200, @0);
	FadeStand("bu志乃_白衣_通常_cool2", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19800220ta">
「……！」

葉月は西條拓巳に、笑みを向けた。
患者に対するような、その優しげな笑みは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("back11", 500, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	DrawTransition("back11", 500, 0, 1000, 500, null, "cg/data/up2.png", true);
	DeleteStand("bu志乃_白衣_通常_cool2", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603006]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch09/19800230hd">
「神光の救いあれ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＢＧ//赤
//ＳＥ//首を掻き切る
//ＳＥ//血が噴き出す
	CreateSE("SE01","SE_じん体_動作_手_棒を振り回す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", 500);

	CreateSE("SE02","SE_じん体_血_噴きでる_包丁でさされ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	Wait(500);

	CreateColor("back10", 500, 0, 0, 1280, 720, "RED");
	DrawTransition("back10", 300, 0, 1000, 100, null, "cg/data/zoom1.png", false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
噴き出した彼女自身の血によって、赤く塗り潰された。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	ClearAll(2000);

	Wait(2500);

//～～Ｆ・Ｏ
//■インターミッション４９終了


}