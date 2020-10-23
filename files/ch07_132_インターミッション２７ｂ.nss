//<continuation number="410">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_132_インターミッション２７ｂ";
		$GameContiune = 1;
		Reset();
	}

		ch07_132_インターミッション２７ｂ();
}


function ch07_132_インターミッション２７ｂ()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();
	

//■インターミッション２７ｂ

//アイキャッチIN
	IntermissionIn();
	
	Delete("*");
//ＢＧ//渋谷警察署大会議室
	CreateBG(100, 0, 0, 0, "cg/bg/bg095_01_1_警察署大会議室_a.jpg");

//アイキャッチOUT
	IntermissionIn2();
	
//あやべ：会議室ＳＥ
	CreateSE("SE01","SE_はいけい_けいさつ署_LOOP");
	MusicStart("SE01", 0, 500, 0, 1000, null, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
この日もまた、渋谷署の大会議室では朝から捜査会議が招集された。

刑事たちは誰もが疲れ果てていて、今日も不毛な会議が何時間も続くのか、とうんざり顔だ。

松永が各捜査員の報告を聞き始めようとしたところで、判が不意に手を挙げながらおずおずと立ち上がった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st安二_スーツ_通常","normal", 210, @+240);
	FadeStand("st安二_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text3601001]
//【判】
<voice name="判" class="判" src="voice/ch07/13200010bn">
「ちょっといいですかね」

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200020mn">
「なんだね？」

松永だけでなく、判のすぐ隣に座っている諏訪や、他の刑事たちもいぶかしげな表情で判に注目した。

判はいつもの軽薄そうな愛想笑いを浮かべてペコリと頭を下げてから、周囲を見回す。

//【判】
<voice name="判" class="判" src="voice/ch07/13200030bn">
「先日インターネット上に投稿された、いわゆる『集団ダイブ』の映像についてなんですが、実はちょっとした発見をしまして」

{	Stand("st護_スーツ_通常","sigh", 200, @-240);
	FadeStand("st護_スーツ_通常_sigh", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13200040su">
「えっ？」

諏訪があからさまに驚いた顔をした。

それもそうだろう。判はコンビを組んでいる諏訪には一言も言わずにその映像を調べたのだから。

もっとも、その理由は諏訪に秘密にしたかったわけでもなんでもなく、

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200050mn">
「判警部補、君は確か『張り付け』の捜査担当だったはずだが」

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200060mn">
「なぜ『集団ダイブ』について調べている？」

とまあ、そういうことである。

判は捜査本部の指示を無視して独断専行したというわけであり、諏訪を巻き込めば将来有望な新人刑事が上司に絞られることになる。それを避けたのだった。

//【判】
<voice name="判" class="判" src="voice/ch07/13200070bn">
「いや、まあ、とりあえず見てくださいって」

判はヘラヘラと笑いつつ、手許のファイルから大きく引き延ばした写真を２枚、取り出した。それを黒板にマグネットで張り付ける。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//イメージＢＧ//２枚の夜景写真
	CreateTextureEX("写真０１", 500, 0, 0, "cg/bg/bg172_01_1_集団ダイブ比較_a.jpg");
	Fade("写真０１", 1000, 1000, null, true);
	DeleteStand("st安二_スーツ_通常_normal", 0, true);
	DeleteStand("st護_スーツ_通常_sigh", 0, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
//【判】
<voice name="判" class="判" src="voice/ch07/13200080bn">
「これはどっちも、『集団ダイブ』の現場となったコーネリアスタワー屋上の写真です」

//【判】
<voice name="判" class="判" src="voice/ch07/13200090bn">
「右の写真は、例のミュウツベ投稿映像から抜き出したもの」

//◆ここでは一人称はわざと「私」
//【判】
<voice name="判" class="判" src="voice/ch07/13200100bn">
「左のは昨日の夜、私がタワー屋上に行って撮ってきたものになります」

//【判】
<voice name="判" class="判" src="voice/ch07/13200110bn">
「なにか違いに気付きませんか？」

//■３６０
//判は思わせぶりな態度で、広い会議室をゆっくりと見回し、最後に松永へと視線を据えた。

//【松永】
//<voice name="松永" class="松永" src="voice/ch07/13200120mn">
//「君は弁護士にでもなったつもりかね？」

//【松永】
//<voice name="松永" class="松永" src="voice/ch07/13200130mn">
//「要点を分かりやすく説明したまえ」

//判の隣では、諏訪がしきりに首をひねっている。
//他の刑事も戸惑いの色を隠そうとしなかった。

//◆驚き
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13200230su">
「あ……！」

//あやべ：ガヤ差し替え
//ＳＥ//ザワザワ
{	CreateSE("SE02","SE_日常_ざわめき大");
	MusicStart("SE01", 0, 1000, 0, 1000, null, true);
	MusicStart("SE02", 0, 1000, 0, 1000, null, true);

	Wait(500);}
会議室にどよめきが起きる。

//【判】
<voice name="判" class="判" src="voice/ch07/13200140bn">
「背景がね、違うんです」

{	BGMPlay360("CH25", 3000, 1000, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13200150bn">
「投稿映像のカメラは北東へ向かってる。５人が転落したのが北東だったから間違いない」

//【判】
<voice name="判" class="判" src="voice/ch07/13200160bn">
「で、映像では３分２９秒から約１５秒間、カメラが左右へ大きく振れるんですが」

//【判】
<voice name="判" class="判" src="voice/ch07/13200170bn">
「そのときに、東に向いたときの映像が、この右側の写真なわけです」

//【判】
<voice name="判" class="判" src="voice/ch07/13200180bn">
「コーネリアスタワーの東。つまり六本木方面ですね」

//【判】
<voice name="判" class="判" src="voice/ch07/13200190bn">
「東京タワーが夜景の中にしっかり映ってる。赤いから目立ちますね」

//【判】
<voice name="判" class="判" src="voice/ch07/13200200bn">
「でもね……。もうひとつ、よく目立つものが、映ってないんですよ」

//【諏訪】
//<voice name="諏訪" class="諏訪" src="voice/ch07/13200210su">
//「よく目立つもの？」

判は、その目を細め、顎のヒゲを手のひらでさすりながら、口許に自嘲気味な笑みを浮かべた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//◆※ヒルズじゃなくてビルズ
//【判】
<voice name="判" class="判" src="voice/ch07/13200220bn">
「六本木ビルズですよ」

確かに、投稿映像から抜き出したという写真の方には、六本木ビルズの明かりが見られない。

一方、判が昨日撮ってきたという写真の方には、東京タワーとともに六本木ビルズの窓の明かりがしっかりと写っていた。

{	SetVolume("SE01", 4000, 0, null);
	SetVolume("SE02", 4000, 0, null);}
//【判】
<voice name="判" class="判" src="voice/ch07/13200240bn">
「で、たまたま見つけたんですが、コーネリアスタワーのホテルロビーに、タワー完成当時のパネルが展示してありましてね」

//【判】
<voice name="判" class="判" src="voice/ch07/13200250bn">
「そのパネルのひとつがこれ」

判は新たにファイルから写真を取り出し、２枚の写真の横に並べて張り付けた。

それは、やはりタワー屋上から六本木方面を写したものだが、夜景ではなく昼の写真だった。

//【判】
<voice name="判" class="判" src="voice/ch07/13200260bn">
「六本木ビルズが写ってますよね」

//◆「建設中」を強調
//【判】
<voice name="判" class="判" src="voice/ch07/13200270bn">
「建設中、ですが」

会議室の動揺がさらに大きくなった。
松永も厳つい表情のまま写真を見つめて黙り込んでいる。

//【判】
<voice name="判" class="判" src="voice/ch07/13200280bn">
「コーネリアスタワーの完成は２００１年。六本木ビルズの完成は２００３年」

//【判】
<voice name="判" class="判" src="voice/ch07/13200290bn">
「タワー完成当時の写真では、当然ながら六本木ビルズは建設中でまだ高さもほとんどない」

//【判】
<voice name="判" class="判" src="voice/ch07/13200300bn">
「だが、『集団ダイブ』が起きたのは今年……２００８年だ」

//【判】
<voice name="判" class="判" src="voice/ch07/13200310bn">
「写ってなきゃおかしいですよねえ、六本木ビルズ」

//【判】
<voice name="判" class="判" src="voice/ch07/13200320bn">
「ちなみに投稿映像に細工された形跡はなかった」

{	Stand("st安二_スーツ_通常","normal", 210, @+240);
	FadeStand("st安二_スーツ_通常_normal", 0, true);
	Fade("写真０１", 500, 0, null, true);
	Delete("写真０１");}
//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200330mn">
「つまりなにが言いたいんだ」

しびれを切らしたように、松永が不機嫌そうな声で促す。

{	Stand("st安二_スーツ_通常","hard", 210, @+240);
	FadeStand("st安二_スーツ_通常_hard", 300, false);
	DeleteStand("st安二_スーツ_通常_normal", 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13200340bn">
「ん～、非常に言いにくいんですが……」

{	Stand("st護_スーツ_通常","sigh", 200, @-240);
	FadeStand("st護_スーツ_通常_sigh", 500, true);
	BGMPlay360("CH*", 0, 0, false);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13200350su">
「まさか先輩、この映像が撮られたのは２００３年以前……つまり５年以上前って言いたいんスか！？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	CreateSE("SE01","SE_はいけい_けいさつ署_LOOP");
	CreateSE("SE02","SE_日常_ざわめき大");
	SetVolume("SE01", 500, 1000, null);
	SetVolume("SE02", 500, 700, null);

	Stand("st安二_スーツ_通常","shock", 210, @+240);
	FadeStand("st安二_スーツ_通常_shock", 300, false);
	DeleteStand("st安二_スーツ_通常_hard", 300, true);
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
おいおい諏訪……。

判はがっくりと肩を落とした。

その諏訪の言葉はまさに判が言いたいことそのものであり、この若い刑事の洞察力の鋭さは見事だったが、さすがにそこまでストレートに言われると逆に胡散臭さが強調されてしまう。

どう言い出すべきかという判の思慮はまったくの水泡に帰した。

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200360mn">
「バカバカしい。小説の読み過ぎではないかね？」

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200370mn">
「映像に映っている被害者５人の顔は一致しているんだ。あれが５年前のもののはずがない」

//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200380mn">
「そんなつまらないことを調べている暇があったら、聞き込みのひとつでもしたらどうだ、警部補」

//【判】
<voice name="判" class="判" src="voice/ch07/13200390bn">
「はあ……」

//◆※会議が終わった後で捜査本部から判は外された
//【松永】
<voice name="松永" class="松永" src="voice/ch07/13200400mn">
「今のは聞かなかったことにする。それと、後で話があるから会議が終わったら残りたまえ」

//【判】
<voice name="判" class="判" src="voice/ch07/13200410bn">
「…………」

{	DeleteStand("st護_スーツ_通常_sigh", 500, false);
	DeleteStand("st安二_スーツ_通常_shock", 500, true);}
判は小さくため息をつくと、あきらめて腰を下ろした。

――ま、信じてもらえるとは思っちゃいなかったが。

判はだるそうにうちわで顔をあおぎつつ、心の中で負け惜しみをつぶやく。

もっとも、判としてもこの映像に六本木ビルズが映っていないことがなにを意味するのか、その答えは出てはいなかった。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SetVolume("SE01", 500, 0, null);

//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);
	
//■インターミッション２７ｂ終了

}