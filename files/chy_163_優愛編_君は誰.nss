

chapter main
{

	$PreGameName = "boot_優愛ルート";

	if($GameStart != 1)
	{
		$GameName = "chy_163_優愛編_君は誰";
		$GameContiune = 1;
		$優愛ルート=true;
		$RouteON=true;
		Reset();
	}

	chy_163_優愛編_君は誰();
}


function chy_163_優愛編_君は誰()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★優愛編
//ＢＧ//拓巳の部屋
	PrintBG(1000);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	FadeDelete("back*", 300, true);

	CreateSE("SE01","SE_衝撃_生と手帳落ちる");
	MusicStart("SE01",0,1000,0,1000,null,false);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
僕が恐る恐る指摘すると、優愛は特に躊躇する素振りも見せずにノートを閉じ、表紙を見つめた。
そして改めて僕へと向き直り――

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100850yu">
「やっぱり、美愛ちゃんの日記だわ」

え……？

今、見たはずだ。
優愛は、はっきりと、見た。

表紙に色マジックで書かれたＹｕａ’ｓ　ｄｉａｒｙの文字を。

それなのに、なんで――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu優愛_制服_冷酷","cool", 200, @+150);
	FadeStand("bu優愛_制服_冷酷_cool", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100860yu">
「これは、美愛ちゃんが書いた日記」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100870yu">
「わたしを騙そうとしたの？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100880yu">
「騙されるわけないでしょう」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100890yu">
「わたしは美愛ちゃんとずっと一緒に育ってきたんだから」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100900yu">
「生まれてからずっと一緒だったんだから」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100910yu">
「あなたなんかよりずっと、わたしの方が美愛ちゃんのことを知ってる」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100920yu">
「知ってるの」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100930ta">
「ゆ、優愛には、見えないの……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100940ta">
「は、はっきり、か、書いて、あるじゃないか……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100950ta">
「それは、優愛の日記――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_じん体_心臓_鼓動");
	CreateSE("SE3602","SE_じん体_心臓_鼓動_LOOP");
	MusicStart("SE3601",0,1000,0,1000,null,true);
	MusicStart("SE3602",0,1000,0,1000,null,true);

	Wait(500);

	Stand("bu優愛_制服_通常左手下","sad", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);
	DeleteStand("bu優愛_制服_冷酷_cool", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//◆頭痛
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100960yu">
「うぅ……」

優愛が不意にこめかみを押さえた。
苦痛に表情を歪めている。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100970yu">
「違う、この日記は、わたしじゃなくて、美愛ちゃんが……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100980yu">
「わた、し……？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateSE("SE回想in","SE_衝撃_衝撃音02");
	SoundPlay("SE回想in",0,1000,false);

	CreateColor("回想フラッシュ", 3000, 0, 0, 1280, 720, "WHITE");
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 0, null, true);

	Fade("回想フラッシュ", 100, 1000, null, true);

	CreateColor("回想明度", 2500, 0, 0, 1280, 720, "WHITE");
	Fade("回想明度", 0, 300, null, true);

	CreateTexture360("日記回想", 2000, 0, middle, "cg/bg/bg034_01_3_ネットカフェ37_a.jpg");

	DeleteStand("bu優愛_制服_通常左手下_sad", 0, true);

	Stand("bu優愛_制服_通常左手下", "sad", 2200, @0);
	FadeStand("bu優愛_制服_通常左手下_sad", 0, true);

	Fade("回想フラッシュ", 500, 0, null, true);

	Wait(1500);

//■３６０：ボイスエフェクト：ファイル名、タグ調整
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601002]
//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100981yu">
「西條くんに、自覚があるはず、ないから」

//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100982yu">
「あなたは――」

//ＶＦ//回想セリフ
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01100983yu">
「ＤＩＤ……多重人格、なんです」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//■３６０：ボイスエフェクト：ファイル名、タグ調整

	Fade("回想フラッシュ", 100, 1000, null, true);

	DeleteStand("bu優愛_制服_通常左手下_sad", 0, true);

	Stand("bu優愛_制服_通常左手下","sad", 200, @+150);
	FadeStand("bu優愛_制服_通常左手下_sad", 300, true);

	Delete("日記回想");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602002]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01100990ta">
「君は……誰だ……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101000yu">
「わたしは……ゆあ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101010yu">
「わたしは……」

ＤＩＤなのは、僕じゃなくて、この女なんじゃないのか？

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101020ta">
「楠美愛なんて、実在するの……？」

『集団ダイブ』の報道において、警察は被害者の氏名を公表していたか？

未成年だから、少女Ａとか、そんな呼ばれ方しかされてないんじゃないのか？

あるいは――。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101030ta">
「優愛に、双子の妹なんてホントにいたの……？」

楠美愛という人物は存在したかもしれないけど。その死んだ楠美愛は、今僕の目の前にいる楠優愛の双子の妹なんかじゃないかもしれない。

名前がよく似ているだけの、ただの他人の可能性だってある。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateTexture360("下敷き", 40, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");

	SetVolume("SE36*", 100, 0, null);


	CreateSE("SE01","SE_じん体_掴む");
	Stand("bu優愛_制服_冷酷","cool", 200, @+150);

	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	Shake("背景１", 500, 5, 10, 0, 0, 500, null, false);
	FadeStand("bu優愛_制服_冷酷_cool", 100, true);
	DeleteStand("bu優愛_制服_通常左手下_sad", 0, true);


	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101040yu">
「いるわ！」

優愛が、いきなり僕の首を絞めてきた。
細い指。だけどすさまじい力。
息ができない……。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101050yu">
「いたわよ！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101060yu">
「美愛ちゃんは、確かにいた！」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101070yu">
「はっきり覚えてるもの！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101080ta">
「し、証明……できるの……？」

優愛の手の力が弱まる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101090ta">
「げほっ、げほっ……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101100ta">
「自分はＤＩＤじゃないって、証明、できるの……？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101110ta">
「楠美愛じゃないって、証明、できるの……？」

僕は、できなかった。
『将軍』が自分じゃないって確信を持つことができたのは、その『将軍』本人が僕の前に現れたからであって。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101120yu">
「できるわ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_じん体_掴む");
	CreateSE("SE02","SE_じん体_動作_のぞく");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);
	DeleteStand("bu優愛_制服_冷酷_cool", 300, true);
	Stand("st優愛_制服_冷酷","cool", 200, @+150);
	FadeStand("st優愛_制服_冷酷_cool", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
優愛の手が僕の首から離れる。
ノートは、その場に放り出して。

{	DeleteStand("st優愛_制服_冷酷_cool", 500, true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101130yu">
「美愛ちゃんには、ほくろがあった……」

//ＳＥ//衣擦れの音（服を脱ぐ）
{	CreateSE("SE02","SE_じん体_動作_服を脱ぐ");
	MusicStart("SE02", 0, 1000, 0, 1000, null, false);}
優愛はおもむろに制服の上着を脱ぎ始める。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101140yu">
「左胸の下。そこにほくろがあった。わたしにはない、ほくろ」

ブラウスのボタンを、ひとつひとつ、もどかしげに外していく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//上着を脱ぎ捨てた優愛
//手ブラ。左胸の下にほくろがないか探す。ほくろはある
	CreateTexture360("ほくろ確認", 100, 0, 0, "cg/ev/ev124_01_6_優愛脱ぐ_a.jpg");
	Fade("ほくろ確認", 0, 0, null, true);
	Fade("ほくろ確認", 1000, 1000, null, true);

	Wait(1500);

	Delete("背景１");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
ブラウスだけじゃなく、ブラまでも外して。
その豊かなふくらみを手で隠しつつ、左の胸の下を確認しようとする。

僕も、見た。

そこに、ほくろが――

ある。

{	BGMPlay360("CH01",0,1000,true);}
//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101150yu">
「ある……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101160ta">
「あるよ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101170yu">
「どうして……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101180yu">
「わたしには、ほくろはないはずなのに……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101190yu">
「わたし、誰……？」

//おがみ：EV：テキストと相違があります。
優愛の表情は蒼白で、その唇はわなわなと震えていた。
視線は泳ぎ、あられもない格好のまま、自分自身を抱きしめるようにする。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101200yu">
「わたしは、優愛……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101210yu">
「わたしはずっと、いい子で……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101220yu">
「美愛ちゃんはずっと、悪い子で……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101230yu">
「わたしはずっと、いい子になりたくて……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101240yu">
「美愛ちゃんは、優愛ちゃんが大好きで……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101250yu">
「優愛ちゃんは、美愛ちゃんが心配で……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
言っていることが、支離滅裂になってきている。

僕はゾッとした。

でも、優愛を放っておいて逃げ出したいとも思わなかった。
優愛の今の心理状態を、僕は理解できる。
ついこの間まで、僕も似たような状態だったから。

優愛から“あなたはＤＩＤ”だと告げられてから、ずっと不安定だった。
だから分かる。
自分というものの存在がガラガラと音を立てて崩れていく感覚が。

ＤＩＤなのか、あるいはもっと別の原因によるものなのかは分からないけど。

少なくとも、優愛は、なにかがおかしい。
もともと、おかしかった。

演技とは思えないくらい、性格の裏表が激しかったじゃないか。
初めて話しかけてきたときと、キレたときのギャップは、同一人物とは思えなかったじゃないか。

{	Fade("ほくろ確認", 500, 0, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101260ta">
「優愛は……ＤＩＤなんじゃ……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101270yu">
「違う……ちゃんといた。ちゃんといたの！　美愛ちゃんは、ちゃんといた！」

優愛は胸を片手で隠したまま、脱いだ上着のポケットをまさぐった。
ケータイを取り出して、なにやら操作し、僕に突きつけてくる。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101280yu">
「見て」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101290yu">
「ここに、いるでしょう？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101300yu">
「わたしたちが、いるでしょう！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＣＧ//ケータイ電話の写真（楠姉妹）
//右に「優愛（翠明制服）眼鏡あり」左に「美愛（別高校制服）眼鏡あり」
	CreateTexture360("姉妹写真", 150, 0, 48, "cg/ev/ev125_01_6_楠姉妹写真_a.jpg");
	Fade("姉妹写真", 0, 0, null, true);
	Fade("姉妹写真", 500, 1000, null, true);

	Delete("ほくろ確認");

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101310ta">
「あ……」

いる。
確かに、２人いる。
これは合成とは思えない。

さすが双子。とてもよく似てる。
眼鏡があるかなしかぐらいしか、違いがない。
髪型までそっくりだ。

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101320yu">
「わたしは、わたしよ……」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101330yu">
「わたしは、ここにいる……」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101340ta">
「君は、どっちなんだ……？」

//【優愛】
<voice name="優愛" class="優愛" src="voice/chn03/01101350yu">
「わたしは……」

そして指差したのは。

左の――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume360("@CH*", 2000, 0, null);


//ＳＥ//地響き
	CreateSE("SE03","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE03", 500, 1000, 0, 1000, null, false);

	CreateSE("SE04","SE_自然_じ鳴り_LOOP");
	MusicStart("SE04", 500, 1000, 0, 1000, null, true);

	Wait(500);

	CreateTexture360("shake01", 100, 0, 0, "cg/bg/bg026_02_1_拓巳部屋_a.jpg");
	Request("shake01", Smoothing);
	SetAlias("shake01", "shake01");

	CreateProcess("プロセス１", 1000, 0, 0, "Shaker");
	Request("プロセス１", Start);

	Fade("姉妹写真", 500, 0, null, true);
	Delete("姉妹写真");




	Wait(2000);

	CreateColor("血", 1000, 0, 0, 1280, 720, "Red");
	Fade("血", 0, 0, null, true);
	Request("血", AddRender);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
そのとき、床が激しく揺れ始めた。
地震……！？
この前より大きい……！

//ＳＥ//共鳴音
{	Fade("血", 0, 1000, null, true);
	Fade("血", 1500, 0, null, false);
	CreateSE("SE05","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE05", 500, 1000, 0, 1000, null, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn03/01101360ta">
「……ぐぁぁぁっ」

激しい耳鳴り。
頭が割れるほどの、甲高い共鳴音。

優愛は頭を押さえ、その場にうずくまる。
僕もそうしたかったけど、手の自由が効かないからできなくて。
耳に何千本もの細い針を突き刺されているようで。

そして――


</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

//ＳＥ//衝撃音
//ＳＥ//爆発音
//ＢＧ//白

	SetVolume("SE05", 500, 0, null);
	CreateSE("SE06","SE_衝撃_爆発音");
	CreateSE("SE07","SE_衝撃_爆発音");
	CreateSE("SE08","SE_衝撃_道路陥ぼつ");
	MusicStart("SE05", 0, 1000, 0, 1000, null, false);
	MusicStart("SE06", 0, 1000, 0, 1000, null, false);
	MusicStart("SE07", 0, 1000, 0, 1000, null, false);
	CreateColor("White", 5000, 0, 0, 1280, 720, "White");
	Request("White", AddRender);

	Fade("White", 0, 0, null, false);
	Fade("White", 2000, 1000, null, true);

	Wait(1000);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
すさまじい衝撃とともに、視界が白く染まった――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,0);//――――――――――――――――――――――――――――――

	Wait(2000);

//～～Ｆ・Ｏ
//アイキャッチ

	SetVolume("SE*", 2000, 0, null);

	ClearAll(2000);
	Wait(1000);

}

//shake用function
function Shaker()
{
	Shake("@shake01", 1000, 0, 0, 10, 10, 1000, null, true);
	while(1)
	{
	Shake("@shake01", 500, 10, 10, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 20, 20, 10, 10, 1000, null, true);
	Shake("@shake01", 500, 10, 10, 20, 20, 1000, null, true);
	}

}