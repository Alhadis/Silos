//<continuation number="670">




chapter main
{

	$PreGameName = "boot_第六章";

	if($GameStart != 1)
	{
		$GameName = "ch06_125_インターミッション２６";
		$GameContiune = 1;
		Reset();
	}

		ch06_125_インターミッション２６();
}


function ch06_125_インターミッション２６()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

	IntermissionIn();

	Delete("*");
	ClearAll(0);

	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg136_01_1_希ＶＩＰルーム_a.jpg");


//インターミッションムービー終了
	IntermissionIn2();

	CreateSE("SE01","SE_はいけい_びっぷルーム_LOOP");
	BGMPlay360("CH20",2000,1000,true);
	MusicStart("SE01", 2000, 500, 0, 1000, null, true);

	Wait(1000);


//アイキャッチ
//■インターミッション２６

//ＢＧ//希テクノロジー・ＶＩＰルーム

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500010nr">
「ここからは少し専門的な話になりますが」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500020kr">
「キミは元医師だろう。患者に説明するように、分かりやすく、簡潔に話してもらえるとありがたい」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500030nr">
「努力しましょう」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500040nr">
「さて、人間の脳の中にある、何億という脳細胞。それらは細い神経の糸を出し合って、それぞれに手を繋いでいるような格好をしています」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500050nr">
「しかし実際には、各神経の先端にある手と手の間には、ごくわずかな隙間が空いているんですよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500060nr">
{#TIPS_ドーパミン = true;$TIPS_on_ドーパミン = true;}「脳細胞に情報の電気信号が送り出されると、その神経の手の平から、極小の物質――<FONT incolor="#88abda" outcolor="BLACK">ドーパミン</FONT>がボールのように飛び出してきます」

{$TIPS_on_ドーパミン = false;}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500070nr">
「それは反対側の神経の手の平にキャッチされ、再度情報の電気信号に変わって、また隣の脳細胞に伝わっていく……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500080nr">
「脳の構造は、簡単に言うとその繰り返しです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500090nr">
「我が社が開発した第２世代『ノアⅡ』は、
この部分に干渉することで――」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500100nr">
「人に擬似的な映像を見せることを可能としました」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500110ih">
「ふん、ホログラムのようなものか？」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500120kr">
「あるいは幻覚かな」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500130nr">
「幻覚の方が近いでしょう。ですが明確に違う点として、その擬似的映像は確かな存在感があるものとして映る、ということです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500140nr">
「人間の眼――視覚というのは実に興味深いものです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500150nr">
「視野は単眼の場合、鼻側６０度、耳側１００度程度。
両眼の重複視野は１２０度で、周辺視野を含めれば１８０度から２００度もの視界が広がっているんです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500160nr">
「その一方で、以前ご説明したような『デッドスポット』もまた存在する」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500170nr">
「脳にとって視覚とは、最も繋がりの深い部位です。脳はそのおよそ
８０％を、視神経情報の処理のためだけに使っている」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500180ih">
「その点については３００人委員会も注目しておる」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500190kr">
「人間の視覚にはまだまだ謎が多い」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500200kr">
「世界中で、研究テーマとして上がっているものだけでも、１０００以上に及ぶからね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//※詳細はＴＩＰＳにしちゃった方がよさそう
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500210nr">
「アメリカで数年前に発行された行政命令『機密の人体研究に対する保護の強化』」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500220nr">
「というのは、委員会による圧力ですか？」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500230kr">
「圧力ではない。これは選定だよ」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500240ih">
「３００人委員会は、どこの馬の骨とも知れん研究者がこの分野に足を踏み入れることを歓迎せん」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500250ih">
「当然ながら、アメリカだけではなく世界各国にも同様の指示は出ている」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500260nr">
「我が国はずいぶん自由のようですね。私のような人間を放置しているぐらいですから」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601003]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500270ih">
「勘違いしてはいかんな。なんのために我々がいると思っている」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500280kr">
「キミはすでに“選定済み”なんだよ」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500290kr">
「だからこそ、キミにはなによりも成果が求められている」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500300nr">
「３００人委員会をも出し抜けるような成果、というわけですね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602003]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500310ih">
「迂闊な口を利くなと言っておる」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500320kr">
「今はまだ、我らの真の目的を誰にも悟られてはならない」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500330kr">
「例え委員会に対してもね」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500340nr">
「これは失礼」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500350ih">
「説明を続けたまえ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500360nr">
「ノアⅡが生み出した擬似的映像は、視神経パルスに変換して電磁波として照射します」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500360nr_2">
「対象の皮膚や頭蓋骨を貫通して、直接ドーパミン受容体、つまり先程の説明で言うところの、“手の平”にキャッチさせるのです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500370nr">
「そして、『デッドスポット』へと最終的に落とし込まれる……」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500380nr">
「特にＧＥレートの高いエリアの人々は、空中の映像パルス信号を敏感にキャッチします。混乱した脳は、その擬似的映像を現実だと判断することになります」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601004]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500390nr">
「これが、人間の視界の中に“無”から“有”を作り出すメカニズムです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500400nr">
「ノアⅡを用いれば、街中のどこを見ても先生の選挙ポスターだらけ、などという芸当も容易というわけです」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500410nr">
「ただし、あくまで人々のバイオリズムが高い状態であることが条件ですが」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500420kr">
{#TIPS_沈黙の兵器 = true;$TIPS_on_沈黙の兵器 = true;}「幻覚によって意志を誘導する……か。『<FONT incolor="#88abda" outcolor="BLACK">沈黙の兵器</FONT>』とシステムは同じというわけだね」

{$TIPS_on_沈黙の兵器 = false;}
//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500430kr">
「条件さえ満たせば、
対象の見ている世界を自在に描き変えることができる……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602004]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500440ih">
「それはギガロマニアックスと同等の力ということか？」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500450nr">
「その通りです。『ノアⅡ』は、機械仕掛けのギガロマニアックスと言ってもいいでしょう」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500460nr">
「理論値通りに稼働を始めれば、ギガロマニアックスたちと同等、いや近い将来それ以上の能力を再現できるようになります」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500470kr">
「だが、効果の有効範囲はどうなっている？　電磁波は垂れ流しなのかね？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3603004]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500480ih">
「それでは汎用性という点がおろそかになる」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500490ih">
「我々は無差別な洗脳を望んでおるわけではない。対象は、選定できなければ無意味だぞ」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500500nr">
「ご心配なく。そのために、機能因子を用意してあります」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500510nr">
「モニターをご覧ください」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//天成神光会大講堂に集まる洗脳部隊を映すモニター
//洗脳部隊＝リュックを背負ったオタクっぽい格好の男たち

	SoundPlay("SE01", 2000, 300, true);

	CreateSE("SE02","SE_日常_PC_マウスくりっく");
	SoundPlay("SE02", 0, 1000, false);

	CreateTextureEX("背景１", 100, 0, 0, "cg/ev/ev074_01_1_洗脳部隊inモニター_a.jpg");

	CreateSE("SE02","SE_日常_けい帯_のいず");
	CreateMovie360("砂嵐", 150, Center, Middle, true, false, "dx/mv砂嵐.avi");	
	Fade("砂嵐", 0, 1000, null, true);
	SoundPlay("SE02", 0, 1000, false);

	Wait(1000);

	Fade("背景１", 0, 1000, null, true);

	SoundPlay("SE02", 0, 0, false);
	Delete("砂嵐");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500520ih">
「なんだ、この小汚い連中は」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500530nr">
「我が社では『ポーター』と呼んでいます」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500540nr">
{#TIPS_マインドコントロール = true;$TIPS_on_マインドコントロール = true;}「言い換えれば、<FONT incolor="#88abda" outcolor="BLACK">マインドコントロール</FONT>のための部隊、といったところでしょうか」

{$TIPS_on_マインドコントロール = false;}
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500550nr">
「彼らが背負っているリュックの中には、『ノアⅡ』のパルス波を送受信する為のポートが入っています」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500560nr">
「ポートは、信号を受け取るとリモートで周囲へと放出するわけです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601005]
//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500570ih">
「ふん、歩く端末というわけか。それならば有効範囲の制限などないに等しいな」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500580kr">
「限定的使用も問題ないことになるね」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500590ih">
「状況は理解した。貴様は引き続き計画を続行したまえ」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500600kr">
「ただし、３００人委員会に悟られるような言動はくれぐれも慎むように」

//【猪鼻】
<voice name="猪鼻" class="猪鼻" src="voice/ch06/12500610ih">
「後は何人犠牲を出そうと構わん」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602005]
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500620nr">
「ご理解いただき、ありがとうございます」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500630nr">
「それでは、ポーターとして使える人材を提供していただきたいです」

//【倉持】
<voice name="倉持" class="倉持" src="voice/ch06/12500640kr">
「手配しよう」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500650nr">
「それと引き続き、先生方にはメディアのコントロールをお願いいたします」

//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500660nr">
「すべては、我ら３人の目指す理想のために」

//◆嘲笑
//【野呂瀬】
<voice name="野呂瀬" class="野呂瀬" src="voice/ch06/12500670nr">
「クク……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("CH*", 2000, 0, null);
	SoundPlay("SE*", 2000, 0, false);

	ClearAll(2000);
	Wait(2000);

//■インターミッション２６終了
//アイキャッチ

}