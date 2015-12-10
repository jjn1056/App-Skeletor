use Test::DBIx::Class
  -schema_class => 'MyApp::Schema';

my $config = {
  'default_view' => 'HTML',
  'Model::Schema' => {
    connect_info => [ sub { Schema()->storage->dbh } ],
  },
};

return $config;