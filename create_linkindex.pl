#!/usr/bin/perl -w

use File::Find;

$folder=$ENV{PWD}."/static.bak";

$links = '';

find(\&filehandler, $folder);

sub filehandler {
	if(-s $_ < 2048) {
		open(BLUB, $_);
		@lines = <BLUB>;
		close(BLUB);
		if($#lines < 4) {
			#print "file too small: $File::Find::name\n";
		} else {
			if(($href) = $lines[4] =~ /<meta http-equiv=\"Refresh\" content=\"0;url=([^"]+)\" \/>/) {
				$href =~ s/%([0-9A-F]{2})/chr(hex($1))/eg; #clean uri
				$links .= "$_ $href\n";
			} else {
				print "no match in $File::Find::name\n\$lines[4]: $lines[4]\n\n";
			}
		}
	}
}

open(LIST, ">$folder/links.list");
print LIST $links;
close(LIST);
