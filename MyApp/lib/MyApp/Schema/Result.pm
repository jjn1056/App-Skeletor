use strict;
use warnings;

package MyApp::Schema::Result;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components(qw/
  Helper::Row::RelationshipDWIM
  Helper::Row::SelfResultSet
  TimeStamp
  InflateColumn::DateTime/);

sub default_result_namespace { 'MyApp::Schema::Result' }

sub add_columns {
  my @ret = (my $class = shift)
    ->next::method(@_);

  # Since we want this on every table...
  $class->add_column(
    created => {
      data_type => 'datetime',
      retrieve_on_insert => 1,
      default_value => \'current_timestamp',
  }) unless $class->has_column('created');

  return @ret;
}

sub TO_JSON { +{shift->get_columns} }

1;

=head1 NAME

MyApp::Schema::Result - Base Result Class

=head1 SYNOPSIS

    TBD

=head1 DESCRIPTION

All Result classes inherit behavior from this

=head1 METHODS

This class defines the following methods

=head2 uuid_columns

Override this method so that we say all primary key fields should
be UUIDs, via the UUIDColumns component.

=head2 TO_JSON

Default data for generating JSON views

=head1 AUTHORS & COPYRIGHT

See L<MyApp>.

=head1 LICENSE

See L<MyApp>.

=cut