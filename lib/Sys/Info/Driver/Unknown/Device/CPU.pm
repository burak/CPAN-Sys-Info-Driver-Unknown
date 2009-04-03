package Sys::Info::Driver::Unknown::Device::CPU;
use strict;
use vars qw($VERSION $UP);
use base qw(Sys::Info::Driver::Unknown::Device::CPU::Env);

$VERSION = '0.69_10';

BEGIN {
    local $SIG{__DIE__};
    local $@;
    eval {
        require Unix::Processors;
        Unix::Processors->import;
    };
    $UP = Unix::Processors->new if ! $@;
}

sub load {0}

sub identify {
    my $self = shift;
    $self->{META_DATA} ||= [
        !$UP ? $self->SUPER::identify(@_) : map {{
            processor_id                 => $_->id, # cpu id 0,1,2,3...
            data_width                   => undef,
            address_width                => undef,
            bus_speed                    => undef,
            speed                        => $_->clock,
            name                         => $_->type,
            family                       => undef,
            manufacturer                 => undef,
            model                        => undef,
            stepping                     => undef,
            number_of_cores              => $UP->max_physical,
            number_of_logical_processors => $UP->max_online,
            L1_cache                     => undef,
            flags                        => undef,
        }} @{ $UP->processors }
    ];
    return $self->_serve_from_cache(wantarray);
}

1;

__END__

=head1 NAME

Sys::Info::Driver::Unknown::Device::CPU - Compatibility layer for unsupported platforms

=head1 SYNOPSIS

-

=head1 DESCRIPTION

L<Unix::Processors> is recommended for
unsupported platforms.

=head1 METHODS

=head2 identify

See identify in L<Sys::Info::Device::CPU>.

=head2 load

See load in L<Sys::Info::Device::CPU>.

=head1 SEE ALSO

L<Sys::Info>, L<Sys::Info::CPU>, L<Unix::Processors>.

=head1 AUTHOR

Burak Gürsoy, E<lt>burakE<64>cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2006-2009 Burak Gürsoy. All rights reserved.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself, either Perl version 5.10.0 or, 
at your option, any later version of Perl 5 you may have available.

=cut
