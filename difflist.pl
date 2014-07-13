#!/usr/bin/perl

my $last=0.0;
my $sum=0.0;

my $K = 1.0/139.696254564114497;

my $first=$ARGV[0] || 0;

while (<STDIN>) {
  chomp;
  if ($_ =~ /\A\s*(\d+)\s+\(\s*([0-9.]+)\s*,\s*([0-9.]+)\s*\)\s*([0-9.]+)\s*([0-9.]+)\s*([0-9.]+)\s*\Z/) {
    my ($count,$start,$stop,$diff,$weight,$ntx)=($1,$2,$3,$4,$5,$6);
    $sum += $diff;
    if ($count>=$first && $last != $diff) {
      print (($start+$stop)*0.5," ",$last*$K," ",$sum*$K*600,"\n") if ($last>0);
      print (($start+$stop)*0.5," ",$diff*$K," ",$sum*$K*600,"\n");
    }
    $last=$diff;
  }
}

print time," ",$last*$K," ",$sum*$K*600,"\n";
