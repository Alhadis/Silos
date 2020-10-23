//<continuation number="270">


chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "chz_216_青空編_bluesky";
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

		chz_216_青空編_bluesky();
}


function chz_216_青空編_bluesky()
{
	$SYSTEM_text_auto_lock=false;

	$SYSTEM_last_text="エピローグ";

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	Wait(4000);

	CreateSE("SE01","SE_自然_雨_通常_LOOP");
	Request("SE01", Lock);
	MusicStart("SE01", 4000, 1000, 0, 1000, null, true);

	SetVolume360("chn05", 3000, 0, NULL);
	Request("chn05", Lock);

	ClearAll(3000);

	Request("SE01", UnLock);
	Request("chn05", UnLock);
	Wait(4000);

	Delete("chn05");

//	CreateTextureEX("背景０", 100, @0, @-480, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");
//	CreateMovie360("雨１", 500, Center, Middle, true, false, "dx/mv雨02.avi");	
//	Request("雨１", AddRender);
//	Fade("雨１", 0, 0, null, true);

//	Fade("雨１", 1000, 1000, null, false);
//	Fade("背景０", 500, 1000, null, true);

//Ａルートグッドエンド

	CreateTextureEX("追加EV", 150, @0, 0, "cg/ev/ev117_01_6_梨深殺せない_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500010ri">
「殺せない……」

僕から唇を離して。
梨深が、苦しげにつぶやいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	Request("雨１", Pause);
	Fade("追加EV", 2000, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500020ri">
「やっぱり、タクを、殺せないよ……」

痛みを、感じないのは――
彼女の剣が、リアルブートされていないから。
僕の身体はどこも傷ついていなくて。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500030ta">
「でも、消して、くれなきゃ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500040ta">
「本物の、僕が……」

彼が、死んでしまう。
僕が、死ぬべきなんだ。

そうして、彼の命を少しでも生き長らえさせなくちゃいけないんだ。

梨深も、それが目的だったはずなんだ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500050ta">
「消して」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆切ないブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500060ri">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500070ta">
「消すんだ……僕を……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500080ri">
「できない……」

梨深は小さく首を振る。
その、揺れる瞳が、僕を見つめてくる。

{	BGMPlay360("chn04", 0, 1000, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500090ri">
「好きなの……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500100ri">
「あなたの、弱さが……好き」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500110ri">
「弱いくせに、臆病なくせに……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500120ri">
「ボロボロになって、あたしなんかを助けに来てくれた」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500130ri">
「その強さが……好きなの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500140ri">
「あなたと同じ時間を、もっと過ごしたいの……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500150ri">
「あなたを、失いたくない……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500160ri">
「あなたに、生きていて、ほしい……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
僕を、見てくれるの……？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500170ta">
「僕は、化け物なんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500180ri">
「あたしだって、同じだよ……」

僕は、生きていて、いいの……？

//ＶＦ
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21500190jn">
「君がそれを選んだなら」

//【将軍】
<voice name="将軍" class="将軍" src="voice/ch10/21500200jn">
「生きていて、いいんだ」

空から、声が聞こえて。

それで、分かった。
心が直結しているからこそ、感覚として、それを捉えた。

彼の命が、今この瞬間に、消えてしまったことを。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500210ri">
「タクミが……死んだんだね……」

僕の表情に出てしまった感情を。
梨深が、敏感に感じ取る。

僕は、少し躊躇して、かすかにうなずく。

//◆泣く
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500220ri">
「…………」

泣かないで。
君に、泣いてほしくない。

全身に、感覚が戻ってくる。

身体に、温かさが戻ってくる。

まだぎこちないけど。

まだ、震えてしまうけど。

動かせるようになった手で、懐から、朱色のハンカチを取り出して。

梨深の頬を流れる涙。

とてもキレイで、とても透明なその雫を。

君がくれた想い出で、そっと拭った。

{	SetVolume("SE01", 500, 0, NULL);
//	BGMPlay360("CHN_ED_A", 1000, 1000, true);
}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500230ta">
「僕も……君が、好きです……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("追加EV2", 170, 0, 0, "cg/ev/ev117_02_6_梨深殺せない_a.jpg");
	Fade("追加EV2", 1000, 1000, null, true);
	Delete("追加EV");
	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
梨深が、その僕の手を、すがるように握りしめてくる。

僕たちが、ここにいることを確かめるように。

温もりが、感染する。
僕と君の温度が、溶け合う。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//▼べー：ムービー：停止位置調整
	Move("背景０", 3000, 0, 0, AxlAuto, false);
	WaitAction("背景０", 1000);
	CreateTextureEX("背景１", 100, @0, @0, "cg/bg/bg001_01_1_崩壊渋谷_a.jpg");
	CreateTextureEX("青空", 100, center, middle, "cg/bg/bg904_01_1_エンド青空_a.jpg");
	CreateSE("SE01","SE_自然_雨_通常_LOOP");

	CreateMovie360("雨２", 100, Center, Middle, true, false, "dx/mv雨01.avi");
	Fade("雨２", 0, 0, null, true);
	Request("雨２", AddRender);
//	Fade("雨１", 0, 0, null, false);
	Fade("背景１", 0, 1000, null, false);
	Fade("雨２", 0, 1000, null, true);
	Delete("雨１");
	Delete("背景０");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
２人で、空を見上げた。
やっぱり雨雲に覆われている。

でも――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500240ta">
「光は、電磁場の波。その振動現象を、人の視覚は色として捉える……」

{	FadeDelete("追加EV2", 2000, false);}
//◆呆然
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch10/21500250ri">
「タク……その言葉……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
彼と梨深しか知り得ない言葉。
彼が、梨深に希望をあげた言葉。

でも、僕は、知っているんだ。
彼の記憶を、見てきたから。

僕と彼は、一心同体。
僕と彼の記憶は、共有されている。

彼がこれまで生きてきた１７年間の記憶は、僕に受け継がれているし。

僕がこれまで生きてきた１年半の記憶は、彼もまた追体験した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500260ta">
「自分のデッドスポットに、望む色を当てはめれば――」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/21500270ta">
「僕たちのあの空の色は、取り戻せる……」

僕たちは、その色を知っている。
あの、海と空しかない心象世界で、見上げ、記憶に焼き付けた色だから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	//★徒歩：ここからオート進行
	$skip_log=$SYSTEM_skip;
	$auto_log=$SYSTEM_text_auto;
	$SYSTEM_skip=false;
	$SYSTEM_text_auto=false;
	$SYSTEM_menu_lock = true;

	MusicStart("SE01", 1000, 1000, 0, 1000, null, true);

	SetVolume360("chn*", 3000, 0, NULL);
	SetVolume360("CH*", 3000, 0, NULL);

//おがみ：ムービー挿入
//	Move("青空", 3000, @0, @120, Dxl2, false);
//	FadeDelete("背景１", 3000, false);
//	Fade("青空", 3000, 1000, null, true);
//	WaitAction("背景１", null);

	CreateMovie360("雨のち晴れ", 500, Center, middle, false, false, "dx/mvくもりから晴れ.avi");
	Fade("雨のち晴れ", 0, 0, null, true);
	Fade("雨のち晴れ", 1000, 1000, null, true);
	Fade("雨２", 2000, 0, null, true);

	Delete("背景１");
	Delete("雨２");

	Fade("青空", 0, 1000, null, true);

	Wait(6000);
	SetVolume360("SE01", 4000, 0, null);

	Wait(7000);
	BGMPlay360Suspend("CHN_ED_A", 0, 1000, true);

	WaitAction("雨のち晴れ", null);

	Fade("雨のち晴れ", 2000, 0, null, true);
	Delete("雨のち晴れ");

	//Wait(1000);

	//★徒歩：ここまでオート進行
	$SYSTEM_menu_lock = false;
	$SYSTEM_text_auto_lock=false;

	if(#keep_auto_and_skip){
		if($skip_log){
			$SYSTEM_skip=true;
		}else if($auto_log){
			$SYSTEM_text_auto=true;
		}
	}

	$SYSTEM_text_interval = 128;
	LoadBox10();

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3601006]
不意に、雨がやんで。
{WaitKey(1500);}
雲が、一瞬にして消えていく。
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3602006]
晴れ渡り。
{WaitKey(1500);}
戻ってきた。
{WaitKey(1500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3603006]
どこまでも吸い込まれそうな。
{WaitKey(1500);}
この世界を優しく覆う。
{WaitKey(2000);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(500);//――――――――――――――――――――――――――――――

	Wait(500);


//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text3604006]
あの、青い空が――
{WaitKey(2500);}
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin3(2000);//――――――――――――――――――――――――――――――

//エンディングスタッフロールへ
//Ａルートグッドエンド


//エンディング中にＣＧで以下の状況を説明したいです……
//※以下のうち、２、３、４はなくてもＯＫです。１と５は欲しいです。

//１：病室の窓の外の青空を見つめるようにして、ベッドの上の将軍が息絶えている。その表情は笑み。死んだ将軍の手を、七海の「右手」が握りしめている。右手にはバングル装備。（七海の右手さえ見えていればいいです）
//２：将軍の手を「右手」で握りしめている七海。右手にはバングル装備。表情は、泣きながら無理に笑顔を浮かべている。目線は空へ。
//３：あやせと優愛が、瓦礫の中に立ち尽くして２人で空を見上げている
//４：セナと梢が、神泉駅の線路にへたり込んで２人で空を見上げている。梢がセナと腕を組んで密着している。
//５：スクランブル交差点の瓦礫の中に、下半身が埋もれている星来覚醒後バージョンフィギュア。埃で汚れた作り物の瞳が空を見上げている。

}











