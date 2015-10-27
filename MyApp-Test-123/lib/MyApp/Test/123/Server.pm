use warnings;
use strict;

package MyApp::Test::123::Server;

use MyApp::Test::123;
use Plack::Runner;

sub run { Plack::Runner->run(@_, MyApp::Test::123->to_app) }

return caller(1) ? 1 : run(@ARGV);

=head1 TITLE

MyApp::Test::123::Server - Start the application under a web server

=head1 DESCRIPTION

Start the web application.  Example:

    perl -Ilib  lib/ --server Gazelle

=head1 AUTHORS & COPYRIGHT

See L<MyApp::Test::123>.

=head1 LICENSE

See L<MyApp::Test::123>.

=cut