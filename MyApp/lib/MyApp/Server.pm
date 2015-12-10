use warnings;
use strict;

package MyApp::Server;

use MyApp;
use Plack::Runner;

sub run { Plack::Runner->run(@_, MyApp->to_app) }

return caller(1) ? 1 : run(@ARGV);

=head1 TITLE

MyApp::Server - Start the application under a web server

=head1 DESCRIPTION

Start the web application.  Example:

    perl -Ilib  lib/ --server Gazelle

=head1 AUTHORS & COPYRIGHT

See L<MyApp>.

=head1 LICENSE

See L<MyApp>.

=cut