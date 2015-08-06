#!/usr/bin/perl
##################################################
# Purpose: This script just do a simple quick    #
#          check on the server.                  #
# Author: Ac Perdon                              #
# Change:                                        #
#                                                #
#       2015.08.06 - Initial                     #
#                                                #
#                                                #
##################################################
use strict;
use warnings;

my $serv_name = `cat /etc/sysconfig/network | grep HOSTNAME`;
my $app_proc = `ps -ef | grep -v root | grep -i pmon`;
my $hw = `hplog -v`;
my $disk_array = `hpacucli ctrl all show config`;
my $mem_stat = `hpasmcli -s "show dimm" | grep -i Status`;
my $serv_num = `dmidecode -t 1 | egrep -i "Product Name|Serial Number|SKU Number"`;
my $firm_ver = `dmidecode | grep -i release`;
my $mesg_log = `tail /var/log/messages`;
my $net_config = `ifconfig -a`;
my $os_ver = `cat /etc/redhat-release`;
my $type = `uname -m`;
my $num_fs = `mount | wc -l`;
my $fs = `/opt/soeg/bin/sbdf.sh`;


print $serv_name, "\n";

print ".....Check if its RTCIS or DAS process running......\n";
print $app_proc, "\n";

print "......Check for hardware issue......\n";
print $hw, "\n";

print "......Check for disk failed......\n";
print $disk_array, "\n";

print "......Check Memory status.......\n";
print $mem_stat, "\n";

print "......Server Product Name, Serial and SKU number......\n";
print $serv_num, "\n";

print "......Firmware version.......\n";
print $firm_ver, "\n";

print "......Check for errors in log messages.......\n";
print $mesg_log, "\n";

print "......Network Configuration.......\n";
print $net_config, "\n";

print "......OS Version.......\n";
chomp $os_ver;
print $os_ver . " $type \n";

chomp $num_fs;
print "......There are " . $num_fs . " filesystem mounted\n";

print "\n......Actual File system mounted.......\n";
print $fs;
