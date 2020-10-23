//<continuation number="50">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_038_インターミッション０６";
		$GameContiune = 1;
		Reset();
	}

		ch02_038_インターミッション０６();
}


function ch02_038_インターミッション０６()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション０６開始
//ＢＧ//優愛自宅ＰＣ前
//※優愛自宅ＰＣ前ＢＧについて。ＰＣの横（あるいはＰＣの上）に、フォトスタンドに入れた優愛自身の写真（カメラ目線で微笑んでいる。服装は私服。メガネなし）がある。それは優愛に見えるが実は死んだ双子の妹の美愛である。美愛はメガネをかけていない。

	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

//	CreateTexture360("背景１", 100, 0, 0, "cg/ev/ev037_01_3_INT13優愛自室でメール書く_a.jpg");
	CreateTextureEX("プリント", 110, 0, 0, "cg/bg/bg042_01_2_ログプリント_a.jpg");
	CreateColor("背景２", 150, 0, 0, 1280, 720, "Black");
	Fade("背景２", 0, 0, null, true);
	CreateTexture360("背景３", 100, 0, 0, "cg/bg/bg096_01_1_優愛自宅ＰＣ前_a.jpg");

	CreateSE("SE05","SE_日常_家具_イス_きしむ");

	IntermissionIn2();

	CreateSE("SE02","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE02", 1000, 500, 0, 1000, null, true);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
楠優愛は、自分の部屋でＰＣに向かっていた。
その横顔は真剣そのものであり、モニタに表示された情報を素早く読み取っていく。

やがて小さく息をつくとマウスから手を離し、チラリと手許に置かれた紙を見やった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(500,200);//――――――――――――――――――――――――――――――

	Move("プリント", 10000, @0, @-240, null, false);
	Wait(100);
	Fade("プリント", 500, 1000, null, false);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601011]
それは『ナイトハルト』と『将軍』によって交わされたチャットのログを印刷したもので、昨日、西條拓巳に突きつけたのと同じものだ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03800010yu">
「西條くん……」

優愛はポツリとその名をつぶやく。脳裏には、松濤公園のベンチにひとり座る拓巳の背中が思い浮かんだ。それをかき消すように、すぐに小さく首を振る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	Wait(1000);
	SoundPlay("SE02", 500, 1, true);
	Fade("背景２", 100, 1000, null, true);
//	Delete("背景１");
	Delete("プリント");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601021]
と、急にハッとして背後を振り返った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	Fade("背景３", 10, 1000, null, true);
	Fade("背景２", 1000, 0, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601031]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03800020yu">
「今、誰かに、見られていたような……」

彼女の視線の先には、ベッドの上に鎮座するゲロカエルんの大きなぬいぐるみの姿。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	SoundPlay("SE05", 0, 1000, false);
	Wait(1000);
	SoundPlay("SE05", 200, 0, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601041]
気のせいかと首を傾げると、彼女はのろのろと立ち上がり、ベッドまで歩いていってボフッと顔から倒れ込んだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,200);//――――――――――――――――――――――――――――――

	SoundPlay("SE02", 1000, 300, true);

//ＣＧ//自室のベッドで寝転がる優愛
	CreateSE("SE03","SE_じん体_動作_のぞく");
	CreateSE("SE04","SE_じん体_動作_尻餅");
	SoundPlay("SE03", 0, 1000, false);
	SoundPlay("SE04", 0, 500, false);

	Wait(500);

	CreateTextureEX("背景２", 100, 0, 40, "cg/ev/ev023_01_3_INT06優愛寝転がる_a.jpg");
	Fade("背景２", 0, 0, null, true);
	Move("背景２", 1000, @0, @-80, Dxl1, false);
	Fade("背景２", 1000, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
シーツからは、太陽の匂いがした。

どうやら昼間、母が布団を干してくれたようだ。
そのホッとする匂いに顔を埋めながら、優愛はぼんやりと視線をさまよわせる。

彼女の部屋はとても整頓されており、几帳面な性格を窺わせた。

特に、８畳ほどの部屋には不釣り合いな大きな本棚には、隙間すらほとんどないくらいにぴっちりと、たくさんの本が並べられている。

ただ、少し微笑ましいのは、下半分がいかにも難しそうな学術書や、ＰＣ関係の書物ばかりであるのに対して、上半分は対照的に少女マンガやアニメのＤＶＤで埋められているということだ。

優愛はもう一度ため息をつき、身体を仰向けにして天井を見つめた。

//◆ディーアイディー
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03800030yu">
{#TIPS_ＤＩＤ = true;$TIPS_on_ＤＩＤ = true;}「<FONT incolor="#88abda" outcolor="BLACK">ＤＩＤ</FONT>……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：ＤＩＤ
$TIPS_on_ＤＩＤ = false;

	SoundPlay("SE02", 1000, 500, true);
	CreateTextureEX("背景３", 100, 0, 0, "cg/bg/bg122_01_3_PC画面同一性障害_a.jpg");
	Move("背景３", 2000, @0, @-80, null, false);
	Fade("背景３", 500, 1000, null, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text102]
つぶやいたのは、さっきまでＰＣで調べていた、心の病の名。

今もモニタには、それに関する説明が表示されていた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//優愛のＰＣ画面（解離性同一性障害に関する説明）

//以下、ネットブラウザ画面に表示されたテキストサイトの解説文
//解離性同一性障害【かいりせい-どういつせい-しょうがい】
//略称はDID (Dissociative Identity Disorder)

//１人の人間に複数の人格が存在する状態。人格とは「自我や環境を認知し、そこに関与し、思考することの持続的様式」と定義される。つまり人間は連続した時間を認識することで自我を有し、行動・情報が一貫していることを確認し、それを『自分』として形成している。障害における人格の交代は突然で、心理的・社会的ストレスや環境的要因が誘因となる。別人格時の記憶を持っていない例が多いのが特徴。発症年齢は小児期であるが、臨床的に露見しない場合もある。慢性化しやすく、小児期に受けた虐待や心的外傷が、解離性同一性障害より先に見られる。

//なおこの疾患にはよく『多重人格障害』という名称が使われていたが、それはＤＳＭ－Ⅲ（アメリカ精神医学会の定めた『精神障害の診断と統計の手引き』第３版・１９８０年発行）での旧称で、ＤＳＭ－Ⅳ（１９９４年）以降は使われていない。


	SoundPlay("SE02", 1000, 300, true);
	Fade("背景３", 1000, 0, null, true);

	CreateColor("背景３", 150, 0, 0, 1280, 720, "Black");
	Fade("背景３", 0, 0, null, true);
	CreateSE("SE03","SE_じん体_動作_抱く1");

//ＣＧ//自室のベッドで寝転がる優愛

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03800040yu">
「辛いんですね……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("背景３", 1500, 1000, null, true);
	SoundPlay("SE03", 0, 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
優愛は枕元に置いてある、ゲロカエルんぬいぐるみをギュッと抱きしめ、拓巳のことを想う。

//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03800050yu">
「でも……わたし……」

だがすぐにその表情を消し、奥歯をギリリと噛みしめた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,500);//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	MusicStart("SE*", 2000, 0, 0, 1000, null, false);

	ClearAll(1000);
	Wait(2000);

//～～Ｆ・Ｏ
//プレイヤーはこの時点で拓巳が多重人格性障害だと思い込む

//■インターミッション０６終了

}
