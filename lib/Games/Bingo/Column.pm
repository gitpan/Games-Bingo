package Games::Bingo::Column;

# $Id: Column.pm,v 1.9 2003/05/13 15:28:51 jonasbn Exp $

use strict;
use POSIX qw(floor);

sub new {
	my $class = shift;
	my $label = shift;
	my @array = sort _reverse (@_);
	
	my $self = bless {
		label  => $label?$label:0,
		_array  => \@array
	}, $class || ref $class;
}

sub _reverse { $b <=> $a }

sub populate {
	my $self = shift;
	my $value = shift;
	
	push @{$self->{_array}}, $value;
	
	@{$self->{_array}} = sort _reverse @{$self->{_array}};
}

sub set_status {
	my $self = shift;
	my $status = shift;

	$self->{_status} = $status;
}

sub get_random_number {
	my $self = shift;
	my $do_splice = shift;
	
	my $pos = POSIX::floor(rand($self->count_numbers));
		
	my $number = $self->{_array}->[$pos];
	splice(@{$self->{_array}}, $pos, 1) if $do_splice;
	
	return $number;
}

sub count_numbers {
	my $self = shift;
	
	my $count = 0;
	$count = (scalar @{$self->{_array}}) if $self->{_array};
	
	return $count;
}

sub get_number {
	my $self = shift;

	my $number = shift(@{$self->{_array}});

	return $number;
}

1;

__END__

=head1 NAME

Games::Bingo::Column - a column class used for generating bingo plates

=cut

=head1 SYNOPSIS

C<< my $c = Games::Bingo::Column-E<gt>new(); >>

C<<
foreach my $number(@numbers) {
	$c-E<gt>populate($number);
} >>

C<< my @numbers = qw(1 2 3 4 5 6 7 8 9); >>

C<< my $c = Games::Bingo::Column-E<gt>new(@numbers); >>

C<< my $number = $c-E<gt>get_number(1); >>

C<< my $c-E<gt>set_status(1); >>

=cut

=head1 DESCRIPTION

The Column is used when building the bingo plates and is a temporary
data structure.

The class has two attributes:

=over 4

=item *

_array

Array is a list of numbers for containment in the class, since the class
actually is nothing but an array with a status flag.

=item *

_status 

The status attribute is a flag indicating whether the collection has
been used during the generation of bingo plates, please refer to the
accessor set_status for more information.

=back

=cut

=head1 METHODS

=head2 new

The contructor optionally takes an array as an argument, and sets the
B<_array> attribute to point to this.

=head2 populate

populate is a simple accessor which can be used to add additional number
to the list of number contained in the class. This is a secondary use of
the class, please refer to the description of the algoritms used in the
program described in the Games::Bingo class.

=head2 set_status

This accessor method can be used to set the status of the Column, the
attribute B<_status>. The values used to indicate whether the column has
been used is B<1> for true and B<0> for false. Meaning B<0> is the
default value and the value of a new Column.

=head2 get_number

The get_number is also a simple accessor, it return a random number from
the list contained in the class.

If the optional parameter is set to true, it splices the list contained
in the class, meaning the class shrinks by B<1>. Default behaviour is
not shrinking.

=head2 _reverse

The method used by Perls sort to sort the list

=cut

=head1 SEE ALSO

=over 4

=item Games::Bingo

=item Games::Bingo::ColumnCollection

=back

=cut

=head1 TODO

The TODO file contains a complete list for the whole Games::Bingo
project.

=cut

=head1 AUTHOR

jonasbn E<lt>jonasbn@io.dkE<gt>

=cut

=head1 ACKNOWLEDGEMENTS

My friend Allan helped me out with some of the algoritmic stuff and was
in on the development when this class was thought up.

=cut

=head1 COPYRIGHT

Games::Bingo and related modules are free software and is released under
the Artistic License. See
E<lt>http://www.perl.com/language/misc/Artistic.htmlE<gt> for details.

Games::Bingo is (C) 2003 Jonas B. Nielsen (jonasbn)
E<lt>jonasbn@io.dkE<gt>

=cut