#!/usr/bin/perl

use strict;
use warnings;

use Text::Diff;

my $root = "./input";
my $result = { 'addition' => 0, 'deletion' => 0, 'changes'=> 0};

my $diff = diff "$root/$ARGV[0]",  "$root/$ARGV[1]", {STYLE => "Context", FILENAME_PREFIX_A => ">>>", FILENAME_PREFIX_B => "<<<"};

$result->{'addition'} = () = $diff =~ m/^[\+]{1,1}/mg;
$result->{'deletion'} = () = $diff =~ m/^[-]{1,1}/mg;
$result->{'changes'} = () = $diff =~ m/^[!]{1,1}/mg;
$result->{'matches'} = () = $diff =~ m/^[\s]{1,1}/mg;

print $result->{'addition'} . "\n";
print $result->{'deletion'} . "\n";
print $result->{'changes'} . "\n";
print $result->{'matches'} . "\n";
print $diff;
