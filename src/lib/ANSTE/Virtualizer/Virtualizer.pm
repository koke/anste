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

package ANSTE::Virtualizer::Virtualizer;

use strict;
use warnings;

use ANSTE::Config;
use ANSTE::Exceptions::NotImplemented;
use ANSTE::Exceptions::MissingArgument;

# Class: Virtualizer
#
#   Abstract class with the methods called by the rest of the ANSTE
#   framework to interact with a virtualizer software and have to
#   be implemented by each virtualizer backend.
#

# Constructor: new
#   
#   Constructor for Virtualizer class and his derivated classes.
#
# Returns:
#
#   A recently created <ANSTE::Virtualizer::Virtualizer> object
#
sub new # returns new Virtualizer object
{
	my ($class) = @_;
	my $self = {};
	
	bless($self, $class);

	return $self;
}

# Method: execute
#   
#   Executes a command
#
# Parameters:
#
#   command - string that contains the command to be executed
#
# Returns:
#
#   boolean - true if the exit code is 0, false otherwise
#
sub execute # (command)
{
    my ($self, $command) = @_;

    defined $command or
        throw ANSTE::Exceptions::MissingArgument('command');

    if (not ANSTE::Config->instance()->verbose()) {
        $command .= ' > /dev/null 2>&1';
    }
    return system($command) == 0;
}

# Method: createBaseImage 
#
#   Override this method to execute the command of a
#   specific virtualizer to create a base image.
#
# Parameters: 
#   
#   name   - name of the image type to be created
#   ip     - ip address that will be assigned to the image
#   memory - *optional* size of the RAM memory to be used
#   swap   - *optional* size of the swap partition to be used
#   method - installation method to be used (depends of the virtualizer)
#   source - source of the installation data (depends of the virtualizer)
#   dist    - distribution to be installed (depends of the virtualizer)
#   command - command to be used for the installation (depends of the virtualizer)
#
# Returns:
#   
#   boolean -   indicates if the process has been successful
#               
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub createBaseImage # (%params)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: shutdownImage 
#
#   Override this method to execute the command
#   of the corresponding virtualizer program
#   to shutdown a given image being virtualized. 
#
# Parameters:
#
#   image - name of the image to shutdown 
#
# Returns:
#   
#   boolean - indicates if the process has been successful
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub shutdownImage # (image)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: destroyImage 
#
#   Override this method to execute the command of the corresponding 
#   virtualizer program to force the immediate shutdown of a given image 
#   being virtualized. 
#
# Parameters:
#
#   image - name of the image to destroy
#
# Returns:
#   
#   boolean - indicates if the process has been successful
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub destroyImage # (image)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: createVM
#
#   Override this method to create the Virtual Machine
#   with the corresponding virtualizer program.
#
# Parameters:
#
#   name - name of the virtual machine
#
# Returns:
#   
#   boolean - indicates if the process has been successful
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub createVM # (name)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: imageFile
#
#   Override this method to return the full path
#   of the disk image, adding extension and so on
#   given the path and the name of the image.
#
# Parameters:
#
#   path - root directory where images are stored
#   name - name of the image
#
# Returns:
#   
#   boolean - indicates if the process has been successful
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub imageFile # (path, name)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: createImageCopy
#
#  Override this method to create a copy of a base image
#  with the specified new configuration.
#
# Parameters:
#
#   baseimage - an <ANSTE::Deploy::BaseImage> object with the configuration
#               of the base image
#   newimage  - an <ANSTE::Deploy::Image> object with the configuration 
#               of the new image
#
# Returns:
#   
#   boolean   - indicates if the process has been successful
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub createImageCopy # (baseimage, newimage)
{
    throw ANSTE::Exceptions::NotImplemented();
}


# Method: deleteImage 
#
#   Override this method to delete an image using
#   the specific virtualizer program.
#
# Parameters: 
#   
#   image   - name of the image to be deleted
#
# Returns:
#   
#   boolean -   indicates if the process has been successful
#               
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub deleteImage # (image)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: createNetwork
#
#   Override this method to do the stuff needed
#   to set up the network for a scenario, on your
#   specific virtualizer.
#
# Parameters: 
#   
#   network   - a <ANSTE::Scenario::Network> object
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub createNetwork # (network)
{
    throw ANSTE::Exceptions::NotImplemented();
}

# Method: destroyNetwork
#
#   Override this method to do the stuff needed
#   to destroy the network of a scenario, on your
#   specific virtualizer.
#
# Parameters: 
#   
#   network   - a <ANSTE::Scenario::Network> object
#
# Exceptions:
#
#   throws <ANSTE::Exceptions::NotImplemented> 
#
sub destroyNetwork # (network)
{
    throw ANSTE::Exceptions::NotImplemented();
}

1;
