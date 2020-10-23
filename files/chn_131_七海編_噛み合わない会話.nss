//<continuation number="240">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_131_七海編_噛み合わない会話";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_131_七海編_噛み合わない会話();
}


function chn_131_七海編_噛み合わない会話()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編
//以下、七海編チャプター４。このパートは「現実」です。ただし妄想エフェクトをあえて付けます

//ＢＧ//拓巳の部屋//天井
	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	Wait(500);

	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg026_05_3_chn拓巳部屋_a.jpg");

//おがみ：挙動確保のためルーム削除
//	CubeRoom3("ルーム", 100, 0);
//	Fade("ルーム", 0, 1000, null, true);
//	Rotate("ルーム", 10, 90, 0, 0, Axl1, true);

	CreateEffect("レンズ１", 3000, -200, -400, 1600, 1600, "Lens");
	SetAlias("レンズ１", "レンズ１");
	CreateProcess("レンズプロセス１", 1000, 0, 0, "LensMove");
	Request("レンズプロセス１", Start);

	CreateSE("SE360101","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE360101",2000,1000,0,1000,null,true);


	FadeDelete("Black", 1000, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
七海が、帰ってこない……。

あの後、昼ぐらいになって、七海は食事の買い出しを兼ねて、服を取りに一度家に戻った。
“すぐ戻ってくるね”なんて言って、呑気に手を振って出て行った。

それからもう、８時間以上経っている。
僕はネットもやらず、ブラチューを見たりすることもせず、ただひたすらソファに座って、七海の戻りを待ち続けていた。

自分のケータイを握りしめ、七海から電話かメールでも来ないものかと、１分おきでチェックもしていた。

こっちから電話もしてみたけど、電源が入ってないか電波が届かないっていうアナウンスが出るだけだった。

どうして、帰ってこないんだ？
家で親になにか言われたのかな？　なにかってなんだ？

//◆↓わざと「あるあ……」です
“いくら兄妹とは言え、年頃の男女が狭い部屋で一夜を明かすなんていけません”とか？<k>
あるあ……ねーよ。

あるいは、制服をなくしたことについて、もめているのかもしれない。

よくよく考えれば、七海はこのベースにたどり着くまで、全裸で渋谷の街を徘徊してたってことになるわけで。

はっきり言って、刑事事件になってもおかしくない状況だ。
その話を聞いて驚いた両親が、慌てて警察に通報するのは、有り得る話。

でも、もしもそんな理由じゃなくて、もっとまずい状況になっていたとしたら？

家に戻ろうとした七海を、今度こそ『将軍』――あるいはその手下の優愛とか――が、連れ去っていったとしたら？

あまつさえ、もう殺されていたとしたら？

『将軍』からのメールがまた来ているかもしれないと思うと、怖くてＰＣのメールソフトをチェックする気にはなれなかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700010ta">
「うう、七海……僕を、１人にしないで……」

早く戻ってきてほしい。

僕が落ち着くまで、学校なんていかず、ずっとそばにいてほしい。
梨深はそう約束してくれたのに、いなくなった。
七海までいなくなったら、僕は……僕は……！

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 300, 0, null);

	Wait(200);

//ＳＥ//ケータイバイブの音
	CreateSE("SE01","SE_日常_けい帯_ばいぶ_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);

	Wait(1000);

	CreateSE("SE360201","SE_じん体_動作_足_蹴る_イス");
	MusicStart("SE360201",0,1000,0,1000,null,false);


	Rotate("ルーム", 400, 0, 0, 0, Axl1, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700020ta">
「っ！」

//着信表示画面は出さないで下さい
手に握っていた僕のケータイが、ブルブルと震え出した。
すぐさま受信ボタンを押して繋げる。

{	CreateSE("SE02","SE_日常_けい帯ボタン押す");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	SetVolume("SE01", 0, 0, null);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700030ta">
「も、もしもしっ！　七海！」

//ＶＦ//電話の声
//◆苦しげな息
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700040na">
「…………」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700050ta">
「おい……、七海、今、どこにいる……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(0,0);//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,1000,true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700060na">
「おにぃ……」

//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700070na">
「助けて……」

ギクリとした。まさか、ホントに『将軍』にさらわれた……！？

//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700080na">
「どうして……」

//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700090na">
「どうして、見捨てたの……？　ねえ、おにぃ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700100ta">
「『将軍』か！？　あいつに、な、な、なにかされたの！？」

//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700110na">
「うぅ……痛いよ……」

//ＶＦ//電話の声
//◆弱々しい
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700120na">
「右手が、痛いの……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ブツッとケータイ切れる
//ＳＥ//ツーツーツー
	CreateSE("SE03","SE_日常_でんわ_ぶつっと切れる");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	WaitPlay("SE03", null);
	CreateSE("SE04","SE_日常_でんわ_つーつーつー_LOOP");
	MusicStart("SE04", 0, 1000, 0, 1000, null, true);

	Wait(1500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700130ta">
「……また、だ」

ケータイをのろのろと下ろして、僕はほとんど無意識にそうつぶやいていた。

デジャヴ。

似たようなやり取りは、昨日もあった。
あのときも七海は『右手を返して』と言ってた。
いたずらだと思ってた。

でも、違うの……？

分からない。

僕は頭を抱えて、その場でうずくまった。
七海、いったい、どこにいるんだ。
早く戻ってきて……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 2000, 0, null);


//～～Ｆ・Ｏ
	SetVolume("SE04", 1000, 0, null);
	CreateColor("フェードアウト", 4000, 0, 0, 1280, 720, "Black");
	Fade("フェードアウト", 0, 0, null, false);
	Fade("フェードアウト", 2000, 1000, null, true);


//	Delete("ルーム");
	Delete("back01");
	Delete("レンズ１");

	Wait(1000);

//以下、七海編チャプター５。このパートは拓巳の妄想です。ただし妄想エフェクトはあえて付けません
//ＢＧ//コンテナ外観・夜

	CreateSE("SE05","SE_日常_扉_開ける");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	CreateSE("SE360101","SE_日常_雑踏_遠い");
	MusicStart("SE360101",2000,300,0,1000,null,false);


	CreateTexture360("back01", 100, 0, 0, "cg/bg/bg006_01_3_コンテナ外観_a.jpg");
	FadeDelete("フェードアウト", 1000, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
フラフラと、なんのあてもなく外に出た。
すでに空は暗く、月すらも出ていない。
遠くに見える渋谷の遠景は、薄ぼんやりとした光に包まれていた。

外に出たのはいいけど、七海を探しに行くほどの行動力はなかった。

もう一度、七海に電話をかけてみるべきだろうか。

二日連続で七海にいたずらを仕掛けられたっていう可能性だってあるんだ。

僕が、深刻に考え過ぎてるだけかも――

//ここでの七海は私服姿
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700140na">
「おにぃ、なにしてんの？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700150ta">
「！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(500);

//ここでの七海は私服姿
	Stand("st七海_私服_通常","shock", 200, @+150);
	FadeStand("st七海_私服_通常_shock", 300, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
ハッとして声のした方を見ると、買い物袋を持った七海が、きょとんとした顔で立っていた。
着替えてきたのか、出て行ったときと服装が違う。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700160ta">
「お、お前……今までどこに……」

{	Stand("st七海_私服_通常","normal", 200, @+150);
	FadeStand("st七海_私服_通常_normal", 300, false);
	DeleteStand("st七海_私服_通常_shock", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700170na">
「ごめんね、遅くなっちゃって。お母さんと一緒に、新しい制服を買いに行ってたら、こんな時間になっちゃった」

それは、僕が予想していた中で一番無難な答えだった。
でも、もしそうだとしたら、ひとつおかしなことがある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("st七海_私服_通常","shock", 200, @+150);
	FadeStand("st七海_私服_通常_shock", 300, true);
	DeleteStand("st七海_私服_通常_normal", 0, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700180ta">
「さ、さっきの電話は……？」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700190na">
「電話って？　ああ、メールで遅れるって伝えておけばよかったね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700200ta">
「そ、そうじゃなくて、
電話、してきただろ……、僕の、ケータイに……」

{	Stand("st七海_私服_通常","pride", 200, @+150);
	FadeStand("st七海_私服_通常_pride", 300, true);
	DeleteStand("st七海_私服_通常_shock", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700210na">
「ううん、してないよ。おにぃ、ボケボケだね」

いたって脳天気に、七海はそう答えた。
会話がかみ合わない……。

{	Stand("st七海_私服_通常","smile", 200, @+150);
	FadeStand("st七海_私服_通常_smile", 300, true);
	DeleteStand("st七海_私服_通常_pride", 0, true);}
//■３６０
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700220na">
//「それより、今日の晩ご飯はなんだと思う？　へへ～、なんと、ハンバーグだよ。ナナの手作りだよ。これから作るから、おにぃも手伝ってね」
「それより、今日の晩ご飯、なんだと思う？　へへ～、なんと、ハンバーグだよ。ナナの手作りだよ。これから作るから、おにぃも手伝ってね」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00700230ta">
「ちょ、ま、待て！　待てよ！　電話したよな！？　右手を返せとか、言ったよな！？」

{	Stand("st七海_私服_通常","angry", 200, @+150);
	FadeStand("st七海_私服_通常_angry", 300, true);
	DeleteStand("st七海_私服_通常_smile", 0, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00700240na">
「もー、しつこい。言ってないってば。
　誰かと間違えてるんじゃないの？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_私服_通常_angry", 500, true);

	CreateSE("SE360201","SE_日常_扉_開ける");
	MusicStart("SE360201",0,1000,0,1000,null,false);

	Wait(2000);

	CreateSE("SE360301","SE_日常_扉_閉まる");
	MusicStart("SE360301",0,1000,0,1000,null,false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
七海は本気でムスッとした顔になると、さっさとコンテナの中に入っていってしまった。

僕を騙している？

とてもそんな風には見えない。
それに七海は、こんな悪趣味ないたずらはしない。
少なくともこれまで、された覚えはない。

じゃあ、あの電話は……なんだ？
これも『将軍』の罠なのか？

首筋に、チリチリとした感覚。
見られている……ような気がする。

――その目だれの目？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1000);
}
