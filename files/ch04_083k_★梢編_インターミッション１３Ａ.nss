//<continuation number="70">

chapter main
{

	$PreGameName = "boot_第四章";

	if($GameStart != 1)
	{
		$GameName = "ch04_083k_★梢編_インターミッション１３Ａ";
		$GameContiune = 1;
		$梢ルート=true;
		$RouteON=true;
		Reset();
	}

	ch04_083k_★梢編_インターミッション１３Ａ();
}


function ch04_083k_★梢編_インターミッション１３Ａ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★梢編
//２周目梢編追加インターミッション１３Ａ

//梢編突入フラグが立っている場合、“ch04_083_インターミッション１３”を以下のものと差し替え

//※※３６０以下
//アイキャッチ
//■インターミッション１３Ａ
//■アイキャッチIN
	IntermissionIn();

	DeleteAll();

//ＢＧ//学校校門・昼
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg016_02_0_学校校門_a.jpg");

//■アイキャッチOUT
	IntermissionIn2();

	CreateSE("SE01","SE_日常_校門前_朝");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	Wait(1000);

	Stand("st梢_制服_正面","sad", 200, @+180);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
午後の授業が終わり、放課後の弛緩した空気が校内に流れ始める時間。
折原梢は、１人トボトボと校門を出た。

うつむきがちに歩くその姿は、とても弱々しい。
表情も冴えず、キュッと眉をひそめているのが、まるで泣くのを我慢しているようにも見える。

梢は転校してきたばかりのこの学校で、孤立していた。
それは当然と言えば当然だった。

梢はほとんど――いや、まったく喋ろうとしない。

授業中、教師から問題を解くように指名されても、教科書を読むよう指名されても、ただ涙をためてもじもじとしているだけ。

この学校で、梢の喋る声を聞いた人間は、生徒や教師を含めて、誰１人としていない。

梢の方から壁を作っていれば、最初は“転校生”という物珍しさから声をかけてくれた人たちも離れていく。

いまだに１人か２人、声をかけてきてくれる物好きなクラスメイトはいるものの、そんな人たちに対しても梢は心を開こうとはしなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 2000, 0, null);
	DeleteStand("st梢_制服_正面_sad", 500, true);

//ＢＧ//松濤公園・昼
	CreateSE("SE02","SE_日常_松濤公園");
	MusicStart("SE02", 1000, 1000, 0, 1000, null, true);

	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg015_01_0_松濤公園_a.jpg");
	DrawTransition("back02", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back01");

	Stand("st梢_制服_正面","sad", 200, @-180);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
けれど、そんな今の自分が置かれている状況について、梢はそれほど危機感を抱いてはいなかった。

友人は、１人だけだけど、できた。

クラスメイトではなく、年上の先輩。

その人だけは、この引っ越してきたばかりの東京という土地で、唯一信用できる人物だった。

それ以外に、友達を作ろうとは思っていない。
クラスメイトと仲良くする気も、あまりない。
このまま、ひっそりと生きていきたいと思っていた。

夕方の松濤公園では、小さな子供たちが楽しそうな声をあげつつ、池のほとりを走り回っていた。

遊歩道を歩く梢のすぐ横を、男の子が元気にすり抜けていく。
その手には、象の顔を模したかわいらしい手鏡が握られていた。

子供の母親と思われる２人の主婦がベンチに座り、大きな声でお喋りに花を咲かせている。
梢にも、その話し声ははっきり聞こえてくる。

//【主婦Ａ】
<voice name="主婦Ａ" class="主婦Ａ" src="voice/chn04/00100010s1">
「――サンメンキョウの怪奇ビデオっていうのが、
ものすごく怖いのよ～」

//【主婦Ｂ】
<voice name="主婦Ｂ" class="主婦Ｂ" src="voice/chn04/00100020s2">
「あら、そうなの。私、それ知らないわ～。
　でも、サンメンキョウって？」

//【主婦Ａ】
<voice name="主婦Ａ" class="主婦Ａ" src="voice/chn04/00100030s1">
「ほらあれよ、鏡！　３つ並んでるやつ」

//【主婦Ｂ】
<voice name="主婦Ｂ" class="主婦Ｂ" src="voice/chn04/00100040s2">
「ああ、鏡ね！　三面鏡！　それで、どんな怪奇ビデオなの？」

梢は、そのベンチの前で立ち止まってしまっていた。
イヤな汗が、じっとりと額ににじんでくる。

２人の主婦が、お喋りをやめて怪訝な顔を梢へと向けてくる。
ハッとして梢は我に返り、そそくさと公園を出た。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 2000, 0, null);
	DeleteStand("st梢_制服_正面_sad", 500, true);


	CreateColor("黒幕", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("黒幕", 300, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("back02");

//ＢＧ//松濤の町並み
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg039_02_1_松濤_a.jpg");
	CreateTexture360("上乗せ", 110, 0, 0, "cg/bg/bg039_02_1_松濤_b.png");


	CreateSE("SE360101","SE_日常_雑踏02");
	MusicStart("SE360101",2000,400,0,1000,null,false);

	DrawTransition("黒幕", 300, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("黒幕");

	Stand("st梢_制服_正面","sad", 200, @-180);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
鏡――

それは梢にとっては、トラウマだった。
思い出したくない過去。よみがえってきそうになるのを、必死で押さえ込んだ。

考えすぎだと自分に言い聞かせて、再び駅へと歩き出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sad", 500, true);

	SetVolume("SE360101", 2000, 0, null);

//ＢＧ//Ｂｕｎｋａｍａｃｈｉ前（昼）
	BGMPlay360("CH12", 1000, 1000, true);


	CreateColor("黒幕", 500, 0, 0, 1280, 720, "Black");
	DrawTransition("黒幕", 300, 0, 1000, 100, null, "cg/data/right3.png", true);
	Delete("上乗せ");
	Delete("back03");

	CreateTexture360("back04", 100, 0, 0, "cg/bg/bg076_01_1_Ｂｕｎｋａｍａｃｈｉ前_a.jpg");
	DrawTransition("back04", 500, 0, 1000, 100, null, "cg/data/right3.png", true);


	DrawTransition("黒幕", 300, 1000, 0, 100, null, "cg/data/left3.png", true);
	Delete("黒幕");

	CreateSE("SE03","SE_日常_雑踏01");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);

	Stand("st梢_制服_正面","sad", 200, @+180);
	FadeStand("st梢_制服_正面_sad", 500, true);

	Wait(300);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 100, 1000, null, true);
	FadeDelete("フラッシュ", 150, false);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
Ｂｕｎｋａｍａｃｈｉの前まで来たところで、光が目に入った。
チカチカとまぶしい。

梢はぞくりと身を震わせた。
引っ越し前に何度も体験した嫌がらせ。
鏡の反射。

そのときの悪夢がよみがえり、頭の中がパニックになる。
偶然なのか故意なのか。
偶然に違いない、と祈るような気持ちを抱きつつ、周囲を見回す。

少し離れたところに停まっている、白いワゴン車。

//※背景“bunkamachi前”の右側奥に停まっている白いレガシー（？）ステーションワゴンのこと
その運転席の窓から、見知らぬ男が身を乗り出していた。
その手に、鏡。
向きを微調整しているように見える。

{	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/ncentern2.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);

	Wait(200);}
梢の目に、その光が何度も当たる。
梢は怖くなって、手でひさしを作り、逃げるように横断歩道を渡った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE03", 500, 0, null);
	DeleteStand("st梢_制服_正面_sad", 300, true);


//▼べー：白い車がいるのはＭＨＶ前なのでＭＨＶへ変更
//ＢＧ//１０７・昼
	CreateSE("SE03","SE_日常_雑踏01");
	MusicStart("SE03", 1000, 1000, 0, 1000, null, true);

	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg074_01_1_ＭＨＶ前_a.jpg");
	DrawTransition("back05", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back04");

	Stand("st梢_制服_正面","sad", 200, @-180);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
梢の脳裏は、恐怖と混乱で占められていた。

急いで家に帰りたい。
この場にいたくない。
涙が、頬をつたう。

きっと偶然だ、と必死で自分に言い聞かせた。
涙を指先で拭う。

その直後に――

{	CreateColor("鏡反射", 1000, 0, 0, 1280, 720, "White");
	Request("鏡反射", AddRender);
	Fade("鏡反射", 0, 0, null, true);
	Fade("鏡反射", 0, 500, null, true);
	DrawTransition("鏡反射", 100, 0, 1000, 200, null, "cg/data/light10.png", true);
	DrawTransition("鏡反射", 150, 1000, 0, 200, null, "cg/data/ncenter2.png", false);
	FadeDelete("鏡反射", 100, true);}
またも、光が梢の瞳を襲った。
眩しさが、突き刺すように梢の目を侵す。

//【梢】
<voice name="梢" class="梢" src="voice/chn04/00100050ko">
「……っ」

さっきの白いワゴン車が、追いかけてきていた。

//※背景“１０７（昼）”の一番右の白いレガシー（？）ステーションワゴンのこと
運転席から、腕だけが外に出ていた。相変わらず手鏡を握っている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE03", 500, 0, null);

	CreateSE("SE走","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE走", 1000, 1000, 0, 1000, null, true);
	SetVolume("SE走", 500, 1000, null);

	DeleteStand("st梢_制服_正面_sad", 300, true);
	Wait(100);

//ＢＧ//渋谷駅前・昼

	CreateSE("SE04","SE_はいけい_しぶ谷えき_LOOP");
	MusicStart("SE04", 1000, 1000, 0, 1000, null, true);

	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg079_01_1_渋谷駅前_a.jpg");
	DrawTransition("back06", 500, 0, 1000, 100, null, "cg/data/right3.png", true);

	Delete("back05");

	Wait(200);
	SetVolume("SE走", 1000, 0, null);
	Stand("st梢_制服_拒絶","pinch", 200, @+180);
	FadeStand("st梢_制服_拒絶_pinch", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
気が付けば、全力で駅まで走っていた。
人混みをかきわけ、何度も通行人にぶつかる。
舌打ちされ、文句を言われても、怖くて止まれない。

駅前にたどり着いて後ろを振り返ると、白い車はスクランブル交差点で赤信号に引っかかっていた。

梢はハチ公像の陰に隠れ、自分の身体を抱きしめるようにして息をつく。
今のがなんだったのか、冷静に考えることができない。
心の中で、ただひたすら連呼するのは――

これは偶然これは偶然これは偶然これは偶然これは偶然これは偶然――

//【大学生】
<voice name="大学生" class="大学生" src="voice/chn04/00100060dg">
「セーラー服もえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//フラッシュバック
//ＢＧ//焼却炉中
//一瞬だけ表示
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2500, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 2400, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("回想背景", 2000, 0, 0, "cg/bg/bg037_01_2_焼却炉中_a.jpg");

	Wait(100);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想明度");
	Delete("回想背景");
	Stand("st梢_制服_正面","sad", 200, @+180);
	DeleteStand("st梢_制服_拒絶_pinch", 0, true);
	FadeStand("st梢_制服_正面_sad", 0, true);

	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	CreateSE("SEもえ","se_せんたく_せーらーふく4_LOOP");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
その声に、ギクリとして顔を上げた。

ハチ公像前で待ち合わせをしているらしい、大学生くらいの男。梢には背を向ける格好で立っている。その男が、ケータイを耳に当てたままポツリとつぶやいた言葉。

{	MusicStart("SEもえ",2000,1000,0,1000,null,true);}
//以後、「セーラー服もえ」というセリフ（心の声ボイスエフェクトあり）をバッグで連呼させてください
声が、幾重にもこだまして、梢の頭の中に響く。

セーラー服燃え？
セーラー服萌え？

男は梢の方を振り返ることもない。

耳にはケータイを当てたまま。
電話の向こうの相手が話していて、それを聞いているのかと思った。

だが、相づちを打つことも、うなずいたりすることもない。
直立不動。

本当に、電話中なのだろうか……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//◆ボイス連呼ここまで
	SetVolume360("SEもえ", 500, 0, null);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//◆瀬戸内＝せとうち
//【大学生】
<voice name="大学生" class="大学生" src="voice/chn04/00100070dg">
「『瀬戸内の花嫁』最高」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//フラッシュバック
//イベント絵//尾道
//一瞬だけ表示
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2500, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 2400, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("回想背景", 2000, Center, Middle, "cg/ev/ev017_02_2_尾道_a.jpg");
	Zoom("回想背景", 0, 500, 500, null, true);

	Wait(100);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("回想明度");
	Delete("回想背景");

	Stand("st梢_制服_拒絶","pinch", 200, @+180);
	DeleteStand("st梢_制服_正面_sad", 0, true);
	FadeStand("st梢_制服_拒絶_pinch", 0, true);

	Fade("回想フラッシュ", 500, 0, null, true);
	Delete("回想フラッシュ");



	CreateSE("SE瀬戸内","se_せんたく_せとうち");
	MusicStart("SE瀬戸内",2000,1000,0,1000,null,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
再度のつぶやき。

//以後、「『瀬戸内の花嫁』最高」というセリフ（心の声ボイスエフェクトあり）をバッグで連呼させてください
今度こそ意味不明な。
けれど梢にとっては、イヤでも過去と関連づけてしまう言葉。

身体が震え出す。
もう、その男を見ることさえ怖くて。
その場にずるずるとへたり込み、耳を塞いだ。

偶然だ。これはただの偶然だ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ボイス連呼ここまで
	SetVolume360("CH*", 3000, 0, null);
	SetVolume("SE*", 3000, 0, null);

//	PrintBG(200);
//ＢＧ//夜空
	CreateTexture360("back07", 300, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	Fade("back07", 0, 0, null, true);
	Fade("back07", 1000, 1000, null, true);

	Delete("back06");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
そう心で唱え続けた。

１時間以上その場でうずくまっていて。
誰にも声をかけられることはなくて。
恐る恐る顔を上げると、もうさっきの男の姿はなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//アイキャッチ
//※拓巳視点に戻る
//※※３６０以上

//この後、“ch04_084_１０月２２日水”へ

	ClearAll(2000);
	Wait(1000);
}

