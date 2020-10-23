//<continuation number="270">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_183_インターミッション４４";
		$GameContiune = 1;
		Reset();
	}

		ch09_183_インターミッション４４();
}


function ch09_183_インターミッション４４()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//合流２
//アイキャッチ
//■インターミッション４４
//ＢＧ//渋谷駅ガード下//夜
	IntermissionIn();

	DeleteAll();

	CreateTextureEX("back01", 100, 0, 0, "cg/bg/bg091_01_3_渋谷ガード下_a.jpg");
	Fade("back01", 0, 1000, null, true);

	IntermissionIn2();

	CreateSE("SE01","SE_日常_雑踏02");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
咲畑梨深は、渋谷駅のガード下を歩きながら、ケータイを取り出した。

拓巳と別れた後、彼女はまっすぐにここまで歩いてきたのだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_けい帯操作");
	MusicStart("SE02", 500, 1000, 0, 1000, null, false);
	WaitAction("SE02", null);
	CreateSE("SE03","SE_日常_でんわ_呼びだし音_LOOP");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//※七海のケータイは、拓巳の部屋から梨深が回収して今は将軍が持っている
アドレス帳を呼び出し“ナナちゃん”という名前で登録されている番号をコールする。

{	SetVolume("SE03", 0, 0, NULL);}
相手は、すぐに出た。

//◆以下、梨深は電話の相手（将軍）に向かって話している
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300010ri">
「あ、うん。あたし」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300020ri">
「実は、ちょっとした報告がありまーす」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300030ri">
「……ナナちゃんを、これから助けに行こうと思って」

梨深には、七海がどこに捕らえられているのか、誰に捕らえられているのか見当がついていた。
かつて自分も同じ境遇にあったから、分かる。

それは忘れたい過去だったが、七海を助けるために、あえて暗い記憶と再び対面する覚悟だった。

電話の相手のリアクションは、梨深の予想した通りのもので。だから彼女は、苦笑してしまう。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300040ri">
「たはは。あたしって信用されてないなあ。平気だってば」

その声も、表情も、とても明るい。
彼女の抱く悲壮な覚悟など微塵も感じさせず。
傍目には、楽しげに電話しているようにしか見えない。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300050ri">
「昔の話だしね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300060ri">
「そもそも、あたしの感情と、ナナちゃんを助けることと、どっちを優先させるかなんて、決まり切ってることだよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300070ri">
「言ったでしょ。あたしは、あなたの力になりたいって」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300080ri">
「それに……タクには、関わらせたくないの」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
梨深はそこで、表情を曇らせた。

{	BGMPlay360("CH16", 2000, 1000, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300090ri">
「ねえ、ちょっとだけ、語っちゃっていいかな？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300100ri">
「タクにね、いろいろ、ひどいこと、言っちゃったんだ……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300110ri">
「しかも、そんなことしておいて、すごく自分勝手なんだけど……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300120ri">
「あたし、彼と一緒に過ごした時間は、とっても楽しかったって、思っちゃってるんだ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300130ri">
「なにもかもが、妄想でまみれたまやかしでしかなかったのに」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300140ri">
「学生生活も」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300150ri">
「あの学校にあたしやタクが通っていることも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300160ri">
「大ちんと友達だっていうことも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300170ri">
「あたしがタクと一緒にいようとしたことも」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300180ri">
「タクの存在そのものも」

梨深の歩く速度が、少しずつ緩やかになっていく。
後ろから、見ず知らずの人たちが彼女を追い抜いていく。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300190ri">
「タクって、どうしようもないくらい情けなくて。どうしようもないくらい弱くて。きっと普通の女だったら、見向きもしないような男の子なんだよ」

話しながら。
耳に当てたケータイを握る手に、力がこもる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//渋谷駅東口//夜
//※可能なら東急文化会館とその屋上のプラネタリウムが見えているようにしてください
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg197_01_3_渋谷駅東口とプラネタリウム_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg197_01_3_渋谷駅東口とプラネタリウム_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300200ri">
「なのに、あたしの心には――楽しかった、っていう気持ちがあるの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300210ri">
「なのに、あたしの心には――もっと一緒にいたかった、っていう気持ちがあるの」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300220ri">
「この気持ちって、なんなのかな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("back10", 100, 0, -72, "cg/bg/bg206_01_3_夜空_a.jpg");
	Move("back10", 1000, 0, 0, Dxl1, false);
	Fade("back10", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
見上げれば、ネオンに照らされた夜空。
星は、見えない。
しばし梨深はそこに立ち止まる。

{	SetVolume360("CH16", 1500, 0, NULL);}
//◆かすかに微笑むブレス
//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300230ri">
「…………」

梨深は電話の相手の言葉にかすかに微笑みを浮かべた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300240ri">
「さてと、そろそろ切るね」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300250ri">
「あはは。本当に大丈夫だって。あなたはなにも心配しないで。あたしが全部、決着をつけてくるから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300260ri">
「ね――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/ch09/18300270ri">
「タクミ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 1000, 0, NULL);

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	Fade("back03", 0, 0, null, false);
	Fade("back03", 1000, 1000, null, true);

	Wait(2500);

	CreateSE("SE01","SE_日常_けい帯ボタン押す");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	WaitAction("SE01", null);

	DeleteAll();

	Wait(2000);

//ＢＧ//黒
//ＳＥ//ケータイを切る
//～～Ｆ・Ｏ

//■インターミッション４４終了

}