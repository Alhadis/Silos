//<continuation number="220">




chapter main
{

	$PreGameName = "boot_第十章";

	if($GameStart != 1)
	{
		$GameName = "ch10_206_Ａ諏訪との対峙";
		$GameContiune = 1;
		$Ａルート = true;
		Reset();
	}

		ch10_206_Ａ諏訪との対峙();
}


function ch10_206_Ａ諏訪との対峙()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//※拓巳視点に戻る

//ＢＧ//崩壊渋谷・神泉駅ホーム//昼・曇り
//ＳＥ//ヒュンヒュンという機械音

	CreateColor("back03", 100, 0, 0, 1280, 720, "Black");

	CreateSE("SE03","SE_擬音_きかい_ひゅんひゅん1_LOOP");
	MusicStart("SE03", 1000, 800, 0, 1000, null, true);

/*森島ＢＧダミー*/
	CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg193_01_5_崩壊渋谷神泉駅ホーム_a.jpg");
	Fade("back04", 500, 1000, null, true);

	Stand("st梢_制服_通常","normal", 200, @-250);
	FadeStand("st梢_制服_通常_normal", 500, true);

	Delete("back03");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20600010ko">
「……拓巳しゃん！」

こずぴぃが、叫んでいた。
心の声じゃなく、現実の声で。
思えば彼女の生の声を聞くのはこれが初めてだった。

ここに駆けつけることができたのは、こずぴぃのおかげ。

彼女の、助けを求めるような心の悲鳴は、道玄坂上の交番あたりにいた僕の頭にはっきりと聞こえてきたんだ。

そして声を頼りに駆けつけてみれば。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetBacklog("そこには、僕には見えない妄想を見せられ顔を青ざめさせているセナとこずぴぃ、そして――血まみれで倒れている、波多野さん。", "NULL", NULL);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text900]
そこには、僕には見えない妄想を見せられ顔を青ざめさせているセナと
こずぴぃ、そして――血まみれで倒れている、波多野さん。

ようやく見つけたのに、手遅れだったなんて。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin10();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_通常_normal", 500, true);

	Wait(1000);

	Stand("st護_スーツ_通常","normal", 200, @+150);
	FadeStand("st護_スーツ_通常_normal", 700, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600020su">
「こいつはラッキーッスね」

踏切のところに、拳銃を手にした男が立っていた。

ガンマン気取りなのか、その銃を指でクルクルと回している。

スーツ姿なのにリュックを背負っていて、その中から耳障りな機械音が響いていた。

諏訪護。警視庁捜査一課の刑事。
この男には、会ったことがある。

そして――この男のしたことを、僕は知っている。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600030su">
「元々は、目障りな波多野親子を処分しに来たんスけどね」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600040su">
「西條くん。キミが自分から火に飛び込んできてくれて、感謝感激ッス」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600050su">
「キミを見かけたら捕まえろってことになってるんスよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600060ta">
「誰に……？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600070su">
「内緒ッス」

ヘラヘラとした笑み。
その笑い方は、彼の相棒だった判刑事を彷彿とさせる。

でも、決定的に違うのは。

判刑事の笑みは、相手を油断させるための、
あるいは苛つかせるための演技だった。

それに対して諏訪は、この狡猾そうな笑みこそ本質だっていうこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600080ta">
「あんたは、野呂瀬の居場所を知ってる？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600090su">
「西條くんさあ」

諏訪は大げさに首を振りながら、ため息をついた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600100su">
「口の利き方に気をつけてほしいッスねえ。自分の方が年上ッスよ？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600110ta">
「判、っていう人を殺したのは……あんただ……」

//◆嘲笑
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600120su">
「……だから？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600130ta">
「刑事のくせに、人を殺すなんて……」

//◆嘲笑
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600140su">
「キミには言われたくないッス」

僕はディソードをきつく握りしめる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600150ta">
「あんたみたいなヤツに、敬語を使う義理なんて……ないよ」

{	Stand("st護_スーツ_通常","hard", 200, @+150);
	FadeStand("st護_スーツ_通常_hard", 300, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600160su">
「ふーん……」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600170su">
「そんなナメた口、利いていいんスか？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01",0,1000,true);


	Stand("st護_スーツ_通常","cool", 200, @+150);
	FadeStand("st護_スーツ_通常_cool", 500, true);
	DeleteStand("st護_スーツ_通常_hard", 0, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆以下、諏訪の口調が変わります
//◆押し殺した怒り
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600180su">
「……殺すぞ、童貞野郎」

この距離からでも、はっきりと分かった。
諏訪の顔から笑みが消える。

そしてヤツは。
その場から一歩も動かないまま。
不意に、拳銃を持っていない方の手を振り払うような仕草をした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st護_スーツ_通常_cool", 300, true);

//ＳＥ//杭が高速で飛び、空気を切り裂く音

	CreateSE("SE02","SE_擬音_杭_飛ぶ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back10", 500, 0, 0, 1280, 720, "White");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 0, 1000, null, true);

	Fade("back10", 100, 0, null, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梢】
<voice name="梢" class="梢" src="voice/ch10/20600190ko">
「拓巳しゃん、危ない……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//おがみ：ＳＥ：クオリティ
//ＳＥ//杭が拓巳に突き刺さる
	CreateSE("SE02","SE_擬音_杭_突きささる");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	CreateColor("back10", 100, 0, 0, 1280, 720, "RED");
	Request("back10", AddRender);
	Fade("back10", 0, 0, null, false);
	Fade("back10", 100, 1000, null, true);
	CreateColor("back05", 200, 0, 0, 1280, 720, "Black");
	Fade("back05", 0, 0, null, false);
	Fade("back05", 200, 1000, Dxl3, true);
	Delete("back10");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch10/20600200ta">
「……！？」

{	Fade("back05", 500, 0, null, true);
	Delete("back05");}
衝撃。
痛み。
唐突な感覚。

驚いて自分の肩を見ると、
そこに、見覚えのある十字架が突き刺さっていた。

違う。十字架じゃない。
これは、杭だ。

『張り付け』事件で使われた十字架型の杭。

目にも留まらない速さだった。
構内が薄暗いせいもあって、飛んできたことにまったく気付かなかった。

諏訪が投げたんだ。
しかもこの距離を、寸分の狂いなく。

試しに杭に触れてみる。
冷たく、滑らかな感触。

これは妄想？<k>
それとも本物？

痛みがどんどん強くなる。
手に力が入らなくなって。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソードを落とす
	CreateSE("SE02","SE_擬音_ディそーど落ちる");
	MusicStart("SE02", 0, 600, 0, 1000, null, false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ディソードを握っていられない。

{	Stand("bu護_スーツ_通常","cool", 200, @+150);
	FadeStand("bu護_スーツ_通常_cool", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600210su">
「再現してやるよ……」

諏訪は怒りを押し殺したような声を上げた。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch10/20600220su">
「『張り付け』事件の、再現だ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	SetVolume360("CH01", 1500, 0, null);

	Wait(1500);

//～～Ｆ・Ｏ

}

/*森島文字用function===============================================================*/

//■TypeBegin10


