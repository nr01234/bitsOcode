#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use DBD::Oracle;

my $driver = "Oracle";
my $database = "";
my $hostname = "";
my $portname = "1521";

my $dsn = "DBI:$driver:host=$hostname;sid=$database;port=$portname";
my $userid = "";
my $password = "";


my $dbh = DBI->connect($dsn,$userid,$password) 
          or die "Can't connect to Orace Database: $DBI::errstr\n";
$dbh->do("ALTER SESSION SET NLS_DATE_FORMAT='MM/DD/YYYY'");


my $sth = $dbh->prepare($query);
