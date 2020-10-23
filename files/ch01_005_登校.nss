//<continuation number="410">




chapter main
{

	$PreGameName = "boot_第一章";

	if($GameStart != 1)
	{
		$GameName = "ch01_005_登校";
		$GameContiune = 1;
		Reset();
	}

	ch01_005_登校();
}


function ch01_005_登校()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();


	CreateColor("背景１", 100, 0, 0, 1280, 720, "Black");
	Fade("背景１", 500, 1000, null, true);

//☆Cut-51-----------------------------
//ＢＧ//校門//朝
	CreateBG(100, 1000, 0, 0, "cg/bg/bg016_01_0_学校校門_a.jpg");

	CreateSE("SE02","SE_日常_校門前_朝");
	MusicStart("SE02", 1000, 1000, 0, 1000, null, true);

	Delete("背景１");

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
私立翠明学園。それが僕の通う学校。

それほど歴史はなくて、１０年くらい前に設立されたって聞いてる。<k>
だから校舎は小ぎれいで、よく教師もののテレビドラマでロケに使われる。

それと、制服を有名デザイナーがデザインしたらしくて、女子の中にはこの学校の制服を着たいがために入学してくるバカも多い。

一応進学校だけど偏差値は中の上程度。

校則は厳しいくせに、新入生向けの売り文句は『自由な校風』だから笑わせる。

まあ、校則なんてほとんど有名無実化してるけど。<k>
それに確かに自由な校風っていうのもあながち間違ってない。

なにしろ僕みたいな、週に２．５回しか来ないヤツでもちゃんと進級できるんだから。

学校の前まで行くと、さすがに登校してくる生徒たちで騒がしくなる。<k>
でも僕は人混みが苦手だから、うつむいたままで校門をくぐった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE02", 500, 0, NULL);

	CreateBG(100, 500, 0, 0, "cg/bg/bg019_01_1_学校廊下_a.jpg");


	CreateSE("SE01","SE_日常_がっ校_教室_LOOP");
	MusicStart("SE01", 2000, 350, 0, 1000, null, true);

	Wait(500);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
心の中では、ひたすら"誰も話しかけてくるなよ"と唱え続けた。

この学校には、ひとつ年下の妹も実家から通ってる。<k>

あいつと遭遇した日には悲劇だ。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


	SetVolume("SE01", 1000, 500, NULL);

//ＢＧ//教室//朝
	CreateTexture360("back03", 100, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");
	DrawTransition("back03", 1000, 0, 1000, 100, null, "cg/data/right3.png", true);
	CreateBG(100, 0, 0, 0, "cg/bg/bg017_01_0_教室_a.jpg");

	CreateSE("SE3601","SE_じん体_動作_座る七海");
	MusicStart("SE3601",0,1000,0,1000,null,false);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
幸いにして、今日はその妹にも遭うことなく、無事に教室へたどり着いた。

{	CreateTextureEX("背景１", 100, 0, 56, "cg/bg/bg018_01_0_教室席視線_a.jpg");
	Move("背景１", 500, @0, @-56, Dxl1, false);
	Fade("背景１", 500, 1000, null, true);
	Delete("back*");}
誰とも目を合わさないように、そそくさと自分の席につく。

近くで談笑していた数人の女子が僕に視線を投げかけてきた気がしたけど、それも一瞬で、なにも言わずにまた談笑に戻ったみたいだ。

どうせこいつら、心の中では僕のことをキモいとか思ってるに違いない。

ふん、僕からしてみればお前たち三次元女の方がよっぽどキモいよ。

キモいなら見なければいいんだ。
僕がここにいるって認識しなければいいんだ。

そうすれば、僕はお前たちに迷惑をかけずに黙って生きていくんだから。

それをいちいち"キモい"って口に出すＤＱＮ連中はいったいなんなんだろう、ってよく思う。理解できない。

むしろその"キモい"側の人間に構ってもらいたいんじゃないかとすら思える。

{	Move("背景１", 500, @0, @-80, Dxl1, true);}
僕は席に座ったまま、ただひたすらうつむき、自分の机の表面をじっと見つめ続けていた――

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE02","SE_衝撃_衝撃音03");
	MusicStart("SE02", 0, 500, 0, 700, null, false);

	Wait(400);

	Shake("背景１", 300, 0, 30, 0, 0, 0, null, false);
	Move("背景１", 300, @0, @80, Dxl2, false);

	Wait(600);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500010mi">
「よー、タク！」

いきなり、背中を軽く叩かれた。

ギクリとして、イヤイヤ顔を上げる。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX2(0,200);//――――――――――――――――――――――――――――――


	Stand("bu大輔_制服_通常","smile", 200, @+100);
	FadeStand("bu大輔_制服_通常_smile", 700, true);

	Wait(500);
	BGMPlay360("CH03", 1000, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500020mi">
「お前、今日って学校来る日だっけ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500030ta">
「み、<RUBY text="みすみ">三住</RUBY>くん……」

クラスメイトの<RUBY text="みすみ">三住</RUBY><RUBY text="だいすけ">大輔</RUBY>くんが、
人なつっこい笑みを浮かべてそこに立っていた。
端正な顔立ちをしている彼は、女子にもよくモテるらしい。

しかも本人が自ら女好きを公言していて、常に何人かと同時に付き合っているっていうんだから、僕からしてみれば完全にＤＱＮの領域に足を突っ込んでいる男だ。

できれば関わり合いにはなりたくないところなんだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","normal", 200,@+100);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500040mi">
「相変わらず暗い顔してんなー。ゲームのやり過ぎで寝不足か？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500050ta">
「べ、別に……」

クラスでただひとり、僕に馴れ馴れしく話しかけてくるんだ。

三住くんと僕とじゃ趣味だって性格だってまったく合わないのに、どうして彼はいつもいつもこんな僕に話しかけてくるんだろう。

今年クラスメイトになってからずっと疑問だった。

もし仮に僕が女だったなら、なんとなく理由は分かるんだけど。男であるこの僕に話しかけてくるのは、意味が分からない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500060mi">
「引きこもりだからしゃーねーかもしんねえけどよ、もっとこう、ハキハキ答えろって」

そうできたらとっくにしてるよ。

三次元の人間相手には、話すだけで苦痛なんだ。

緊張で声がまともに出せなくなっちゃうし、
普段話し慣れてないから呂律もうまく回らないし、

ヘタなことを言ってバカにされるんじゃないかっていう恐怖で気持ちが萎縮しちゃうし。

僕の苦しみも知らないくせに、知った風なことを言わないでほしいよ。

あ、ただし僕は引きこもりじゃないぞ。引きこもりっていうのは２４時間３６５日部屋に閉じこもってる人のことを言うんだ。僕は違う。

{	Stand("bu大輔_制服_通常","normal", 200, @+100);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500070mi">
「女相手に緊張するならともかく、そういう態度されると俺らホモと思われるじゃねーか」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500080ta">
「ひ……っ」

まさか女好きっていうのはウソで実は男好きだったのかー！？

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	CreateSE("SE3601","SE_じん体_動作_席を立つ_勢いよく");
	MusicStart("SE3601",0,1000,0,1000,null,false);
	Wait(100);
	Shake("背景１", 200, 0, 5, 0, 0, 0, null, false);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
とっさに三住くんから少しでも離れようと身体を引いた。そのせいでイスから転げ落ちそうになって、慌てて机にしがみつく。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500090mi">
「なにしてんだ、お前？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500100ta">
「み、三住くんは、ホモなの……？」

{	Stand("bu大輔_制服_通常","shock", 200,@+100);
	FadeStand("bu大輔_制服_通常_shock", 300, true);
	DeleteStand("bu大輔_制服_通常_normal", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00501100mi">
「はあ？　なわけねーだろ！　お前、俺の女好きを忘れたのか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500120ta">
「だ、だよね。はー、ビビった……」

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_shock", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00501300mi">
「ちなみに――」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
三住くんは周囲をそっとうかがい、それから急に声を潜めた。いたずらげにニヤニヤとした笑みを浮かべる。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00501400mi">
「昨日、このクラスの女子で３人目をオトした。誰だか聞きたいか？」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500150ta">
「い、いいよ、別に……」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00501600mi">
「んだよ、もっと興味示せよー。田中だぜ田中」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500170ta">
「……田中って、誰？」

{	Stand("bu大輔_制服_通常","sigh", 200, @+100);
	FadeStand("bu大輔_制服_通常_sigh", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500180mi">
「お前、もうすぐ１０月だってのにいまだに同じクラスのヤツの顔覚えてねーのか」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500190mi">
「ま、三次元に興味ないんじゃそれも当然か」

呆れたように肩をすくめてため息をついている。

ただ、彼はこれまで一度として、僕の趣味――つまり僕が二次元キャラが好きなことなどを侮辱したことがない。

"キモい"って言ったりしない。自分の趣味じゃないことに関しては踏み込んでこないんだ。

そういうところを見ると、悪いヤツじゃないって思える。だから、彼が話しかけてくるとついつい相手をしちゃうのかもしれない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","smile", 200, @+100);
	FadeStand("bu大輔_制服_通常_smile", 300, true);
	DeleteStand("bu大輔_制服_通常_sigh", 0, true);

	CreateSE("SE3601","SE_じん体_心臓_鼓動");

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text010]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500200mi">
「これでウチのクラスのかわいい女はほぼ攻略完了だ」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500210mi">
「そろそろ隣のクラスにも守備範囲広げようかって思ってんだよ」

……ホントに悪いヤツじゃないんだろうか。
これは女子に聞かれたら相当ひんしゅくものだと思うけど。

{	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 300, true);
	DeleteStand("bu大輔_制服_通常_smile", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500220mi">
「Ｄ組によー、滅多に学校来ねーけどすごくいい女がいるらしいんだよ」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500230mi">
「なんかそーいうの燃えねえか？」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500240mi">
「あ、お前の場合は燃えるんじゃなくて、萌え～、だっけか」

//☆☆☆
……意味も知らないくせに安易に使わないでほしいね、その言葉を。

{	Stand("bu大輔_制服_通常","normal", 200, @+100);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);}
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500250mi">
「ま、お前の興味ねー話はそろそろやめるか」

{	SetVolume360("CH03", 2000, 0, NULL);}
//脳天気に
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500260mi">
「じゃあよ、ニュージェネの話知ってるだろ？」

{	MusicStart("SE3601", 0, 1000, 0, 1000, null, false);}
その単語が彼の口から出てきたことは、正直なところ意外だった。<k>
彼は女のことしか考えていない人間だって思っていたから。

三住くんがニュースや新聞を見ている姿なんて想像できない。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text011]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500270mi">
「集団ダイブの事件さ、あれも噂によると殺人らしいぜ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500280ta">
「へ、へえ……」

//スポ東＝東スポ
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500290mi">
「マジだって。書いてあったんだよ、スポ東に」

{#TIPS_ソース = true;$TIPS_on_ソース = true;}
なんだ、スポ東が<FONT incolor="#88abda" outcolor="BLACK">ソース</FONT>か……。
それじゃ信憑性ゼロじゃないか。

{$TIPS_on_ソース = false;}
それにその情報は僕だって知ってる。興味はないけど。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500300mi">
「で、聞いて驚け？　その殺人鬼が女で、しかもかなり美人だって目撃証言があんだよっ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500310ta">
「女……」

興奮気味に言う三住くんを見て、ようやく合点がいった。<k>
どうして三住くんは、普段見向きもしないスポ東を突然読んだのか。

結局は女がらみっていうことだ。当然と言えば当然のオチ。

それにしても、かわいければ人殺し相手でも三住くん的にはＯＫなのかな……。

僕としても、二次元キャラならアリだけど……。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	DeleteStand("bu大輔_制服_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text012]
三住くんは窓の外の青空を見やり、遠い目をした。

なんだろう、悟りでも開いたような顔つきだ。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500320mi">
「どんなヤツなんだろうな、犯人って。
ホントに美人なのかな。会ってみてー」

こいつは下半身だけで生きてるって、今確信した。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500330mi">
「俺だけは殺されねー自信があんだよなー。だってほら、俺ってかっこいーだろ？　いくら連続殺人鬼でも、俺みたいないい男に会ったらコロッと惚れちゃうぜ」

だから殺されない、って……？

予想の斜め上を行くお花畑な思考回路だよ。

なんのてらいもなく爽やかにそう言える三住くんに、僕はドン引きした。

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500340ta">
「ぼ、僕は……興味ないから……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","pride", 200, @+100);
	FadeStand("bu大輔_制服_通常_pride", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601012]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500350mi">
「でもよ、興味ないっつったって、犯人はぜってーこの辺ウロウロしてんだぞ？　どっかですれ違ってたりするかもしんねーし」

もしかしたら、三住くんが犯人だったりして。

いや、さすがにそれはないだろうけど、でもこの学校の生徒の可能性はなきにしもあらずかも……。

{#TIPS_ＰＴＳＤ = true;$TIPS_on_ＰＴＳＤ = true;}
もしそうだったとしたら"<FONT incolor="#88abda" outcolor="BLACK">ＰＴＳＤ</FONT>になりました"とか言って、出席日数が足りなくても卒業できるように工作しようかな。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

	Stand("bu大輔_制服_通常","normal", 200, @+100);
	FadeStand("bu大輔_制服_通常_normal", 300, true);
	DeleteStand("bu大輔_制服_通常_pride", 0, true);
	$TIPS_on_ＰＴＳＤ = false;

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text013]
//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500360mi">
「なあ、今日俺と一緒に殺人現場見に行かね？　ここから歩いて行けんだってよ。まだ血とか残ってるらしいぞ」

そんなのまったくこれっぽっちも興味はなかった。

僕は平穏無事に授業を受けて、さっさと家に帰って、星来たんにただいまって挨拶して、僕が神になれる世界へ戻りたいんだ。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500370mi">
「もう小橋と長谷川は見に行ったって言ってたしよ」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500380ta">
「ホントに、興味ないんだ……」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601013]
すっかり盛り上がっている三住くんには悪いけど、付き合っていられない。

だからなんとか断りを入れようと声を絞り出したけど、
彼は聞いてなかった。

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500390mi">
「そしたら犯人とバッタリ会っちゃったりしてな。
犯人は犯行現場に戻ってくるってよく言うだろ？」

//【三住】
<voice name="三住" class="三住" src="voice/ch01/00500400mi">
「で、次はタクがターゲットにされるんだ。死をもって罪を償え、みたいな。罪状は、そうだなぁ……引きこもってたからってことで」

//【拓巳】
<voice name="拓巳" class="拓巳" src="voice/ch01/00500410ta">
「…………」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	SetTrigger("１");
	TypeBegin();//――――――――――――――――――――――――――――――

//	PrintBG(500);

	EndTrigger();

}
