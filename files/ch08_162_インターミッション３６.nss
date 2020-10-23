//<continuation number="240">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_162_インターミッション３６";
		$GameContiune = 1;
		Reset();
	}

		ch08_162_インターミッション３６();
}


function ch08_162_インターミッション３６()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg006_01_2_コンテナ外観_a.jpg");
	Fade("背景１", 0, 1000, null, true);

	IntermissionIn2();

	Wait(1000);

	CreateSE("SE01","SE_自然_動物_カラス_鳴き声_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);


//アイキャッチ
//■インターミッション３６

//ＢＧ//拓巳の部屋・外観//夕方

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
神泉にある古びたビルの屋上。
西條拓巳の暮らしているコンテナハウスは、今はひっそりと静まり返っている。

蒼井セナがこの場所を訪れるのは、二度目だ。

１度目は数日前。センター街で梢と拓巳が一緒にいるところにたまたま遭遇した後、こっそり尾行した。それでこの場所を突き止めたのだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","sad", 200, @+150);
	FadeStand("st梢_制服_正面_sad", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//以下、梢の声はすべて心の声です
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200010ko">
「セナしゃん、やめた方がいいと思うのら……」

//◆ふみゅー＝落ち込む
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200020ko">
「ドロボーしゃんはね、こずぴぃ、嫌いなの～。ふみゅー」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_正面_sad", 300, true);
	Stand("stセナ_制服_通常","hard", 200, @-150);
	FadeStand("stセナ_制服_通常_hard", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200030sn">
「それなら、どうしてついてきた」

肩を落として浮かない顔をしている梢に対し、振り返らずに冷たくそうあしらう。

セナは拓巳の部屋に忍び込むつもりでここに来た。

{	DeleteStand("stセナ_制服_通常_hard", 300, true);}
西條拓巳は、普通じゃない――

何度か彼と話した結果、セナはそういう結論に達した。

彼が、セナや梢のような“普通”のギガロマニアックスとは一線を画しているのは間違いない。

恐ろしく人並み外れた妄想能力の持ち主か、あるいはなんらかの“人為的なサポート”を受けているのか。

いずれにせよ拓巳という存在のあやふやさが、
セナにはどうしても引っかかるのだ。

彼女は、波多野という男を探していた。

もしかすると西條拓巳は、
どこかで波多野と繋がっているかもしれない――

確証はなかった。

だが少しでも疑わしいなら、それを実際にこの目で確かめて、可能性をひとつずつ潰していく。

そうすれば、絶対に標的にたどり着ける。セナはそう信じていた。

{	Wait(500);}
扉には、南京錠がかけられていた。

セナは小さく鼻を鳴らして、すでにリアルブートしていたディソードを振り下ろす。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE03","SE_じん体_動作_手_棒を振り回す");
	CreateSE("SE04","SE_衝撃_衝撃音03");
	CreateSE("SE05","SE_衝撃_杭_落ちる_壁");
	SoundPlay("SE03", 0, 1000, false);
	Wait(200);
	SoundPlay("SE04", 0, 1000, false);
	Wait(300);
	SoundPlay("SE05", 0, 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
あっさりと、南京錠は砕け散った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","sad", 200, @+150);
	FadeStand("st梢_制服_正面_sad", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200040ko">
「拓巳しゃんが帰ってきたら、怒られちゃうよ……？」

{	DeleteStand("st梢_制服_正面_sad", 300, true);}
拓巳が友人２人とともに学校を出て駅の方へ向かうのを、セナはすでに確認していた。

それに例え拓巳にバレたとしても構わなかった。セナは自らの目的のためならば、誰に嫌われようが、警察に通報されようが、どうでもよかったのだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 0, false);

	CreateSE("SE02","SE_日常_扉_開ける");
	SoundPlay("SE02", 0, 1000, false);

	CreateColor("色１", 150, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Fade("背景２", 0, 1000, null, true);
	Wait(1000);

//ＳＥ//コンテナハウスの扉を開く
//ＢＧ//拓巳の部屋
	CreateSE("SE03","SE_日常_扉_閉まる");
	SoundPlay("SE03", 0, 1000, false);
	DrawTransition("色１", 1000, 1000, 0, 100, null, "cg/data/right3.png", true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
扉を開いて、室内に足を踏み入れる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","rage", 210, @-150);
	FadeStand("stセナ_制服_通常_rage", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//◆うんざりしたようなうめき声
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200050sn">
「…………」

ゴミためのような部屋の中の惨状に、セナはたまらず顔をしかめ、うめき声を上げた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_通常","smile", 200, @+150);
	FadeStand("st梢_制服_通常_smile", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200060ko">
「きったなーいね♪」

{	Stand("stセナ_制服_通常","normal", 210, @-150);
	FadeStand("stセナ_制服_通常_normal", 300, true);
	DeleteStand("stセナ_制服_通常_rage", 0, true);}
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200070sn">
「なんで楽しそうなんだ、梢」

{	Stand("st梢_制服_通常","normal", 200, @+150);
	FadeStand("st梢_制服_通常_normal", 300, true);
	DeleteStand("st梢_制服_通常_smile", 0, true);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200080ko">
「靴は脱いだ方がいーいのかなあ？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st梢_制服_通常_normal", 500, true);
	Wait(1000);
	DeleteStand("stセナ_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603003]
ため息をつき、セナは土足のまま部屋の奥へと進む。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu梢_制服_通常","shy", 200, @+150);
	FadeStand("bu梢_制服_通常_shy", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3604003]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200090ko">
「お人形さん、いっぱいなのらー。うぷー」

{	Stand("bu梢_制服_通常","smile", 200, @+150);
	FadeStand("bu梢_制服_通常_smile", 300, true);
	DeleteStand("bu梢_制服_通常_shy", 0, false);}
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200100ko">
「拓巳しゃんて、ヘンターイさんだったんだ。すごいのー」

{	DeleteStand("bu梢_制服_通常_smile", 500, false);}
妙な感心をしている梢を放っておいて、セナはＰＣの前に立つ。

{	CreateSE("SE01","SE_日常_PC_起動");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);}
なんの躊躇もなく電源を入れ、起動を待つ間にデスクの上にある物へと目を走らせた。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200110sn">
「……？」

眉をひそめつつ、置かれていた作文用紙を手に取る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE01", 2000, 200, true);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg004_01_1_作文用紙その目_a.jpg");

	Fade("背景１", 100, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//◆興奮
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200120ko">
「あっ！　あっ！　あーーっ！」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200130ko">
「“その目だれの目？”だぁ！」

セナの背後から作文をのぞき込んだ梢は、興奮したようにぴょんぴょんとその場で跳ねた。

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200140ko">
「やっぱり、拓巳しゃんが“その目だれの目？”の人だったのらー！」

//◆ぱんぱかぱーん＝正解、という意味。
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200150ko">
「こずぴぃは、ぱんぱかぱーん！　だったぽーん！」

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200160sn">
「…………」

そんな梢とは対照的に、セナは興味なさげにその作文をざっと読み、それから何気なく裏面を見た。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200170sn">
「……っ！」

直後、愕然と目を見開く。

//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200180sn">
「これ……は……！」

そこに描かれていたもの。それは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH01", 2000, 1000, true);

	CreateSE("SE03","SE_じん体_動作_ぺーじめくり");
	SoundPlay("SE03", 0, 1000, false);

//イメージＢＧ//Ｉｒ２の公式が描かれた落書き
	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg155_01_1_Ir2_a.jpg");
	Fade("背景２", 500, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200190ko">
「うぴー？　人がいっぱーいだね。これロボットさん？」

//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200200ko">
「あいあーるに、だって」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("背景１", 1000, 1000, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//◆憎しみのこもったブレス
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200210sn">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st梢_制服_正面","sad", 200, @+150);
	FadeStand("st梢_制服_正面_sad", 300, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【梢】
<voice name="梢" class="こずえ" src="voice/ch08/16200220ko">
「セナしゃん？」

{	DeleteStand("st梢_制服_正面_sad", 300, true);}
セナの口から、ギリリと歯噛みする音が漏れた。

その表情はいつも以上に険しく、作文用紙を持っている手は怒りにより小刻みに震えている。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("stセナ_制服_通常","angry", 210, @-150);
	FadeStand("stセナ_制服_通常_angry", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603005]
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200230sn">
「そう、か……」

//◆Ｉｒ２＝アイアールツー
//【セナ】
<voice name="セナ" class="セナ" src="voice/ch08/16200240sn">
「西條が……Ｉｒ２を生み出した、張本人か……っ！」

{	DeleteStand("stセナ_制服_通常_angry", 500, true);}
押し殺した声を発して。
{	CreateSE("SE03","SE_衝撃_生と手帳落ちる");
	CreateSE("SE04","SE_じん体_動作_尻餅");
	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE04", 0, 500, false);}
セナは、ぐしゃりと作文用紙を握り潰した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//～～Ｆ・Ｏ
	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*",2000,0,false);
	ClearAll(2000);
	Wait(2000);

//■インターミッション３６終了

}