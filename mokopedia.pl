use IO::Socket;
my $sock = new IO::Socket::INET (
	LocalHost => 'localhost',
	LocalPort => '7070',
	Proto => 'tcp',
	Listen => 1,
	Reuse => 1,
);
die "Could not create socket: $!\n" unless $sock;

while($new_sock = $sock->accept())
{
	$get = <$new_sock>;
	print $get;
	print $new_sock "HTTP/1.1 200 OK\n\n";
	print $new_sock "<b>j0!</b>";
	close $new_sock;
}
close $sock;
