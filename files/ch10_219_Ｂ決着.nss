//<continuation number="180">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_219_Ｂ決着";
		$GameContiune = 1;
		$Ｂルート = true;
		Reset();
	}

		ch10_219_Ｂ決着();
}


function ch10_219_Ｂ決着()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る

//※以下は拓巳の妄想です
//ＢＧ//黒

	CreateColor("back10", 100, 0, 0, 1280, 720, "Black");

//梢の声、徐々にフェードイン

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//◆苦悶の叫び
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21900010ko">
「あああああああああ――」

//◆苦悶の叫び
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21900020ko">
「あ、あ、あああ、あああああああ――」

//◆苦悶の叫び
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21900030ko">
「やだああああああああ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//ノアⅡ
	CreateBG(100, 1000, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	CreateSE("SE01","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
こずぴぃが、なんかさけんでる。
くるしそう。いたそう。たのしそう？

ぼくは、めをぱちぱち。
こずぴぃはどこ？

へんなおぶじぇにはりつけにされてる。
そのあしもとに、りみがぐるぐるしばられてたおれてる。

こずぴぃはへんだった。
ふくはびりびりにされてる。
そして、もぞもぞしてる。

もぞもぞ？
なにが？

かわが。
ひふが。

ほっぺたとか。
くびとか。
うでとか。

おへそのあたりとか。
ふとももとか。

もぞもぞ。
むにゅむにゅ。

こずぴぃのひふのなかで、たくさんのなにかがうごいてる。

いっぴきじゃない。１０ぴき……２０ぴき……３０ぴきぐらい？

きっときせいちゅうだ。
きもちわるいいもむしだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆苦悶の叫び
//【梢】
<voice name="梢" class="梢" src="voice/ch10/21900040ko">
「い、いいいい、ぎぎ、ああああ――」

こずぴぃがぶんぶんとあたまをふりみだしている。
めがいっちゃってる。
よだれだってだらだらたらしてる。

すごくばかっぽいかお。
おもしろい。
それに、あたまになんかかぶってる。

こーどがたくさんでてる。
おもちゃみたい。
“なんとかせんたいへんしんせっと”みたいな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//革靴の足音
	CreateSE("SE36001","SE_じん体_動作_足_歩く");
	MusicStart("SE36001",0,1000,0,1000,null,false);

	Stand("st玄一_スーツ_通常","normal", 200, @+150);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900050nr">
//「楽しいことでもあったのですか？　西條拓巳」
//※テキスト表示は以下のようにしてください。
//【野呂瀬】
//<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900060nr">
「×しいことでもあったのですか？　にしじょうたくみ」

みたことないおじさんだ。
だれ？　だれ？　だれ？

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900070nr">
//「なるほど、無意識に折原梢と妄想をシンクロさせているのですか。ずいぶんと物好きですね」
//※テキスト表示は以下のようにしてください。
//【野呂瀬】
//<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900080nr">
「なるほど、×××に×××と××をしんくろさせているのですか。ずいぶんと××きですね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900090nr">
//「そんなに焦らずとも、彼女の次は君にたっぷりとあの拷問を受けさせてあげますよ」
//※テキスト表示は以下のようにしてください。
//【野呂瀬】
//<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900100nr">
「そんなに×らずとも、××の×は×にたっぷりとあの××を×けさせてあげますよ」

つぎは、ぼく？
そんなのやだ。

つぎは、僕？
そんなの、やだ。

次は、僕？
そんなの、嫌だ。

痛いのも、苦しいのも、嫌だ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st玄一_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//ＶＦ//◆心の声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21900110ri">
「タク」

//ＶＦ//◆心の声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21900120ri">
「あなたなら、止められる」

//ＶＦ//◆心の声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21900130ri">
「今なら、止められる」

//ＶＦ//◆心の声
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21900140ri">
「あなたなら――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//ＳＥ//手首を縛る紐が外れる
	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
手首を、後ろ手で縛られていたはずだった。
でも、紐が意志を持ったかのように、自動的に緩み、外れた。

縛られ、横たわっている梨深が、視線だけを僕に向けている。
その目が、訴えている。

このドーム状の空間の中央に鎮座し、不気味なうなりを上げている巨大な装置。

これこそが、ノアⅡだと。
これを、壊せと。

梨深の目が、訴えている。

インテリ風の長身の男――野呂瀬は、僕に背を向け、こずぴぃが拷問されている姿を真面目な顔をして眺めている。

僕の動きには気付いていない。
他に人影はない。諏訪の姿もない。

今なら、僕でもやれる。
僕しか、できない。

怖い。

もし野呂瀬にバレたら。
もし失敗したら。
そう思うと、身体が震える。

僕なんかに世界の命運を任せるなんて、このゲームは間違ってる。

でも――
僕がやるしかないんだ。

意外にもすんなりと、僕は覚悟を決めることができた。
もしかして僕は強くなったのかもしれない。

そうだ、僕は強い。
強いんだ――

立ち上がる。ゆっくりと。
野呂瀬はまだ気付かない。

ラスボスのくせにけっこう間抜けだ。
こずぴぃが苦しむ姿がそんなに楽しいのか。

虫酸が走る。
僕は歯噛みし。

――出てこい、ディソード。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_擬音_ディそーど_具現化直前_Loop");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "BLUE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Fade("攻撃フラッシュ", 300, 600, null, true);
	Fade("攻撃フラッシュ", 1000, 0, null, true);
	Delete("攻撃フラッシュ");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
空間に現れる波紋。
そして青い光。

それを握る。
感触がある。

冷たくもなく、熱くもない。
硬くもなく、柔らかくもない。

それを、ディラックの海から引き抜く。
長大な剣が僕の手の中におさまる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE01", 1000, 0, null);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	BGMPlay360("CH13",2000,1000,true);


	Stand("st玄一_スーツ_通常","normal", 200, @+150);
	Shake("st玄一_スーツ_通常_normal*", 500, 5, 0, 0, 0, 1000, null, false);
	FadeStand("st玄一_スーツ_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900150nr">
「なに！？」

{	CreateSE("SE02","SE_衝撃_衝撃は_リアルぶーと");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);
	CreateColor("back14", 500, 0, 0, 1280, 720, "White");
	Request("back14", AddRender);
	Fade("back14", 0, 0, null, false);
	Fade("back14", 0, 1000, null, true);
	FadeDelete("back14", 200, true);}
今さら気付いても遅い。
ディソードをリアルブート。

粒子をこの場にいる全員のデッドスポットへ飛ばす。
意識しなくてもできる。

どういう仕組みなのかなんて関係ない。
ただ、そう妄想するだけでいい。

{	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 1000, 0, null, false);}
両手でディソードの柄を握りしめる。
その剣の輝きが、青から赤へと変化する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21900160nr">
「心を殺されたはず……」

信じられないという面持ちで、野呂瀬が僕を見ている。
たじろいでいる。

//■３６０
//たじろいている。

僕の勝ちだ。

僕はニヤリと笑う。

{	CreateSE("SE02","SE_擬音_ディそーどかまえる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
剣を振り上げ。

妄想する。

これは光の剣だ。
空を切り裂くような、すごい力がある。

すべての力を解放して、振り抜けば、いかなるものをも塵へと変える。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21900170ta">
「食らえ、これが――」

とっさに必殺技の名前が思いつかない。
だから、少年マンガみたいに技名を叫ぶのはやめて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21900180ta">
「うおおおおおおお！」

ディソードに妄想によってため込んだ力を、
ノアⅡ目がけて解き放った――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("攻撃フラッシュ");

	SetVolume360("CH13", 1000, 0, null);

//ＢＧ//白
//ＳＥ//衝撃波
//ＳＥ//大爆発

//～～Ｆ・Ｏ

	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Fade("back10", 0, 600, null, false);
	DrawTransition("back10", 300, 500, 0, 100, null, "cg/data/爆発.png", true);

	CreateSE("SE02","SE_擬音_ディそーど_空を切る2");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	WaitAction("SE02", 1000);

	CreateColor("back11", 500, 0, 0, 1280, 720, "White");

	DrawTransition("back11", 1000, 0, 1000, 500, null, "cg/data/爆発.png", true);
	SetVolume("SE01", 0, 0, null);

	Delete("back10");

	Wait(500);

	CreateSE("SE03","SE_擬音_きかい切る音");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("SE03", 2000);

	CreateSE("SE04","SE_衝撃_爆発音");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	Wait(2000);

	ClearAll(3000);

	Wait(2000);

}