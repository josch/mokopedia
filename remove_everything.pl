#!/usr/bin/perl -w

use File::Find;

$transform = $ENV{PWD}."/transform.xslt";
$folder=$ENV{PWD}."/";

find(\&filehandler, $folder);

sub filehandler {
	if(-s $_ > 2048) {
		$doc = qx/xsltproc --html \Q$transform\E \Q$_\E/;
		$doc =~ s/^[^\n]*\n//;
		($title) = $doc =~ /^([^\n]*)\n/;
		$doc =~ s/^[^\n]*\n//;
		$doc =~ s/\n//g;
		$doc =~ s/\s{2,}//g;
		$doc =~ s/<!--.*?-->//g;
		#open FILE, ">$_";
		print "$title\n$doc";
		#close FILE;
	}
}
