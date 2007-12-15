#!/usr/bin/perl

use Aware::Status;
my $bar = new Aware::Status;

$bar->name("Status");
$bar->setspace(4);
$bar->addstep("Ticket", "12/10/2007");
$bar->addstep("Confirm Payment", "12/11/2007");
$bar->addstep("Send to you.", "12/12/2007", 1);
$bar->addstep("Send",);
$bar->addstep("Done",);

my $code = $bar->show_status_bar();

print $code;

