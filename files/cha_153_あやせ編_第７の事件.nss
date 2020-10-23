//<continuation number="0">

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_153_あやせ編_第７の事件";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_153_あやせ編_第７の事件();
}


function cha_153_あやせ編_第７の事件()
{

	$SYSTEM_last_text="第８章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編

//章タイトルアイキャッチ
//――――――――――――――――
//■第８章【罪過に契約の血を】

	ChapterIn("dx/mvP.avi");

		Delete("*");

		CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
		Fade("背景１", 0, 1000, null, true);
		ChatMain(420,-54,"002");
		Fade("box01", 0, 1000, null, true);

	ChapterIn2();

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

	Wait(1000);

//１１月４日（火）//日付は表示しない


//以下、ＤＱＮパズルがらみのことはセナ編のコピペ
//イメージＢＧ//ＰＣ画面（チャット画面）


	CreateSE("SE02","SE_日常_PC_ちゃっと_参加音");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
ナイトハルトさんが入室しました
現在のメンバー：２人
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFCC);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
ナイトハルト：おっす
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text012]
グリム：やあナイトハルトくん
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
グリム：お待ちしておりました
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
グリム：新しい乳毛だお！(｀・ω・´)
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
ナイトハルト：お前はなにを言っているんだ（ＡＡ{#TIPS_ＡＡ = true;$TIPS_on_ＡＡ = true;}略
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：ニュージェネだよニュージェネ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
ナイトハルト：なんでニュージェネが乳毛なんだ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
グリム：NEW GENERATION→NEW GE→にゅうげ→乳毛
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
グリム：分かるだろ、常識的に考えて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
グリム：それより、第７の事件だ！
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	SoundChat(0,0,false);
	TypeChat("1500");

//ウェブＣＨＡＴ終了
	SoundPlay("SE*",2000,0,false);
	BGMPlay360("CH01", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text021]
『第７の事件』……！

また、起きた。
またニュージェネだ。

いったい、いつまで続くんだ。
僕が殺されるのは次か？　その次か？

それにしても、グリムはまるでニュージェネ事件の広報担当みたいだ。
いちいち僕に報せてくる。

今も、わざわざニュースサイトなど複数のリンクを貼り付けてきていた。
見ろ、ということらしい。

やむなくそのリンクをクリックし、きつく唇を噛む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：ＡＡ
	$TIPS_on_ＡＡ = false;

//イメージＢＧ//ＰＣ画面（ネット画面）

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	Delete("背景２");

	Wait(2000);

	CreateSE("SE00","SE_衝撃_衝撃音02");
	SoundPlay("SE00", 0, 1000, false);

	Delete("box01");
	#bg183_01_3_PC画面ZACO‐DQN_a=true;
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg183_01_3_PC画面ZACO-DQN_a.jpg");
	WaitKey();

	#bg183_02_3_PC画面ZACO‐DQN_a=true;
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	CreateTexture360("背景１", 100, 0, 40, "cg/bg/bg183_02_3_PC画面ZACO-DQN_a.jpg");
	WaitKey();

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Move("背景１", 500, @0, @-176, Dxl2, true);
	WaitKey();

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	Move("背景１", 500, @0, @-176, Dxl2, true);
//	WaitKey();

/*
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]

//※以下、ネットの記事の見出し
ニュージェネ７ｔｈ事件は通称『ＤＱＮパズル』

//※以下、ネットの記事
４日午前４時５０分ごろ、東京都渋谷区の線路沿い鉄柱で、何者かによって殺害されたと見られる３人の男性の遺体が発見された。殺されたのは無職藤田耕平さん（１９）、大学生安沢三郎さん（２０）、とび職鷹木了さん（１９）。
警察の調べによると、３人の遺体は胴体の部分で上半身と下半身とに分断されており、またその裂傷痕は刃物で切断したような鋭利な切り口ではなかったという。
さらに上半身と下半身は別々の組み合わせへとその主を替え、丈夫な糸で縫いつけられていた。
３人の額にはそれぞれ“Ｄ”“Ｑ”“Ｎ”と読める傷が付けられており、この言葉が犯人からのなんらかのメッセージなのではないかと見て警察で捜査を続けている。
インターネットの大型匿名掲示板『＠ちゃんねる』では、事件の報道を待たずして何者かによって同事件現場の写真が流出されており、早くも“ニュージェネレーションの狂気”通称ニュージェネの第７の事件として“認定”。上半身と下半身が組み替えられていたことから『ＤＱＮパズル』と命名された。ちなみに＠ちゃんねるにおいてＤＱＮは“一般常識のない人”という意味で使われている。
一連のニュージェネ事件に関連して、被害者遺族が＠ちゃんねるの一部モラルのない書き込みに対して法的手段を取る動きが出てきており、ネット上でも賛否両論だ。

１５時２７分配信　ZACOZACO
//※以上、ネットの記事

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――
*/

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTexture360("背景９", 2000, center, middle, "SCREEN");
	CreateBoard(0,0);

//おがみ：フォントサイズ修正
//<FONT size="34" incolor="#ff0000"><SPAN value=32>

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text900]
　　　<FONT size="32" incolor="#ff0000"><SPAN value=30>【ニュージェネ】渋谷で胴体分断された３人の遺体「額にＤＱＮ」★３</SPAN></FONT>
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TitleBoard("【3:950】");
	TypeBoard(500,null);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text901]
<FONT incolor="#0000ff"><U>946</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:29:24  <FONT incolor="#0000ff"><U>ID:</U></FONT>TtIxacRy8
新しい乳ジェネｋｔｋｒ！！！
　
　
<PRE>＜◎＞　＜◎＞</PRE>　その目だれ（ｒｙ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text902]
<FONT incolor="#0000ff"><U>947</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:29:50  <FONT incolor="#0000ff"><U>ID:</U></FONT>wZGbSvjkO
ちょｗｗｗＤＱＮてｗｗｗ
事件との関係性なんてあるワケねーだろｗｗｗ
警察バカスｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text903]
<FONT incolor="#0000ff"><U>948</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［sage］ ：200X/11/4(火) 16:30:48  <FONT incolor="#0000ff"><U>ID:</U></FONT>MOsurvPq0
<FONT incolor="#0000ff"><U><PRE>>></PRE>920</U></FONT>
　
ＤＱＮ嫌いな漏れ達の仕業だとでも言いたいのか？
つか下半身が別々ってまさに死体パズルだな
漏れも上半身を池麺と入れ替えたいおｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//※池麺＝イケメン。わざとです

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text904]
<FONT incolor="#0000ff"><U>949</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 16:31:22  <FONT incolor="#0000ff"><U>ID:</U></FONT>KnYohrpd0
そろそろエスパー西條に犯人突き止めてもらえよｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	FadeDelete("背景９", 0, true);

	WaitKey();

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text905]
<FONT incolor="#0000ff"><U>950</U></FONT>  名前：<FONT incolor="#228b22">オレだよ名無し！</FONT>［age］ ：200X/11/4(火) 17:41:59  <FONT incolor="#0000ff"><U>ID:</U></FONT>Hmaeicj30
<PRE>乳毛速報だクマ(ll´（エ）｀ll)
　
乳毛その１＠集団ダイブ　ﾉﾉﾉ---(ollllll´▽｀)oﾉ
乳毛その２＠妊娠男　＼(||｀□´||;;＼)
乳毛その３＠張り付け　†l†l(＠□＠)l†l†
乳毛その４＠ヴァンパイ屋ξ--（;￣ξ￣;)---ξ
乳毛その５＠ノータリン　ヘ（´ρ｀）ノ~
乳毛その６＠美味い手　Ψ(Q^； )Ψ
乳毛その７＠ＤＱＮパズル　(ﾟ∀｡)ﾉ・ω・)ﾉA` )ﾉ
乳毛その？＠……to be continued!!!(゜ロ)ギョェ</PRE>
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――


	CreateTexture360("背景９", 100, center, middle, "SCREEN");
	EndBoard();

//ＢＧ//ＰＣ画面（テレビニュース）

	CreateSE("SE02","SE_き械_でん化製ひん_ラジオ_ぴンクのいず");

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg213_01_6_ニュースDQNパズル_a.jpg");

	CreateMovie360("砂嵐", 200, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);
	SoundPlay("SE02", 0, 1000, true);

	Wait(500);

	Fade("背景２", 0, 1000, null, true);
	SetVolume("SE02", 100, 0, NULL);

	Fade("砂嵐", 100, 0, null, true);
	Delete("砂嵐");

	FadeDelete("背景９", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text023]
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600660ka">
「今日午前４時５０分頃、東京都渋谷区の線路沿いで、男性３人の他殺死体が鉄柱につり下げられているのを、通りかかった新聞販売員の男性が発見しました」

//◆「ふじた・こうへい」「あんざわ・さぶろう」「たかぎ・りょう」
//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600670ka">
「警察の調べによりますと、殺されたのは、いずれも渋谷区に住む、無職、藤田耕平さん、大学生の安沢三郎さん、とび職の鷹木了さん、の３人です」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600680ka">
「３人とも胴体の部分が切断され、それぞれの上半身と下半身が別々に入れ替えられて、糸で縫合されていました」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600690ka">
「３人の額にはそれぞれ謎の傷が付けられており、警察では犯人からのメッセージではないかと見て、調べています」

//【キャスターＡ】
<voice name="キャスターＡ" class="キャスターＡ" src="voice/ch08/15600700ka">
「渋谷では、２ヶ月ほど前から猟奇殺人事件が頻発しており、警察では今回の事件も同一犯による犯行の可能性が高いと見て、捜査を続けています」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

//画面パンして拓巳の視線をさまよわせる

//おがみ：ビデオロック
	XBOX360_LockVideo(true);

	CubeRoom4("ルーム", 100, 0);

//おがみ：ビデオロック
	XBOX360_LockVideo(false);

	Fade("ルーム", 500, 1000, AxlDxl, true);
	Rotate("ルーム", 600, @5, @5, @0, AxlDxl, true);
	Rotate("ルーム", 800, @-10, @-10, @0, AxlDxl, true);
	Rotate("ルーム", 600, @10, @5, @0, AxlDxl, true);
	Rotate("ルーム", 800, @-5, @0, @0, AxlDxl, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text024]
最後に見た動画ニュースに、被害者３人の顔写真が映し出されていた。

僕は、
その顔に、
見覚えがあった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600710ta">
「あ、あいつらだ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch08/15600730ta">
「き、昨日……僕に、か、絡んできた……」

僕は財布を差し出して、
でも暴力を振るわれて、

意識を失って、
気が付いたら、そこにこずぴぃがいて、

彼ら３人は血まみれで倒れてた……。

自分の財布をポケットから出して、まじまじと見つめてみる。

これは、僕が気が付いたとき、こずぴぃが持っていて、返してくれた。

もしかして、あの３人を殺したのは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――


//ＣＧ//梢・ディソード顕現
//フラッシュバックで一瞬表示
	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 150, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("背景３", 100, 0, middle, "cg/ev/ev071_01_1_梢ディソード顕現_a.jpg");
	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

	Fade("回想フラッシュ", 100, 1000, null, true);

	Delete("背景３");
	Delete("ルーム");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
いや、違う。
あのとき、僕が最後にあの３人を見たとき、確かに顔は変形して血まみれだったけど、胴体が切断されていたりなんかしなかった。

あの３人が殺されたのは、僕とこずぴぃが立ち去った後……。


//ここまで、セナ編とまったく同じ
やっぱり『将軍』だ。
あいつが、あのじいさんが、僕を挑発しているんだ……！

くそぅ、どこまで僕を精神的に追い詰める気だ……。
吐きそうな気分になった。胃がきりきりと痛み、お腹を手で押さえる。

次か？
この次こそ僕が殺されるのか？

怖い。

梨深、助けてくれ……。
どこに行っちゃったんだよ。僕を守ってくれるんじゃ、なかったの……？


</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 2000, 0, null);
	Wait(1000);


//～～Ｆ・Ｏ
//アイキャッチ

//	ClearAll(2000);
//	Wait(1000);
}
