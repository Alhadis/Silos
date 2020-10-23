//<continuation number="470">




chapter main
{

	$PreGameName = "boot_第八章";

	if($GameStart != 1)
	{
		$GameName = "ch08_172_インターミッション３９";
		$GameContiune = 1;
		Reset();
	}

		ch08_172_インターミッション３９();
}


function ch08_172_インターミッション３９()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//アイキャッチ
//■インターミッション３９
//ＢＧ//希テクノロジー・ＶＩＰルーム


	IntermissionIn();

	Delete("背景*");
	Delete("色*");
	BGMPlay360("CH*", 500, 0, true);
	SoundPlay("SE*",0,0,false);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg136_01_1_希ＶＩＰルーム_a.jpg");

	CreateSE("SE01","SE_はいけい_びっぷルーム_LOOP");
	MusicStart("SE01", 3000, 600, 0, 1000, null, true);
	IntermissionIn2();

	BGMPlay360("CH27", 2000, 1000, true);
	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200010nr">
「ノアⅡに搭載されている中で最も秀でているのは、中核システムに組み込まれた、とある方程式です」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200020nr">
「これは人類史上、いまだ解答が見つかっていないとされているもの」

//◆ミレニアムセブン
//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200030kr">
{#TIPS_ミレニアム７ = true;$TIPS_on_ミレニアム７ = true;}「<FONT incolor="#88abda" outcolor="BLACK">ミレニアム７</FONT>のうちのひとつかね？」

{$TIPS_on_ミレニアム７ = false;}
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200040ih">
「億単位の懸賞金がかけられているという、数学界で未だ未解決の、７つの問題か」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200050nr">
「いいえ。その７つの中には入っていません」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200060nr">
「ですが、実はミレニアム７はもともと問題が８つあった。公開前にひとつだけ削除されたのです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200070ih">
「それが、ノアⅡに組み込まれている方程式だと？」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200080kr">
「削除された理由は？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200090nr">
「世界に災厄を撒き散らす可能性があるため、というところです」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200100ih">
「いったいどのような数式なのだ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200110nr">
{#TIPS_基本相互作用 = true;$TIPS_on_基本相互作用 = true;}「『<FONT incolor="#88abda" outcolor="BLACK">基本相互作用</FONT>』における電磁気力を想定した共鳴現象。それを現す計算式です」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	$TIPS_on_基本相互作用 = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200120nr">
「これにより、特定の電磁パルスと受容体とが近接作用することで発現する、未知の力が解明されました」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200130nr">
「各国が３０年以上かけて開発し積み上げてきた『沈黙の兵器』の研究成果を、一瞬にして過去のものとしてしまったんですよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200140ih">
「その問題に解答を見つけた者は、神になるに等しいというわけだ」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200150kr">
「それを、キミが果たしたというわけかね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200160nr">
「それはとても不思議な場所から見つかりました。子供の落書きという、ね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200170nr">
「Ｉｒ２」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200180nr">
「ノアⅡの、いわゆるハードウェア部分は、この公式によって神に匹敵する能力を手に入れました」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200190nr">
「後は、ソフトウェア部分に相当する、ギガロマニアックスのＣＯＤＥサンプルを集めれば」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200200nr">
「ノアⅡは本格的に稼働し、我々の望むものすべてを実現してくれるでしょう」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200210kr">
「かのアインシュタインが現代に生きていれば、と思うよ。彼は高い能力を持つギガロマニアックスだったと聞く」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200220ih">
「仮定の話よりも、現状がどうなっているかだ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200230ih">
「ギガロマニアックスは世界中に数えるほどしかいないと言うではないか。大丈夫なのか！？」

//※梨深、あやせ、セナ、七海、野呂瀬
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200240nr">
「すでに５人分のサンプルは確保しました」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200250kr">
「ノアⅡ稼働にじゅうぶんな数は集まったようだね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200260ih">
「ならば結構」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200270nr">
「ただ、サンプルが多ければ多いほど、ノアⅡの能力は向上します」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200280nr">
「特に……どうしてもサンプルを採取したいギガロマニアックスの少年が、ひとりいましてね」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200290ih">
「だからと言って計画の遅延は許されんぞ」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200300kr">
「ノアⅡの本格稼働はいつ頃になりそうなのかね？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200310nr">
「稼働前に、最終実験として」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200320nr">
「サードメルトを行います」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200330kr">
「また地震を起こそうと？」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200340ih">
「予測規模は？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200350nr">
「想定では関東大震災と同レベル」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200360ih">
「関東大震災クラスだと！？」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200370kr">
「マグニチュード７．９、だったかな？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200380nr">
「現在の建築基準と免震対策レベルを考えれば、街にかつてほどの大きな損害を及ぼすことはないでしょう」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch08/17200390kr">
「だが犠牲者の数はファースト、セカンドの比ではなかろう？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200400nr">
「およそ５０００人ほどといったところです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200410nr">
「少なく見積もって……ですが。問題が？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200420ih">
「責任は貴様が取るのだろうな」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200430nr">
「腹でも切って死んで見せますか？」

//◆うなる
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch08/17200440ih">
「…………」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200450nr">
「これが最終実験です」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200460nr">
「サードメルトが予定通りの成果を上げたとき、ノアⅡは完全なる完成を見る」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch08/17200470nr">
「世界の可能性は我らの手の中に」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH*", 2000, 0, false);
	SoundPlay("SE*", 2000, 0, false);
	ClearAll(2000);
	Wait(2000);

//～～Ｆ・Ｏ

//■インターミッション３９終了

}