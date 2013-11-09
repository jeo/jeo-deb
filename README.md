# jeo Deb Packaging

## Prerequisites

Before deb packages can be built a few packages must be installed on the system
where the build is occuring.

    % apt-get install unzip build-essential devscripts debconf debhelper dpatch unzip

## Building

To build the package simply run the `build.sh` command in the root of this 
repository. Upon success the jeo deb should be located ...

