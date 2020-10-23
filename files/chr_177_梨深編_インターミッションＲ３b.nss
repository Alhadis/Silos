//<continuation number="910">

chapter main
{

	$PreGameName = "boot_梨深ルート";

	if($GameStart != 1)
	{
		$GameName = "chr_177_梨深編_インターミッションＲ３b";
		$GameContiune = 1;
		$梨深ルート=true;
		$RouteON=true;
		Reset();
	}

	chr_177_梨深編_インターミッションＲ３b();
}


function chr_177_梨深編_インターミッションＲ３b()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//■インターミッションＲ３
//ＢＧ//プラネタリウム・ロビー
//梨深はディソードはまだ出してません（立ち絵表示する場合）
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 1000, null, true);

	Wait(1000);

	CreateSE("SE360101","SE_はいけい_崩壊しぶ谷_神泉えきほーむ_LOOP");
	MusicStart("SE360101",2000,500,0,1000,null,true);


	CreateTexture360("back05", 100, 0, 0, "cg/bg/bg199_01_3_プラネタリウム・ロビー_a.jpg");
	Stand("st梨深_制服_正面","hard", 500, @+100);
	FadeStand("st梨深_制服_正面_hard", 0, true);
	FadeDelete("Black", 1500, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ノアⅡ。災厄をもたらすもの。あるいは人類の理想郷を作るもの。

どちらだろうと、梨深にとってはあまり意味がなかった。
どちらだろうと、梨深にとってそれは“壊すべきもの”だったから。

ノアⅡの場所は、梨深には分かっていた。
静かに、そして巧妙に人々の意識の中に埋め込まれた、周囲共通認識。

渋谷の駅の目の前にありながら。
数年前に取り壊された建物でありながら。

誰も疑問に思わずそこにあり。
誰も足を踏み入れてこようとはしない。

人の気配がしない、かつてプラネタリウムだったその扉を開いて、梨深は中へと踏み込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼べー：ＥＶ：要調節
//ＳＥ//プラネタリウムの扉を勢いよく開く
//ＣＧ//ノアⅡ（ev084）
//ＳＥ//ノアⅡ稼働音
	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);
	DeleteStand	("st梨深_制服_正面_hard", 0, true);
	
	CreateSE("SE01","SE_日常_ぷらねたりうむ入り口扉開く");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	SetVolume("SE360101", 2000, 0, null);


	Wait(2000);

	CreateTexture360("back12", 500, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("back12", 500, 1000, null, true);

	CreateSE("SE360110","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE360110",2000,500,0,1000,null,true);


	CreateTexture360("back10", 100, 0, 0, "cg/ev/ev084_01_3_ノアII_a.jpg");
	Fade("back10", 0, 1000, null, true);
	Fade("back12", 0, 0, null, false);
	Delete("back12");

	FadeDelete("Black", 1000, true);
	Delete("back05");

	Wait(1000);

	Move("back10", 3000, @0, -832, Dxl1, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
そこに広がる光景に、梨深は目を見開いた。
あまりにも巨大な、怪物を思わせる『装置』。
それが、ドーム状の部屋の中央に鎮座していた。

広い室内には、不気味な音がかすかに響いている。
それは低く、獣がうなるような音。
『装置』が稼働していることを意味する音。

ノアⅡ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梨深_制服_正面","hard", 600, @+360);
	FadeStand("bu梨深_制服_正面_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200200ri">
「ナナちゃん……！」

西條七海が、その装置のすぐ横に囚われていた。

破れかけた制服、血がにじんだ右手の包帯、力なく垂れた頭。ひどく青ざめた顔色。
その痛々しい姿に、梨深は言葉を失う。

//◆ここはあえて「磔」
磔にされたナザレのイエスのごとく。
いや、七海を捕らえているのは、十字架と呼べる代物ではない。
それとはかけ離れた、あまりにも悪意に満ちた形状。

この世のすべての邪悪――
この世のすべての混沌――
この世のすべての背徳――

それらを形として表象させたものと言っても過言ではなかった。

梨深は警戒しながら、素早く周囲を見回す。

七海以外に人影はない。
ノアⅡの開発を主導し、かつて梨深に残酷な拷問を行ったあの男――野呂瀬玄一の姿は見当たらなかった。

梨深は意外に思いつつも、七海を助けることを優先し、彼女を磔にしているオブジェへと駆け寄った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_足_走る_LOOP");
	MusicStart("SE01",0,1000,0,1000,null,false);


	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 500, 1000, null, true);

	Delete("back10");
	DeleteStand("bu梨深_制服_正面_hard", 0, true);

//▼べー：立ち絵：ディソード出してない差分があったら差し替え、なかったらなしで
//	Stand("bu七海_制服ダメージ_武器構え","lost", 650, @-200);
//	FadeStand("bu七海_制服ダメージ_武器構え_lost", 0, false);


	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("back06", 0, 1000, null, true);

	FadeDelete("Black", 500, true);

	Wait(1000);

	SetVolume("SE01", 500, 0, null);


	Stand("bu梨深_制服_正面","hard", 600, @+200);
	FadeStand("bu梨深_制服_正面_hard", 500, true);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200210ri">
「ナナちゃん、しっかり」

//◆↓七海セリフは『ch09/19100210na』流用
//【七海】
<voice name="七海" class="七海" src="voice/ch09/19100210na">
「う……うう……」

{	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);}
オブジェから七海を下ろし、七海に息があることを確認してホッとする。

ひとまず七海をどこか安全な場所に連れていかなくちゃ。
梨深は七海を抱き上げようとした。

だが――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//▼べー：立ち絵：七海ディソードなしがあれば差し替えなければ削除
//▼べー：ＳＥ：調整
//ＳＥ//剣で刺される
//	CreateSE("SE02","SE_擬音_ディそーど_さす");
//	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

	SetVolume("SE360110", 100, 1, null);


	CreateSE("SE02","SE_擬音_ディそーどかまえる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateSE("SE360103","SE_じん体_血_噴きでる");
	MusicStart("SE360103", 0, 1000, 0, 1000, null, false);

	Shake("back06", 500, 50, 50, 0, 0, 500, null, false);


	CreateColor("血１", 1500, 0, 0, 1280, 720, "RED");
	DrawTransition("血１", 200, 300, 1000, 500, null, "cg/data/zoom1.png", true);
	DeleteStand("bu梨深_制服_正面_hard", 0, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//	DeleteStand("bu七海_制服ダメージ_武器構え_lost", 0, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200220ri">
「がはっ……！？」

背中に激痛。
抉られるような。

//ＳＥ//血が飛び散る
{	CreateSE("SE03","SE_じん体_動作_と血");
	MusicStart("SE03", 0, 1000, 0, 1000, null, false);}
梨深は血を吐いた。
その血が、七海の服にかかる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE360110", 2000, 500, null);

	FadeDelete("血１", 1000, true);

	CreateSE("SE01","SE_じん体_手首_たれる血");
	MusicStart("SE01",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200230nr">
「久々の再会だというのに、私には挨拶もなしですか？」

痛みをこらえ、振り返る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(500);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "RED");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Stand("st玄一_スーツ_武器構え","pride", 500, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 1000, true);

	Wait(1000);

	BGMPlay360("CH06",2000,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
野呂瀬玄一が、すぐ背後に立っていた。

その手には――

直前まで七海を捕らえていたオブジェ。
それはオブジェではなく、剣。
野呂瀬玄一の、ディソード。

そのディソードが、梨深の身体に突き刺さっている。

野呂瀬が手をゆっくりと引く。

身体に食い込んでいた、ディソードの鋭い刃が、梨深の肉の上を滑り、骨の表面を擦る。

身を削られるような激痛に、梨深は弓なりに身体を痙攣させた。

{	CreateSE("SE01","SE_擬音_ディそーど_さす");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200240ri">
「う、ああぁっ……！」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200250nr">
「痛みには慣れているはずでしょう？」

野呂瀬の剣が、梨深の身体から抜けた。

{	CreateSE("SE01","SE_じん体_血_噴きでる");
	MusicStart("SE01",0,1000,0,1000,null,false);}
大量の血が溢れ出す。
身体じゅうの神経が悲鳴を上げる。
痛みで今にも気絶しそうだった。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200260nr">
「その娘は、西條拓巳をおびき寄せる貴重な餌なのです。勝手に連れて行かれては困りますね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//おがみ：ST：怪我差分ないので表示しないでおこう
//	Stand("st梨深_制服_正面","hard", 600, @-300);
//	FadeStand("st梨深_制服_正面_hard", 500, true);

	CreateColor("Black", 550, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200270ri">
「……うぅ」

野呂瀬のギガロマニアックスとしての力の強大さを、梨深はよく知っている。
なにしろ、この男に３年以上もの間、捕らわれていたのだ。

まともにやりあっても勝ち目はない。
かと言ってこのまま逃がしてもらえるわけもない。

――せめて、ナナちゃんだけでも逃がさなきゃ。

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
口の中に、血の味が広がっている。
激しい嘔吐感がさっきから断続的にこみ上げてきている。

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 300, 0, null, true);}
背中の傷口は火で炙られ続けているかのように熱く。
痛みのせいで身体は満足に動かせず。
血は際限なくにじみ出している。

{	CreateSE("SE01","SE_じん体_心臓_鼓動");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("Black", 300, 400, null, true);
	Fade("Black", 1000, 0, null, false);}
意識が途切れそうになる。

とても寒い。

目がかすむ。
その視界の中で、野呂瀬が嘲るような笑みを浮かべている。

ダメかもしれない――

梨深には自分がこの男から逃れる未来を妄想することができない。
心を占めるのはただ絶望だけ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Fade("Black", 0, 1000, null, true);
	SetVolume360("CH*", 200, 0, null);
	SetVolume("@SE*", 200, 0, null);

	Wait(600);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200280jn">
「僕の力を、あげるよ」

//	Stand("st梨深_制服_通常","shock", 600, @-300);
//	DeleteStand("st梨深_制服_正面_hard",300, false);
//	FadeStand("st梨深_制服_通常_shock", 300, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200290ri">
「……！？」

その声は、梨深にとって聞き覚えのあるものだった。

ニシジョウタクミ。
あるいは『将軍』と名乗る少年。

声は遠隔からの、いわばテレパシーのようなものだ。
思考盗撮と同じ原理。
ギガロマニアックスだからこそできる芸当。

{	BGMPlay360("CH22",0,1000,true);}
//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200300jn">
「僕の最期の妄想を、君に」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200310ri">
「タクミ……？」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200320jn">
「君に、こんな辛い役目を任せてしまって、ごめん」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200330jn">
「もう、余計なことは言わない。君の意志を曲げることは無理だって、分かったから」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200340jn">
「死ぬつもり、なんだね？」

――死なずになんとかできる方法があったなら、そうしてたけど。

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200350jn">
「“彼”が目覚めなかった以上、僕にはどうすることもできない」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200360jn">
「だからせめて、僕の最期の妄想を、君に」

//	Stand("st梨深_制服_正面","sad", 600, @-300);
//	DeleteStand("st梨深_制服_通常_shock", 300, false);
//	FadeStand("st梨深_制服_正面_sad", 300, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200370ri">
「な、なに言ってるの！？　あなたはそんなことしなくても――」

梨深は、この場にいない相手に向かって叫んだ。

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200380jn">
「君だけを、死なせるわけにはいかないよ。すべての元凶は僕なんだから」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200390ri">
「だって……！」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200400jn">
「もういいんだ」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200410jn">
「梨深、野呂瀬を……殺してほしい。ノアⅡを、破壊してほしい」

//◆心の声
//【将軍】
<voice name="将軍" class="将軍" src="voice/chn01/02200420jn">
「僕が、サポートするから」

梨深は唇を噛み、涙を拭い、遠のきそうになる意識を必死にたぐり寄せた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH22", 1000, 0, null);


//▼べー：エフェクト待ち、とりあえず白フラッシュ
	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("White", 0, 0, null, true);
	Fade("White", 0, 1000, null, true);
	Delete("Black");
//ＳＥ//梨深ディソード顕現
//画面エフェクト//羽根が舞う
//以降、野呂瀬戦決着まで画面エフェクトずっと継続
	CreateSE("SE04","SE_擬音_ディそーど出現");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

//	DeleteStand("st梨深_制服_正面_sad", 0, true);
//	Stand("st梨深_制服_武器構え","hard", 600, @-300);
//	FadeStand("st梨深_制服_武器構え_hard", 0, true);

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Wait(1000);

	FadeDelete("White", 1000, true);

	BGMPlay360("CH29",0,1000,true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ディソードをリアルブート。
ひらひらと、無数の輝く羽根が舞い散る。

七海を片手に抱いたまま、梨深は剣を構えた。

ボタボタと、大量の血痕が足許に垂れる。
血は、いまだ止まらない。
止まるような傷ではない。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200430nr">
「ふんっ！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//▼べー：ＳＥ：調節します。
//ＳＥ//剣戟
	CreateSE("SE05","SE_擬音_ディそーど1");
	CreateSE("SE06","SE_擬音_ディそーど同士ぶつかる");

	CreateTextureEX("back05", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");

	CreateMovie360("ムービー", 2000, center, middle, false, false, "dx/mv軌跡01.avi");

//	Request("ムービー", Play);

	Delete("back*");
	DeleteStand("st玄一_スーツ_武器構え_pride", 0, false);
//	DeleteStand("st梨深_制服_武器構え_hard", 0, true);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	Fade("back05", 0, 1000, null, true);

	MusicStart("SE06", 0, 1000, 0, 1000, null, false);
	WaitAction("ムービー", null);

	Delete("ムービー");

	Stand("st玄一_スーツ_武器構え","hard", 500, @-400);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601006]
野呂瀬のディソードによる、すべてをなぎ倒すかのような一閃。

{	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);
	CreateSE("SE01","SE_擬音_ディそーど落ちる");
	MusicStart("SE01",0,1000,0,1000,null,false);
	Fade("攻撃フラッシュ", 0, 1000, null, true);
	Fade("攻撃フラッシュ", 800, 0, null, false);}
梨深は七海をかばいつつ、剣で受け止める。
しかし体重差は致命的であり。
梨深の細い身体では野呂瀬の一撃を受け止めきれない。

//▼べー：ＳＥ：壁に激突音がないので代用。
//おがみ：SE：タイミング調整
{	Shake("back05", 500, 10, 5, 0, 0, 500, null, false);
	CreateSE("SE02","SE_衝撃_どすーん");
	CreateSE("SE07","SE_衝撃_巨大杭_突きやぶる");
	MusicStart("SE02",0,1000,0,1000,null,false);
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);}
吹っ飛ばされ、壁に激突。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200440ri">
「く……」

プラネタリウムの、ドーム上の壁に亀裂が入る。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200450nr">
「わざわざ生かしておいてやったというのに、恩を仇で返すとは」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200460nr">
「また、いたぶられたいのですか？」

野呂瀬が、ゆっくりと梨深の方へと歩み寄ってくる。
その顔に浮かぶのは、余裕。
梨深を完全に見下している。

//	Stand("st梨深_制服_武器構え","hard", 600, @-400);
//	FadeStand("st梨深_制服_武器構え_hard", 500, true);
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200470ri">
「ヘ、ヘンタイだよね……あなたって」

ニヤリと、梨深は笑う。けれどその笑みは引きつっている。

そしてなにを思ったか、背後のひび割れた壁に向けて剣を振るった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ビデオロック
	XBOX360_LockVideo(true);


	CreateSE("SE360118","SE_擬音_ディそーど2");
	CreateSE("SE360108","SE_衝撃_道路陥ぼつ");
	CreateSE("SE08","SE_擬音_ディそーど_コンクリート砕く");
	CreateTextureEX("剣戟", 500, 0, 0, "cg/bg/bg250_01_6_斬撃汎用縦_a.jpg");
	CreateTextureEX("back06", 100, 0, 0, "cg/bg/bg179_01_1_雨空_a.jpg");

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

//ＳＥ//壁が崩れる
	MusicStart("SE360118", 0, 1000, 0, 1000, null, false);
	Fade("剣戟", 0, 1000, null, true);


	Shake("剣戟", 1000, 0, 10, 0, 0, 1000, null, false);
	Wait(300);
	MusicStart("SE360108", 0, 1000, 0, 1000, null, false);
	MusicStart("SE08", 0, 1000, 0, 1000, null, false);

//	CreateMovie360("雨２", 400, Center, Middle, true, false, "dx/mv雨02.avi");	
//	Request("雨２", AddRender);

	Fade("back06", 0, 1000, null, true);
	Fade("剣戟", 1000, 0, null, true);
	Delete("剣戟");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602006]
壁が崩れ、外の景色が露わになる。
雨が降っていた。
空には厚い雨雲が垂れ込めている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//	Fade("雨２", 300, 0, null, false);
	Fade("back06", 300, 0, null, true);
	Stand("st玄一_スーツ_武器構え","pride", 500, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603006]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200480nr">
「逃げようとでも？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200490ri">
「逃げないよ……でも……」

梨深は、抱いていた七海をその場に座らせた。
剣を持ったまま、七海を背中から抱く。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200500ri">
「ナナちゃんは……関係ないでしょ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//画面エフェクト//閃光
	CreateSE("SE04","SE_擬音_ディそーど出現");
	MusicStart("SE04", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ", 1000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	CreateTextureEX("剣戟２", 500, 0, 0, "cg/bg/bg240_01_6_chnディソード全体_梨深_a.jpg");

	Fade("フラッシュ", 200, 1000, null, true);

	DeleteStand("st玄一_スーツ_武器構え_pride", 0, true);

//	Fade("雨２", 300, 1000, null, false);
	Fade("back06", 300, 1000, null, true);

	Fade("フラッシュ", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604006]
梨深は妄想する。
まばゆい閃光。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Fade("フラッシュ", 100, 1000, null, true);
	Delete("back06");
//	Delete("雨２");
	Fade("剣戟２", 0, 1000, null, true);
	MusicStart("SE01",0,1000,0,1000,null,false);
	Zoom("剣戟２", 2500, 2000, 2000, Axl2, false);
	Fade("フラッシュ", 500, 0, null, true);

	Wait(500);

	Fade("フラッシュ", 1000, 1000, null, true);
	Delete("剣戟２");
	FadeDelete("フラッシュ", 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
その光が収まったとき、梨深が持っていた翼のようなディソードは消え。
代わりに、七海の背に純白の羽が生えていた。

血に染まる七海の身体を、清浄なる翼が包む。
その姿は、凄惨で、なおかつ美しい、さながら天使のよう。

{	CreateSE("SE360501","SE_擬音_ディそーど2");
	MusicStart("SE360501",0,1000,0,1000,null,false);}
七海の意識はない。だがその羽は、自ら意志を持つかのように大きく羽ばたいた。

梨深が七海から離れる。

{	CreateSE("SE360501","SE_擬音_ディそーど_空を切る2");
	MusicStart("SE360501",0,1000,0,1000,null,false);}
戸惑う野呂瀬の前で、プラネタリウムに開いた大きな穴をくぐり、七海は空へと飛び立つ。

ゆっくりと、雨が降りしきる渋谷の空を滑空していった。

梨深は丸腰で、それを見送る。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200510ri">
「ナナちゃん、無事で……いて……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Stand("st玄一_スーツ_武器構え","hard", 500, @-400);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200520nr">
「ディソードを妄想によって翼としたのですか」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200530nr">
「……それで、君は逃げないのですか？」

すでに野呂瀬は、自らのディソードの間合いの内に梨深を捉えていた。
腕を一振りするだけで、梨深の首は飛ぶ。

梨深はしかし、物怖じしていない鋭い瞳で、野呂瀬を見据えた。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200540ri">
「まだ、逃げられないよ」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200550ri">
「……あなたを、殺さなきゃいけないから」

懐から、黒光りする十字架を取り出す。

正確にはそれは十字架ではなく、杭。
『張り付け』事件で使われたものと同じもの。
たった今、梨深がリアルブートした。

野呂瀬はそれを見てせせら笑う。

{	Stand("st玄一_スーツ_武器構え","pride", 500, @-400);
	FadeStand("st玄一_スーツ_武器構え_pride", 300, false);
	DeleteStand("st玄一_スーツ_武器構え_hard", 300, true);}
//◆玩具＝おもちゃ
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200560nr">
「私を殺す？　そのような玩具でですか？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200570nr">
「ずいぶんと、ナメられたものですね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//剣を振る
	CreateSE("SE05","SE_擬音_ディそーど1");

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mv軌跡01.avi");

	DeleteStand("st玄一_スーツ_武器構え_pride", 0, true);

	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

//	Request("ムービー", Play);
	WaitAction("ムービー", null);
	Fade("ムービー", 500, 0, null, true);
	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
その一撃は素早かった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ/血が飛び散る
	CreateSE("SE09","SE_じん体_血_噴きでる");

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");
//	Request("ムービー", Play);
//	DeleteStand("st梨深_制服_正面_hard", 0, true);
	MusicStart("SE09", 0, 1000, 0, 1000, null, false);

	WaitAction("ムービー", null);
	Fade("ムービー", 500, 0, null, true);

	Delete("ムービー");

//※１０月３日修正、以下
//野呂瀬の身の丈よりも巨大なディソードが、通常の物理法則では考えられない速度で、梨深の右足を根本から切断した。
//支えを失い、自らの身体が傾いたところで、梨深は自分の足が斬られたことに気付いた。
//その場に倒れ込み、失われた自分の足を見て、ようやく痛みを認識した。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
野呂瀬の身の丈よりも巨大なディソードが、通常の物理法則では考えられない速度で、梨深の脇腹を切り裂いた。

自分の身体が斬撃を受けよろめいたところで、梨深は自分が斬られたことに気付いた。

//※１０月３日修正、以上
//◆痛みで悲鳴
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200580ri">
「ああ、あああああ――！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE01",0,1000,0,1000,null,false);


	Stand("st玄一_スーツ_武器構え","pride", 500, @-650);
	FadeStand("st玄一_スーツ_武器構え_pride", 500, true);
//※１０月３日修正、以下
//悲鳴を上げ、のたうつ彼女の元に野呂瀬は歩み寄り。
//ディソードの、二股に別れた切っ先で、左手の二の腕を挟み込んだ。

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601008]
その場にくずおれて、梨深は痛みのあまり悲鳴を上げる。

野呂瀬の攻撃は殺すためのものではなかった。
殺そうと思えばいつでもできたが、彼はあえてそうしなかった。
のたうつ梨深に歩み寄り、腕を踏み付ける。

梨深は苦しげな呼吸を繰り返しつつも歯を食いしばり、動きを止めた。
止めざるを得なかった。

野呂瀬の巨大な剣の切っ先が、梨深の血まみれになっている背中に突き立てられていた。けれどまだ、その切っ先が身を貫くことはない。

//※１０月３日修正、以上
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200590nr">
「もう一度、聞かせてもらっていいでしょうか？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200600ri">
「や、やめて……っ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200610nr">
「やめませんよ」

//ＳＥ//ジャキン！
//※↑ＳＥカット
//※１０月３日追加、以下
梨深の懇願に合わせて、野呂瀬はディソードを持つ手に力を込めた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//※１０月３日追加、以上
//ＳＥ//血が飛び散る
//	CreateSE("SE05","SE_擬音_ディそーど1");
//	MusicStart("SE05", 0, 1000, 0, 1000, null, false);

	CreateSE("SE360105","SE_じん体_血_噴きでる_包丁でさされ");
	CreateSE("SE09","SE_じん体_動作_と血");

	MusicStart("SE360105", 0, 1000, 0, 1000, null, false);

	CreateMovie360("ムービー", 2000, Center, Middle, false, false, "dx/mvやられ01.avi");

	DeleteStand("st玄一_スーツ_武器構え_pride", 300, true);

	MusicStart("SE09", 0, 1000, 0, 1000, null, false);

	WaitAction("ムービー", null);

	Fade("ムービー", 500, 0, null, true);
	Delete("ムービー");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602008]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200620ri">
「が、は、あ、ああああ――！」

//※１０月３日追加、以下
剣の先端がすでに血まみれになっている梨深の身をさらに抉り、深く食い込んでいく。それはまるで昆虫に虫ピンを刺しているかのようだった。

//※１０月３日追加、以上
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200630nr">
「それで、私を殺すと言いましたか？　それとも私の聞き間違いでしょうか？」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200640ri">
「はあっ、はあっ、ぐすっ、はあ、うぅ、く……っ」

//※１０月３日修正、以下
//それでも梨深は、片手だけで身体を起こし、野呂瀬の足にすがりつく。
それでも梨深は、うつ伏せに倒れたまま片手を伸ばし、野呂瀬の足にすがりつく。

涙で濡れた瞳の奥に、いまだ確固たる決意の炎を宿し。
嘲笑する野呂瀬を、下からにらみつけて。

//※１０月３日修正、以上
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200650ri">
「……殺してあげる。あたしが、あなたを」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//蹴る
	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("White", AddRender);
	Fade("White", 0, 0, null, true);
	Fade("White", 0, 1000, null, true);
	Shake("back05", 500, 10, 5, 0, 0, 500, null, false);
	CreateSE("SE11","SE_衝撃_顔面蹴られる");
	MusicStart("SE11", 0, 1000, 0, 1000, null, false);
	FadeDelete("White", 250, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603008]
//※１０月３日修正、以下
//野呂瀬の全力の蹴りが、梨深の顎を捉えた。
//彼女の身体は人形のように床の上を転がる。
野呂瀬は剣を抜くと、梨深の顎を全力で蹴り上げた。
{	CreateSE("SE01","SE_じん体_動作_滑って転ぶ");
	MusicStart("SE01",0,1000,0,1000,null,false);}
彼女の身体が人形のように床の上を転がる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//※１０月３日修正、以上
	Stand("st玄一_スーツ_武器構え","hard", 500, @-650);
	FadeStand("st玄一_スーツ_武器構え_hard", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604008]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200660nr">
「しばらく会わないうちに、実に不愉快な人間になったようですね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200670nr">
「すでに君は用済みです。利用価値があるかと思い、生かしておきましたが……もういりません」

すでに梨深は瀕死。
なおも身体を起こし、野呂瀬の方へ這ってこようとしているが、ディソードもなくまともに歩くこともできないのでは、死んだも同然。

{	Stand("st玄一_スーツ_武器構え","pride", 500, @-650);
	FadeStand("st玄一_スーツ_武器構え_pride", 300, true);
	DeleteStand("st玄一_スーツ_武器構え_hard", 0, true);}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200680nr">
「私に生意気な口を叩いたことを、後悔しながら死んでいってください。……例えば、そうですね、これから３０年ほど、私が君に毎日拷問を施してあげましょうか。……妄想の中でね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("攻撃フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("攻撃フラッシュ", 0, 0, null, true);
	Request("攻撃フラッシュ", AddRender);

	Fade("攻撃フラッシュ", 200, 1000, null, true);
	Delete("back05");
	DeleteStand("st玄一_スーツ_武器構え_pride", 500, true);

	CreateSE("SE360101","SE_えい像_ゆあでぃそーど");
	MusicStart("SE360101",2000,1000,0,1000,null,true);

//ＣＧ//瀕死の梨深
//羽根が舞ってます（画面エフェクトじゃなくてイベント絵の一部として静止状態で）
	CreateTextureEX("back10", 1000, center, middle, "cg/ev/ev115_01_6_梨深瀕死_a.jpg");
	CreateMovie360("ムービー１", 1050, Center, Middle, false, false, "dx/mvりみ_はね.avi");

	Fade("攻撃フラッシュ", 200, 0, null, true);

	WaitAction("ムービー１", null);

	Fade("back10", 0, 1000, null, true);
	Fade("ムービー１", 1000, 0, null, true);
	Delete("ムービー１");	

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
野呂瀬は唇を歪めた。

舞い散る羽根の中にうずくまる梨深を視界に捉え。

妄想する。

ディソードを強く握りしめ。

ディラックの海とのチャネルを広げる。

彼の妄想を具現化するための、粒子と反粒子が生まれ。

そのうちの、粒子のみを。

光の信号であるところの“視線”によって――

咲畑梨深のデッドスポットへと送り込む――

{	SetVolume360("CH*", 500, 0, null);}
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200690ri">
「それを、待ってた――」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200700nr">
「……なに？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


	CreateSE("SE360201","SE_擬音_ディそーど同士ぶつかる");


	MusicStart("SE360201",0,1000,0,1000,null,false);
	CreateTexture360("back11", 1000, center, middle, "cg/ev/ev115_02_6_梨深瀕死_a.jpg");
	SetBlur("back11", true, 2, 200, 100);

	Wait(500);

	Zoom("back11", 100, 1100, 1100, Dxl2, true);
	Zoom("back11", 500, 1000, 1000, Dxl2, false);
//ＣＧ//瀕死の梨深（差分）
//「羽根」が「瞳」に変化
	Fade("攻撃フラッシュ", 500, 1000, null, true);
	Delete("back10");

	CreateTexture360("羽部分１", 1500, -512, 0, "cg/ev/ev115_03_6_梨深瀕死_a.jpg");
	CreateTexture360("羽部分２", 1200, 512, 0, "cg/ev/ev115_03_6_梨深瀕死_a.jpg");
	Zoom("羽部分１", 0, 2000, 2000, null, true);
	Zoom("羽部分２", 0, 2000, 2000, null, true);

	Fade("攻撃フラッシュ", 500, 0, null, false);

	Move("羽部分１", 1500, @0, -512, Dxl2, 1000);
	Fade("羽部分１", 500, 0, null, false);
	Move("羽部分２", 1500, @0, -512, Dxl2, true);
	Fade("羽部分２", 500, 0, null, true);

	Delete("羽部分*");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
舞い散る羽根は、一瞬で“瞳”に変わる。

それまで、野呂瀬を見つめる瞳は、梨深のものだけだった。
だがいまや野呂瀬を囲むのは、数え切れないほどの、空中に浮かぶ瞳。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateTextureEX("back13", 1100, 0, 0, "cg/ev/ev115_03_6_梨深瀕死_a.jpg");
	SetBlur("back13", true, 2, 200, 100);
	Request("back13", Smoothing);
	Move("back11", 600, @0, @80, Axl2, false);
	Zoom("back11", 600, 1500, 1500, Axl2, false);
	Wait(200);
	Move("back13", 600, @0, @80, Dxl2, false);
	Zoom("back13", 600, 1500, 1500, Dxl2, false);
	Fade("back13", 600, 1000, Dxl2, true);
	Delete("back11");

	SetVolume("SE360101", 400, 1, null);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200710ri">
「その目、だれの目？」

それが、タクミから託された、最期の妄想。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume("SE360101", 2000, 200, null);

	Fade("攻撃フラッシュ", 200, 1000, null, true);
	CreateTexture360("back14", 1000, 0, 0, "cg/ev/ev115_04_6_梨深瀕死_a.jpg");
	Fade("back14", 0, 1000, null ,true);
	Delete("back12");
	Delete("back13");
	CreateColor("反粒子", 1050, 0, 0, 1280, 720, "Black");
	Fade("反粒子", 0, 0, null, true);

	Fade("攻撃フラッシュ", 800, 0, null, true);

	Fade("反粒子", 0, 1000, null, true);
	DrawTransition("反粒子", 5000, 0, 500, 100, Dxl2, "cg/data/effect.png", false);


//おがみ：BGM：後でリミソングに差し替え
	BGMPlay360("chn01",0,1000,true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602010]
野呂瀬が飛ばした粒子は、無数の瞳に阻まれ、梨深のデッドスポットには届かず。
そしてそれらの瞳は、ディラックの海と繋がって反粒子を垂れ流す。

ギガロマニアックスの力を封じる、絶対防御。

ニシジョウタクミだからこそ。

人間を１人、創造できるほどの力を持つギガロマニアックスだからこそ。

己の命の最期の灯火を燃やし尽くしたからこそ。

リアルブートすることのできた、化け物じみた妄想。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_擬音_共鳴音_女性悲鳴のよう");
	MusicStart("SE01",0,1000,0,1000,null,false);


//ＢＧ//瞳で画面埋め尽くす
	CreateTextureEX("back20", 1500, 0, 0, "cg/bg/bg221_01_6_chn梨深ラスト瞳_a.jpg");
	Request("back20", AddRender);
	Zoom("back20", 0, 2000, 2000, null, true);

	Fade("back20", 500, 1000, null, false);

	Zoom("back20", 1000, 1000, 1000, Dxl2, true);

	Delete("back13");

	Wait(1000);
	CreateSE("SE360101","SE_擬音_ディそーど_空を切る1");
	CreateSE("SE02","SE_擬音_ディそーど_空を切る2");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603010]
野呂瀬は瞳に囲まれ、愕然と息を呑む。

どこを見渡しても、あるのは、彼を見つめてくる瞳ばかり。

その数は減るどころか、むしろ際限なく広がる。

野呂瀬の視界すべてを、埋め尽くす。
そして迫ってくる。

野呂瀬は本能的な恐怖に襲われた。

{	MusicStart("SE360101",0,1000,0,1000,null,false);}
歯を食いしばり、ディソードを振り回す。
{	MusicStart("SE02",0,1000,0,1000,null,false);}
斬られた瞳は血をまき散らしながら、まぶたを閉じ、消えてしまう。

だがその瞳のさらに後ろに、別の瞳がいる。
斬っても斬っても、瞳の数は減らず。

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/chn01/02200720nr">
「わ、私を、見るな――」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200730ri">
「それなら、もう一生、目を開けなければいい」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//▼べー：ＳＥ：要調整
//ＳＥ//刺す
//	CreateSE("SE12","SE_擬音_ないふ_しゅっ血");
//	MusicStart("SE12", 0, 1000, 0, 1000, null, false);
	CreateSE("SE01","SE_じん体_血_噴きでる");
	MusicStart("SE01",0,1000,0,1000,null,false);
	CreateColor("血１", 2000, 0, 0, 1280, 720, "Red");
	Fade("血１", 0, 0, null, true);
	Fade("血１", 1000, 1000, null, true);
	Request("血１", MulRender);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604010]
野呂瀬の胸に、圧迫感。
次いで脳に届く、痛みの信号。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 1000, 0, null);
	SetVolume360("chn*", 1000, 0, null);
	SetVolume("SE360101", 1000, 0, null);


	Fade("攻撃フラッシュ", 200, 1000, null, true);

	Delete("反粒子");
	Delete("血１");
	Delete("back*");
	Delete("反粒子");

	CreateSE("SE36101","SE_擬音_ディそーど_人を切る");
	CreateSE("SE36201","SE_擬音_ディそーど_人を切る");
	CreateSE("SE36301","SE_擬音_ディそーど_人を切る");

	MusicStart("SE36101",0,1000,0,1000,null,false);
	Wait(300);
	MusicStart("SE36201",0,700,0,1000,null,false);
	Wait(300);
	MusicStart("SE36301",0,400,0,1000,null,false);

//ＢＧ//ノアⅡ
	CreateTexture360("back06", 100, 0, 0, "cg/bg/bg200_01_6_ノアIIのあるドーム内_a.jpg");
	Fade("back06", 0, 1000, null, true);

	Wait(2000);

	Fade("攻撃フラッシュ", 3000, 0, null, true);
	Delete("攻撃フラッシュ");

	CreateSE("SE10","SE_擬音_のあII稼働音_LOOP");
	MusicStart("SE10",3000,400,0,1000,null,true);

	Wait(1000);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
霧が晴れるかのように、覆い尽くしていた瞳はすべて消えた。

野呂瀬の目の前に、梨深の姿。
その手に握った、十字の杭は。
野呂瀬の胸に、深々と突き刺さっていて。

野呂瀬は絶命していた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――


	CreateSE("SE01","SE_じん体_動作_尻餅");
	MusicStart("SE01",0,1000,0,1000,null,false);

//ＣＧ//瀕死の梨深（羽根）
//	CreateTexture360("back10", 1000, 0, 0, "cg/ev/ev107_01_1_梨深祈る_a.jpg");
	CreateTexture360("back10", 1000, 0, 0, "cg/ev/ev115_01_6_梨深瀕死_a.jpg");
	Fade("back10", 0, 0, null ,true);
	Fade("back10", 1000, 1000, null ,true);
	Delete("back06");

	Wait(1500);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
梨深は、野呂瀬の死を確かめてから、がっくりとその場に膝を突いた。

出血がひどく、顔色は陶器のように白い。

もはやほとんど意識はなく。

苦しそうに、小刻みな吐息を漏らしている。

すでに、その目はなにも見ていない。

いまだ健在であるノアⅡの不気味な稼働音は、かろうじて耳に届いてはいる。

――でも、あれを壊すのは、他の人に、託すしかなさそうかな。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200740ri">
「ごめんね、タク……」

ぽつりと、梨深はつぶやく。
ほとんど声にならないほどの、かすかな声。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	CreateColor("White", 1100, 0, 0, 1280, 720, "White");
	Request("white", AddRender);
	Fade("White", 0, 0, null, true);
	Fade("White", 10000, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602011]
//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200750ri">
「約束、守れそうに、ないみたい……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200760ri">
「ナナちゃん、助けたから……それで、罪滅ぼしなんかには……ならないけど……助けた……から……」

梨深は、のろのろと顔を上げた。

プラネタリウムの壁の一部は、崩れているはずだった。

そこから、空がのぞいているはずだった。

さっきは雨雲に覆われていた。

今はどうだろう。
彼女の目では、その空の色を確かめることはもうできないけれど――

咲畑梨深は、空を見上げて、わずかに、微笑んだ。

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200770ri">
「あの空を……あなたと、もう一度見たかったな……」

//【梨深】
<voice name="梨深" class="梨深" src="voice/chn01/02200780ri">
「タク……ありがとう……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//～～Ｆ・Ｏ
	ClearAll(3000);
	Wait(1000);

//エンディングへ

//エンディング後、エピローグ}

}