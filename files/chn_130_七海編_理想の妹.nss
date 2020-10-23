//<continuation number="330">

chapter main
{

	$PreGameName = "boot_七海ルート";

	if($GameStart != 1)
	{
		$GameName = "chn_130_七海編_理想の妹";
		$GameContiune = 1;
		$七海ルート=true;
		$RouteON=true;
		Reset();
	}

	chn_130_七海編_理想の妹();
}


function chn_130_七海編_理想の妹()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★七海編


//以下のニュージェネ事件は、拓巳の妄想なので、メインルートでの本来の第６事件「美味い手」とは違っています

//ＢＧ//テレビのニュース（新たなニュージェネ事件『ＳＭＪＫ』発生）
//テロップ部分「ニュージェネ第６の事件か」
	CreateSE("SE01","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");

	CreateTexture360("テレビニュース", 100, 0, 0, "cg/bg/bg213_02_6_chnニュースSMJK_a.jpg");

	CreateMovie360("砂嵐", 200, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);
	SoundPlay("SE01", 0, 1000, true);

	Wait(1000);

	Fade("テレビニュース", 0, 1000, null, true);
	SetVolume("SE01", 100, 0, NULL);
	Fade("砂嵐", 100, 0, null, true);
	Delete("砂嵐");


	BGMPlay360("CH01",3000,1000,true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/chn06/00600010ka">
「２８日未明、渋谷区松濤の路上で、男性の変死体が発見されました」

//◆橋屋泰行＝はしや・やすゆき
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/chn06/00600020ka">
「被害者は練馬区に住む橋屋泰行さん、３１歳で、死因は異物をのどに詰まらせたことによる窒息死と見られています」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/chn06/00600030ka">
「被害者の口には、ハサミで細かく切り刻まれた大量の布が詰め込まれており、また、胃の中からも同様の布が多数、見つかりました」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/chn06/00600040ka">
「警察の発表によりますと、布は渋谷区にある私立翠明学園の女子冬用制服である可能性が高いとのことです。翠明学園は現場から徒歩で３分ほどの距離にあり、警察では事件との関連を調べています」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＢＧ：要差し替え
	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 500, 1000, 0, 1000, null, true);

	CreateTexture360("乳毛速報ＳＭＪＫ", 100, 0, 0, "cg/bg/bg118_06_3_chn掲示板速報_a.jpg");
	Fade("乳毛速報ＳＭＪＫ", 0, 0, null, true);
	Fade("乳毛速報ＳＭＪＫ", 1000, 1000, null, true);
	Delete("テレビニュース");

	WaitKey(3000);
/*
//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
//以下、ＰＣ画面内＠ちゃんねる掲示板のテキスト
//日付は１０月２８日の午後の早い時間

乳毛速報だクマ(ll´（エ）｀ll)

乳毛その１＠集団ダイブ　ﾉﾉﾉ---(ollllll´▽｀)oﾉ
乳毛その２＠妊娠男　＼(||｀□´||;;＼)
乳毛その３＠張り付け　†l†l(＠□＠)l†l†
乳毛その４＠ヴァンパイ屋ξ--（;￣ξ￣;)---ξ
乳毛その５＠ノータリン　ヘ（´ρ｀）ノ~
乳毛その６＠ＳＭＪＫ　(;.;:× Ж ×;:)#⊂（’-’*) 
乳毛その？＠……to be continued!!!(゜ロ)ギョェ
//以上、ＰＣ画面内＠ちゃんねる掲示板のテキスト

//わざと「乳毛速報」です
//『ＳＭＪＫ』＝「ＳＭ趣味のある女子高生」
*/

//ＢＧ//拓巳の部屋
	CreateColor("Black", 4000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	Delete("乳毛速報ＳＭＪＫ");
	CubeRoom4("ルーム", 150, 0);

	CreateSE("SE03","SE_日常_家具_イス_きしむ");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);

	Fade("ルーム", 500, 1000, null, false);

	FadeDelete("Black", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600050ta">
「う、う……」

また、新しい事件だ……。
しかも、ハサミで切り刻まれた翠明の女子冬用制服が、口に詰め込まれたことによる窒息死だって……？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//一瞬、フラッシュバック
//ＣＧ//裸の七海がＫＵＲＥＮＡＩビル屋上の隅にうずくまっている
	CreateSE("SE回想in","SE_衝撃_ふらっしゅばっく");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "White");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	CreateTexture360("背景１", 2000, 0, 0, "cg/ev/ev139_01_3_七海うずくまり_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1000);

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("背景１");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
まさかその制服って、七海の……？
そうだ、こんな偶然、あるわけがない。タイミングがよすぎる。

やっぱり、『将軍』だ！　あいつはこれが目的で、きっと七海を誘拐して、制服だけ剥ぎ取っていったんだ！

絶対に、あいつは僕を挑発してる！
次は、今度こそ、僕だ……。僕が、殺されるんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE02", 200, 1, null);

	CreateSE("SE360701","SE_じん体_掴む");
	MusicStart("SE360701",0,500,0,1000,null,false);


	SetVolume360("CH01", 200, 0, null);
	Wait(100);
	CreateSE("SE04","SE_日常_家具_イス_きしむ");
	CreateSE("SE05","SE_衝撃_ぺっとぼとる");
	CreateSE("SE06","SE_じん体_動作_足_蹴る_イス");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆どしたの＝どうしたの
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600060na">
「おにぃ？　どしたの？」

//▼べー：背景効果：調整の必要があるかもしれません。
{	MoveCube("ルーム", 200, @0, @0, @0, Dxl2, false);
	Rotate("ルーム", 200, @-5, @0, @0, AxlDxl, false);
	SoundPlay("SE04", 0, 1000, false);
	SoundPlay("SE06", 0, 1000, false);
	Wait(200);
	SoundPlay("SE05", 0, 1000, false);
	Shake("ルーム", 500, 0, 5, 0, 0, 500, null, false);}
背後から七海が声をかけてきて、僕はたまらずイスから転げ落ちそうになった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	CreateTexture360("bg026_02_1_拓巳部屋_a.jpg", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("ルーム", 500, 0, null, true);
	Delete("ルーム");

	Stand("st七海_トレーナー_通常","shock", 200, @+150);
	FadeStand("st七海_トレーナー_通常_shock", 300, true);

	SetVolume("SE02", 2000, 300, null);

	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600070na">
「顔色、悪いみたいだけど……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600080ta">
「あ、な、七海……」

七海に、手を伸ばす。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600090ta">
「ぼ、僕は、殺される……」

{	Stand("st七海_トレーナー_拗ね","angry", 200, @+150);
	FadeStand("st七海_トレーナー_拗ね_angry", 300, false);
	DeleteStand("st七海_トレーナー_通常_shock", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600100na">
「殺されるって……そ、そんな冗談やめてよー」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600110ta">
「ホ、ホントなんだっ！　間違いないあいつは次こそ僕を狙ってくる七海ごめん僕のせいであいつはお前のこと誘拐して……あああ、僕は、ど、どうすれば……、うう、怖い……怖いよ……」

妹の前で情けないとは思うけど、もう心の余裕なんてなかった。

誰かにすがりたい。守ってほしい。
梨深はここ最近、まったく連絡はない。
あやせは病院で入院中。

他に僕を守ってくれそうな人なんて誰もいない……。

と、伸ばした僕の手を、七海がそっと握ってきた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st七海_トレーナー_拗ね_angry", 500, true);
	Stand("bu七海_トレーナー_通常","shy", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600120na">
「もう、ホント、おにぃはダメダメだなぁ。１人じゃなんにもできないんだから」

{	Stand("bu七海_トレーナー_通常","normal", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_normal", 300, false);
	DeleteStand("bu七海_トレーナー_通常_shy", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600130na">
「きっとゲームのやり過ぎで疲れてるんだよ。今日はパソコンはやらずに、ソファで横になってた方がいいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600140ta">
「僕を……１人にしないで……」

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 300, false);
	DeleteStand("bu七海_トレーナー_通常_normal", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600150na">
「分かった、分かったから」

//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600160na">
「おにぃを１人になんかしないよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600170ta">
「ホ、ホント……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600180na">
「ホント。昨日はナナがおにぃに優しくしてもらったから、そのお礼」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600190ta">
「七海……うう……」

やっぱり、持つべきものは家族だ。
赤の他人なんか、いざというときにはちっとも役に立たない。
心の底から僕の支えになってくれるのは、家族だけなんだ……。

七海から救いの手を差し伸べられたことにホッとして、たまらず涙が溢れそうになった。

七海の手にすがりつく。

{	Stand("bu七海_トレーナー_通常","shy", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shy", 300, false);
	DeleteStand("bu七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600200na">
「甘えん坊だね、おにぃって。これじゃ、ナナがお姉さんで、おにぃが弟みたいだよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600210ta">
「う、うるさいな……」

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 300, false);
	DeleteStand("bu七海_トレーナー_通常_shy", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600220na">
「はいはい、よしよし」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
七海が、冗談めかして僕の頭を撫でてくれる。

七海にとっては単なる冗談かもしれないけど、今の僕にとっては、その感触がとても心地よかった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600230ta">
「な、七海、あの……頼みが、ある……」

{	Stand("bu七海_トレーナー_通常","shock", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shock", 300, false);
	DeleteStand("bu七海_トレーナー_通常_smile", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600240na">
「なに？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600250ta">
「その……」

普段、七海とはケンカばっかりなだけに、こんなことを頼むのはかなり恥ずかしいんだけど……なりふり構っていられないよな……。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600260ta">
「き、今日も、と、と、と……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600270ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu七海_トレーナー_通常","pride", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_pride", 300, false);
	DeleteStand("bu七海_トレーナー_通常_shock", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600280na">
「なんでそこで黙っちゃうかなぁ。ちゃんと言ってくれなきゃ、分かんないってば」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600290ta">
「……き、今日も、と、泊まっていって、くれ……」

そうすれば、少しは安心できる……。１人でこの部屋で『将軍』の影に怯えているなんて、耐えられない。

でも、七海は嫌がりそうだな……。下手をすると、ヘンタイ呼ばわりされるかも……。
七海のリアクションを予想して、僕はおずおずと七海を見た。

{	Stand("bu七海_トレーナー_通常","smile", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_smile", 300, false);
	DeleteStand("bu七海_トレーナー_通常_pride", 300, true);}
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600300na">
「なぁんだ、そんなことかー。別に何泊したっていいよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600310ta">
「ホント……！？」

{	Stand("bu七海_トレーナー_通常","shy", 200, @+150);
	FadeStand("bu七海_トレーナー_通常_shy", 300, false);
	DeleteStand("bu七海_トレーナー_通常_smile", 300, true);}
//◆照れ隠し
//【七海】
<voice name="七海" class="七海" src="voice/chn06/00600320na">
「い、一応、ナナだっておにぃの心配はしてるんだからねっ。さすがに、今のおにぃを放っておけないよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn06/00600330ta">
「あ、ありがとう……助かる……」

よかった……。
やっぱり家族が一番だ。いや、実妹が、一番だ……。
七海が実妹で、ホントによかった……。

これで後は、生意気なところさえ直してくれれば、理想の妹なんだけどな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, null);

//～～Ｆ・Ｏ
	ClearAll(2000);
	Wait(1000);
}

