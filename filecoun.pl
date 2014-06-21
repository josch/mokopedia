#!/usr/bin/perl -w
use strict; 
use warnings; 
my $dir = shift; 
die "Usage: $0 directory" unless defined $dir; 
opendir DIR, "$dir" or die "Could not open $dir: $!\n";
while(my $file = readdir DIR)
{
        unlink "$dir/$file" or print "Could not remove $dir/$file: $! \n";
}
closedir DIR;
