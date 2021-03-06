# Copyright © 2009 Raphaël Hertzog <hertzog@debian.org>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

package Dpkg::Vendor::Debian;

use strict;
use warnings;

use Dpkg::Vendor::Default;

our @ISA = qw(Dpkg::Vendor::Default);

=head1 NAME

Dpkg::Vendor::Debian - Debian vendor object

=head1 DESCRIPTION

This vendor object customize the behaviour of dpkg scripts
for Debian specific actions.

=cut

sub run_hook {
    my ($self, $hook, @params) = @_;

    if ($hook eq "before-source-build") {
        my $srcpkg = shift @params;
    } elsif ($hook eq "before-changes-creation") {
        my $fields = shift @params;
    } elsif ($hook eq "keyrings") {
        return ('/usr/share/keyrings/debian-keyring.gpg',
                '/usr/share/keyrings/debian-maintainers.gpg');
    }
}

1;
