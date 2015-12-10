use strict;
use warnings;

package MyApp::Schema::ResultSet::Game;

use base 'MyApp::Schema::ResultSet';

sub _new_game {
  my $self = shift;
  return $self->create({board_rs => [ +{} ]});
}

1;

=head1 TITLE

MyApp::Schema::ResultSet::Game - resultset method for Game

=head1 DESCRIPTION

    TBD

=head1 METHODS

This class defines the following methods

=head2 TBD

    TBD

=head1 AUTHORS & COPYRIGHT

See L<MyApp>.

=head1 LICENSE

See L<MyApp>.

=cut