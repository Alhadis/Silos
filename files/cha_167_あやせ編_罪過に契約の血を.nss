

chapter main
{

	$PreGameName = "boot_あやせルート";

	if($GameStart != 1)
	{
		$GameName = "cha_167_あやせ編_罪過に契約の血を";
		$GameContiune = 1;
		$あやせルート=true;
		$RouteON=true;
		Reset();
	}

	cha_167_あやせ編_罪過に契約の血を();
}


function cha_167_あやせ編_罪過に契約の血を()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();

//★あやせ編
	PrintBG(1000);

	CreateColor("黒幕", 110, 0, 0, 1280, 720, "Black");
	Fade("黒幕", 0, 0, null, true);
	DrawTransition("黒幕", 0, 300, 300, 300, null, "cg/data/effect.png", true);
	CreateTexture360("赤い空", 100, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");

	FadeDelete("back*", 1000, true);

	CreateSE("SE3601","SE_自然_じ鳴り_ふぇーどいん_LOOP");
	MusicStart("SE3601",4000,400,0,1000,null,true);

	Wait(1000);

	Fade("黒幕", 2000, 600, null, true);
	DrawTransition("黒幕", 6000, 300, 400, 300, null, "cg/data/effect.png", false);
	Fade("黒幕", 6000, 1000, null, false);



//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
ふと、あやせの肩越しに視界に捉えた空が。
赤銅色から、黒へと変化していくのが見えた。

それは染みのようで。
あるいは星かと錯覚して。

でも、染みの範囲は、徐々に広がっている。
空を覆い尽くそうという勢いだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("背景１", 120, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	Fade("背景１", 0, 0, null, true);
	Fade("背景１", 1000, 1000, null, true);
	Delete("赤い空");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400260ta">
「なんだ……あれ……」

あ然として、つい、そうつぶやいていた。
あやせも異変に気付き、僕の肩を借りながらも自分の足で立って空を見上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	BGMPlay360("CH26",0,1000,true);

	Stand("buあやせ_制服_通常_胸血","hard", 200, @-50);
	FadeStand("buあやせ_制服_通常_胸血_hard", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602001]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400270ay">
「あれが、目覚めた邪心王……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400280ay">
「ついに侵略を始めたんだわ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400290ay">
「結局……私は、間に合わなかったというの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400300ay">
「もう止められないの……？」

{	Stand("buあやせ_制服_通常_胸血","angry", 200, @-50);
	FadeStand("buあやせ_制服_通常_胸血_angry", 300, true);
	DeleteStand("buあやせ_制服_通常_胸血_hard", 300, false);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400310ay">
「そんなこと、させない……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

//ＳＥ//ディソード顕現
	CreateSE("SE01","SE_擬音_ディそーど出現");
	MusicStart("SE01", 0, 1000, 0, 1000, null, false);

	CreateColor("フラッシュ",2000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);

	DeleteStand("buあやせ_制服_通常_胸血_angry", 0, true);
	Stand("buあやせ_制服_武器構え_胸血","angry", 200, @-50);
	FadeStand("buあやせ_制服_武器構え_胸血_angry", 0, true);

	FadeDelete("フラッシュ", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
あやせがなにもない空間からディソードを出現させる。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400320ta">
「ど、どうするつもり？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400330ay">
「グラジオール記黙示録詩編には、こう書かれているわ……」

//◆「大蛇」＝だいじゃ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400340ay">
「７本のディソードが集まったとき、暗黒の大蛇が現れると」

//◆屠る＝ほふる
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400350ay">
「それは純粋なる邪心の塊。邪心を屠ることのできる邪心」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400360ay">
「あらゆる崩壊を呑み込み、邪心王の身を砕くことのできる、同質にして異質なるもの」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400370ay">
「その大蛇を、出現させるのよ。グラジオールを、倒すために……！」

{	DeleteStand("buあやせ_制服_武器構え_胸血_angry", 500, true);}
あやせはまだふらついていた。
それでもなんとかディソードを構え、目を閉じる。
さながら瞑想しているかのようだった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateTexture360("赤い空", 100, 0, 0, "cg/bg/bg216_01_6_chn赤い空_a.jpg");

	Wait(500);

	CreateSE("SE3611","SE_擬音_風圧落下_LOOP");

	DrawTransition("黒幕", 6000, 400, 500, 300, null, "cg/data/effect.png", false);
	FadeDelete("背景１", 1000, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
だけど……しばらく待っても、なにも起こらない。

そうこうしているうちに、空はすっかり黒に覆われた。
まるで、夜になったみたいに感じられる。

それどころか――

{	MusicStart("SE3611",3000,500,0,1000,null,true);}
黒い靄は、霧となって渋谷の街に立ちこめて。
波となって、渋谷の街を邪心で満たしていく。

瓦礫だらけの地面を、ゆっくりと、這うように迫ってくる。黒く染めていく。

音もなく、侵食してくる。

僕らの足許にも、それは押し寄せてきた。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400380ta">
「あ、ああ……」

思わず絶望の声を漏らしてしまう。

錆び付いていた世界が、今度は、腐っていく。
腐敗し、崩れ落ち、無へと帰って行く。

人も、死体も、瓦礫も。
あらゆるものがぐずぐずにとろけて、強烈な腐臭を放ち出す。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400390ta">
「あ、あやせ……っ。ど、どうにか、な、ならないの！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("黒幕２", 1000, 0, 0, 1280, 720, "Black");
	Fade("黒幕２", 0, 0, null, true);
	Fade("黒幕２", 500, 1000, null, true);

	Delete("赤い空");


	CreateTexture360("上敷き", 200, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	DrawTransition("上敷き", 0, 300, 300, 200, null, "cg/data/up.png", false);
	CreateTexture360("背景１", 100, 0, 0, "cg/bg/bg027_05_6_chn道玄坂_a.jpg");
	DrawTransition("黒幕", 0, 500, 500, 250, null, "cg/data/effect.png", false);
	Fade("黒幕", 0, 700, null, true);

	Fade("黒幕２", 500, 0, null, true);
	Delete("黒幕２");

	Stand("buあやせ_制服_泣く_胸血","utsu", 200, @-50);
	FadeStand("buあやせ_制服_泣く_胸血_utsu", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400400ay">
「どうして……」

あやせは僕の呼びかけに応えようとせず、ただ自分が握るディソードを、泣きそうな顔で見つめていた。

{	Stand("buあやせ_制服_泣く_胸血","cry", 200, @-50);
	DeleteStand("buあやせ_制服_泣く_胸血_utsu", 300, false);
	FadeStand("buあやせ_制服_泣く_胸血_cry", 300, true);}
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400410ay">
「ディソードが７本揃っているのに……、どうして、現れないの……？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400420ay">
「このままじゃ、グラジオールに世界は飲み込まれてしまうわ……」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400430ay">
「やっぱり、黒騎士が７人集まらなければどうしようもなかった」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400440ay">
「予言通りに進めなければダメだったのよ……」

黒の波は、さらにその水かさを増していた。
ほんの数十秒前まで、僕のくるぶし程度までしかなかったのに、今はもう膝まで達している。

不思議なことに、その黒の波の流れに抵抗を感じた。
これは、物理的にそこに存在しているのか？
ただの幻覚とかじゃなく？

ゾクッと、恐怖を感じた。

渋谷が、ホントに腐り落ちようとしている――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400450ta">
「あやせが、も、妄想すればいい……！　グ、グラジオールを倒す妄想を……！」

たまらず叫んでいた。
けれど、あやせは首を左右に振る。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_泣く_胸血","utsu", 200, @-50);
	DeleteStand("buあやせ_制服_泣く_胸血_cry", 300, false);
	FadeStand("buあやせ_制服_泣く_胸血_utsu", 300, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400460ay">
「私の妄想じゃないわ、グラジオール記は」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400470ta">
「だ、だとしても、ぼ、僕にもあやせにも、そ、その予言をねじ曲げて、新しい妄想を、げ、現実にすることは可能のはずだろ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400480ta">
「それがギガロマニアックス……いや、黒騎士なんだろ……！？」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400490ay">
「でも……拓巳……」

すがるような視線で、あやせが僕を見た。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400500ay">
「分からないの。どうすればいいのか……」

そんな……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateColor("Black", 1000, 0, 0, 1280, 720, "Black");
	Fade("Black", 0, 0, null, true);
	Fade("Black", 1000, 1000, null, true);

	DeleteStand("buあやせ_制服_泣く_胸血_utsu", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
言葉を失う。
世界は黒い靄に覆われる。
空は完全に暗黒。星すらもなく、あらゆる光を遮断してしまった。

黒の波はすでに腰の高さまで来ていて、水流にも似た力で僕は押し流されそうになり、必死で踏ん張らなくてはならなかった。

すぐ横を、ドロドロに溶けた死体が流れていく。

これに呑み込まれたら、僕もああなるんだ……そう思うと、恐怖で絶叫したくなった。

どうする……。
どうすればいいんだよ……。

必死に考えたけど、そんなの分かるわけがなかった。
僕は勇者なんかじゃない。ただのキモオタだ。

ディソードを手に入れたところで、その力の使い方すら知らない。
どうしようもない役立たずなんだ……。

こんな僕は、杭を打たれて死ぬべきだよね……。
あの『張り付け』みたいに。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 200, null);
	SetVolume("SE3611", 1000, 200, null);
	SetVolume360("@CH*", 1000, 0, null);


	Wait(300);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
そんなことを考えて、ふと思い出す。

ＦＥＳが紡いだ、あの歌を――

その歌の、詞を――

{	FadeDelete("Black", 500, true);}
//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400510ta">
「歌を、歌うんだ……」

それは、ダメ元で言ったことなんかじゃなくて。
僕が思いついた中で、今できる唯一の、そして最善の方法だっていう確信があった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400520ta">
「歌で、あやせの妄想を、世界に拡散させるんだ……」

渋谷の若者を虜にした、ＦＥＳの紡ぐ世界。

グラジオール記黙示録詩編っていう、ホントにあるかどうかも分からないようなうさんくさい神話。もしかしたらあやせ１人しか知らなかった妄想。

でも今は違う。
ファンタズムの歌によって、そのうさんくさい神話は渋谷の若者たちへと伝播していった。

周囲共通認識が、できあがった――

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400530ta">
「だから、歌うんだ……！」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400540ta">
「グラジオールを倒す歌を、歌ってよ、ＦＥＳ……！」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("buあやせ_制服_泣く_胸血","utsu", 200, @-50);
	FadeStand("buあやせ_制服_泣く_胸血_utsu", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400550ay">
「歌えと言うの……？　この状況で？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400560ta">
「“歌を歌うことで導きが現れる”って、
前に言ってたじゃないか……！」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400570ay">
「……そうね。言ったわ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 1000, null, true);
	DeleteStand("buあやせ_制服_泣く_胸血_utsu", 0, true);
	CreateTexture360("回想背景", 1500, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Fade("回想フラッシュ", 300, 0, null, true);
	Wait(1000);

	Fade("回想フラッシュ", 100, 1000, null, true);
	Delete("回想背景");
	Delete("回想明度");
	Fade("回想フラッシュ", 1500, 0, null, true);
	Delete("回想フラッシュ");
	Wait(500);

	Stand("buあやせ_制服_通常_胸血","shy", 200, @-50);
	FadeStand("buあやせ_制服_通常_胸血_shy", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3602007]
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400580ay">
「そして、あのライブで、拓巳と出会えた」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400590ay">
「拓巳……」

あやせが僕に手を伸ばしてくる。
僕の手を、強く握りしめてくる。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400600ay">
「拓巳は……好き？　私の、歌」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400610ta">
「……う、うん」

あのライブで買ったＣＤは、何度も聞いた。
人混みが苦手だからあきらめたけど、もっと何度もライブに行きたいって思ったぐらいだ。

僕がうなずいたのを見て、あやせは――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE3601", 1000, 200, null);
	SetVolume("SE3611", 1000, 200, null);

	Stand("buあやせ_制服_通常_胸血","smile", 200, @-50);
	FadeStand("buあやせ_制服_通常_胸血_smile", 500, true);
	DeleteStand("buあやせ_制服_通常_胸血_shy", 300, true);

	Wait(100);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
すごく嬉しそうに、微笑んだ。

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400620ay">
「ここで滅びても、別にいいかもしれない……。拓巳がそう言ってくれたから」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400630ay">
「……歌うわ。聞いていて、拓巳」

{	DeleteStand("buあやせ_制服_通常_胸血_smile", 500, false);}
あやせは目を閉じる。
わずかの間、意識を集中させて。
大きく、深呼吸。

次に目を開けたときには、あやせはあやせではなく。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(200,0);//――――――――――――――――――――――――――――――

	CreateColor("回想フラッシュ", 2100, 0, 0, 1280, 720, "WHITE");
	Fade("回想フラッシュ", 0, 0, null, true);
	Request("回想フラッシュ", AddRender);
	Fade("回想フラッシュ", 0, 1000, null, true);
	Fade("色１", 0, 0, null, true);
	CreateTexture360("回想背景", 1500, 0, 0, "cg/ev/ev024_01_3_あやせライブシーン_a.jpg");
	Fade("回想フラッシュ", 300, 0, null, true);
	Wait(500);

	Delete("回想フラッシュ");
	Fade("回想背景", 1500, 0, null, true);
	Delete("回想背景");
	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
ファンタズムのＦＥＳとなって。

//◆※服装は変化してません。制服のまま
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/chn05/01400640ay">
「『罪過に契約の血を』」

静かに曲名をつぶやき、歌い出す。
真っ暗な空へ向けて、その声を響かせた――

//◆以下、「ch01_009_インターミッション０２」よりコピペ
//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900010ay">
「杭を打て　杭を打て――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900020ay">
「闇夜を切り裂き　月光を浴びて――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900030ay">
「幾千もの鉄槌は　汝の痛みとなりて　今解き放たれる――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900040ay">
「やがて叫びは宙に舞い　夜空は紅く染まるだろう――」

//【あやせ】
<voice name="あやせ" class="あやせ" src="voice/ch01/00900050ay">
「十字の杭は力となり　やがて聖域へと辿り着く……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//以下、「ch01_009_インターミッション０２」よりコピペ
//※以下、ＢＧＭは「罪過～」のカラオケバージョンでもいいかも
//おがみ：BGM：罪過インストバージョンなし
	BGMPlay360("CH_INS_FES_ライヴ", 3000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
歌詞が、ヒントになった。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400650ta">
「あやせ……く、杭を打つんだ」

この歌は、『張り付け』事件を予言した歌なんかじゃない。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400660ta">
「７本のディソードを合わせて、闇夜に打ち込むんだ！」

きっと、グラジオールを倒すための歌だ。
あやせを、赤錆びた世界から解放するための歌だ。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/chn05/01400670ta">
「あやせの世界を、こ、壊せ……！」

あやせが僕を見つめる。
その瞳は爛々としている。

あやせは、歌っているときが一番魅力的だって思った。
精気が違う。さっきまでの、絶望に瀕していた姿はどこにもない。

あやせは僕の意図を理解してくれた。
なにも言わず、黙ってうなずいてくれた。

繋いだ手に力を込める。

黒の波に必死で抗いながら、僕はあやせにディソードを託した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE10","SE_えい像_七海消える");
	MusicStart("SE10", 0, 1000, 0, 1000, null, false);
	CreateColor("赤い光",2000, 0, 0, 1280, 720, "Red");
	Fade("赤い光", 0, 0, null, true);
	Request("赤い光", AddRender);
	Fade("赤い光", 200, 1000, null, true);

	CreateTextureEX("back10", 500, Center, Middle, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	CreateTextureEX("back11", 500, Center, Middle, "cg/bg/bg239_01_6_chnディソード全体_拓巳_a.jpg");
	Zoom("back11", 0, 1000, 1000, null, false);
	SetBlur("back11", true, 2, 400, 100);
	Fade("back10", 300, 1000, null, false);
	Fade("back11", 300, 500, null, false);

	Fade("フラッシュ", 1000, 0, null, false);
	MusicStart("SE360301",0,1000,0,1000,null,false);
	Zoom("back11", 2000, 1500, 1500, Dxl2, true);
	Zoom("back11", 5000, 2000, 2000, Axl2, false);

	FadeDelete("赤い光", 1000, false);
	FadeDelete("back10", 500, false);
	FadeDelete("back11", 500, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601010]
あやせが握りしめた瞬間、僕のディソードは赤い光に包まれて霧散する。

でも消滅したわけじゃない。その赤い光は、導かれるようにしてあやせのディソードへと取り込まれていく。

僕はそれを見届けて、あやせの手を離した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE36*", 1000, 0, null);

	CreateSE("SE11","SE_擬音_共鳴音_激しい_LOOP");
	MusicStart("SE11", 0, 1000, 0, 1000, null, true);


	CreateColor("フラッシュ", 3000, 0, 0, 1280, 720, "White");
	Fade("フラッシュ", 0, 0, null, true);
	Request("フラッシュ", AddRender);
	Fade("フラッシュ", 200, 1000, null, true);

	Delete("黒幕");
	Delete("上敷き");
	Delete("背景１");
//	ClearAll(2000);
//	Wait(1000);
}