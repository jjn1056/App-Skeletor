use strict;
use warnings;

package App::Skeletor::Script;

use Getopt::Long::Descriptive;
use File::Share 'dist_dir';
use Module::Runtime 'use_module';
use Path::Tiny;
use Template::Tiny;

sub getopt_spec {
  return (
    'skeletor %o <some-arg>',
    ['template=s', 'Namespace of the project templates', { required=>1 }],
    ['as=s', 'Target namespace of the new project', { required=>1 }],
    ['directory=s', 'Where to build the new project (default: cwd)', {default=>Path::Tiny->cwd}],
    ['author=s', 'Primary author for the project', { required=>1 }],
    ['year=i', 'Copyright year (default: current year)', {default=>(localtime)[5]+1900}]
  );
}

sub path_to_share {
  use_module(my $project_template = shift);
  $project_template=~s/::/-/g;
  return path(dist_dir($project_template), 'skel');
}

sub template_as_name {
  my $name_proto = shift;
  $name_proto=~s/::/-/g;
  return $name_proto;
}

sub run {
  local @ARGV = @_;
  my ($opt, $usage) = describe_options(getopt_spec);
  my $path_to_share = path_to_share($opt->template);

  my %template_var_names =  (
    (map { $_->{name} => $opt->${\$_->{name}} } @{$usage->{options}}),
    name => template_as_name($opt->as),
    namespace => $opt->as,
    project_fullpath => do {my $path = path(split('::', $opt->as)); "$path" },
    name_lowercase => lc(template_as_name($opt->as)),
    name_lc => lc(template_as_name($opt->as)),
    name_lowercase_underscore => do {
      my $val = lc(template_as_name($opt->as));
      $val=~s/-/_/g; $val;
    },
    name_lc_underscore => do {
      my $val = lc(template_as_name($opt->as));
      $val=~s/-/_/g; $val;
    },

  );

  my $keys = join ',', map { "\$$_" }  keys %template_var_names;
  my $ref = join ' ',  keys %template_var_names;
  my $to_eval = "my ($keys) = \@template_var_names{qw/$ref/}";
  my $tt = Template::Tiny->new(TRIM => 1);

  use Devel::Dwarn;

  $path_to_share->visit(sub {
    my ($path, $stuff) = @_;
    return if $path=~m/\.DS_Store/g;
    my $expanded_path = $path;
    my $target_path = path($opt->directory, $expanded_path->relative($path_to_share));
    $target_path = path(eval "$to_eval; qq[$target_path]" 
      || die "Can't expand $target_path");


    if($expanded_path->is_file) {
      $expanded_path->parent->mkpath;
      if("$path"=~/\.ttt$/) {
        warn "$path";
        my $data = $expanded_path->slurp;
        $tt->process(\$data, \%template_var_names, \my $out);
        my ($new_target_path) = ("$target_path" =~m/^(.+)\.ttt$/);
        warn "$new_target_path";
        path($new_target_path)->touchpath;
        my $fh = path($new_target_path)->openw;
        print $fh $out;

      } else {
        $expanded_path->copy($target_path);
      }
    } elsif($path->is_dir) {
      $target_path->mkpath;
    } else {
      print "Don't know want $path is!";
    }


  }, {recurse=>1});

 
 Dwarn \%template_var_names;

}

caller(1) ? 1 : run(@ARGV);

