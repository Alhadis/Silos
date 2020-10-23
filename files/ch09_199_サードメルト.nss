//<continuation number="270">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_199_サードメルト";
		$GameContiune = 1;
		Reset();
	}

		ch09_199_サードメルト();
}


function ch09_199_サードメルト()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");


//ＣＧ管理用フラグ
	#bg165_03_3_OFRONT見上げ_a=true;

	CreateBG(100, 1000, 0, 0, "cg/bg/bg165_03_3_O-FRONT見上げ_a.jpg");

//※拓巳視点に戻る

//ＢＧ//スクランブル交差点//夜

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19900010ga">
「エスパーだ……」

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19900020gb">
「救世主……だわ……」

誰かが、つぶやいた。

それが僕に向けられていると気付いたのは、いくつもの視線が突き刺さってきたからだ。

多くの人たちの前で。
葉月志乃は、首を切って自殺した。

殉教、と言った方がいいかもしれない。
むせ返るような、血の匂いがこの場には漂っている。

暴動はいまや完全に治まっていた。

僕が街頭ビジョンに投影させた、葉月志乃の犯行の記憶は、興奮した人々を黙らせるのには最適だった。

誰もが、その映像のショッキングさに言葉を失っていた。

いまだ血を流し続けている葉月志乃の遺体。
そこに歩み寄る人間が、何人かいた。
彼女の遺体を、足蹴にし始めた。

凶悪殺人犯の死体。
そこに払われるべき尊厳なんて、ないっていうことか。

次は、首を刈られて戦国時代みたいにさらされるのか。

彼女と、彼女の遺体を足蹴にする人間との間に、どんな差があるって言うんだ。

人は、どうしようもなく醜い。
僕も含めて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateSE("SE05","SE_擬音_ふらっしゅ_大量");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	CreateSE("SE10","SE_はいけい_すくらんぶる交差点ガヤ_どよめき_LOOP");
	MusicStart("SE10", 2000, 500, 0, 1000, null, true);

//画面エフェクト//フラッシュ
	CreateColor("back03", 100, 0, 0, 1280, 720, "White");
	DrawTransition("back03", 100, 0, 800, 100, null, "cg/data/爆発.png", true);


	CreateBG(100, 500, 0, 0, "cg/bg/bg164_01_3_スポットライト_a.jpg");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
マスコミは、ハイエナみたいにスクープとなる被写体に群がっている。

およそ半分は、葉月志乃の遺体に。
そして残り半分は、僕の周りに。

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19900030ga">
「西條くん！　お見事でした！」

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19900040gb">
「今のは、超能力ですか！？
やはりエスパーだったんですね！　すごいです！」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19900050ga">
「今日のこの集まりは、初めから真犯人をおびき寄せるためのものだったの？」

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19900060gb">
「あなたの超能力は、何歳頃にあらわれたものなんですか？」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19900070ga">
「子供の頃のあだ名は？　神童、とか呼ばれたことはある？」

//【芸能レポーターＢ】
<voice name="芸能レポーターＢ" class="芸能レポーターＢ" src="voice/ch09/19900080gb">
「今後、警察の捜査に協力する予定は？」

//【芸能レポーターＡ】
<voice name="芸能レポーターＡ" class="芸能レポーターＡ" src="voice/ch09/19900090ga">
「うちの局の番組に出てくれないかな？」

次々と投げかけられる、
賞賛の言葉。

//◆↓男
//【祭参加者１】
<voice name="祭参加者１" class="祭参加者１" src="voice/ch09/19900100m1">
「西條！　よくやったぞ！」

//◆↓女
//【祭参加者２】
<voice name="祭参加者２" class="祭参加者２" src="voice/ch09/19900110m2">
「キャー！　拓巳くーん、こっち向いて！」

//◆↓男
//【祭参加者７】
<voice name="祭参加者７" class="祭参加者７" src="voice/ch09/19900120m7">
「お前、すげえよ！」

//◆↓女
//【祭参加者３】
<voice name="祭参加者３" class="祭参加者３" src="voice/ch09/19900130n3">
「好きです！　付き合ってください！」

次々と投げかけられる、好意的な言葉。

僕は――

そんな声に、虚しさを覚える。
世論に作られた虚像と、妄想の存在。
そんなに違いはないじゃないか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE11","SE_はいけい_ガヤ_たくみコール_LOOP");
	MusicStart("SE11", 500, 1000, 0, 1000, null, true);

//複数でコール
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆複数でコール
//【祭参加者コール】
<voice name="祭参加者コール" class="祭参加者コール" src="voice/ch09/19900140m9">
「タクミ！　タクミ！　タクミ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
あのノリが、帰ってくる。
Ｏ－ＦＲＯＮＴの屋上にいた僕を見上げていた、あの熱気。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆複数でコール
//【祭参加者コール】
<voice name="祭参加者コール" class="祭参加者コール" src="voice/ch09/19900150m9">
「タクミ！　タクミ！　タクミ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE05", 0, 0, NULL);
	SetVolume("SE10", 0, 0, NULL);
	SetVolume("SE11", 500, 400, NULL);

	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");
	DrawTransition("back03", 300, 0, 1000, 400, null, "cg/data/up2.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg206_01_3_夜空_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900160ta">
「うるさい！」

たまらず、叫んでいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＣＧ管理用フラグ
	#bg165_03_3_OFRONT見上げ_a=true;

	CreateTextureEX("back03", 100, 0, 0, "cg/bg/bg165_03_3_O-FRONT見上げ_a.jpg");
	Fade("back03", 500, 1000, null true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900170ta">
「手のひら返して英雄扱いかよ！　バカみたいだ！」

{	SetVolume("SE11", 3000, 0, NULL);}
涙が出た。

無性に、悲しかった。
無性に、バカらしくなった。

泣かなきゃ、やってられなかった。

僕は、英雄じゃない。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900180ta">
「僕はキモオタで！　星来たんのエロいフィギュアにハアハアしてるヘンタイだ！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900190ta">
「１８歳未満だけどエロゲーして萌え～って言ってる男だ！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900200ta">
「頭の中じゃ、街を歩く女どもを裸にひんむいてエロい妄想してる！　それが僕だ！」

涙と鼻水で、顔をぐしゃぐしゃにして。
全国に中継されていることも忘れて。

また醜態をさらしてるなんてことに考えは及ばなくて。
どうしようもないくらい、空気が読めなくて。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900210ta">
「どうだよ？　これでも僕は英雄かよ！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900220ta">
「違う。僕は英雄なんかじゃない。しょせん、妄想の存在で、キモオタで、ひとりじゃなんにもできないヘタレだ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
周囲の声が、静まっていく。

黙り込む、野次馬たち。
怪訝な顔を見せる、マスコミたち。

この渋谷の中心で。
広いスクランブル交差点で。
僕の声だけが、響いている。

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900230ta">
「それが僕だ！　お前らに、他人に、僕っていう人間を決めさせない！　僕の本質は、僕が決める！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900240ta">
「僕は、お前らのオモチャじゃない！　見せ物なんかにはならない！」

//◆涙声
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900250ta">
「僕にはやるべきことがあるんだ！
僕は、お前達なんかのために行動しない！」

脳裏に、梨深の笑顔が浮かんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/19900260ta">
「僕はただ――」

大切な人のために。戦って。消える。

それを宣言する前に。
ふと、視界の端に映った、夜空が。
白く、染まっているのに気付いた。

それは雲ではなく。
ましてや季節外れの雪なんかでもなく。

地震が起きたときと同じ現象だと気付いたときには、すでに手遅れだった。

//ＶＦ//心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch09/19900270jn">
「サードメルト！？　予定より早い……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//地響き
	CreateSE("SE01","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, false);

	CreateSE("SE02","SE_自然_じ鳴り_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

//ＣＧ管理用フラグ
	#bg165_03_3_OFRONT見上げ_a=true;

	CreateTextureEX("shake01", 100, 0, 0, "cg/bg/bg165_03_3_O-FRONT見上げ_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");
	Fade("shake01", 0, 1000, null, true);

	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
まず最初に、地響きがした。
地面が、揺れ出す。
空の“白”はますます広がっていく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//共鳴音
	CreateSE("SE03","SE_擬音_共鳴音_女性悲鳴のよう");
	MusicStart("SE03", 500, 1000, 0, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
次に、激しい耳鳴りに襲われた。
頭が割れるほどの、甲高い共鳴音。
周りの人たちも、みんな耳を押さえている。

そして――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 500, 0, NULL);

//ＳＥ//衝撃音
//ＢＧ//白
//ＳＥ//爆発音

	CreateSE("SE04","SE_衝撃_爆発音");
	CreateSE("SE05","SE_衝撃_爆発音");
	CreateSE("SE360104","SE_衝撃_道路陥ぼつ");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	MusicStart("SE360104", 0, 1000, 0, 1000, null, false);
	CreateColor("white", 100, 0, 0, 1280, 720, "White");
	Fade("white", 0, 0, null, false);
	Fade("white", 500, 1000, null, true);

	Wait(2000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
世界が、白一色に染まった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);

//○実績No.10：第九章【giga-lo-maniac】
	XBOX360_Achieved(10);

	Wait(3000);

//第９章　ＥＮＤ

}

/*森島shake用function*/
function Shaker()
{
	Shake("@shake01", 1000, 0, 0, 10, 10, 1000, null, true);
	while(1)
	{
	Shake("@shake01", 500, 10, 10, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 20, 20, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 10, 10, 20, 20, 1000, null, true);
	}

}