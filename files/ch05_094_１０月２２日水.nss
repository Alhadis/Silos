//<continuation number="0">




chapter main
{

	$PreGameName = "boot_第五章";

	if($GameStart != 1)
	{
		$GameName = "ch05_094_１０月２２日水";
		$GameContiune = 1;
		Reset();
	}

		ch05_094_１０月２２日水();
}


function ch05_094_１０月２２日水()
{

	$SYSTEM_last_text="第５章";

	if(Platform()!=100){
		Save(9999);
	}

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


//Ｃｈａｏｓ；Ｈｅａｄ　第５章

//――――――――――――――――
//■第５章【妄想】
//イメージＢＧ//ニュージェネについて
//↑第２章で使ったものを流用
//１０月２２日（水）//日付は表示しない
	ChapterIn("dx/mvD.avi");

		Delete("*");
		CreateTextureEX("back04", 100, 0, 0, "cg/bg/bg117_01_3_PC画面ニュージェネ_a.jpg");
		Fade("back04", 1000, 1000, null, true);

	ChapterIn2();

	CreateSE("SE01","SE_日常_PC_はーどでぃすく_LOOP");
	MusicStart("SE01", 500, 1000, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
『集団ダイブ』の映像が流出したことは、当然のように大きな話題になっていた。

ネットでは、グリムが言う通り祭り発生中。

＠ちゃんでは、ニュージェネの４つの殺人事件はすべて同一犯によるもので確定、っていう意見が多い。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);

//イメージＢＧ//ＰＣ画面（＠ちゃんねる）
	CreateTexture360("背景９", 2000, center, middle, "SCREEN");
	CreateBoard(0,0);

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text901]
<FONT incolor="#0000ff"><U>123</U></FONT>  名前：<FONT incolor="#228b22">守銭奴（コネチカット州）</FONT>［age］：200X/10/22(水) 20:38:11  <FONT incolor="#0000ff"><U>ID:</U></FONT>OlkKqUBO0
ニュージェネの犯人は“その目だれの目？”でケテーイ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

	#TIPS_（ｒｙ = true;
	$TIPS_on_（ｒｙ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text902]
<FONT incolor="#0000ff"><U>124</U></FONT>  名前：<FONT incolor="#228b22">退学中（静岡県）</FONT>［age］：200X/10/22(水) 20:38:42  <FONT incolor="#0000ff"><U>ID:</U></FONT>WbOw0ibQ0
ミュウツベにうｐしたヤツって犯人だよな
すげーその目だれ（ｒｙ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text903]
<FONT incolor="#0000ff"><U>125</U></FONT>  名前：<FONT incolor="#228b22">夜間警備員（兵庫県）</FONT>［age］：200X/10/22(水) 20:39:47  <FONT incolor="#0000ff"><U>ID:</U></FONT>HHn4LeUp0
よし、通報してうわ、その目だれくぁｗせｄｒｆｔｇｙふじこｌｐ；＠
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text904]
<FONT incolor="#0000ff"><U>126</U></FONT>  名前：<FONT incolor="#228b22">ホワイトカラー（オレゴン州）</FONT>［age］：200X/10/22(水) 20:41:56  <FONT incolor="#0000ff"><U>ID:</U></FONT>ot5WPXVG
ヴァンパイ屋でも『その目だれ（ｒｙ』ってメッセージあったよな。
ニュージェネの最初と最後の事件が繋がったじゃねーか。これまで関連性なしって言われてたのに。
ということは妊娠男と張り付けも……
　
やべー、オラわくわくしてきたぞ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text905]
<FONT incolor="#0000ff"><U>127</U></FONT>  名前：<FONT incolor="#228b22">草野球選手（茨城県）</FONT>［age］：200X/10/22(水) 20:42:22  <FONT incolor="#0000ff"><U>ID:</U></FONT>/pkGqtA8
<PRE>|д<◎>).｡oO</PRE>(その目だれの目？)
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text906]
<FONT incolor="#0000ff"><U>128</U></FONT>  名前：<FONT incolor="#228b22">獅子舞（空中都市）</FONT>［age］：200X/10/22(水) 20:43:56  <FONT incolor="#0000ff"><U>ID:</U></FONT>r1TH+bP8
<FONT incolor="#0000ff"><U><PRE>>></PRE>126</U></FONT>
しかも、その目だ（ｒｙは初出がヴァンパイ屋の方だから、集団ダイブ見て模倣するってのも不可能。
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,null);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text907]
<FONT incolor="#0000ff"><U>129</U></FONT>  名前：<FONT incolor="#228b22">書記（神奈川県）</FONT>［age］：200X/10/22(水) 20:45:10  <FONT incolor="#0000ff"><U>ID:</U></FONT>ZheTK2L10
<FONT incolor="#0000ff"><U><PRE>>></PRE>127</U></FONT>
こっち見んなｗｗｗ
その目（ｒｙ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,start);//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);
	FadeDelete("背景９", 0, true);

	#TIPS_ペリカ = true;
	$TIPS_on_ペリカ = true;

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text908]
<FONT incolor="#0000ff"><U>130</U></FONT>  名前：<FONT incolor="#228b22">低所得者（新潟県）</FONT>［age］：200X/10/22(水) 20:46:07  <FONT incolor="#0000ff"><U>ID:</U></FONT>3S3h/NC89
動画見たけどなんかウソくさくね？
どっかの劇団が売名行為でやってるに１ペリカ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text909]
<FONT incolor="#0000ff"><U>131</U></FONT>  名前：<FONT incolor="#228b22">パイロット（成層圏）</FONT>［age］：200X/10/22(水) 20:48:42  <FONT incolor="#0000ff"><U>ID:</U></FONT>e6dCF8Ps
お前らあんま、その目なんとかっていう言葉使うなよボケ
犯人が調子乗るだけだろ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text910]
<FONT incolor="#0000ff"><U>132</U></FONT>  名前：<FONT incolor="#228b22">整形外科（三重県）</FONT>［age］：200X/10/22(水) 20:50:38  <FONT incolor="#0000ff"><U>ID:</U></FONT>DVtxTrYu0
これガチでニュージェネ全部同一犯か(((( ；ﾟДﾟ)))
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text911]
<FONT incolor="#0000ff"><U>133</U></FONT>  名前：<FONT incolor="#228b22">すっとこどっこい（父島）</FONT>［age］：200X/10/22(水) 20:50:51  <FONT incolor="#0000ff"><U>ID:</U></FONT>dETOb6pw
　<PRE>(  < ◎> 皿< ◎>)</PRE>そ～の～目～
　
　
　<PRE>(<◎ >皿 <◎ >  )</PRE>だ～れ～の～
　
　
<PRE> m9( <◎> 皿 <◎> )</PRE>　目！？
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text912]
<FONT incolor="#0000ff"><U>134</U></FONT>  名前：<FONT incolor="#228b22">昼寝中（山梨県）</FONT>［age］：200X/10/22(水) 20:51:04  <FONT incolor="#0000ff"><U>ID:</U></FONT>i07S8ghy
<FONT incolor="#0000ff"><U><PRE>>>130</PRE></U></FONT>
高さは２メートルぐらいで、
直下にマットとか敷いてあったりしてなｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text913]
<FONT incolor="#0000ff"><U>135</U></FONT>  名前：<FONT incolor="#228b22">サイコメトラー（カムチャッカ半島）</FONT>［age］：200X/10/22(水) 20:54:00  <FONT incolor="#0000ff"><U>ID:</U></FONT>yoepHMBk0
<FONT incolor="#0000ff"><U><PRE>>>131</PRE></U></FONT>
同意
この言葉が流行している間は、殺人が繰り返されるぞ
お前ら自重しろ。シャレじゃ済まなくなってきてる
　
　
　
　
<PRE>＜◎＞　＜◎＞</PRE>　その目だれ（ｒｙ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text914]
<FONT incolor="#0000ff"><U>136</U></FONT>  名前：<FONT incolor="#228b22">映画鑑賞家（瀬戸内海）</FONT>［age］：200X/10/22(水) 20:55:29  <FONT incolor="#0000ff"><U>ID:</U></FONT>ecZZ4Itq0
渋谷に住んでる<FONT incolor="#0000ff"><U><PRE>>></PRE>131</U></FONT>涙目ｗｗｗ
　
<FONT incolor="#0000ff"><U><PRE>>></PRE>133</U></FONT>
こっち見んな
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text915]
<FONT incolor="#0000ff"><U>137</U></FONT>  名前：<FONT incolor="#228b22">１７歳ＯＬ（関東地方）</FONT>［age］：200X/10/22(水) 20:56:08  <FONT incolor="#0000ff"><U>ID:</U></FONT>EMD4gjlgO
ミュウツベの動画
再生回数トップになってるぞ
　
<FONT incolor="#0000ff"><U><PRE>>></PRE>133</U></FONT>
ちょｗｗｗこっち見んなｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text916]
<FONT incolor="#0000ff"><U>138</U></FONT>  名前：<FONT incolor="#228b22">酋長（東京都）</FONT>［age］：200X/10/22(水) 21:01:03  <FONT incolor="#0000ff"><U>ID:</U></FONT>6ReQ/N/dO
ＭＨＫニュース、トップ報道ｋｔｋｒ!!!111!!
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text917]
<FONT incolor="#0000ff"><U>139</U></FONT>  名前：<FONT incolor="#228b22">インテリアデザイナー（西日本）</FONT>［age］：200X/10/22(水) 21:02:24  <FONT incolor="#0000ff"><U>ID:</U></FONT>t11D9z5a0
その目だ（ｒｙからの犯行声明ﾏﾀﾞｰ？
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE @box03>
[text918]
<FONT incolor="#0000ff"><U>140</U></FONT>  名前：<FONT incolor="#228b22">ホタテ養殖（東京都）</FONT>［age］：200X/10/22(水) 21:02:41  <FONT incolor="#0000ff"><U>ID:</U></FONT>NObrf8P20
民放すべて特番ｷﾀ━━━━<PRE>＜◎＞ ∀ ＜◎＞</PRE>━━━━!!!11!!11
ただし東テレ以外ｗｗｗ
　
</PRE>
	SetBoard($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBoard(500,true);//――――――――――――――――――――――――――――――



//画面パンして拓巳の視線をさまよわせる

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
テレビでの報道も過熱していた。

//※東テレ＝テレビ東京のこと
>>140の言う通り、民放は東テレをのぞいてどこも報道特別番組を放送し、そこで繰り返し例の動画を流した。

特番自体は１時間程度で終わったけど、あの映像が全国に流されたっていうのはちょっとした衝撃だった。

もちろん、最後の飛び降りる場面についてはどのテレビ局も自主規制してカットしてたけど、それでもインパクトが強すぎた。

テレビでの論調もおおむねネットと同じで、ニュージェネの４つの事件を同一犯によるものだとほぼ決めつけてるみたいだった。

それも当然だろう。
一連のニュージェネ事件に、ついに共通点が見つかったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Fade("back04", 0, 0, null, true);
	CreateTexture360("背景９", 100, center, middle, "SCREEN");
	EndBoard();
	FadeDelete("背景９", 0, true);

//▼TIPS：解除：（ｒｙ
//▼TIPS：解除：ペリカ：掲示板の切れ目変更まで一時的に記述
	$TIPS_on_（ｒｙ = false;
	$TIPS_on_ペリカ = false;

	LoadBox10();
	CreateTextureEX("背景１", 1000, 0, -480, "cg/bg/bg009_01_1_107_a.jpg");

//――――――――――――――――――――――――――――――――――――――
<PRE box10>
[text004]
――その目だれの目？
　
</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin2();//――――――――――――――――――――――――――――――

	Wait(1000);

	FadeDelete("@text004", 1000, false);
	Fade("背景１", 1000, 1000, null, false);
	Move("背景１", 1000, @0, @480, Dxl2, true);

	CreateTextureEX("背景２", 1000, 0, 0, "cg/bg/bg084_01_1_渋谷センター街_a.jpg");
	Fade("背景２", 500, 1000, null, true);
	FadeDelete("背景１", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
今、渋谷で流行っている言葉。

本来その言葉は、ニュージェネ第４の事件『ヴァンパイ屋』において世間に初めて登場したものだ。

それなのに、『ヴァンパイ屋』より１ヶ月以上も前に起きた『集団ダイブ』でも被害者が口走っていた。

今のところ発生している４つの事件のうち、最初と最後の事件で使われた言葉。

これが意味するのは……やっぱり４つの事件はすべて同一犯によるものだっていう可能性。

警察は急遽開いた記者会見で“動画を投稿した人物の特定を急ぐ”って、今後の対応を発表して。

一部の政治家も“大変遺憾。一刻も早く犯人逮捕を”なんて言ってる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg901_01_1_汎用ミュウツベ_a.jpg");

	FadeDelete("背景２", 500, true);
	Fade("背景１", 500, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
ミュウツベの動画は、アップされてから３時間も経たないうちに管理者の手で削除されたけど、もう遅かった。

とっくに動画を落とし終えていた＠ちゃんねらーの手によって、あちこちのアップローダーから大量に拡散されていくのを、誰も止めることはできなかったんだ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE*", 2000, 0, NULL);
	FadeDelete("背景１", 1000, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
そして深夜近くになって、警察発表として次の事実が明らかにされた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	WaitAction("背景１", null);

	Wait(1000);

	CreateTextureEX("背景１", 100, 0, 0, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");
	SetTone("背景１", Monochrome);

	CreateSE("サウンド１","SE_衝撃_衝撃音01");
	SoundPlay("サウンド１",0,1000,false);

	Fade("背景１", 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
――『集団ダイブ』事件の動画は、
渋谷区内にあるマンガ喫茶『＠カフェ』のＲＯＯＭ３７にある
パソコンからアップロードされたものである。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	Wait(2000);

	ClearAll(1000);

	Wait(4000);

//～～Ｆ・Ｏ


}