package MyApp::Test::123;

use Catalyst qw/
  ConfigLoader
  RedirectTo/;

sub version { our $VERSION ||= eval '0.001' };
sub accepts_json { pop->req->header('accept') =~m/json/i }
sub accepts_html { pop->req->header('accept') =~m/html/i }

__PACKAGE__->config(
  'Model::Form::Game' => {
    class => 'MyApp::Test::123::Form::Game',
  },
);

__PACKAGE__->setup;