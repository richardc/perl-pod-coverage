package Pod::Coverage::Overloader;
use strict;
use Pod::Coverage ();
use base qw(Pod::Coverage);

sub _get_syms {
    my $self = shift;
    my $package = shift;

    my %syms = map { $_ => 1 } $self->SUPER::_get_syms($package);

    { 
	no strict 'refs';
	return keys %syms unless ${"$package\::OVERLOAD"}{dummy};
    }
    
    delete @syms{ grep { /^\(/ } keys %syms };
    return keys %syms;
}


1;
__END__

=head1 NAME

Pod::Coverage::Overloader - subclass of Pod::Coverage that discards overloading functions

=head1 SYNOPSIS

  # all in one invocation
  use Pod::Coverage::Overloader package => 'Fishy';

  # straight OO
  use Pod::Coverage::Overloader;
  my $pc = new Pod::Coverage::Overloader package => 'Pod::Coverage';
  print "We rock!" if $pc->coverage == 1;

=head1 DESCRIPTION

This module extends Pod::Coverage to exclude symbols that have been
created for use in overloading.  It scans the %$package::OVERLOAD hash
in addition to the %$package:: stash, this is likely to be fragile
should the implemtation of the overload prgama changes.

If you want full documentation we suggest you check the
L<Pod::Coverage> documentation.

=head1 SEE ALSO

L<Pod::Coverage>, L<overload>

=head1 AUTHORS

Copyright (c) 2001 Richard Clamp, Micheal Stevens. All rights
reserved.  This program is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut
