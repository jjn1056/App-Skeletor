use strict;
use warnings;

package MyApp::Test::123::Schema::ResultSet::Game;

use base 'MyApp::Test::123::Schema::ResultSet';

sub _new_game {
  my $self = shift;
  return $self->create({board_rs => [ +{} ]});
}

1;

=head1 TITLE

MyApp::Test::123::Schema::ResultSet::Game - resultset method for Game

=head1 DESCRIPTION

    TBD

=head1 METHODS

This class defines the following methods

=head2 TBD

    TBD

=head1 AUTHORS & COPYRIGHT

See L<MyApp::Test::123>.

=head1 LICENSE

See L<MyApp::Test::123>.

=cut