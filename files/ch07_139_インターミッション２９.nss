//<continuation number="1030">




chapter main
{

	$PreGameName = "boot_第七章";

	if($GameStart != 1)
	{
		$GameName = "ch07_139_インターミッション２９";
		$GameContiune = 1;
		Reset();
	}

		ch07_139_インターミッション２９();
}


function ch07_139_インターミッション２９()
{

	$構文名 = $SYSTEM_present_process;
	SystemInit();
	SystemSet();



//■インターミッション２９

//アイキャッチIN
	IntermissionIn();

	Delete("*");
//ＢＧ//信用調査会社フリージア・社内//昼
	CreateBG(100, 0, 0, 0, "cg/bg/bg069_01_1_フリージア社内_a.jpg");

//アイキャッチOUT
	IntermissionIn2();

	CreateSE("SE001","SE_はいけい_ふりーじあ社内_LOOP");
	MusicStart("SE001", 1500, 1000, 0, 1000, null, true);

	Stand("st安二_スーツ_通常","normal", 200, @+150);
	FadeStand("st安二_スーツ_通常_normal", 500, true);


//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text001]
判が一週間ぶりに訪れたフリージアのオフィスは、少し様子が違っていた。

各社員のデスクに積み上げられていた書類の山が、今はきれいさっぱりなくなっている。

おそらく地震で全部崩れ去り、百瀬から片付けを命じられたんだろう。
おかげでかなりすっきりした印象を受ける。

それを横目で眺めてため息をついた判は、引っ張ってきたキャスター付きのイスに腰掛けた。愛用のうちわでせわしなく顔を扇ぎ出す。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	Stand("st克子_スーツ_通常","sigh", 200, @-240);
	FadeStand("st克子_スーツ_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text002]
自らのデスクでノートＰＣのキーボードを叩いていた百瀬が、彼の陰気くさい様子を一瞥して眉をひそめた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900010mm">
「なあに？　来るなりため息なんてついて」

//【判】
<voice name="判" class="判" src="voice/ch07/13900020bn">
「なあ、モモちゃん」

//【判】
<voice name="判" class="判" src="voice/ch07/13900030bn">
「なんにもないトコから剣が出てくるってぇ手品、見たことあるかい？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900040mm">
「さあ……手品なんて詳しくないから」

//【判】
<voice name="判" class="判" src="voice/ch07/13900050bn">
「じゃあ、瞬間移動は？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900060mm">
「箱の中に入って……とか、そういうこと？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900070bn">
「んー、いや、そうじゃなくて……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900080mm">
「いったいなにが言いたいわけ？　宴会芸でも覚えたいの？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900090bn">
「いや、分かんねえならいいんだ。たぶん関係ないことだからさ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900100mm">
「変な人ねえ」

百瀬は肩をすくめると、判からの差し入れである金つばを一口頬張った。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st安二_スーツ_通常_normal", 500, true);
	Stand("st護_スーツ_通常","normal", 210, @+240);
	FadeStand("st護_スーツ_通常_normal", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text003]
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900110su">
「どうぞー、お茶ッス」

諏訪が紙コップをふたつ持ってきた。
コップに注がれた緑茶が、湯気を立てている。

{	Stand("st克子_スーツ_通常","normal", 200, @-240);
	FadeStand("st克子_スーツ_通常_normal", 300, false);
	DeleteStand("st克子_スーツ_通常_sigh", 300, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900120mm">
「あら、悪いわね諏訪ちゃん。お茶汲みなんてさせちゃって」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900130mm">
「今日、ミホちゃん風邪で休んでて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900140su">
「いや、大丈夫ッス」

爽やかな笑みを浮かべながら、彼は百瀬と判に紙コップを手渡した。

諏訪は以前にも別の事件で判に連れられ、ここを訪れたことがある。それ以来、彼は直接の上司である判よりも百瀬のことを師と仰ぐようになった。

百瀬もまた若くて素直な諏訪のことがお気に入りのようで、判に対するような辛辣な言葉は出さない。

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900150su">
「それより、なんの話してたんスか？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900160bn">
「どうやったら、婦警に受ける宴会芸を覚えられるかって相談をな」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900170su">
「はあ……そりゃ興味深いッス」

{	Stand("st克子_スーツ_通常","sigh", 200, @-240);
	FadeStand("st克子_スーツ_通常_sigh", 300, false);
	DeleteStand("st克子_スーツ_通常_normal", 300, true);}
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900180mm">
「諏訪ちゃん、こんなダメ刑事なんかといつまでもつるんでちゃダメよ。もっと優秀な上司に付くのをオススメするわ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900190mm">
「でないとあなたの出世街道が断たれちゃう」

//【判】
<voice name="判" class="判" src="voice/ch07/13900200bn">
「まるで俺が出世絶望的みてぇな言い方だな」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900210mm">
「事実でしょ。悔しかったらもっと真面目に仕事しなさい」

//【判】
<voice name="判" class="判" src="voice/ch07/13900220bn">
「してるんだがなぁ」

納得が行かない、という感じで顔をしかめる判を無視して、百瀬は金つばの入った箱を諏訪の方へと差し出した。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900230mm">
「諏訪ちゃんも食べて」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900240su">
「あ、どもッス」

//【判】
<voice name="判" class="判" src="voice/ch07/13900250bn">
「言っとくが、そりゃ俺が自腹で買ってきたもんだぞ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900260su">
「先輩、いただきまっス」

ペコリと頭を下げて金つばに手を伸ばす部下を見て、判はまたもため息をついた。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900270mm">
「それより２人とも、これを見て」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE001");

//イメージＢＧ//ＧＥレートの折れ線グラフ
	CreateTextureEX("グラフ", 500, 0, 0, "cg/bg/bg177_01_1_GEレート折れ線グラフ_a.jpg");
	Fade("グラフ", 1000, 1000, null, true);
	DeleteStand("st護_スーツ_通常_normal", 0, true);
	DeleteStand("st克子_スーツ_通常_sigh", 0, true);

	BGMPlay360("CH04", 500, 1000, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text004]
ノートＰＣのモニタに、折れ線グラフが表示された。波のように高くなったり低くなったりと、緩やかにうねった曲線を描いている。

判の後ろに回り込んだ諏訪が、それをのぞき込んで首を傾げた。

//◆金つばを食べながら
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900280su">
「これ、なんのグラフッスか？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900290mm">
「ここ１年の、渋谷近辺のＧＥレートよ」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900300mm">
「おかしいと思わない？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900310bn">
「渋谷の平均ＧＥレートが世界的に見ても高いってのは、モモちゃんに教えてもらったんだぜ？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900320mm">
「そうじゃなくて」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900330mm">
「気のせいかもしれないけど、ＧＥレートが何者かによって操作されているような気がするの」

//◆すでに金つばは食べ終わっています
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900340su">
「そ、そんなことできるんスか？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900350mm">
「さあ。でもグラフを見ると、なんだか不自然なのよね……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900360mm">
「数値が小刻みに変動しすぎてる」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900370mm">
「１０年ぐらい前までさかのぼって調べてみたんだけど、ここ５年くらいはずっとそんな調子なのよ」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginDX(200,0);//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text005]
//【判】
<voice name="判" class="判" src="voice/ch07/13900380bn">
「前に太田教授、だっけか？　その人が言ってた、えーと、なんだっけ？　ＧＥレートが半年前から増加してるとかなんとか、その辺と関係あんのかい？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900390mm">
「太田教授の調査では、ＧＥレートはそんなに細かい変動は起こさないっていうことなのよ」

//【判】
<voice name="判" class="判" src="voice/ch07/13900400bn">
「なんらかの異常が起こってて、そこに人為的なものを感じるってことか」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900410su">
「でも５年ッスよ？　それだけ続いてれば、異常じゃなくて正常な状態と言えなくもないんじゃないスか？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900420mm">
「もうひとつあるの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900430mm">
「グラフを細かく調べていくと、ＧＥレートは毎週末に伸びる傾向にあ
るのよ」

//【判】
<voice name="判" class="判" src="voice/ch07/13900440bn">
「週休２日のサラリーマンにゃありがたいこったな。俺には関係ねぇけど」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900450su">
「はあ、土日に休みほしいッスねえ。自分、もう２ヶ月休みなしッスよ」

しょんぼりとした顔でうなだれる刑事２人に対して、百瀬は小さく首を振って見せた。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text006]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900460mm">
「茶化してる場合じゃないわ。一週間ごとに定期的に変動してるのよ？　しかも年末年始やお盆休みなんかは、変動がぴたりと止まる」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900470mm">
「なにかの意志が働いているとしか思えないわ」

//【判】
<voice name="判" class="判" src="voice/ch07/13900480bn">
「年末年始やお盆休みがあるのって、人間だけだよな」

//【判】
<voice name="判" class="判" src="voice/ch07/13900490bn">
「動物や植物はそんなもんあるわけねえもんな」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900500su">
「実は地球の意志とか」

//【判】
<voice name="判" class="判" src="voice/ch07/13900510bn">
「地球の意志ぃ？　ずいぶん壮大な話だな」

//【判】
<voice name="判" class="判" src="voice/ch07/13900520bn">
「だが、もし仮にそんなもんがあったとして、地球があけましておめでとうとか言うかよ」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900530su">
「じょ、冗談ッスよ……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900540mm">
「年末年始はともかく、お盆休みは日本にしかない風習よね」

//【判】
<voice name="判" class="判" src="voice/ch07/13900550bn">
「日本人の社会活動と同期し過ぎてる……か」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900560su">
「渋谷ッスから当然なんじゃ……？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900570mm">
「ちなみに、ココとココ、見て」

そう言って百瀬は、まず折れ線グラフのほぼ中央あたりを指差し、続いて一番右、最新の日付を指した。

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBeginEX();//――――――――――――――――――――――――――――――

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text007]
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900580mm">
「この２ヵ所は、すごく伸びているでしょう？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900590bn">
「一番右はこの１年の最高記録みたいだな」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900600mm">
「１年どころか、この１０年で最高よ」

//【判】
<voice name="判" class="判" src="voice/ch07/13900610bn">
「日付は？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900620mm">
「真ん中は３ヶ月前。覚えてる？　小さな地震があったでしょ？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900630bn">
「震度３でなぜか８人も死んだ、あれか」

//【判】
<voice name="判" class="判" src="voice/ch07/13900640bn">
「あの犠牲者って、なんで死んだのか理由はまだ特定できてないんじゃなかったか？」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900650su">
「さあ、そうでしたっけ？」

刑事２人のやり取りを無視して、百瀬は話を続ける。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900660mm">
「で、一番右は、この間の地震の日」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

//ＢＧ//信用調査会社フリージア・社内
	Stand("st克子_スーツ_通常","hard", 200, @-240);
	FadeStand("st克子_スーツ_通常_hard", 0, true);
	
	Stand("st安二_スーツ_通常","hard", 210, @+240);
	FadeStand("st安二_スーツ_通常_hard", 0, true);
	FadeDelete("グラフ", 1000, true);
//	CreateBG(100, 0, 0, 0, "cg/bg/bg069_01_1_フリージア社内_a.jpg");
	
//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text008]
//【判】
<voice name="判" class="判" src="voice/ch07/13900670bn">
「ほう……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900680mm">
「あの日、大規模な電磁波が発生したのは知ってるわよね？」

//【判】
<voice name="判" class="判" src="voice/ch07/13900690bn">
「渋谷じゅうのコンピュータが壊れたらしいな。俺はアナログ人間だからよく分からんが」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900700su">
「自分も自宅のノーパソがやられたッス。復旧してる暇がなくて……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900710mm">
「あれは地震の影響で電磁波が起きたって言われてるけど、真相はまったく逆かもしれない」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900720mm">
「電磁波の影響で、地震が起きた……」

{	Stand("st安二_スーツ_通常","shock", 210, @+240);
	FadeStand("st安二_スーツ_通常_shock", 300, false);
	DeleteStand("st安二_スーツ_通常_hard", 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13900730bn">
「おいおい、そんなことテレビや新聞じゃ言ってなかったぞ？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900740mm">
「あくまで私の推測だけど……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900750mm">
「このふたつの地震は……天災じゃなくて、人災かもって思ってるの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900760mm">
「だって、どっちも普通じゃないもの」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900770mm">
「前の地震では震度３っていう規模なのに８人も亡くなってるし」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900780mm">
「そして今回は震度５で１１８人」

{	Stand("st安二_スーツ_通常","hard", 210, @+240);
	FadeStand("st安二_スーツ_通常_hard", 300, false);
	DeleteStand("st安二_スーツ_通常_shock", 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13900790bn">
「死にすぎ、って言いたいのか？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900800mm">
「さっきバンちゃん言ったでしょ？　亡くなった方の大半は、死因が不明って」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900810mm">
「そんなの尋常じゃないわ」

//【判】
<voice name="判" class="判" src="voice/ch07/13900820bn">
「まあ、確かに……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900830mm">
「それに、空が白く染まったっていう噂もある」

//【判】
<voice name="判" class="判" src="voice/ch07/13900840bn">
「そう言えば、時間が経つにつれてまったく報道されなくなったな」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900850mm">
「マスコミになんらかの圧力があったのかもね」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	DeleteStand("st安二_スーツ_通常_hard", 500, true);
	Stand("st護_スーツ_通常","sigh", 210, @+240);
	FadeStand("st護_スーツ_通常_sigh", 500, true);

//――――――――――――――――――――――――――――――――――――――
<PRE box00>
[text009]
//◆苦笑しながら
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900860su">
「……まさか」

{	DeleteStand("st護_スーツ_通常_sigh", 500, true);
	Stand("st安二_スーツ_通常","hard", 210, @+240);
	FadeStand("st安二_スーツ_通常_hard", 500, false);}
//【判】
<voice name="判" class="判" src="voice/ch07/13900870bn">
「……明和党か？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900880mm">
「おそらくそうよ」

{	DeleteStand("st安二_スーツ_通常_hard", 500, true);
	Stand("st護_スーツ_通常","sigh", 210, @+240);
	FadeStand("st護_スーツ_通常_sigh", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900890su">
「げえっ！？　マジっすか！？」

{	DeleteStand("st護_スーツ_通常_sigh", 500, true);
	Stand("st安二_スーツ_通常","hard", 210, @+240);
	FadeStand("st安二_スーツ_通常_hard", 500, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13900900bn">
「明和党と繋がりのある企業、団体を洗うべきかもな……」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900910mm">
「もうやったわよ」

{	Stand("st安二_スーツ_通常","pride", 210, @+240);
	FadeStand("st安二_スーツ_通常_pride", 300, false);
	DeleteStand("st安二_スーツ_通常_hard", 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13900920bn">
「さっすがモモちゃん、相変わらず仕事早いね」

//【判】
<voice name="判" class="判" src="voice/ch07/13900930bn">
「で？」

{	Stand("st克子_スーツ_通常","sigh", 200, @-240);
	FadeStand("st克子_スーツ_通常_sigh", 300, false);
	DeleteStand("st克子_スーツ_通常_hard", 300, true);}
百瀬は両手を上げて大きく伸びをした。
首をわずかに傾げると、小気味よい音を立てて骨が小さく鳴る。

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900940mm">
「それらしい当たりはなし。お手上げよ」

{	Stand("st安二_スーツ_通常","shock", 210, @+240);
	FadeStand("st安二_スーツ_通常_shock", 300, false);
	DeleteStand("st安二_スーツ_通常_pride", 300, true);}
//◆呆れる
//【判】
<voice name="判" class="判" src="voice/ch07/13900950bn">
「お手上げ、って……モモちゃ～ん」

//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13900960su">
「やっぱモモちゃんさんの推測が間違いなんじゃ……？」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900970mm">
「そうかもしれないわね」

//◆小声
//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900980mm">
「これでもけっこう時間かけて調べたのよ。本業そっちのけでね」

//【百瀬】
<voice name="百瀬" class="百瀬" src="voice/ch07/13900990mm">
「でも行き詰まっちゃったわ。よほど巧妙に隠されているか、諏訪ちゃんの言う通り私の推測が見当外れでしかないのか」

{	Stand("st安二_スーツ_通常","normal", 210, @+240);
	FadeStand("st安二_スーツ_通常_normal", 300, false);
	DeleteStand("st安二_スーツ_通常_shock", 300, true);}
//【判】
<voice name="判" class="判" src="voice/ch07/13901000bn">
「ふ～む」

//【判】
<voice name="判" class="判" src="voice/ch07/13901010bn">
「こういうときは、別の方向から攻めてみるってのが刑事の鉄則だぜ」

{	DeleteStand("st克子_スーツ_通常_sigh", 500, true);
	Stand("st護_スーツ_通常","sigh", 200, @-240);
	FadeStand("st護_スーツ_通常_sigh", 500, true);}
//【諏訪】
<voice name="諏訪" class="諏訪" src="voice/ch07/13901020su">
「先輩、なんか心当たりあるんスか？」

判は、うちわを扇いでいた手の動きを止め、唇を舐めた。

{	BGMPlay360("CH*", 2000, 0, false);}
//【判】
<voice name="判" class="判" src="voice/ch07/13901030bn">
「週末にＧＥレートが上がって得するヤツって、誰なんだろうな？」

</PRE>
	SetText($SYSTEM_present_preprocess,$SYSTEM_present_text);
	TypeBegin();//――――――――――――――――――――――――――――――

	SoundStop("SE001");
//～～Ｆ・Ｏ
	ClearAll(1000);
	
	Wait(3000);
	
//■インターミッション２９終了

}