
chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "chz_213_青空編_findtheblue";
		$GameContiune = 1;
		$Ａルート = true;
		$Ａ２ルート = true;
			#ClearG=true;
			#ClearPieceR=true;
			#ClearPieceY=true;
			#ClearPieceS=true;
			#ClearPieceK=true;
			#ClearPieceN=true;
			#ClearPieceA=true;
			#ClearRouteB=true;
			#ClearRouteA=true;
			#EndPieceR=true;
			#EndPieceY=true;
			#EndPieceS=true;
			#EndPieceK=true;
			#EndPieceN=true;
			#EndPieceA=true;
			#EndRouteB=true;
			#EndRouteA=true;
			$ClearPreAll=true;
		Reset();
	}

		chz_213_青空編_findtheblue();
}


function chz_213_青空編_findtheblue()
{
	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//ＢＧ//海と青い空
	CreateTexture360("背景８", 1000, 0, 0, "cg/sys/select/back.png");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001360ta">
僕は――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back11", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back11", Smoothing);
//	Request("back11", AddRender);
	CreateTextureEX("back12", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back12", Smoothing);
	Request("back12", AddRender);
	CreateTextureEX("back13", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	Request("back13", Smoothing);
	Request("back13", AddRender);

	Zoom("back13", 0, 1500, 1500, null, true);
	Zoom("back12", 0, 2000, 2000, null, true);
	Zoom("back11", 0, 3000, 3000, null, true);

//	SetBlur("back11", true, 2, 300, 100);

	Zoom("back11", 1000, 1000, 1000, Axl1, false);
	Zoom("back12", 1000, 1000, 1000, Axl2, false);
	Zoom("back13", 1000, 1000, 1000, Axl3, false);

	Fade("back11", 300, 500, null, false);
	Fade("back12", 300, 300, null, false);
	Fade("back13", 300, 300, null, true);

	Fade("back12", 1200, 0, Axl3, false);
	Fade("back13", 1200, 0, Axl3, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text100]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21200130ri">
「タクーっ！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001370ta">
その声が聞こえた瞬間に。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("back13", null);
	SetBlur("back11", true, 2, 300, 100);

//	CreateSE("SE03","SE_擬音_妄そうIN");
//	MusicStart("SE03",0,1000,0,1000,null,false);
	Fade("back11", 2000, 1000, null, true);

	Wait(300);

	CreateSE("SE04","SE_擬音_ディそーど_具現化直前_Loop");
	CreateSE("SE05","SE_衝撃_衝撃音02");
	CreateSE("SE06","SE_擬音_ディそーど出現");
	CreateColor("色１", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

	MusicStart("SE04",0,1000,0,1000,null,true);
	MusicStart("SE05",0,1000,0,1000,null,false);
	MusicStart("SE06",0,1000,0,1000,null,false);
	BGMPlay360("CH_OP", 1000, 1000, true);

	Zoom("back11", 500, 1200, 1200, null, false);
	Fade("色１", 500, 1000, null, true);
	Fade("back11", 500, 0, null, true);
	Delete("back11");
	Delete("back12");
	Delete("back13");

	FadeDelete("背景８", 0, true);
	Fade("色１", 1000, 0, null, true);

	Wait(500);
	CreateTextureEX("360剣追加", 100, 0, -16, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text101]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001380ta">
意識が僕を固定した。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001390ta">
ぐちゃぐちゃにかき回されていた世界が、一気に収束する。

{	Fade("色１", 0, 1000, null, true);
	Fade("360剣追加", 0, 1000, null, true);
	Fade("色１", 500, 0, null, true);
}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001400ta">
混沌は、僕のディソードを形作って収束する。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001410ta">
僕は、僕としての形に、戻る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001420ta">
世界は、世界としての形に、戻る。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chex/00001430ta">
僕は、僕だ――！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("@text101", null);

	CreateTextureEX("back03", 120, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Zoom("back03", 0, 2000, 1500, null, true);
	Zoom("back04", 0, 2000, 1500, null, true);



//ＳＥ//衝撃音
//ＢＧ//ノアⅡ
	CreateSE("SE10","SE_衝撃_衝撃は_リアルぶーと");

	SetVolume("SE04", 1000, 0, NULL);
	SetVolume("SE05", 1000, 0, NULL);
	SetVolume("SE06", 1000, 0, NULL);

	MusicStart("SE10", 0, 1000, 0, 1000, null, false);

	Fade("色１", 500, 1000, Axl2, false);
	Zoom("360剣追加", 500, 2000, 2000, Axl2, true);
	Delete("360剣追加");

	Wait(1300);

	Fade("back03", 500, 500, null, false);
	Fade("back04", 500, 1000, null, false);
	Zoom("back03", 500, 1000, 1000, Dxl1, false);
	Zoom("back04", 1000, 1000, 1000, Dxl1, false);

	Fade("色１", 500, 0, null, false);
	DrawTransition("色１", 500, 1000, 0, 100, null, "cg/data/zoom2.png", true);

	Wait(1000);
	Delete("back03");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text018]
視界はクリアになっていた。

身体の傷は治っていた。

上半身と下半身は繋がっていた。

僕は自分の足で、立っていた。

痛みは完璧に消えていた。

心は、穏やかに凪いでいた。

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200140jn">
「妄想によく打ち勝ったね」

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21200150jn">
「僕の最期の力を、君に託すよ」

梨深の姿を視界の隅に認める。

彼女は無事。
僕を見ている。
泣いている。

泣かないで。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "WHITE");
	Request("色１", AddRender);
	Fade("色１", 0, 0, null, true);

//ＹＥＳ／ＮＯ分岐が出現する（ＡＡエンド解放フラグが立っていてなおかつＹＥＳ／ＮＯ分岐で正解を選びＡＡエンドが確定した）場合のみ新規テキストを追加。「泣かないで。」の後に挿入

//※※３６０以下
//６本のディソード召喚
//拓巳の背後の空間からヒロインたち６人のディソードが水平に出現
//ＳＥ//女性の悲鳴のような共鳴音

	CreateMovie360("ムービー１", 500, Center, Middle, false, false, "dx/mvでぃそーどしゅつげん.avi");
	Fade("ムービー１", 0, 0, null, true);

	Move("back04", 2000, @0, @96, Axl1, false);

	Fade("ムービー１", 1000, 1000, null, true);
	WaitAction("ムービー１", null);


	Fade("色１", 100, 1000, null, true);

	Delete("ムービー１");

	CreateMovie360("ムービー２", 600, Center, Middle, true, false, "dx/mvでぃそーど回転.avi");
	Fade("ムービー２", 0, 0, null, true);
	Fade("ムービー２", 1000, 1000, null, true);

	Fade("色１", 500, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text020]
僕のすぐ背後。
空間が歪む。

祈りはもたらされた。
それは６つの福音。
あるいは６つの魂の衝動。

あまりにも無垢。
あまりにも優雅。
あまりにも凛として。

あまりにも鋭利。
あまりにも獰猛。
あまりにも破滅的で。

そして、あまりにも美しく禍々しいそれらを。

僕は受け入れる。

６つの刃は身をよじり。

切なげな。
あるいは歓喜の。
悲鳴を上げて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Move("back04", 0, @0, @-96, null, true);

//ＳＥ//衝撃音

//※※３６０以上
	Fade("色１", 100, 1000, null, true);
	CreateMovie360("ムービー３", 600, Center, Middle, false, false, "dx/mvでぃそーど融合.avi");
	Fade("ムービー３", 0, 0, null, true);
	Fade("ムービー３", 1000, 1000, null, true);
	Fade("色１", 800, 0, null, true);
	Delete("ムービー２");
	WaitAction("ムービー３", null);

	Fade("色１", 300, 1000, null, true);
	Delete("ムービー３");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602020]
僕のディソードと融合した――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※※３６０以上

//ＳＥ//衝撃音
	CreateSE("SE01","SE_擬音_ディそーど同士ぶつかる");

	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("色１", 500, 0, null, true);
	Delete("色１");


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text019]
ディソードの柄を握る手。
力を込める。

感触を確かめる。
腕がちゃんと動く。
完全に再生している。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_擬音_ディそーどかまえる");
	MusicStart("SE02",0,1000,0,1000,null,false);
	Stand("st玄一_スーツ_武器構え","hard", 200, @-400);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601019]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21200160nr">
「これは……実に興味深いですよ」

//◆興奮して苦笑いしながら
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch10/21200170nr">
「この……化け物め……！」

{	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);}
僕は野呂瀬を見据え。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21200180ta">
「確かに、僕は、化け物だよ。でもこれが」

梨深を救い出すために。
ノアⅡを破壊するために。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21200190ta">
「僕が望んだ妄想だ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

}

