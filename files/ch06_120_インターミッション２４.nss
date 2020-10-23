//<continuation number="200">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_120_インターミッション２４";
		$GameContiune = 1;
		$GameDebugSelect = 1;
		Reset();
	}

		ch06_120_インターミッション２４();
}


function ch06_120_インターミッション２４()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

if($GameDebugSelect == 1)
{
	SetChoice02("１週目","２週目以降");
	select
	{
		if($SYSTEM_skip||$SYSTEM_text_auto)
		{
			$SYSTEM_skip=false;
			$SYSTEM_text_auto=false;
		}
	
		case @選択肢１:
		{
			ChoiceA02();
			#ClearG=false;
		}
		case @選択肢２:
		{
			ChoiceB02();
			#ClearG=true;
		}
	}
	$GameDebugSelect = 0;
}


	IntermissionIn();

	Delete("*");
	ClearAll(0);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg097_01_2_ＡＨ病院外観_a.jpg");
	Fade("背景１", 0, 1000, null, true);


	IntermissionIn2();


	Wait(3000);


	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg098_01_2_AHロビー_a.jpg");
	Fade("背景２", 500, 1000, null, true);

	Wait(1000);

//アイキャッチ
//■インターミッション２４
//ＢＧ//総合病院ロビー//昼
	CreateSE("SE01","SE_はいけい_びょういん_LOOP");
	MusicStart("SE01", 2000, 100, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ＡＨ東京総合病院の精神科診察室が入っているフロアには、静けさが訪れていた。

外科や救急では、地震が起きて以来、原因不明の症状で意識を失った怪我人が続々と運び込まれていて、大変な状況だと言う。

けれど精神科はその騒ぎにはまったく関係なく、外来の診察もいつもの時間より少し早く終わったほどだ。

数日すれば、ＰＴＳＤになった可能性のある患者が詰めかけてくるのかもしれないが、少なくとも今日に限って言えば、精神科外来の業務はもうない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu志乃_白衣_通常","normal", 200, @150);
	FadeStand("bu志乃_白衣_通常_normal", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
看護師である<RUBY text="はづき">葉月</RUBY><RUBY text="しの">志乃</RUBY>は、前日の夜勤からここまで働きづめで、ほとんど休憩を取っていないことに気付いた。お腹もすいている。

先日、精神科は医師をひとり失い――ニュージェネ事件で無惨にも殺された――その補充要員もまだ来ていないので、ずっと人手不足なのだ。

だが今日の仕事で残っているのは細々とした雑用だけで、次の夜勤の看護師に引き継ぎ作業をすればようやくＯＦＦだ。

さてもうひと頑張り、と自分の頬を両手で叩き、人がいなくなったロビーを足早に横切ろうとしたとき。

ふと、彼女は背中から視線を感じた。
うなじにチリチリとした感覚。ゾクリと腕に鳥肌が立つ。

反射的に、背後を振り返った。
だが、その先には静まり返った廊下が続いているだけで、誰もいない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	Stand("bu志乃_白衣_通常","shock", 200, @150);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000010hd">
「……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000020su">
「看護師さん！」

{	FadeStand("bu志乃_白衣_通常_shock", 200, false);
	DeleteStand("bu志乃_白衣_通常_normal", 300, false);
	Move("bu志乃_白衣_通常_shock", 50, @0, @-5, Dxl1, true);
	Move("bu志乃_白衣_通常_shock", 50, @0, @5, Dxl1, true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000030hd">
「キャッ……」

{	DeleteStand("bu志乃_白衣_通常_shock", 300, false);}
まったく別の方向から飛んできた声に、葉月はビクッと身を震わせた。

無人だと彼女が思い込んでいたロビーに、声の主はひとり残っていて、葉月の姿を見かけて声をかけてきたのだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st護_スーツ_通常","normal", 200, @-150);
	FadeStand("st護_スーツ_通常_normal", 200, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
まだ幼さが残るものの、精悍な顔立ちをした男性だった。顔の血色もよく、とても病気をしているとは思えなかった。

//◆戸惑い気味
//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000040hd">
「あなたは……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000050su">
「ちょっと時間もらっていいッスか？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000060hd">
「はあ……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000070su">
「どもッス！」

//※葉月と諏訪は実は面識があるが、ここではあえて互いに“知らないフリ”をしている。
{	DeleteStand("st護_スーツ_通常_normal", 300, true);
	CreateSE("SE03","SE_じん体_動作_のぞく");
	SoundPlay("SE03", 0, 1000, false);}
照れたように笑うと、男はいきなり葉月の腕をつかみ、ロビーから階段の方へと歩き出した。

戸惑う葉月に、男――<RUBY text="すわ">諏訪</RUBY><RUBY text="まもる">護</RUBY>は懐から黒い手帳を出して控えめに掲げる。それは警察手帳だった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg105_01_2_AH階段_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);0

	BGMPlay360("CH04",2000,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
諏訪は踊り場で立ち止まり、念には念を入れた様子で周囲を見回す。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000080hd">
「それで、あの、お話って……」

葉月は、まだ仕事が残っていることもあって、少しソワソワした表情を見せた。

諏訪もそれは分かっているらしく、前置きもなくポケットから一枚の写真を取り出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu護_スーツ_通常","normal", 200, @-100);
	FadeStand("bu護_スーツ_通常_normal", 200, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000090su">
「この少年に見覚えないッスか？」

そこに写っていたのは、西條拓巳の無気力そうな顔だった。職業柄、顔を覚えることについては自信がある葉月は、ついうなずいてしまう。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000100su">
「西條拓巳……間違いないッスか？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000110hd">
「え、ええ……でも……」

葉月の躊躇は、当然のことだった。

例え相手が警察とは言え、患者の情報を勝手に漏らすことは決していいことではない。

だが諏訪としても、それは承知の上で葉月に話しかけたのだった。それまでの軽い態度を改め、真剣な眼差しを浮かべる。そして、声を潜めて切り出した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆小声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000120su">
「頼みがあるんスけど……」

//◆小声
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000130su">
「西條拓巳のカルテ、こっそり見せてもらえないッスか？」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000140hd">
「え、そんなの……無理です……できません……」

{	Stand("bu護_スーツ_通常","hard", 200, @-100);
	FadeStand("bu護_スーツ_通常_hard", 500, true);
	DeleteStand("bu護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000150su">
「とある事件に関わる、重要なことなんスよ！」

葉月はすっかり困り果ててしまい、たまらずその場から立ち去ろうとするが、諏訪に回り込まれて行く手を塞がれてしまう。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000160hd">
「こ、困ります……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000170su">
「迷惑はかけないッス！　だから頼んまスよ！」

ついには、諏訪はその場に膝をついて、土下座し始めた。

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000180hd">
「や、やめてください、本当に……無理なんです……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch06/12000190su">
「これ以上、犠牲者を出さないためにも……！」

//【葉月】
<voice name="葉月" class="葉月" src="voice/ch06/12000200hd">
「…………」

いったいどうすればあきらめてくれるのかしら――

葉月にはいい断りの文句が思い浮かばず、
ただオロオロとするしかなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ

//※実は諏訪と葉月はともに天成神光会の信者であり顔見知り。葉月は困っているフリ。諏訪も頼んでいるフリ。この後、葉月は内密にカルテを渡す（その部分はここでは描かない）

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(2000);
	Wait(2000);


//※※３６０以下
//２周目以降は以下を追加
//ＢＧ//総合病院ロビー//夕方
if(#ClearG){

	PrintBG(1000);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg105_01_2_AH階段_a.jpg");

	Stand("st志乃_白衣_通常","shock", 200, @250);
	Stand("st護_スーツ_通常","hard", 210, @-250);

	FadeStand("st志乃_白衣_通常_shock", 0, false);
	FadeStand("st護_スーツ_通常_hard", 0, false);
	Fade("背景１", 0, 1000, null, true);

	FadeDelete("back*", 2000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
諏訪と葉月は不意に黙り込み、天井へと目を向けた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st護_スーツ_通常_hard", 500, false);
	DeleteStand("st志乃_白衣_通常_shock", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
それから互いに目配せをする。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――



	Stand("bu護_スーツ_通常","normal", 210, @-250);
	FadeStand("bu護_スーツ_通常_normal", 500, true);
	DeleteStand("bu護_スーツ_通常_hard", 0, true);

	BGMPlay360("CH20",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400010su">
「ふう」

{	Stand("bu志乃_白衣_通常","smile", 200, @250);
	FadeStand("bu志乃_白衣_通常_smile", 500, true);
	DeleteStand("bu志乃_白衣_通常_shock", 0, true);}
諏訪がため息をついたのを合図に、葉月も顔に浮かべていた困惑顔を消す。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400020su">
「……見られていたな」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn00/00400030hd">
「その目だれの目、ね」

唐突に、２人の交わす言葉に馴れ馴れしさが混じった。
旧知の仲としか思えない感情が、その言葉の端々に込められていた。

{	Stand("bu護_スーツ_通常","hard", 210, @-250);
	FadeStand("bu護_スーツ_通常_hard", 500, true);
	DeleteStand("bu護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400040su">
「ニシジョウタクミのオリジナルは見つかったか？」

{	Stand("bu志乃_白衣_通常","normal", 200, @250);
	FadeStand("bu志乃_白衣_通常_normal", 500, true);
	DeleteStand("bu志乃_白衣_通常_smile", 0, true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/chn00/00400050hd">
「いいえ。この病院内にいることは分かっているのに」

//【葉月】
<voice name="葉月" class="葉月" src="voice/chn00/00400060hd">
「これ、カルテよ。彼は夢遊病だわ」

さっきまであれほど渡すのを渋っていたにもかかわらず、葉月はそのカルテをあっさりと諏訪に渡した。まるで諏訪が訪れるのを予想していたかのように、彼女は手元にカルテを用意までしていた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400070su">
「助かる」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400080su">
「じゃ、予定通りにＯ－ＦＲＯＮＴにヤツを誘導して、覚醒させるか」

{	Stand("bu志乃_白衣_通常","worry", 200, @250);
	FadeStand("bu志乃_白衣_通常_worry", 500, true);
	DeleteStand("bu志乃_白衣_通常_normal", 0, true);}
//【葉月】
<voice name="葉月" class="葉月" src="voice/chn00/00400090hd">
「接触するの？」

{	Stand("bu護_スーツ_通常","normal", 210, @-250);
	FadeStand("bu護_スーツ_通常_normal", 500, true);
	DeleteStand("bu護_スーツ_通常_hard", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400100su">
「ああ。顔は隠すけどな」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu志乃_白衣_通常_worry", 500, false);
	DeleteStand("bu護_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
諏訪はいたずらげに笑うと、葉月の唇に軽くキスをした。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/chn00/00400110su">
「コスプレしてパーティーに出発だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	SetVolume360("CH*", 3000, 0, null);

	ClearAll(2000);
	Wait(3000);

//※※３６０以上

}


//■インターミッション２４終了
//アイキャッチ


}