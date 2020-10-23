//<continuation number="740">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_128_七海編_朝餉の準備";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_128_七海編_朝餉の準備();
}


function chn_128_七海編_朝餉の準備()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編


//以下、七海編チャプター３。このパートは拓巳の妄想です。ただし妄想エフェクトはあえて付けません

	Wait(1500);

//ＢＧ//拓巳の部屋
	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_03_4_拓巳部屋_a.jpg");
	Fade("back01", 0, 0, null, true);
	Fade("back01", 1000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//ＶＦ//目覚ましのボイス
//【星来】
<voice name="星来" class="星来" src="voice/ch04/07500010se">
「朝だよー！　ほら起きて！　起きなさーい！」

//ＶＦ//目覚ましのボイス
//【星来】
<voice name="星来" class="星来" src="voice/ch04/07500020se">
「起きたら、おはようのキスしてあげるからさ……って、あたしなに言ってんだろバカバカ今の忘れて！」

//ＶＦ//目覚ましのボイス
//【星来】
<voice name="星来" class="星来" src="voice/ch04/07500030se">
「ちょっと！　いつまで寝てるんさ、このぼけなす！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＳＥ//目覚ましを切る
	CreateSE("SE01","SE_じん体_動作_手_目ざましを切る");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
星来たんの声で目を覚ますと、相変わらず七海の姿はなかった。
あいつ、僕に一言もなしに帰ったのか。
それとも、学校に行ったのかな？

今日は、何月何日だっけ？
シフト表だと、今日は学校に行く日だっただろうか。

頭の中が、ぼんやりとしていて、霞がかかってるみたいだ。
……まだ寝ぼけてるなあ。
今、何時だろう……？

床にしゃがみ込んだまま、なおもボーッとしていると――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//ＳＥ//コンテナハウスの扉を開く
//七海は部屋着のまま
	CreateSE("SE02","SE_日常_扉_開ける");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateTexture360("back02", 100, 0, 0, "cg/bg/bg026_01_1_拓巳部屋_a.jpg");
	Fade("back02", 0, 0, null, true);
	Fade("back02", 500, 1000, null, true);

	Stand("st七海_トレーナー_通常","normal", 200, @+100);
	FadeStand("st七海_トレーナー_通常_normal", 500, true);
	Delete("back01");

	BGMPlay360("CH08",0,1000,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500010na">
「あ、おにぃ。やっと起きたー」

扉が開いて、七海が顔をのぞかせた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500020ta">
「か、帰ったんじゃ、ないのか……？」

{	Stand("st七海_トレーナー_通常","angry", 200, @+100);
	FadeStand("st七海_トレーナー_通常_angry", 300, false);
	DeleteStand("st七海_トレーナー_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500030na">
「帰ってないよ。泊まるって言ったじゃん」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500040ta">
「ということは、や、やっぱり、昨日の深夜のあれは、い、いたずらだったんだな……。も、もう二度と、やるな……」

{	Stand("st七海_トレーナー_通常","shock", 200, @+100);
	FadeStand("st七海_トレーナー_通常_shock", 300, false);
	DeleteStand("st七海_トレーナー_通常_angry", 300, true);}
//◆本当に分かっていない
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500050na">
「いたずら？　なんのこと？」

七海は首を傾げてとぼけている。
あくまで、しらを切るつもりか。

ごまかし切れると思っているなんて、僕をバカにするにもほどがあるな。

それにしても、一晩明けて、冷静にこうして見てみると、今の七海はとんでもない格好をしてる気がする。

あのトレーナーの下は、当然ながら……はいてない。
はいてないんだよ、うん。

七海が手を動かすたびに、裾が持ち上がって、チラチラときわどいところが見えそうなんだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st七海_トレーナー_通常","angry", 200, @+100);
	FadeStand("st七海_トレーナー_通常_angry", 300, true);
	DeleteStand("st七海_トレーナー_通常_shock", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆責めるように
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500060na">
「おにぃ、どこ見てんの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500070ta">
「ど、どど、どこも」

七海は裾を手で伸ばし、足の付け根を隠すようにした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500080ta">
「ちょ、そ、そんな伸ばすな！　そのトレーナー、貴重なんだぞ！」

{	Stand("st七海_トレーナー_通常","pride", 200, @+100);
	FadeStand("st七海_トレーナー_通常_pride", 300, false);
	DeleteStand("st七海_トレーナー_通常_angry", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500090na">
「ナナよりトレーナーが心配なんだ。おにぃのバカ」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500100na">
「言っとくけど、下着ははいてるもんね」

え、そうなのか。それは残念……。
って、いやいや、自重しろ僕。妹に欲情するな。
でも下着なんてどうやって手に入れたんだろう？

……まあ、いつもの七海に戻ったみたいでなによりだけど。
昨日はずいぶん弱ってたけど、一晩寝て、吹っ切れたのかもしれない。

と、やけにいい匂いが漂ってきた。
これは……ベーコンが焼ける匂いのような……。

{	Stand("st七海_トレーナー_通常","normal", 200, @+100);
	FadeStand("st七海_トレーナー_通常_normal", 300, false);
	DeleteStand("st七海_トレーナー_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500110na">
「ねえねえ、おにぃも朝ごはん、食べる？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500120ta">
「朝ごはん……」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500130na">
「うん。今、作ってるんだけど」

このベースにおいてキッチン……というか流し台は、コンテナの外、シャワールームのすぐ横に無造作に置いてある。

ちなみにガスは来ていない。代わりに、ネットオークションで格安で手に入れた、カセットガスのコンロを使うしかない。

もっとも僕は自炊なんかしないから、部屋のどこかにしまっておいたままになっていたはず。

七海のヤツ、わざわざ探して引っ張り出してきたのか。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500140ta">
「メ、メニューは？」

{	Stand("st七海_トレーナー_通常","smile", 200, @+100);
	FadeStand("st七海_トレーナー_通常_smile", 300, false);
	DeleteStand("st七海_トレーナー_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500150na">
「サンドイッチとベーコンエッグ」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500160na">
「ここのキッチンじゃ、あんまり凝ったもの、作れないしね」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500170na">
「それに、おにぃは貧乏舌だから、むしろシンプルなものの方がいいかなぁって」

うーむ。

僕の普段の朝食は、コーラと菓子パンというような組み合わせばかりだ。
久々にまともな朝食にありつけそうだぞ。

それに、妹の手作りっていうのは、いざ実際に作ってもらうとそれなりに嬉しかったりするし。
これなら、昨日のいたずらを許してやってもいい。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500180ta">
「よ、よし。さっさと、用意しろ」

{	Stand("st七海_トレーナー_通常","pride", 200, @+100);
	FadeStand("st七海_トレーナー_通常_pride", 300, false);
	DeleteStand("st七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500190na">
「うわー、偉そう……。まったく、少しは感謝してよね？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00500200ta">
「……と、泊めてやったんだから、むしろ、そっちが感謝しろよ」

{	Stand("st七海_トレーナー_通常","smile", 200, @+100);
	FadeStand("st七海_トレーナー_通常_smile", 300, false);
	DeleteStand("st七海_トレーナー_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500210na">
「あはは、それもそうかも。じゃ、一応、感謝感謝♪」

頭でも下げてくれるのかと思ったけど、全然そんなことはなかった。{DeleteStand("st七海_トレーナー_通常_smile", 500, true);}笑顔のまま、七海はさっさと外に出て行ってしまう。

//◆外から呼びかけてきている
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500220na">
「おにぃ、外で食べようよー。
折りたたみ式のテーブル、あったでしょー？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00500230na">
「それ、持ってきてー」

くそぅ、寝起きの人間をこき使いやがって。
これで朝メシがまずかったら、許さないぞ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_扉_開ける");
	MusicStart("SE01",0,1000,0,1000,null,false);

//～～Ｆ・Ｏ
	ClearAll(2000);
	CreateSE("SE01","SE_日常_扉_閉まる");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Wait(1000);

}


