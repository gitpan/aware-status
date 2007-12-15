#
# Copyright (c) 2004 Aware.
# Copyright (c) 2004 Thiago Rondon. <thiago@aware.com.br>
#

package Aware::Status;
use strict;

our $VERSION = '0.1'; 

sub new {
	my ($self) = @_;
	my $name;
	my @steps;
	my $space = 0;
	my $urlimages = "/images";
	return bless { opened => 0 }, $self;
}

sub name {
	my ($self, $name) = @_;
	$self->{name} = $name;
	undef $name;
}

sub addstep {
	my ($self, $stepname, $data, $red) = @_;
	my $step;
	$step->{name} = $stepname;
	$step->{data} = $data;
	$step->{red} = $red;
	push(@{$self->{steps}}, $step);
	undef $stepname; undef $data; undef $red;
}

sub setspace  {
	my ($self, $space) = @_;
	$self->{space} = $space;
	undef $space;
}

sub seturlimages  {
	my ($self, $urlimages) = @_;
	$self->{urlimages} = $urlimages;
	undef $urlimages;
}


sub show_status_bar {
	my ($self) = @_;
	my $code;

	my $alert_red = 0;

	#$code = "<b>" . $self->{name} . "</b><br/>\n";
	$code = "";
	$code .=<<EOF;
<table cellspacing="0" cellpadding="0" border="0"><tr><td valign="top">
<img src="$self->{urlimages}/start.gif">
</td>
EOF

	foreach (@{$self->{steps}}) {
		my $image = "green.gif";
		
		if ($alert_red) {
			$image = "blank.gif";
		}
		
		if ($_->{red} && !$alert_red) {
			$image = "red.gif";
			$alert_red = 1;
		}
		

		for (my $loop = 0; $loop < $self->{space}; $loop++) {
			$code .=<<EOF;
			<td valign="top"><img src="$self->{urlimages}/middle.gif"></td>
EOF
		}
		
		$code .=<<EOF;
		<td valign="top" width="88"><img src="$self->{urlimages}/$image"><br/>
		<center><font size="2"><b>$_->{name}</b><br/>
		$_->{data} </font></center></td>
EOF
	}


	for (my $loop = 0; $loop < $self->{space}; $loop++) {
	$code .=<<EOF;
	<td valign="top"><img src="$self->{urlimages}/middle.gif"></td>
EOF
	}

	$code .=<<EOF;
<td valign="top">
<img src="$self->{urlimages}/end.gif">
</td></tr></table>
EOF
	return $code;
}


END { }

1;
__END__

