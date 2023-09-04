package Alien::SeqAlignment::edlib;
use parent qw( Alien::Base );
use strict;
use warnings;




sub exe {
  my($class) = @_;
  $class->runtime_prop->{command} if  $^O ne 'MSWin32';
}


sub alien_helper {
  my($class) = @_;
  return {
    edlib_aligner => sub {
      # return the CLI command for the edlib aligner
      Alien::SeqAligment::edlib->exe;
    }
  },
}




1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Alien::SeqAlignment::edlib

=head1 VERSION

version 0.04

=head1 SYNOPSIS

To execute the alignment using the commande line tool:

 use Alien::Edlib;
 use Env qw( @PATH );

 unshift @PATH, Alien::SeqAlignment::edlib->bin_dir;
 system Alien::SeqAlignment::edlib->exe, (list of options), <queries.fasta>, <target.fasta>;

=head1 DESCRIPTION

This distribution provides edlib so that it can be used by other
Perl distributions that are on CPAN.  The source code will be downloaded
from the edlib github repo, and if that fails it will use the location of a
fork but the author of this module. Contrary to other Alien modules, this one
will not test for a prior install of the edlib library, but will install 
from source into a private share location for the use by other modules. 
This strategy will avoid overwritting prior  system installs of the edlib
library, and is guaranteed to use the latest version of edlib. 
The build provides the static and shared libraries, but also the CLI aligner 
(edlib-aligner, not currently available in Windows). 

=head1 NAME

Alien::SeqAlignment::edlib - find, build and install the edlib library

=head1 METHODS

=head2 exe

 Alien::SeqAlignment::edlib->exe

Returns the command name for running the CLI version of the edlib aligner
Since the command line tool is not built under Windows by the edlib project
make files, this method will return undef under Windows.

=head1 HELPERS

%{edlib_aligner}

=head2 edlib_aligner

Returns the CLI command for the edlib aligner

=head1 SEE ALSO

=over 4

=item L<edlib|https://github.com/Martinsos/edlib>

Edlib is a lightweight and superfast C/C++ library for sequence 
alignment using the edit (Levenshtein) distance between two or more
biological (usually) sequences. It can calculate the edit distance, 
find the optimal aligment path and the coordinates (start/end) 
locations. It supports multiple alignment modes such as global (NW), 
prefix (SHW) and infix (HW). The library does not handle utf8 and its
primary use is to compute edit distances and alignments over small 
(255 characters or fewer) alphabets as they occur in bioinformatic
applications.

=back

=over 4

=item L<Text::Levenshtein::Edlib|https://metacpan.org/pod/Text::Levenshtein::Edlib>

An XS library that also wraps around the edlib library and returns
edit distances, as well as alignment paths.

=back

=over 4

=item L<Text::Levenshtein::XS|https://metacpan.org/pod/Text::Levenshtein::XS>

An XS library that computes edit distances but not alignment paths. See also 
its github repository at: L<https://github.com/ugexe/Text--Levenshtein--XS/>)

=back

=over 4

=item L<Text::LevenshteinXS|https://metacpan.org/pod/Text::LevenshteinXS>

Yet another XS implementation of Levenshtein distance over strings 
(no alignment path).

=back

=over 4

=item L<Alien>

Documentation on the Alien concept itself.

=item L<Alien::Base>

The base class for this Alien.

=item L<Alien::Build::Manual::AlienUser>

Detailed manual for users of Alien classes.

=back

=head1 AUTHOR

Christos Argyropoulos <chrisarg@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Christos Argyropoulos.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 AUTHOR

Christos Argyropoulos <chrisarg@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Christos Argyropoulos.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
