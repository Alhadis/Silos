//<continuation number="30">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_122_インターミッション２５";
		$GameContiune = 1;
		Reset();
	}

		ch06_122_インターミッション２５();
}


function ch06_122_インターミッション２５()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	Delete("*");
	ClearAll(0);

	CreateTextureEX("背景４", 100, 0, 0, "cg/bg/bg097_01_2_ＡＨ病院外観_a.jpg");
	Fade("背景４", 0, 1000, null, true);

	CreateSE("SE01","SE_日常_ざわめき大");

	IntermissionIn2();

	MusicStart("SE01", 4000, 500, 0, 1000, null, true);
	Wait(1000);


//アイキャッチ
//■インターミッション２５

//ＢＧ//総合病院・外観

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ＡＨ東京総合病院の時間外出入口は、救急外来のために救急車が横付けできるようになっている。

今も、そこには２台の救急車が停まっていて、救急隊員が地震で怪我をした患者を病院内に運び込もうとしていた。

薄緑色の手術着を着た医師と、中年の看護師長が怒鳴りながら搬入の指示を出している。

すでに時間外出入口の周囲には、何人もの診察待ちの患者が座り込んでおり、医師の手が回っていないことを窺わせる。

運び込まれてくる患者には、大きく分けて２種類いた。

外傷を負っている人たちは、額や腕などから血を流し、苦痛に顔を歪めている。見た目にも痛々しいが、彼らの治療は後回しにされていた。

優先的に搬入されているのは、外傷などどこにもないのに意識を失っている患者だ。

今回の地震によって運び込まれる救急患者には、この意識不明の症例がやけに多い。

これまでの大きな地震では見られない現象だった。

そして、彼らが意識不明になった原因について、いまだ医師たちは解明できていなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//救急車のサイレン
	CreateSE("SE02","SE_日常_きゅう急車_サイレン_LOOP");
	MusicStart("SE02", 5000, 1000, 0, 1000, null, true);

	Wait(5000);
	CreateSE("SE03","SE_じん体_動作_尻餅");
	CreateSE("SE05","SE_日常_部屋の扉開く_勢いよく");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
そこへ、さらに別の救急車がけたたましいサイレンを奏でて到着する。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE02",500,0,false);
	Wait(500);
	SoundPlay("SE03", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE05", 0, 1000, false);
	Wait(500);
	SoundStop("SE02");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
救急車から降りた救急隊員は、患者の症状を尋ねる医師に対してこう怒鳴った。

//【救急隊員】
<voice name="救急隊員" class="救急隊員" src="voice/ch06/12200010rq">
「最優先だ！」

説明はそれだけだった。

本来なら、医師は逆に文句を言っていたことだろう。

この混乱している状況でなんの説明もなく
“最優先”と言われたところで、“バカにしているのか”と答えるのが普通だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_車椅す");
	CreateSE("SE03","SE_日常_物音");
	SoundPlay("SE02", 0, 1000, false);
	SoundPlay("SE03", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE02", 200, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]

だが意外にも、医師も看護師長もあっさりとうなずき、
救急車からストレッチャーが降ろされるのを手伝う。

{	SoundPlay("SE03", 1000, 0, false);}
ストレッチャーに寝かせられていたのは、岸本あやせだった。
意識はなく、うめき声をかすかに上げている。

{	CreateSE("SE04","SE_日常_車椅す");
	CreateSE("SE02","SE_じん体_動作_足_走る_LOOP");
	CreateSE("SE03","SE_じん体_動作_足_走る_LOOP");
	SoundPlay("SE04", 0, 500, false);
	SoundPlay("SE02", 0, 1000, false);
	Wait(300);
	SoundPlay("SE04", 600, 0, false);
	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE02", 4000, 0, false);
	SoundPlay("SE03", 4000, 0, false);}
周囲で座り込んでいる外傷患者の恨めしげな視線を意に介さず、医師と救急隊員は急ぎ足でストレッチャーを院内へと運び込んでいった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梨深_制服_正面","sad", 200, @+150);
	FadeStand("st梨深_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12200020ri">
「…………」

その様子を、少し離れた場所――病院の正面入り口にたたずんで、じっと見つめている少女の姿があった。

咲畑梨深は、厳しい表情で眉根を寄せ、唇を噛んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch06/12200030ri">
「岸本……さん……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ

//※梨深はこのとき、セカンドメルトが起きたことで将軍（本物の西條拓巳）の身を案じて学校から駆けつけたところ。

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(2000);
	Wait(2000);

//■インターミッション２５終了
//アイキャッチ

}