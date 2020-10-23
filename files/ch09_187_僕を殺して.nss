//<continuation number="110">




chapter main
{

	$PreGameName = "boot_第九章";

	if($GameStart != 1)
	{
		$GameName = "ch09_187_僕を殺して";
		$GameContiune = 1;
		Reset();
	}

		ch09_187_僕を殺して();
}


function ch09_187_僕を殺して()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//※拓巳視点に戻る

//ＢＧ//ＰＣ画面（チャット画面）
//※この時点ですでにチャット画面に延々と“僕を殺して”というナイトハルトの書き込みがされている

//ウェブＣＨＡＴ開始
//ＳＥ//キーボードを叩く//以下略

	CreateColor("back03", 2000, 0, 0, 1280, 720, "BLACK");

	CreateTextureEX("back10", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"001");

	Fade("back10", 0, 1000, null, false);
	Fade("box01", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text501]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text502]
ナイトハルト：ぼくを殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text503]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text504]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text505]
ナイトハルト：僕をころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text506]
ナイトハルト：ぼくをコロシテ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text507]
ナイトハルト：ボクお殺ｓて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text508]
ナイトハルト：ボクをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text509]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text510]
ナイトハルト：僕ヲコロして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text511]
ナイトハルト：僕おこｒして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text512]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text513]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("0");



	FadeDelete("back03", 1000, true);

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);


	CreateSE("SE02","SE_日常_PC_キーたたく_中");
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	Wait(3100);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text001]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text002]
ナイトハルト：ぼくを殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text003]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text004]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text005]
ナイトハルト：僕をころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text006]
ナイトハルト：ぼくをコロシテ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text007]
ナイトハルト：ボクお殺ｓて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text008]
ナイトハルト：ボクをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text009]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeChat("3150");


//イメージＢＧ//チャット画面フラッシュ
//ＳＥ//チャット参加音

	ChatPerson("002");

	CreateSE("SE02","SE_日常_PC_ちゃっと_参加音");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
グリムさんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
ナイトハルト：ぼｋをころｓｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
グリム：ちょｗｗｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
ナイトハルト：ぼくをコロシテ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
ナイトハルト：ボクお殺ｓて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：今さら中２病にでもなったか？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
ナイトハルト：ボクをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
グリム：それともリアル女に振られたとか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
グリム：それならいいこと教えてやるお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text021]
ナイトハルト：ぼくを殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text022]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text023]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text024]
グリム：３０歳まで童貞でいると
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text025]
ナイトハルト：僕をころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text026]
ナイトハルト：ぼくをコロシテ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text027]
グリム：魔法が使えるようになる
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text028]
ナイトハルト：ボクお殺ｓて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text029]
ナイトハルト：ボクをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text030]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
グリム：これ豆知識な
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
ナイトハルト：ぼくを殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text033]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text034]
グリム：豆知識ついでに
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text035]
ナイトハルト：ぼくをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text036]
グリム：渋谷スクランブル交差点
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text037]
ナイトハルト：僕をころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text038]
ナイトハルト：ぼくをコロシテ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text039]
グリム：あと一時間ぐらいで祭りが起きるらしい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text040]
ナイトハルト：ボクお殺ｓて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text041]
ナイトハルト：ボクをころして
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text042]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text043]
グリム：ちょｗｗｗおまｗｗｗうぜえｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text044]
ナイトハルト：僕を殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text045]
グリム：それなら祭りに行ってみろよ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text046]
ナイトハルト：ぼくを殺して
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text047]
ナイトハルト：ぼｋをころしｔ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,2000);
	TypeChat("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text048]
グリム：おまいは有名人だから祭り会場で注目の的だお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");


//５秒ほどウエイト

	Wait(5000);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text049]
グリム：そこでなら殺してもらえるんじゃね？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//ウェブＣＨＡＴ終了

//※グリムの「おまいは有名人だから」という書き込みはわざとです。本来ナイトハルトの正体（拓巳）を知らないはずのグリムが「拓巳は有名人」と知っているのはおかしい＝グリムの中の人は拓巳がナイトハルトだと知っている。

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text050]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18700010ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※ＰＣ画面が暗転（モニタの電源を切った
//ＳＥ//モニタの電源を切る
	Request("SE01", Lock);

	ClearAll(1000);

	Request("SE01", UnLock);

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");
	CreateSE("SE02","SE_擬音_妄そうOUT");
	MusicStart("SE02", 0, 500, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text051]
ＰＣモニタの電源を切り、僕はイスの上で膝を抱えた。

{	CreateVOICE("ななみ１","ch01/01000070na");
	SoundPlay("ななみ１",0,300,false);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18700020ta">
「僕を……殺してよ……誰か……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

/*
//以下の七海のセリフ、可能ならセリフ表示なしで、拓巳のモノローグ中に挿入
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700030na">
「おにぃー」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700040na">
「おにぃってば！」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700050na">
「おーい！　開けろー！」

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700060na">
「おーにーーー！」
*/

	CreateVOICE("ななみ１","ch01/01000080na");
	SoundPlay("ななみ１",0,400,false);

//◆扉の外から七海が呼んでいる
//◆１章の七海初登場時と同じように。セリフは完全に同じ
//注！！　扉は叩かないでください
//◆１章とまったく同じなのはわざとです。ここに登場する七海は、七海の妄想が生み出した残留思念のようなもの（リアルブートされていない）


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text052]
手には、僕の唯一の味方である星来たん。

{	CreateVOICE("ななみ１","ch01/01000090na");
	SoundPlay("ななみ１",0,600,false);}
さっきから汗まみれの手で握りしめているせいか、そのスレンダーな肢体がベタベタになってしまっていた。
それに腕もひん曲がってしまっている。

{	SetVolume("ななみ１", 300, 0, NULL);}
//ＶＦ//ドア越しの声
//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700070na">
「こーらーぁ！　開ーけーろー！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch09/18700080ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);
	CreateSE("SE03","SE_日常_家具_イス_きしむ_回転");
	CreateTextureEX("back360", 100, 0, 0, "cg/bg/bg026_03_4_拓巳部屋_a.jpg");
	CreateTextureEX("back11", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	Fade("back360", 300, 1000, null, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601052]
この声……

そんな。
なんで……？

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700090na">
「バカおにーー！」

聞き間違えるはずはない。
このベースを訪れる女子で、こんな風に外から大声で怒鳴り散らしてくるバカはひとりしかいない。

七海が、来た……。

そして、そのことにまったくなんの感慨も抱かない自分に、少し驚く。

どうでもいい……と思ってしまっている。
今さら七海がここにやって来たからって、どうなるって言うんだ。

それに、別に七海が来たって不思議でもなんでもないさ。さっき梨深が七海を助けに行くっていうようなことを言ってたじゃないか。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700100na">
「開けないとひどいんだからねー！」

そのうるささに、イラッと来た。
僕みたいな化け物のことは、ほっといてくれよ。

七海は自分の右手のことだけ考えてろよ。その右手がどうなったのか知らないけどさ……。

僕はもう、他人と話す気になれない。

//【七海】
<voice name="七海" class="七海" src="voice/ch09/18700110na">
「おーーーにーーー！」

{	MusicStart("SE03", 0, 1000, 0, 1000, null, false);
	Fade("back11", 500, 1000, null, true);}
でも、あまりにうるさいので、仕方なく僕はイスから立ち上がると、扉へと向かった。

その扉までの距離が、やけに遠く感じられて、自分が七海と会うことを恐れていると気付いた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("４３");
	TypeBegin();//――――――――――――――――――――――――――――――

	EndTrigger();

	Delete("back360");

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	Fade("色１", 0, 0, null, false);
	Fade("色１", 500, 1000, null, false);

	CreateSE("SE03","SE_日常_扉_開ける");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	WaitAction("SE03", null);

	Delete("back*");


//ＳＥ//コンテナハウスの扉を開ける

}