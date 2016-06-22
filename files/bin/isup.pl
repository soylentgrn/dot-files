#!/usr/bin/perl -w

#################################################
#                                               #
#                     isup                      #
#                                               #
#                 Version 0.5                   #
#                                               #
#                                               #
#                                               #
#       It's nmap and ping all in one!          #
#                                               #
#                                               #
#################################################

use IO::Socket;
use Net::Ping;
use Getopt::Long;

# Define flags

my $version = '0.5';
my $portstr = "22,80,135,3389"; # $portstr as comma delimeated string
my $host = '';  # Hostname
my $winf = '';  # Windows server flag.
my $linf = '';  # Linux server flag.
my $ipaddr = '';
my $timeout = 0.8;
my $long = '';

# Parse arguments
GetOptions("w" => \$winf, "l" => \$linf, "p=s" => \$portstr, "long" => \$long);

# Sets windows/linux ports based on flags
if ($portstr eq "22,80,135,3389") {
   if (!($winf && $linf)) {
      $portstr = "80,135,3389" if ($winf);
      $portstr = "22,80" if ($linf);
   }
}

# Extends timeout based on --long argument
$timeout = 2 if $long;

# Split $portstr into array of ints at @ports
my @ports = split(/,/, $portstr);

# Check if hostname passed, sets hostname if true, prints usage and dies if false
if($ARGV[0]) {
   $host = $ARGV[0];
} else {
   die "Usage: isup [-w] [-l] [-p ports] host\n";
}

# Set iteration counter
my $count = 1;

# Sorts port list;
@ports = sort {$a <=> $b} @ports;

#### TODO: CHECK IF HOST IS UP, DETERMINE IP ADDR
open(HOST, "host $host |") or die "Can't Open Host";
$hostline = <HOST>;
close(HOST);

# Die if host not found (DNS record doesn't exist)
die "DNS Resolve error: Can't find $host\n" unless $hostline;
if($host !~ m/(\d{1,3}\.){3}\d{1,3}/) {
   die "DNS Resolve error: $host does not exist\n" if $hostline =~ m/3\(NXDOMAIN\)/;
}

if ($hostline =~ m/\d\(.*\)/) {         # Check for host error

   # Set $ipaddr to $host if 2(SERVFAIL)
   $ipaddr = $host;
} else {

   # Parse host output to pull IP address and/or hostname
   ($ipaddr) = $hostline =~ m/address\s(.*)$/ or $ipaddr = $host and ($host) = $hostline =~ m/pointer\s                                                         +(.*)\.$/;
}

# Print running info
print "Scanning ports " . join(',',@ports). " on host $host ($ipaddr):\n\n";

# Loop to stop
while(1) {

   # Set current time for sleep timer
   $pause = time;

   # Check for ping
   open(PING, "ping -c 1 -W 1 -q -n $ipaddr |") or die "Can't Ping!";
   read(PING, $pinginfo, 200) or die "READ ERROR!";
   ($isping) = $pinginfo =~ m/(\d)\s+received/;
   close(PING);

   print "$count :\t";  # Show iteration
   if($isping) {
      print "\033[1;33mPING\033[0m\   ";
   } else {
      print "       "; # Print PING if pings
   }

   foreach(@ports) {
      my $port = $_;
      my $connected = 1;
      print "$port: ";


      # Create TCP connection to $host on $port. Prints 'DOWN' if port closed
      # or times out
      my $sock = IO::Socket::INET->new(PeerAddr => $ipaddr,
                                  PeerPort => $port,
                                  Proto    => 'tcp',
                                  Timeout  => $timeout) or print "\033[0;31mDOWN\033[0m\  ";

      print "\033[1;32mUP\033[0m\    " if (defined($sock));     # Prints 'UP' if connection made
      $sock->close if (defined($sock)); # Closes socket

   }    # End foreach

   print "\n";  # Newline!
   $count++;    # Iterate

   # Sleep if going too fast!
   while(time < $pause + 2) {
      sleep 1;
   }

} #End while loop
