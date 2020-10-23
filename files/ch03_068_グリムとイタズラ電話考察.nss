//<continuation number="20">





chapter main
{

	$PreGameName = "boot_第三章";

	if($GameStart != 1)
	{
		$GameName = "ch03_068_グリムとイタズラ電話考察";
		$GameContiune = 1;
		Reset();
	}

		ch03_068_グリムとイタズラ電話考察();
}


function ch03_068_グリムとイタズラ電話考察()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);


//アイキャッチ
//※拓巳視点に戻る
//ＢＧ//ＰＣ画面（チャット）

	Delete("背景*");
	Delete("色*");
	SetVolume360("CH*", 500, 0, null);
	SoundPlay("SE*",500,0,false);

	ClearAll(0);

	CreateTextureEX("部屋", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("部屋", 2000, 1000, null, true);
	
	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	CreateSE("SE03","SE_日常_PC_マウスくりっく02");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);
	SoundPlay("SE03", 0, 1000, false);

	Wait(2000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
エンスーを始める前のグリムとの軽いチャットは、僕の習慣になりつつある。

チャットの内容は大したことない。

＠ちゃんの面白いスレについて情報を交換したり、エロい話に花を咲かせたり、オススメの新刊コミックや前日のアニメの話題とか、そういう他愛のないものだ。

意外にもエンスーの話はあまりしない。なぜならこの後エンスープレイ中にくさるほどチャットするから。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE03", 500, 0, false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg000_02_1_チャットサンプル_a.jpg");
	ChatMain(420,-54,"002");
	Fade("背景１", 0, 1000, null, true);
	Fade("box01", 0, 1000, null, true);


//ウェブＣＨＡＴ開始
//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text002]
ナイトハルト：最近妙なイタズラ流行ってないか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text003]
//ｋｗｓｋ＝詳しく話せ
グリム：ｋｗｓｋ{#TIPS_ｋｗｓｋ = true;$TIPS_on_ｋｗｓｋ = true;}
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text004]
ナイトハルト：いや、僕も知り合いから聞いただけなんで
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text005]
ナイトハルト：ホントに流行ってるかどうか分からんけど
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text006]
ナイトハルト：ケータイの留守電に
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,600);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text007]
ナイトハルト：妙な音を吹き込まれるらしい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text008]
グリム：萌え声でエロいこと言ってくれるとか？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text009]
ナイトハルト：ちょｗｗそれなんてエロゲｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,key);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text010]
ナイトハルト：そういうのはむしろどんどんやってほしくね？ｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1200);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text011]
グリム：じゃあいったいその目だれの目？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");


	Wait(1500);
	
//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06800010ta">
「…………」

グリムは相変わらずその言葉を使う……。
おかげでこっちは一瞬にして気分が悪くなる。

しかも日本語おかしいし。そこまで無理矢理使うほど面白い言葉かな、それ。

少なくとも僕はちっとも面白くない。むしろ寒い。

でもイタズラの話を聞き出すまではケンカするわけにもいかない。
しょうがなく我慢した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text013]
グリム：キモオタのハァハァ声とか？ｗｗｗ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text014]
ナイトハルト：それは酷い
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,500);
	TypeChat("0");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text015]
ナイトハルト：マジレスすると、通りゃんせ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1000);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text016]
グリム：通りゃんせ？　歌だっけ？　横断歩道とかで流れてるやつ？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("0");

//▼TIPS：解除：ｋｗｓｋ
	$TIPS_on_ｋｗｓｋ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text017]
ナイトハルト：そうそう
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,400);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text018]
ナイトハルト：で、途中で急にブザーみたいな音に変わる
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1200);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text019]
ナイトハルト：この音量がけっこうデカいらしい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1000);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text020]
ナイトハルト：そういうイタズラ聞いたことある？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1000);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text021]
ナイトハルト：＠ちゃんとかで流行ってるとかありそうじゃね？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,1500);
	TypeChat("2000");
	
//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text022]
昨日、僕の留守電に吹き込まれていた謎のブザー音。

誰の仕業なのかも分からないし、なんとなく不安にさせるような内容
だったから、試しにグリムが知っているかどうか聞いてみた。

もし単なるイタズラなら、今後は相手にしなければいいだけの話だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch03/06800020ta">
「…………？」

あれ、グリムの反応がないぞ。
どうしたんだろう。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text023]
ナイトハルト：おーい
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,400);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text024]
ナイトハルト：オチたか？
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,600);
	TypeChat("2000");
	
//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text025]
なおも反応はない。
グリムが寝オチするなんて珍しい。今まで一度もなかったことだ。

でもオチたなら仕方ない。後でどうせエンスーでも会うだろうし、そのときにまた話せばいいだろう。
そう思って席を立とうとしたとき、

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text026]
グリム：お待たせ
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("1500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text027]
グリム：＠ちゃんで検索かけてたお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2000");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text028]
グリム：おまいの言うイタズラについて
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("200");


	Wait(1000);
//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text029]
なんだ、そういうことだったのか。

でもそれはつまり、情報通のグリムですらイタズラのことは知らないっていうことになる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Wait(500);

//ウェブＣＨＡＴ開始

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text030]
グリム：でもそんな話どこにもなかったお
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("2500");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text031]
グリム：＠ちゃんどころか、ネット上どこ探してもない
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,RED);
	TypeChat("200");

//――――――――――――――――――――――――――――――――――――――
<PRE @box01>
[text032]
ナイトハルト：ふーん
</PRE>
	SetChat($SYSTEM_present_preprocess,$SYSTEM_present_text,#FFFFFF);
	SoundChat(1,1,600);
	TypeChat("200");
	
//ウェブＣＨＡＴ終了

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text033]
ということは、僕に対する個人的な恨みから
ああいうイタズラを仕掛けてきたっていうことなのかな。

やっぱり電話の相手の正体が気になる……。
だけどこっちからかける勇気はない。

あ、そうだ、相手の番号は分かってるんだから、誰かをスケープゴートにしてかけてもらうっていう手を使おう。

適任としては七海か三住くんだな。
いや、三住くんは悪魔女に洗脳されてるかもしれないからダメだ。

七海なら妹っていうことで気兼ねなく頼める。後でキレられそうだけど、そんなの知ったことじゃない。たまには社会の荒波に揉まれて痛い目に遭えばいいんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景２", 100, 0, 0, "cg/bg/bg026_02_3_拓巳部屋_a.jpg");
	Fade("box01", 500, 0, null, false);
	Fade("背景２", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601033]
僕はグリムにお礼を言い、数時間後にエンスーで
合流しようと約束してからチャットを切り上げた。

ちょうど、自分のお腹がグルグルと鳴った。
お腹すいたなあ。カップ麺ってどこかにストックはあったっけ？

探してみたけどどこにも見当たらない。
やむなくコンビニまで買いに行くことにした。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundPlay("SE*", 2000, 0, false);

	CreateSE("SE02","SE_日常_扉_開ける");
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	CreateColor("色１", 100, 0, 0, 1280, 720, "Black");
	DrawTransition("色１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(500);

	ClearAll(0);

	CreateSE("SE03","SE_日常_扉_閉まる");
	SoundPlay("SE03", 0, 1000, false);

	Wait(2500);

//ＢＧ//円山町の町並み//夜

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg024_02_3_円山町_a.jpg");
	DrawTransition("背景１", 1000, 0, 1000, 100, null, "cg/data/left3.png", true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text034]
日はすでに暮れていた。

夜に出歩くのはできれば控えたかったんだけどなあ。最近、イヤな思い出しかないから。

僕は自然と早足になり、コンビニへの道を急いだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

}