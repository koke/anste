# Copyright (C) 2007 José Antonio Calvo Fernández <jacalvo@warp.es> 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

package ANSTE::System::HostInstallGen;

use strict;
use warnings;

use ANSTE::Scenario::Host;

# Generates the scripts that installs ansted and anste-slave
# in a base image.

sub new # (hostname) returns new CommInstallGen object
{
	my ($class, $hostname) = @_;

	my $self = {};

    $self->{hostname} = $hostname;
	
	bless($self, $class);

	return $self;
}

sub writeScript # (file)
{
	my ($self, $file) = @_;

    my $hostname = $self->{hostname};

	print $file "#!/bin/sh\n";
	print $file "\n# Hostname configuration file\n";
	print $file "# Generated by ANSTE for host $hostname\n\n"; 

    print $file "# TODO: Check arguments\n\n";

    print $file "# Receives the mount point of the image as an argument\n";
    print $file 'MOUNT=$1'."\n\n";

    $self->_writeHostname($file);

    $self->_writeHosts($file);
}

sub _writeHostname # (file)
{
    my ($self, $file) = @_;

    my $host = $self->{hostname};

    print $file "# Write /etc/hostname\n";
    print $file "echo $host > ".'$MOUNT/etc/hostname'."\n\n";
}

# TODO: Generalize this through System::Debian, now this is repeated
sub _writeHosts # (file)
{
    my ($self, $file) = @_;

    my $host = $self->{hostname};

    print $file "# Write /etc/hosts\n";
    print $file 'cat << EOF > $MOUNT/etc/hosts'."\n";
    print $file "127.0.0.1 localhost.localdomain localhost\n";
    print $file "127.0.1.1 $host.localdomain $host\n";
    print $file "\n";
    print $file "# The following lines are desirable for IPv6 capable hosts\n";
    print $file "::1     ip6-localhost ip6-loopback\n";
    print $file "fe00::0 ip6-localnet\n";
    print $file "ff00::0 ip6-mcastprefix\n";
    print $file "ff02::1 ip6-allnodes\n";
    print $file "ff02::2 ip6-allrouters\n";
    print $file "ff02::3 ip6-allhosts\n";
    print $file "EOF\n\n";
}

1;