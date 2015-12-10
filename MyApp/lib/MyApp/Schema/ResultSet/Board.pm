use strict;
use warnings;

package MyApp::Schema::ResultSet::Board;

use base 'MyApp::Schema::ResultSet';

sub last_in_game {
  my $self = shift;
  $self->order_by({ -desc => 'move' })->first;
}


1;

=head1 TITLE

MyApp::Schema::ResultSet::Board - resultset method for Board

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