//<continuation number="140">




chapter main
{

	$PreGameName = "boot_第二章";

	if($GameStart != 1)
	{
		$GameName = "ch02_035_グリムとニュージェネ考察";
		$GameContiune = 1;
		Reset();
	}

		ch02_035_グリムとニュージェネ考察();
}


function ch02_035_グリムとニュージェネ考察()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();




	Wait(500);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	CreateMovie360("ナイトハルト", 200, Center, Middle, true, false, "dx/mvNH01.avi");	
	Fade("ナイトハルト", 0, 1000, null, true);
	Delete("背景１");
	Wait(1000);

//イメージＢＧ//ＰＣ画面（エンスープレイ中）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
エンスーに潜ってみると、グリムがいた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(500);

	Fade("ナイトハルト", 200, 0, null, true);
	Delete("ナイトハルト");

	MmoMain(0,0,"cg/sys/mmo/エンスー1.jpg");
	MmoKnight();
	Fade("MmoWindow", 200, 1000, null, true);
	Move("MmoWindow", 500, @0, @-192, Dxl1, true);

	Wait(500);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text002]
ナイトハルト＞最近の＠ちゃんニュース板はつまらなくなったな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,key);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text003]
ナイトハルト＞どこもニュージェネの話ばっかりだ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1000);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text004]
グリム＞そりゃ、今一番注目されてる事件だからな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text005]
グリム＞新しい事件が起きるたびに祭り{#TIPS_祭り = true;$TIPS_on_祭り = true;}になってるおｗ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text006]
ナイトハルト＞犯人はまだ捕まってないの？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1000);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text007]
グリム＞だってほら、警察無能だしｗ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text008]
グリム＞ネットの一部には犯人を萌え美少女設定しちゃってるバカもいるおｗ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//▼TIPS：解除：祭り
	$TIPS_on_祭り = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text009]
ナイトハルト＞あの悪魔女……
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,700);
	TypeMmo("1000");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
張り付け殺人事件のとき、現場で見かけた女の仄暗い瞳が脳裏をかすめ、僕はゾッとした。

もう思い出したくないのに、ちょっとした気の緩みで忌まわしい記憶がよみがえってしまう。

そう、僕は犯人の顔を見ている。犯人を、知っている。
警察に通報すべきなんだろうか。でも巻き込まれたくないし……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text011]
グリム＞悪魔女？　ついにそんなバージョンまで出たのか
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text012]
グリム＞ま、さすがにそりゃ悪ふざけしすぎだけどな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text013]
グリム＞とにかくニュージェネ事件ってマジ面白いんだって
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2500");

//わざと「漏れ」
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text014]
グリム＞漏れ、フレパラのニュージェネコミュ入ったお
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text015]
ナイトハルト＞はまりすぎ
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,600);
	TypeMmo("3000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text016]
グリム＞漏れらのギルドで入ってないの、ナイトハルトとゲジ姉だけなんだぜ？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2500");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text017]
げげ、マジか……。
それじゃギルドのみんなとのチャットで話題に入っていけない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
//エンスーＣＨＡＴ開始
<PRE @box02>
[text117]
グリム＞ニュージェネは普通じゃない
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text018]
グリム＞ゾクゾクするお
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text019]
ナイトハルト＞グリムがそういうグロ趣味だってのは知ってたが
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1200);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text020]
ナイトハルト＞まさか殺人事件に芸術性とか求めるタイプ？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1500);
	TypeMmo("1000");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
確かにあの張り付け死体は、オブジェと勘違いしたくらいだから、芸術性はあると言えばあるのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(1000);

//エンスーＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text023]
グリム＞いや、むしろ求めるべきはいかに変態かじゃね？
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text024]
グリム＞究極のＳＭの形みたいな
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text025]
ナイトハルト＞ダメだこいつ……早くなんとかしないと……
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,700);
	TypeMmo("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text026]
グリム＞ナイトハルトたんも脱童貞すれば分かるようになるお
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text126]
ナイトハルト＞そういう貴様は童貞じゃないと言うのかー
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,1000);
	TypeMmo("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text127]
グリム＞(`･ω･´)
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text128]
ナイトハルト＞Σ (ﾟДﾟ;）
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,500);
	TypeMmo("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text129]
ナイトハルト＞この裏切り者めｏｒｚ{#TIPS_ｏｒｚ = true;$TIPS_on_ｏｒｚ = true;}
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundMmo(1,1,500);
	TypeMmo("1000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text027]
グリム＞それはともかく
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box02>
[text029]
グリム＞まとめサイトはマジ充実してるから、目を通してみろＹＯ！
</PRE>
	SetMmo($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	TypeMmo("1000");

//エンスーＣＨＡＴ終了
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text030]
うう……。怖いから見たくないのに。

事件現場を目撃した、っていう現実から逃れたい……その一心で、ずっとニュージェネに関するすべての情報を遮断してた。

そうすることで、僕が見たあの凄惨な光景は妄想だったって思い込みたかった。
でも……

エンスーでの僕は神に等しい存在だ。
強いだけじゃなく、なんでも知ってなくちゃいけない。

まして僕はギルドのリーダー的存在だ。みんなのまとめ役なのに話題についていけないなんて恥ずかしすぎる。

それは、避けなくちゃ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//▼TIPS：解除：ｏｒｚ
	$TIPS_on_ｏｒｚ = false;

	Fade("MmoWindow", 100, 0, null, true);
	Delete("MmoWindow");

	CreateTextureEX("結果", 100, 0, 0,"cg/bg/bg011_01_1_検索欄UP_a.jpg");
	Fade("結果", 300, 1000, null, true);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(300);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text031]
グリムに教えてもらったまとめサイトのアドレスに飛ぶ。

トップには大きく『ニュージェネまとめ』とそのまんまのタイトルが表示されている。

{#TIPS_Ｗｉｋｉ = true;$TIPS_on_Ｗｉｋｉ = true;}
まとめサイトってのは、一例としては<FONT incolor="#88abda" outcolor="BLACK">Ｗｉｋｉ</FONT>を使って不特定多数の人が特定のネタに関する情報を書き込めるサイトのことを言う。

{$TIPS_on_Ｗｉｋｉ = false;}
ニュージェネのまとめサイトなら、ニュージェネに関する情報をいろんな人が書き込んで随時更新していく。

信憑性の薄い情報も混じってるし、荒らしもいるけど、簡単に事件の全体像を理解するには便利だ。

リンクもたくさん貼ってあるし。

さっそく、『ここまでの流れ』というのを読んでみる。
自然と鼓動が速くなった。まとめサイトを読むだけなのに緊張していた。手の平がじっとりと汗ばむ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);
	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	CreateTexture360("背景１", 100, center, middle, "cg/bg/bg117_01_3_PC画面ニュージェネ_a.jpg");

	Delete("結果");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601031]
第１の事件――通称『集団ダイブ』は、高校生の男女５人による集団飛び降り自殺だ。

９月７日――今から約１ヶ月前の深夜、渋谷コーネリアスタワー。
屋上のヘリポートから墜落した５人はもちろん即死だった。

司法解剖の結果、５人それぞれの手の爪には本人以外の肉片が残されており、同時に引っ掻き傷も見つかった。

そこから、５人がどうやら手を繋いだまま飛び降りたのだと推測されている。

屋上には遺書らしきものはなにもなかった。

{#TIPS_スネーク = true;$TIPS_on_スネーク = true;}
以下はネットの有志（通称<FONT incolor="#88abda" outcolor="BLACK">スネーク</FONT>）が実際にコーネリアスタワーに行って確かめたことだけど、屋上は関係者以外立ち入り禁止であり、そこへ通じる扉はほぼ常時、施錠されたままだという。

{$TIPS_on_スネーク = false;}
当然ながら事件当時も、鍵はかけられていた。５人の遺品からその扉の鍵は見つからなかった。

つまり屋上ヘリポートは事実上“密室”状態であり、５人がどうやって屋上のヘリポートに侵入したのか、一切不明である。

もしかすると５人以外の“誰か”が事件当時そこにいた可能性が高い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);	

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text032]
第２の事件――通称『妊娠男』殺人事件は、９月１９日、第１の事件から１２日後に起こった。

早朝、渋谷駅のガード下付近にて、カラオケ帰りの大学生が、血まみれで倒れている男性を発見した。

この男性は渋谷区在住の大学生、近衛千鶴男（２１）で、発見されたときにはすでに死亡していたが、腹部が不自然に大きく腫れ上がっていた。

司法解剖したところ、男性は何者かによって腹部を切開され、胃の中に生まれたての胎児を閉じこめたまま縫合されたらしい。

なお、ＤＮＡ鑑定によって胎児と被害者に血縁関係はないことが判明している。
被害者は独身であり、また交際していた女性もいなかったとのこと。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
ここからはネット上の憶測になるけど、胎児はだいたい妊娠３２週目ぐらいの状態で、そうだとすると母親の身体から帝王切開をして取り上げられたと思われる。

でもその母親がいったい誰なのか、そして今現在どこでなにをしているのか、そもそも生きているのか死んでいるのかについては、一切不明らしい。

警察はもしかすると行方をつかんでるかもしれないけど、少なくとも世間には公表されてない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//拓巳の部屋
	SetVolume360("CH04", 500, 0, null);
	CubeRoom3("ルーム", 100, 0);
	MoveCube("ルーム", 0, @0, @0, @-150, null, true);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");
	SoundPlay("SE02", 0, 1000, false);
	Fade("ルーム", 300, 1000, null, false);
	MoveCube("ルーム", 500, @0, @0, @150, Dxl2, true);

	Delete("背景１");
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03500010ta">
「うっえ……」

吐きそうになって、僕はモニタから目をそらした。

なんておぞましいんだ……。犯人は絶対に狂ってる。
しかも……もしかしたらこの凄惨な殺人を……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＣＧ//張り付け死体の前に立ち、こちらを振り返る血まみれの梨深
//フラッシュバックで一瞬表示

	CreateSE("SE01","SE_衝撃_ふらっしゅばっく");

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("ルーム");

	if(#下着パッチ==true)
	{
		CreateTexture360("梨深", 500, center, -352, "ex/hu/hu梨深_制服_正面血まみれ_下着_lost_eye01.png");
	}else{
		CreateTexture360("梨深", 500, center, -352, "cg/hu/hu梨深_制服_正面血まみれ_lost_eye01.png");
	}

	Fade("梨深", 0, 0, null, true);
	Move("梨深", 0, @100, @0, null, true);

	SoundPlay("SE01", 0, 1000, false);

	CreateTexture360("背景１", 100, center, middle, "cg/ev/ev005_01_3_杭貼付け_a.jpg");

	Fade("回想フラッシュ", 300, 0, null, true);
	Delete("回想フラッシュ");
	Wait(200);
	Fade("背景１", 10, 0, null, true);
	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg020_01_3_渋谷路地裏_a.jpg");
	Delete("背景１");

	Fade("梨深", 100, 1000, null, true);

	Wait(200);

	Delete("梨深");
	Stand("st梨深_制服_正面血まみれ","lost", 500, @0);
	FadeStand("st梨深_制服_正面血まみれ_lost", 200, true);
	DeleteStand("st梨深_制服_正面血まみれ_lost", 1500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text035]
あの女がやったかもしれないなんて……

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("色１", 1000, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/effect.png", true);
	Delete("背景２");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602035]
//顔文字
日本ｵﾜﾀ＼(^o^)／

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	CreateTexture360("背景２", 100, 0, 0, "cg/bg/bg000_01_1_チャットサンプル_a.jpg");

	Fade("色１", 500, 0, null, true);
	Delete("色１");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text036]
星来たんをじっと見つめて、目の保養。

なんとか精神状態を安定させる。先生にもらった薬を飲むことも考えたけど、まだ星来たんだけでなんとかなった。

それでも、ナイトハルトとしての面子を保つためとはいえ、こんなグロいものを読むのはやっぱり辛いよ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//画面エフェクト//妄想ＩＮ用エフェクト
//ＳＥ//妄想ＩＮ

	CreateTextureEX("背景１", 80, 0, 0, "cg/bg/bg020_01_3_渋谷路地裏_a.jpg");

	DelusionFakeIn();
	Delete("背景２");

	Fade("背景１", 0, 1000, null, true);

	DelusionFakeIn2();

	BGMPlay360("CH07",3000,1000,true);

	Stand("bu星来_覚醒前_通常","happy", 90, @-100);
	FadeStand("bu星来_覚醒前_通常_happy", 500, true);

//ＶＦ//妄想セリフ（以下、星来のセリフはすべて）

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text037]
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500020se">
「そんなに辛いならさ、読まなくていいってぇ」

{	Stand("bu星来_覚醒前_通常","normal", 90, @-100);
	FadeStand("bu星来_覚醒前_通常_normal", 300, true);
	DeleteStand("bu星来_覚醒前_通常_happy", 0, true);}
//以下、拓巳の妄想……と思わせておいて実は現実かもしれない
//ＢＧ//渋谷路地裏//夜
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500030se">
「タッキーがドＭってんなら別に止めないけど」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500040se">
「辛そうなタッキーは見てられないんさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500050se">
「もうやめよ？　楽しいことだけしてようよ」

{	Stand("bu星来_覚醒前_通常","happy", 90, @-100);
	FadeStand("bu星来_覚醒前_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒前_通常_normal", 0, true);}
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500060se">
「いつもみたく、あたしにハァハァしてもいいからさ」

うう、星来たんはなんて優しいんだ……。

僕の味方でいてくれるのは星来たんだけだよ。
さすが僕の嫁。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CubeRoom3("ルーム", 100, 0);

	MusicStart("SE01", 2000, 500, 0, 1000, null, true);
	Fade("ルーム", 1000, 1000, null, true);

	DeleteStand("bu星来_覚醒前_通常_happy", 0, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text038]
テーブルの上に頬杖をついて、僕は深呼吸しつつ星来たんの笑顔を見つめる。はぁ、癒される……。

星来たんをチラ見しつつ読んでいけば、もう少しは耐えられるかもしれない。
ということで早速実践してみることにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	Fade("フラッシュ", 0, 0, null, true);

	MoveCube("ルーム", 1000, @100, @0, @-150, AxlDxl, false);
	Fade("フラッシュ", 500, 1000, null, true);
	Delete("ルーム");

//イメージＢＧ//ニュージェネについて
//おがみ：イメージBGダミー
	CreateTextureEX("背景１", 100, 0, 0,"cg/bg/bg117_01_3_PC画面ニュージェネ_a.jpg");

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(100);

	Fade("背景１", 500, 500, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601038]
そもそもどうして、関連性がまったくないこのふたつの事件が『ニュージェネ』とひとくくりにされるようになったんだろう。

『集団ダイブ』は、最初あくまで自殺として扱われたらしい。

だけど『妊娠男』事件後に『集団ダイブ』の再検証がネット上で行われて、現場の不自然な状況が発覚し、“５人は自殺に見せかけて殺されたのではないか”との説がささやかれ始めた。

『集団ダイブ』で亡くなった５人の親たちや、５人をよく知る友人たちも口々に、彼女たちが自殺をするなどあり得ないと語ったらしい。

そこに至って、マスコミは事件現場が同じ“渋谷”という点から

『新世代の若者達が生み出した狂気』
『ニュージェネレーションの狂気』

というセンセーショナルな見出しを使い始めた……ということなんだそうだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("張り付け現場", 100, 0, 0, "cg/bg/bg020_01_3_渋谷路地裏_a.jpg");
	Fade("背景１", 500, 0, null, false);
	Fade("張り付け現場", 500, 500, null, true);
	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602038]
そして、第３の事件……。
僕が目撃した、通称『張り付け』殺人事件だ。

まとめサイトには、まだ事件発生から日が浅いせいか、それほど多くの情報は出ていなかった。

//※あれだけ無数の杭で張り付けにされていたにもかかわらず被害者の身元が早い段階で判明している←伏線
被害者が太田久という５６歳の大学教授であること、杭で空き家のコンクリート壁に遺体が張り付けにされていたことぐらいしか公表されてないらしい。

現場付近では、犯行が行われたとされる午後８時ぐらいから１時間以上にわたって、“釘を打ち付けるかのような音”を聞いた住民が何人かいるらしい。

その音は僕も聞いた。今も耳にこびりついている。イヤな音だった。

ちなみに『集団ダイブ』『妊娠男』いずれとの関連性も今のところ見つかっていない。

けど、同じ渋谷でこれだけ異常な事件が立て続けに三度も起こったことにより、当然のようにこの『張り付け』殺人事件もニュージェネのひとつとして扱われることになった。

警察やマスコミでは３つの事件はすべて別々の人間による犯行だと見ているけど、ネットでの論調――というより期待――としては、同一犯、あるいは同一グループによる犯行という説が主流だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("渋谷街", 100, 0, -320, "cg/bg/bg009_01_1_107_a.jpg");
	Fade("張り付け現場", 500, 0, null, false);
	Fade("渋谷街", 500, 500, null, true);
	Delete("張り付け現場");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603038]
他にはオカルト説なんかもネットではよくささやかれているみたいで、すべての始まりは２ヶ月前の地震に起因するという意見もあった。

２ヶ月前、渋谷を震源地にして起きた震度３の地震。
規模は大したことがなかったにもかかわらず、
８人もの死者が出たって言って話題になったやつだ。

//※２ヶ月前の地震＝ファーストメルト
言われてみれば確かに、ニュージェネ事件が始まったのはその地震以降だ。

だから“ニュージェネ・オカルト派”は、その地震で８人が亡くなったことこそニュージェネ第１の事件としてカウントすべき、みたいに主張して、“ニュージェネ・主流派”との間に論争が起きていたりする。

いずれにせよ、これだけの凶悪事件が連続で三件も起きたにもかかわらず、すべての事件で犯人の手がかりすら見つけられないというのは異常事態だ。

そしてネットでは、第４の事件を待ち望む声が多い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("渋谷街", 500, 0, null, true);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	Wait(500);

	CreateTextureEX("結果", 100, 0, 0,"cg/bg/bg118_01_3_掲示板速報_a.jpg");
	Fade("結果", 500, 1000, null, true);
	Delete("渋谷街");
	Delete("フラッシュ");

	Wait(500);

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
//以下、ＰＣ画面内＠ちゃんねる掲示板のテキスト

//ニュージェネ速報だクマ(ll´（エ）｀ll)

//ニュージェネその１＠集団ダイブ　ﾉﾉﾉ---(ollllll´▽｀)oﾉ
//ニュージェネその２＠妊娠男　＼(||｀□´||;;＼)
//ニュージェネその３＠張り付け　†l†l(＠□＠)l†l†
//ニュージェネその？＠……to be continued!!!(゜ロ)ギョェ
//以上、ＰＣ画面内＠ちゃんねる掲示板のテキスト


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text039]
きっと僕も、当事者じゃなかったらこの“祭り”に参加していたかもしれない。そして第４の事件をワクテカして待っていたかもしれない。

くそっ、どいつもこいつもいい気なもんだ……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	CubeRoom3("ルーム", 100, 0);
	CreateSE("SE02","SE_日常_家具_イス_きしむ");

	SoundPlay("SE02", 0, 1000, false);
	MoveCube("ルーム", 1000, @-100, @0, @150, Dxl2, false);
	Fade("ルーム", 1000, 1000, null, true);
	Delete("結果");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601039]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch02/03500070ta">
「犯人を早く捕まえてくれよ……」

『張り付け』から１週間以上になるけど、あの悪魔女も警察もなんの動きも見せない。

もし僕があの場に居合わせたって知られているなら、少なくとも警察は話を聞きに来るはずだ。でも今のところその気配はない。

//おがみ：最新シナリオデータに準拠して修正
//もし僕があの場に居合わせたって知られているなら、少なくとも警察は話を聞きに来るはずだ。でも今のところその気配はない。
よ、よかった。
僕が巻き込まれることはなさそうだぞ――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＶＦ//回想セリフ
	SetVolume360("CH04", 500, 0, null);

	SoundPlay("SE10", 200, 0, false);
	SoundPlay("SE01", 1000, 0, false);
	CreateColor("背景２", 50, 0, 0, 1280, 720, "Black");
	CreateColor("背景３", 70, 0, 0, 1280, 720, "Black");
	Fade("背景２", 0, 1000, null, true);
	Fade("背景３", 0, 400, null, true);
	Stand("bu優愛_制服_通常左手下","hard", 60, @100);
	FadeStand("bu優愛_制服_通常左手下_hard", 0, true);

	Fade("ルーム", 0, 0, null, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text040]
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03500080yu">
「あなたには、予知能力がありますか？」

優愛が僕に突きつけた言葉が脳裏をよぎった。

//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/ch02/03500090yu">
「予知能力があるって思わなきゃ、納得できないような画像データを、あなたが持っていたから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("bu優愛_制服_通常左手下_hard", 300, true);
	SoundPlay("SE01", 1000, 500, true);
	Fade("ルーム", 1000, 1000, null, true);
	Delete("背景２");
	Delete("背景３");
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	SoundPlay("SE01", 2000, 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601040]
安心しかけたのに、一瞬にして鬱な気分に逆戻りしてしまう。

『将軍』から送信されてきた画像。
それは今も僕のＰＣの中にデータとして残ってる。

優愛の言ったことはあいつの妄想でしかないんだ。
支離滅裂すぎて推理として破綻してる。

結局今日は病院でそのことについて聞けなかったけど、僕が記憶を失ってる間に別の行動をしてたなんて、そんなのあり得ない。

今までそんなこと一度もなかったんだし。

だからあのグロ画像は、合成に決まってる。

{	SoundPlay("SE01", 500, 0, true);
	CreateColor("フラッシュ", 100, 0, 0, 1280, 720, "Black");
	Fade("フラッシュ", 0, 0, null, true);
	Fade("フラッシュ", 200, 1000, null, true);}
//ＶＦ//妄想セリフ
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500100se">
「だったらさ――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Delete("ルーム");

	BGMPlay360("CH07",1000,1000,true);
	CreateColor("フラッシュ２", 100, 0, 0, 1280, 720, "White");
	Fade("フラッシュ２", 0, 0, null, true);
	Fade("フラッシュ２", 1000, 1000, null, true);
	Delete("フラッシュ");
	Stand("bu星来_覚醒前_通常","normal", 200, @-100);
	FadeStand("bu星来_覚醒前_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text041]
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500110se">
「合成だって証拠を見つけちゃえばいいんさ」

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500120se">
「あの画像、解析しちゃおうよ」

で、でも、気持ち悪いからあんまり見たくないんだけど。

//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500130se">
「あの女を論破しちゃえば、タッキーはもう怯えることなく平穏な生活に戻れるんだよ？」

{	Stand("bu星来_覚醒前_通常","happy", 200, @-100);
	FadeStand("bu星来_覚醒前_通常_happy", 300, true);
	DeleteStand("bu星来_覚醒前_通常_normal", 0, false);}
//【星来】
<voice name="星来" class="星来" src="voice/ch02/03500140se">
「やるしかないっしょ！」

だよね……。その通りだよ……。

優愛はまるで僕が『張り付け』の犯人であるかのような言い方だったけど、そんなわけがないんだ。

だって僕自身が、犯人の顔を見てるんだから。
罪をなすりつけられてたまるか……。

{	Wait(500);}
僕はゴクリと息を呑むと、画像のキャッシュがあるはずのフォルダをダブルクリックした――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH07", 2000, 0, null);
	Wait(1500);

//～～Ｆ・Ｏ


}