//<continuation number="130">

chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_178_梨深編_エピローグ";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_178_梨深編_エピローグ();
}


function chr_178_梨深編_エピローグ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	$SYSTEM_menu_lock = false;

//ＢＧ//青空
//ＳＥ//コンテナハウスの扉を開く

	ClearAll(0);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null ,true);
	Fade("Black", 1000, 1000, null ,true);

	Wait(1000);

	CreateSE("SE01","SE_日常_扉_開ける");
	SoundPlay("SE01", 0, 1000, false);
	CreateTexture360("back01", 500, 0, -96, "cg/bg/bg002_01_1_青空_a.jpg");

	CreateSE("SE360101","SE_はいけい_崩壊しぶ谷_107前_LOOP");
	MusicStart("SE360101",3000,300,0,1000,null,true);

	Wait(1000);

	Move("back01", 3000, @0, @192, Dxl1, false);

	FadeDelete("Black", 1500, true);

	Wait(1500);

//▼べー：ＢＧ：差し替え
	CreateTexture360("back02", 100, center, 0, "cg/bg/bg006_02_1_コンテナ外観_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ベースの扉を開いて、僕が外へ出ると、
青く晴れ渡った空が、目に飛び込んできた。

さっきまで雨が降っていたような気がするけど、あっという間に晴れたらしい。

梨深の姿は、どこにもなかった。
僕になにも言わず、忽然と姿を消した。

また、いなくなった。
何時間か待ってみたけど、戻ってこない。

代わりに、部屋の外にいたのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//車椅子の軋む音「キィ……」
	CreateSE("SE01","SE_日常_車椅す");
	SoundPlay("SE01", 0, 1000, false);
	Move("back02", 1000, @0, @-96, Dxl1, false);
	FadeDelete("back01", 1000, true);

	Wait(500);

	Stand("st将軍_車椅子_通常","normal", 200, @+100);
	FadeStand("st将軍_車椅子_通常_normal", 500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02300010ta">
「あ、し、『将軍』……！」

車椅子に乗った、シワだらけの少年は、とても億劫そうな動きで、僕を見た。
僕は怯え、その場で腰を抜かしてしまう。

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300020jn">
「……君は、これから自由だよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02300030ta">
「え……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300040jn">
「僕は、あと１時間もしないうちに、息絶えるだろう」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300050jn">
「君に脅威を与える存在は、梨深が……殺してくれた」

梨深の名を聞いて、僕はハッとする。
梨深が、僕を守るために、頑張ってくれた……？

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300060jn">
「蒼井セナと、折原梢の死体は、僕が隠しておいた」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300070jn">
「七海は、病院に収容された」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300080jn">
「だから、君はもう、自由だ」

意味が分からない。
こいつは僕の敵じゃないのか？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02300090ta">
「り、梨深は……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02300100ta">
「梨深は、どこへ……？」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300110jn">
「梨深は……もう、戻ってこないよ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn01/02300130ta">
「え……」

//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300130jn">
「それじゃ」

将軍は車椅子を器用に動かして、僕に背を向けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_車椅す");
	MusicStart("SE01",0,800,0,1000,null,false);

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Wait(100);
	Fade("Black", 0, 0, null ,true);
	Wait(100);
	Fade("Black", 200, 1000, null ,true);
	DeleteStand("st将軍_車椅子_通常_normal", 0, true);
	Fade("Black", 200, 0, null ,true);

	Delete("Black");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
僕はまばたきをして。
その１秒にも満たない時間の間に、『将軍』の姿は忽然とその場から消え去った。

どういうことなんだ……。
なにがあったって言うんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//地響き
	CreateSE("SE02","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	SoundPlay("SE02", 0, 500, true);

	Wait(1500);

	Move("back02", 1000, @0, @96, AxlDxl, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
遠くで、地響きのような低い音がした。
渋谷の中心部の方へと目を向けると、爆発でも起きたのか、黒い煙が一筋、もうもうと噴き上がっているのが見えた。

//ＳＥ//地響きフェードアウト
{	SetVolume("SE02", 3000, 0, NULL);}
なにかが、起きた。起きている。
暴動？　それとも超常的ななにか？
あるいはギガロマニアックス同士の争い？

すごく怖い。さっきの『将軍』の謎の言動も怖い。外に出たくない。

//■３６０：ボイスエフェクト付きます。
//ＶＦ//回想
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02300131jn">
「梨深は……もう、戻ってこないよ……」

あそこに、梨深がいるかもしれない。

梨深がまたいなくなったのに、僕が意外にも落ち着いていた。
不思議と、今回は裏切られたっていう気はしなかった。

むしろ、梨深は僕のために、たった１人で、どこかで頑張ってるんだっていう確信があった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 3000, 0, NULL);

	CreateColor("回想黒フラッシュ", 2000, 0, 0, 1280, 720, "Black");
	Fade("回想黒フラッシュ", 0, 0, null, true);
	Fade("回想黒フラッシュ", 1000, 1000, null, true);
	Delete("back*");

	BGMPlay360("chn04",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//以下追加081205
でも、でもさ、梨深……。
君は、もう、じゅうぶん頑張ったじゃないか。
これまでじゅうぶん、辛い目にあってきたじゃないか。

だから、これ以上梨深が苦しむ必要なんてないんだよ。

そんなの、おかしいんだよ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 500, 1000, null, true);

	Delete("回想黒フラッシュ");
	CreateColor("回想明度", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateColor("下敷き", 100, 0, 0, 1280, 720, "WHITE");

	CreateTexture360("back01", 500, 40, 0, "cg/bu/bu梨深_白ワンピ_正面_lost_eye02.png");


	Fade("回想フラッシュ", 2000, 0, null, 1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
彼女の、柔らかな唇の感触を思い出す。

梨深を、探しに行こう。
なにもしないで、１人で怯えて引きこもるのは、もうやめよう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――




//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3654002]
//以下追加081205
これからなんだ。

僕も、梨深も。

これからの人生には、きっと――

楽しいことや、嬉しいことが、たくさん、待っているはずなんだ。

待っているんだって、信じるべきなんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 500, 1000, null, true);
	Delete("下敷き");

//以下、回想シーンに入ります。音声については回想エフェクトを付けたものを新しく用意してもらう予定です
//ev029_01_梨深ソファ腰掛け
	CreateTexture360("back01", 500, center, 0, "cg/ev/ev029_01_2_梨深ソファ腰掛け_a.jpg");

	Fade("回想フラッシュ", 1000, 0, null, true);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604002]
//ch05/09600180ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600180ri_efx">
「朝、一緒に学校行って」

//chn01/09600190ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600190ri_efx">
「学校では休み時間にどうでもいいこと話して」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 500, 1000, null, true);

	CreateTexture360("back01", 500, center, middle, "cg/ev/ev044_03_2_梨深下着Yシャツ_a.jpg");

	Fade("回想フラッシュ", 1000, 0, null, true);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604012]
//ev044_03_2_梨深下着Ｙシャツ_a（制服バージョンでお願いします）
//ch05/09600200ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600200ri_efx">
「お昼休みは、一緒にご飯食べて」

//ch05/09600210ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600210ri_efx">
「夕方、一緒に帰って」

//ch05/09600220ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600220ri_efx">
「帰るついでにたまにどこかのお店に寄ったりして」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 500, 1000, null, true);

	CreateTexture360("back01", 500, center, middle, "cg/ev/ev114_02_6_梨深キス2_a.jpg");

	Fade("回想フラッシュ", 1000, 0, null, true);
	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604022]
//ev114_02_6_梨深キス2_a
//ch05/09600230ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600230ri_efx">
「タクの部屋で、ちょっとだけお喋りして」

//ch05/09600240ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600240ri_efx">
「それで、また明日ねって、手を振って別れて」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 500, 1000, null, true);

	CreateTexture360("back01", 500, center, -96, "cg/ev/ev034_01_6_梨深と将軍の出会い_a.jpg");

	Move("back01", 1500, @0, @96, Dxl1, false);

	Fade("回想フラッシュ", 1000, 0, null, true);
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604032]
//ev034_01_6_梨深と将軍の出会い
//ch05/09600250ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600250ri_efx">
「そんなのでいいなら、あたし、いくらでもしてあげるよ」

//ch05/09600260ri（回想エフェクト付けてください）
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/09600260ri_efx">
「……そういうの、結構、憧れなんだ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("回想フラッシュ", 1000, 1000, null, true);

	Delete("back01");
	Delete("回想明度");
	Wait(500);

	SetVolume360("chn04", 7000, 0, null);

//回想終わり

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3605002]
今なら分かる。

梨深の言葉の意味が。

彼女が、そんな何気ない日々をどれだけ望んでいたか。

思い返せば、僕が梨深と過ごしたのはほんのわずかな時間だったけど。

その時間は、楽しかった。嬉しかった。

それまで１人で引きこもって、死んだような生活をしていた僕にとって、梨深の笑顔は希望だった。明るい未来を予感させてくれた。

僕のために梨深は笑ってくれた。

だからこれからは。

梨深は、梨深自身のために、笑うべきだ。

戻ってこないなんて、僕は信じない。

それはいつもの現実逃避なんかじゃなくて。

僕の覚悟。

僕が信じるのは、ずっと一緒だと言ってくれた梨深の言葉だけ。

さあ、行こう。
行くんだ、西條拓巳。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,500);//――――――――――――――――――――――――――――――


	SetVolume360("CH22", 2000, 0, null);

//	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
//	Fade("回想フラッシュ", 0, 0, null, true);
//	Request("回想フラッシュ", AddRender);
//	Fade("回想フラッシュ", 500, 1000, null, true);

	CreateTexture360("太陽光", 1000, center, middle, "cg/data/light10.png");
	CreateTexture360("光ブラー", 1000, center, middle, "cg/data/light10.png");
	CreateTexture360("back01", 500, 0, 0, "cg/bg/bg002_01_1_青空_a.jpg");
	Request("太陽光", AddRender);
	Request("光ブラー", AddRender);
	Fade("太陽光", 0, 200, null, true);
	Fade("ブラー", 0, 200, null, true);

	BGMPlay360Suspend("CHN_ED_rimi",0,1000,false);

	Zoom("光ブラー", 30000, 2000, 2000, Dxl1, false);
//	Fade("光ブラー", 3000, 0, null, false);
	Fade("回想フラッシュ", 4000, 0, null, 2000);

	$SYSTEM_text_interval = 128;
	LoadBox10();


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3606002]
梨深に、もう一度会うために。
{WaitKey(1500);}
僕は、崩壊した渋谷へ足を向ける。
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3672001]
待ってて、梨深。
{WaitKey(1500);}
きっと、君を見つけ出すから――
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(200);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3673001]
//以下追加081205
そして、今度は僕が、
{WaitKey(2000);}
君と、一緒にいてあげるから――
{WaitKey(3000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(1000);//――――――――――――――――――――――――――――――


	Fade("太陽光", 2000, 400, null, false);
	FadeDelete("光ブラー", 2000, true);
	Wait(500);

//以上追加081205
//エンディングスタッフロールへ


	SetVolume("SE*", 4000, 0, NULL);
//～～Ｆ・Ｏ
//	ClearAll(3000);

//◆梨深編ＥＮＤ



}
