#!/usr/bin/perl

#
#    get_un_number informs you about UN Numbers and their dangers
#    Copyright (C) 2013 Simon Plasger
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

use Number::UN 'get_un';
my $number;
if(1 <= scalar(@ARGV)) # Arguments given?
{
    $number = shift(@ARGV);
}
else
{
    print "No argument given. Please specify any 4 digit UN Number.\n";
    exit;
}
if($number !~ /[0-9]{4}/ || $number =~ /[0-9]{5}/)
{
    print "No 4 digit number given. Please specify any 4 digit UN Number.\n";
    exit;
}
my %un = get_un($number);
if(defined $un{description})
{
    print  "UN Number: ".$number."\n";
    print  "Description: ".$un{description}."\n";
    print  "Class: ".$un{class}."\n";
    print  "Danger: ";
    if($un{class} == "1")
    {
        print "Explosives";
    }
    elsif($un{class} == "1.1")
    {
        print "Substances and articles which have a mass explosion hazard";
    }
    elsif($un{class} == "1.2")
    {
        print "Substances and articles which have a projection hazard but not a mass explosion hazard";
    }
    elsif($un{class} == "1.3")
    {
        print "Substances and articles which have a fire hazard and either a minor blast hazard or a minor projection hazard or both, but not a mass explosion hazard";
    }
    elsif($un{class} == "1.4")
    {
        print "Substances and articles which present no significant hazard";
    }
    elsif($un{class} == "1.5")
    {
        print "Very insensitive substances which have a mass explosion hazard";
    }
    elsif($un{class} == "1.6")
    {
        print "Extremely insensitive articles which do not have a mass explosion hazard";
    }
    elsif($un{class} == "2")
    {
        print "Gases";
    }
    elsif($un{class} == "2.1")
    {
        print "Flammable gases";
    }
    elsif($un{class} == "2.2")
    {
        print "Non-flammable, non-toxic gases";
    }
    elsif($un{class} == "2.3")
    {
        print "Toxic gases";
    }
    elsif($un{class} == "3")
    {
        print "Flammable liquids";
    }
    elsif($un{class} == "4")
    {
        print "Flammable solids; substances liable to spontaneous combustion; substances which, on contact with water, emit flammable gases";
    }
    elsif($un{class} == "4.1")
    {
        print "Flammable solids, self-reactive substances and solid desensitised explosives";
    }
    elsif($un{class} == "4.2")
    {
        print "Substances liable to spontaneous combustion";
    }
    elsif($un{class} == "4.3")
    {
        print "Substances which in contact with water emit flammable gases";
    }
    elsif($un{class} == "5")
    {
        print "Oxidizing substances and organic peroxides";
    }
    elsif($un{class} == "5.1")
    {
        print "Oxidizing substances";
    }
    elsif($un{class} == "5.2")
    {
        print "Organic peroxides";
    }
    elsif($un{class} == "6")
    {
        print "Toxic and infectious substances";
    }
    elsif($un{class} == "6.1")
    {
        print "Toxic substances";
    }
    elsif($un{class} == "6.2")
    {
        print "Infectious substances";
    }
    elsif($un{class} == "7")
    {
        print "Radioactive material";
    }
    elsif($un{class} == "8")
    {
        print "Corrosive substances";
    }
    elsif($un{class} == "9")
    {
        print "Miscellaneous dangerous substances and articles";
    }
    else
    {
        print "Unknown";
    }
    print "\n";
}
else
{
    print "UN Number not defined.\n";
    exit;
}
