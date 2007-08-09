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

package ANSTE::Config;

use strict;
use warnings;

use Config::Tiny;

use constant CONFIG_FILE => 'data/anste.conf';

my $singleton;

# TODO: Return default values in case of undef
# TODO: Add exception throwing when incorrect values in the file

sub instance 
{
    my $class = shift;
    unless (defined $singleton) {
        my $self = {};

        $self->{config} = Config::Tiny->read(CONFIG_FILE);
        
        $singleton = bless($self, $class);
    }

    return $singleton;
}

sub system
{
    my ($self) = @_;

    return $self->{config}->{'global'}->{'system'};
}

sub virtualizer
{
    my ($self) = @_;

    return $self->{config}->{'global'}->{'virtualizer'};
}

sub imagePath
{
    my ($self) = @_;

    return $self->{config}->{'paths'}->{'images'};
}

sub imageTypePath
{
    my ($self) = @_;

    return $self->{config}->{'paths'}->{'image-types'};
}

sub scenarioPath
{
    my ($self) = @_;

    return $self->{config}->{'paths'}->{'scenarios'};
}

sub profilePath
{
    my ($self) = @_;

    return $self->{config}->{'paths'}->{'profiles'};
}

sub scriptPath
{
    my ($self) = @_;

    return $self->{config}->{'paths'}->{'scripts'};
}

sub anstedPort
{
    my ($self) = @_;

    return $self->{config}->{'ansted'}->{'port'};
}

sub masterPort
{
    my ($self) = @_;

    return $self->{config}->{'master'}->{'port'};
}

sub ipRange
{
    my ($self) = @_;

    return $self->{config}->{'comm'}->{'ip-range'};
}

sub gateway
{
    my ($self) = @_;

    return $self->{config}->{'comm'}->{'gateway'};
}

sub xenDir
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'dir'};
}

sub xenInstallMethod
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'install-method'};
}

sub xenSize
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'size'};
}

sub xenMemory
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'memory'};
}

sub xenNoSwap
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'noswap'};
}

sub xenFS
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'fs'};
}

sub xenDist
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'dist'};
}

sub xenImage
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'image'};
}

sub xenKernel
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'kernel'};
}

sub xenInitrd
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'initrd'};
}

sub xenMirror
{
    my ($self) = @_;

    return $self->{config}->{'xen-options'}->{'mirror'};
}

1;
