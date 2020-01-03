a:56:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:-1;i:1;i:0;i:2;i:1;i:3;s:0:"";}i:2;i:1;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"Using iterators to provide lists";i:1;i:1;i:2;i:1;}i:2;i:1;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:47;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:48;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:"As you have seen, you can make use of Swift_RecipientList to send a message to multiple recipients.  Up until now you";}i:2;i:49;}i:9;a:3:{i:0;s:18:"singlequoteclosing";i:1;a:0:{}i:2;i:166;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:398:"ve only seen the usage of addTo(), addCc() and addBcc().  You can completely by-pass these methods however.  Swift is provided with an iterator to loop over those addresses you have added and calling addTo() for example is simply pushing addresses onto an array.  By default Swift_RecipientList will provide an Array iterator so that the values added with addTo(), addCc() and addBcc() can be used.";}i:2;i:167;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:565;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:565;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"The interface of this iterator is simply this:";}i:2;i:567;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:613;}i:15;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:167:"
$iterator =& $recipients->getIterator("to"); //Or cc, bcc
while ($iterator->hasNext())
{
  $iterator->next();
  $address =& $iterator->getValue();
  //and so on...
}
";i:1;s:3:"php";}i:2;i:620;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:799;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"So Swift is calling getIterator() with little regard for what you added initially.";}i:2;i:801;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:883;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:883;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"There";}i:2;i:885;}i:21;a:3:{i:0;s:18:"singlequoteclosing";i:1;a:0:{}i:2;i:890;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:147:"s also a setIterator() method in Swift_RecipientList so you can specify your own.  For example, also packaged with the library is a MySQL iterator.";}i:2;i:891;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1038;}i:24;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:315:"
require_once "lib/Swift/Iterator/MySQLResult.php";

$query = "select email, name from users";
$result = mysql_query($query);

$it =& new Swift_Iterator_MySQLResult($result);

$recipients =& new Swift_RecipientList();
$recipients->setIterator($it, "to"); //or cc, bcc

$swift->send($message, $recipients, $sender);
";i:1;s:3:"php";}i:2;i:1045;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1374;}i:26;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:1;i:1;i:1373;i:2;i:1;i:3;s:32:"Using iterators to provide lists";}i:2;i:1374;}i:27;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Writing your own Iterator";i:1;i:2;i:2;i:1374;}i:2;i:1374;}i:28;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1374;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1411;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1412;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:219:"Writing your own iterator is easy.  If you use PHP5, simply write a class which implements Swift_Iterator.  If you are using PHP4 you just need to be very careful to include the following methods in your iterator class:";}i:2;i:1413;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1632;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1632;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"boolean hasNext( void );";}i:2;i:1634;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1658;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"boolean next( void );";}i:2;i:1659;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1680;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"boolean seekTo( int position );";}i:2;i:1681;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1712;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Swift_Address getValue( void );";}i:2;i:1713;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1744;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"int getPosition( void );";}i:2;i:1745;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1769;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1769;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:445:"Your iterator should not return any value when getValue() is called unless next() was first called;  hasNext() simply returns true if there are remaining values in the list; next() moves one place forward in the list; seekTo() moves to the given numeric position in the list where 0 is the first item; getValue() returns a Swift_Address instance at the current list position; getPosition() returns the current list position where 0 is the start.";}i:2;i:1771;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2216;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2216;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"Here";}i:2;i:2218;}i:49;a:3:{i:0;s:18:"singlequoteclosing";i:1;a:0:{}i:2;i:2222;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"s an example using an ADODB resultset with PHP5.";}i:2;i:2223;}i:51;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2271;}i:52;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:659:"
class ADOIterator implements Swift_Iterator
{
  protected $rs;
  
  public function __construct($adoRs)
  {
    $this->rs = $adoRs;
  }
  
  public function hasNext()
  {
    return !$this->rs->EOF;
  }

  public function next()
  {
    return $this->rs->MoveNext();
  }
  
  public function seekTo($n)
  {
    return $this->rs->Move($n);
  }
  
  public function getPosition()
  {
    return $this->rs->AbsolutePosition();
  }
  
  public function getValue()
  {
    $row = array_values($this->rs->GetAssoc());
    if (!empty($row[1])) return new Swift_Address($row[0], $row[1]); //email, name
    else return new Swift_Address($row[0]); //Just email
  }
}
";i:1;s:3:"php";}i:2;i:2278;}i:53;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2949;}i:54;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:1374;i:1;i:0;i:2;i:2;i:3;s:25:"Writing your own Iterator";}i:2;i:2949;}i:55;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2949;}}