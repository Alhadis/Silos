//<continuation number="320">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_115_インターミッション２２";
		$GameContiune = 1;
		Reset();
	}

		ch06_115_インターミッション２２();
}


function ch06_115_インターミッション２２()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	Delete("*");
	ClearAll(0);

	//※※３６０以下
	//ＣＧの背景を赤い空に変更して下さい
	//※※３６０以上

	CreateColor("赤効果", 60, 0, 0, 1280, 720, "#FF2200");
	Fade("赤効果", 0, 850, null, true);
	Request("赤効果", MulRender);
	DrawTransition("赤効果", 0, 500, 500, 300, null, "cg/data/up.png", true);

	CreateTextureEX("背景１", 50, 0, 0, "cg/bg/bg050_01_1_学校屋上_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	CreateSE("SE02","SE_日常_雑踏02");
	CreateSE("SE03","SE_自然_風音_LOOP");
	MusicStart("SE02", 5000, 500, 0, 1000, null, true);
	MusicStart("SE03", 5000, 500, 0, 1000, null, true);


	IntermissionIn2();

//アイキャッチ
//■インターミッション２２

//イメージＢＧ//翠明学園屋上の縁から空を見る
//※↑はあやせ視点のような感じで


	Wait(1500);


	CreateTextureEX("背景２", 100, 0, 0, "cg/ev/ev065_01_1_あやせ投身_a.jpg");
	Fade("背景２", 1000, 1000, null, true);
	Delete("背景１");
	Delete("赤効果");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500010ay">
「その身体は邪心の影に潜む……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500020ay">
「目には映らない存在……」

岸本あやせは、風を感じていた。

冬の気配をかすかに含み始めた冷たい風。その風に身を任せている彼女の表情はとても苦しげで、玉のような汗が頬を伝っていく。

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500030ay">
「離れようとも、離れようとも……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500040ay">
「醒めぬ悪夢は……」

翠明学園の屋上は、高さが２メートル近くはある金網によって囲われている。あやせが今立っているのは、その金網の外側、わずか３０センチほどのスペース。

すでにその場に立って、１０分以上が経とうとしていた。

あと一歩でも前に踏み出せば、４階建ての校舎屋上から転落する。

下にはたくさんの生徒たちが集まっていて、
あやせのことを固唾を呑んで見守っていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500050ay">
「やがて剣となりて……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500060ay">
「この身を切り裂くのだろう……」

警察や救急隊にはすでに連絡済みではあったが、数時間前の地震の対応に追われているせいか、いまだこの場には到着していなかった。

もしもの場合に備えてマットを用意しようと、教師たちがオロオロと走り回っている。

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500070ay">
「無関心という名の盾で……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500080ay">
「戦火を免れる人々……」

けれど当のあやせは、そんな下の騒ぎなどとは無縁のように、背筋を伸ばして立ち尽くしていた。むしろ意識的に下界への関心を断ち切っているみたいにも見える。

空を見上げるように顎をそらし、両の瞳は閉じられていた。その姿はまるで天に祈りを捧げる巫女のようにも見える。

バランス感覚がいいのか、ちょっとした風ぐらいではそのスレンダーな身体はまったく揺るがなかった。

ましてや、自身の身長とほぼ同じ長さの巨大な剣を右手に持っているにもかかわらず、だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500090ay">
「新生なる戦場の敵は……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500100ay">
「心の内の悪意なる者……」

その剣――ディソードは、青白い光を息苦しそうに明滅させている。明滅とシンクロするように、あやせの口からは苦しげな吐息……そしてか細いささやきが漏れ出ていた。

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500110ay">
「悪意は時として意志を持ち……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500120ay">
「そして……その姿を……現す……」

そのささやきによって紡がれた詩は――
風によってすぐにかき消されていってしまう。

//※※３６０以下
//あやせは目を開き、渋谷のビル群の上に横たわるくすんだ色の空へと視線を巡らせた。
あやせは目を開き、渋谷のビル群の上に横たわる赤錆色の空へと視線を巡らせた。

//※※３６０以上
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500130ay">
「この世界は悪意の妄想に満ち溢れている……」

//◆苦しげ//他人＝ひと、と読んでください
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500140ay">
「みんな他人の不幸が大好き」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500150ay">
「目を閉じても、耳を塞いでも、だめ……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500160ay">
「昔からずっと……私のそばを離れてくれないわ」

彼女はつぶやきながら、巨大な剣を胸元に引き寄せた。

そっと両腕で抱きしめる。

不思議なことに、鋭利に見えるその剣は彼女の身体をまったく傷つけることはない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆苦しげ//還り＝かえり
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500170ay">
「還りたかった……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500180ay">
「大いなる意志が住む、もうひとつの世界に……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500190ay">
「そのために、心を切り刻んで、全部受け入れたわ」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500200ay">
「混沌の器としての……夢を」

あやせの表情が哀しみに歪む。
瞳から、静かに涙がこぼれ落ちた。

声もなく流したその雫はすぐに、風によって空中へと舞う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500210ay">
「だけど……グラジオールの胎動が活発化している……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500220ay">
「もう、時間がないのに……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500230ay">
「見つからない……見つからないのよ……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500240ay">
「天国の扉も、賢者も、導き手も、七つの神罰も」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500250ay">
「黒騎士の伝説は本当なの……？」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500260ay">
「詩はもうたくさん歌ったわ」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500270ay">
「それで足りないって言うなら……」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500280ay">
「ねえ、大いなる意志よ……」

あやせは、両腕をゆっくりと左右へと広げる。

空そのものを抱きしめようとするかのように。

遙かな高みにいる神に己の存在を示すかのように。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500290ay">
「私は、飛ぶわ」

剣の青白い脈動が、激しさを増す。

あやせは再び目を閉じる。その拍子に、目尻から最後の雫が溢れ出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500300ay">
「お願い、この器は、差し出すから」

//◆苦しげ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500310ay">
「魂を、連れていって」

そして、少女は――

なんの躊躇もなく一歩、足を前へと踏み出す――

そこにはもはや、少女の身を支えるものはなにもなく――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev065_02_1_あやせ投身_a.jpg");
	Fade("背景１", 500, 1000, null, true);

	CreateSE("SE05","SE_日常_雑踏02");
	MusicStart("SE05", 5000, 500, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch06/11500320ay">
「還るべき場所へ――」

//※※３６０以下
//冷たい風が頬を優しく撫でるのを感じて、あやせはすべてから解放された気分になった――
冷たい風が頬を優しく撫でるのを感じて。
眼下に目をやれば。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//おがみ：演出調整
	CreateTextureEX("扉閉まってる", 460, center, middle, "cg/sys/select3/door-001.png");
	CreateTextureEX("転落", 100, 0, 0, "cg/bg/bg903_01_6_屋上落下_a.jpg");

	CreateColor("黒幕", 200, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);

	Fade("黒幕", 500, 300, null, false);
	Fade("転落", 500, 1000, null, true);
	Fade("扉閉まってる", 2000, 1000, null, true);

	Wait(500);

	XBOX360_LockVideo(true);

	CreateTextureEX("背景１", 600, 0, 0, "cg/ev/ev065_02_1_あやせ投身_a.jpg");

	CreateColor("セカイ色１", 20550, 0, 0, 1280, 720, "WHITE");
	Request("セカイ色１", AddRender);
	Fade("セカイ色１", 0, 0, null, true);

//	CreateWindow("セカイウィンドウ１", 500, 550, 160, 210, 320, false);
//	CreateWindow("セカイウィンドウ１", 400, 538, 199, 200, 320, false);
	CreateWindow("セカイウィンドウ１", 400, 432, 160, 156, 248, false);
	CreateTexture("セカイウィンドウ１/選択肢１奥", 420, 0, -96, "cg/bg/bg113_01_6_海と青い空_a.jpg");
	Fade("セカイウィンドウ１/選択肢１奥", 0, 0, null, true);
	Request("セカイウィンドウ１/選択肢１奥", Smoothing);

	CreateTexture360("選択肢１＿００", 10100, center, middle, "cg/sys/select3/door-001.png");
	CreateTexture360("選択肢１＿０１", 10100, center, middle, "cg/sys/select3/door-002.png");
	CreateTexture360("選択肢１＿０２", 10100, center, middle, "cg/sys/select3/door-003.png");
	CreateTexture360("選択肢１＿０３", 10100, center, middle, "cg/sys/select3/door-004.png");
	CreateTexture360("選択肢１＿０４", 10100, center, middle, "cg/sys/select3/door-005.png");
	CreateTexture360("選択肢１＿０５", 10100, center, middle, "cg/sys/select3/door-006.png");
	CreateTexture360("選択肢１＿０６", 10100, center, middle, "cg/sys/select3/door-007.png");
	CreateTexture360("選択肢１＿０７", 10100, center, middle, "cg/sys/select3/door-008.png");
	CreateTexture360("選択肢１＿０８", 10100, center, middle, "cg/sys/select3/door-009.png");
	CreateTexture360("選択肢１＿０９", 10100, center, middle, "cg/sys/select3/door-010.png");
	CreateTexture360("選択肢１＿１０", 10100, center, middle, "cg/sys/select3/door-011.png");

	CreateSE("SE01","SE_擬音_YesNo選択_クリック");

	XBOX360_LockVideo(false);

//	Move("選択肢１＿*", 0, @0, @100, null, false);
	Zoom("セカイウィンドウ１/選択肢１奥", 0, 500, 500, null, false);
	Fade("選択肢１＿*",0,0,null,false);
	Fade("セカイウィンドウ１/選択肢１奥",0,0,null,true);

	Fade("セカイウィンドウ１/選択肢１奥",0,1000,null,true);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);


	$fadetime=80;
	$waittime=80;
	Fade("選択肢１＿０１",$fadetime,1000,null,false);
	Wait($waittime);
	Delete("扉閉まってる");
	Fade("選択肢１＿００",$fadetime,0,null,false);
	Fade("選択肢１＿０２",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０１",$fadetime,0,null,false);
	Fade("選択肢１＿０３",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０２",$fadetime,0,null,false);
	Fade("選択肢１＿０４",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０３",$fadetime,0,null,false);
	Fade("選択肢１＿０５",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０４",$fadetime,0,null,false);
	Fade("選択肢１＿０６",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０５",$fadetime,0,null,false);
	Fade("選択肢１＿０７",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０６",$fadetime,0,null,false);
	Fade("選択肢１＿０８",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０７",$fadetime,0,null,false);
	Fade("選択肢１＿０９",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０８",$fadetime,0,null,false);
	Fade("選択肢１＿１０",$fadetime,1000,null,false);
	Wait($waittime);
	Fade("選択肢１＿０９",$fadetime,0,null,false);
	Fade("選択肢１＿１０",0,0,null,false);

	Wait(1000);

	Delete("選択肢*");

//■３６０

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
迫り来るのは、空中に浮かぶ扉。
その扉の向こうに、あやせが求める“空”があった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



//※空中に浮かぶ扉が迫ってきて扉が開き、開いた先に青空。扉はＹＥＳ／ＮＯ分岐の扉を使用。淡く輝いていたりするといいかもです。周囲は真っ黒でいいです。
//※※３６０以上



//おがみ：扉演出――――――――――――――――――――――――――――――

	Move("背景１", 1300, @0, @-96, Axl2, false);
	Fade("背景１", 300, 1000, null, true);

	Wait(700);

	Fade("背景１", 200, 0, null, true);
	Delete("背景１");

	Fade("セカイ色１", 2000, 1000, null, Axl3);
		//■３６０
	Zoom("転落", 1000, 2000, 2000, Axl1, false);
		Zoom("選択肢*", 1000, 7000, 7000, Axl1, false);
		Zoom("セカイウィンドウ１/選択肢１奥", 1000, 7000, 7000, Axl1, false);
		Zoom("セカイウィンドウ１", 1000, 7000, 7000, Axl1, true);


//	Delete("セカイ*");

//おがみ：扉演出ここまで――――――――――――――――――――――――――――――
//～～Ｆ・Ｏ
	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(1000);
	Wait(1000);

//■インターミッション２２終了
//アイキャッチ


}
