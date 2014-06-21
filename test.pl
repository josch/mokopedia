open FILE, "html.lst.3";
while($line=<FILE>)
{
	if ($line =~ /aaaaaaaa/)
	{
		print $line;
		}
}

cat html.lst | perl -ne "print unless /\/.{1,9}\/.{1,9}\/.{1,9}\/(Category_Discussion|Image|Image_Discussion|Portal|Portal_Discussion|Diskussion|Template|Template_Discussion|User|User_Discussion|Wikipedia_Discussion|MediaWiki|MediaWiki_Diskussion|Help|Help_Discussion|WP)~/;" - > html.lst.1

