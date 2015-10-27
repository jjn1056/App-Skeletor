package MyApp::Test::123::Model::Schema;

use Moose;
extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(schema_class => 'MyApp::Test::123::Schema');
__PACKAGE__->meta->make_immutable;

=head1 TITLE

MyApp::Test::123::Model::Schema- Proxy for MyApp::Test::123::Schema

=head1 DESCRIPTION

Proxies all the L<MyApp::Test::123::Schema> information to L<MyApp::Test::123::Model::Schema>

=head1 METHODS

This class defines the following methods

=head1 AUTHORS & COPYRIGHT

See L<MyApp::Test::123>.

=head1 LICENSE

See L<MyApp::Test::123.

=cut