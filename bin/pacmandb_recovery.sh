#!/usr/bin/perl
use strict;
use warnings;

use File::Temp qw/tempdir/;

my $url = 'ftp://mirror.ynet.sk/pub/archlinux/$repo/os/' . `arch`;
chomp $url;
my @repos = qw/core extra community multilib/;

my $tmpdir = tempdir(CLEANUP=>1);

foreach my $repo (@repos)
{
  my $files_url = $url;
  $files_url =~ s/\/\$repo\//\/$repo\//;
  $files_url .= '/' . $repo .'.files.tar.gz';
  `cd "$tmpdir" && curl "$files_url" | bsdtar -xf-`;
}
opendir(my $dh, $tmpdir) or die;
my @pkgs = readdir($dh);
close($dh);

my $l = 0;
foreach my $pkg (@pkgs)
{
  my $i = length($pkg);
  $l = $i if $i > $l;
}

foreach my $pkg (sort @pkgs)
{
  next if ($pkg eq '.' or $pkg eq '..');
  my @files = ();
  if (open(my $fh, '<', $tmpdir .'/'. $pkg .'/files'))
  {
    while (defined(my $line = <$fh>))
    {
      chomp $line;
      next if $line eq '%FILES%' or substr($line,-1) eq '/';
      push @files, '/' . $line;
    }
    close($fh);
    my $n = scalar @files;
    next if $n == 0;
    my $i = 0;
    foreach my $file (@files)
    {
      $i++ if -f $file;
    }
    printf("%-${l}s %3d%%\n", $pkg, 100*$i/$n);
  }
  else
  {
    print "error: failed to open $tmpdir/$pkg/files\n";
  }
}


