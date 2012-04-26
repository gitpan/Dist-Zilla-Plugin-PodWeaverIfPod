package Dist::Zilla::Plugin::PodWeaverIfPod;
BEGIN {
  $Dist::Zilla::Plugin::PodWeaverIfPod::VERSION = '0.01';
}

use Moose;
extends qw/ Dist::Zilla::Plugin::PodWeaver /;

around munge_pod => sub {
    my $inner = shift;
    my ( $self, $file ) = @_;

    my $content = $file->content;

    if ( $content =~ /=head1/ ) {
        return $inner->(@_);
    }
    else {
        return;
    }
};

__PACKAGE__->meta->make_immutable;
no Moose;
1;



=pod

=head1 NAME

Dist::Zilla::Plugin::PodWeaverIfPod - Apply PodWeaver if there is already Pod

=head1 VERSION

version 0.01

=head1 SYNOPSIS

In your L<Dist::Zilla> C<dist.ini>:

    [PodWeaverIfPod]

=head1 DESCRIPTION

Dist::Zilla::Plugin::PodWeaverIfPod will only PodWeaver a .pm if there appears
to be Pod there (i.e. a C<=head1> section).

=head1 AUTHOR

Jonathan Swartz <swartz@pobox.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

