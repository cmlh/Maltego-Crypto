#/usr/bin/env perl
# The above shebang is for "perlbrew", otherwise use /usr/bin/perl
#
# Please refer to the Plain Old Documentation (POD) at the end of this Perl Script for further information

use strict;
use Carp;
use Pod::Usage;

my $VERSION = "0.0.1"; # May be required to upload script to CPAN i.e. http://www.cpan.org/scripts/submitting.html

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print("<MaltegoMessage>\n");
print("<MaltegoTransformResponseMessage>\n");
print ("\t<UIMessages>\n");
print ("\t\t<UIMessage MessageType=\"Inform\">Hash Maltego Local Transform v$VERSION</UIMessage>\n");
print ("\t</UIMessages>\n");


# http://ctas.paterva.com/view/Specification#Input_.28Maltego_GUI_-.3E__external_program.29
my $maltego_selected_entity_value = $ARGV[0];

# Not used for this Maltego Local Transform
my $maltego_additional_field_values = $ARGV[1];

# Process the command line arguments
chomp($maltego_selected_entity_value);
chomp($maltego_additional_field_values);

# ":D" is deprecated within http://ctas.paterva.com/view/Specification#Messages_to_STDERR_.28progress.2C_debug.29
print STDERR
"Value of \$maltego_selected_entity_value is \"$maltego_selected_entity_value\"\n";

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print("\t<Entities>\n");
    # http://ctas.paterva.com/view/Specification#Web_site
    print("\t\t<Entity Type=\"cmlh.SHA1\"><Value>$maltego_selected_entity_value</Value></Entity>\n");
    print("\t\t<Entity Type=\"cmlh.MD5\"><Value>$maltego_selected_entity_value</Value></Entity>\n");
# http://ctas.paterva.com/view/Specification#Entity_definition
print("\t</Entities>\n");

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print("</MaltegoTransformResponseMessage>\n");
print("</MaltegoMessage>\n");


=head1 NAME

from_phrase-to_md5_and_sha1-maltego-local-transform.pl - "From Phrase to MD5 and SHA-1 Hash - Maltego Local Transform"

=head1 VERSION

This documentation refers to from_phrase-to_md5_and_sha1-maltego-local-transform.pl Alpha v$VERSION

=head1 CONFIGURATION

From Manage->Transform->New Transform
Display Name: "To Crypto Hash"
For "Description", copy the text from the DESCRIPTION POD section below
Transform ID is "cmlh.to.md5.and.sha1"
Author is "Christian Heinrich"
Input entity type is "Phrase"

=head1 USAGE

from_phrase-to_md5_and_sha1-maltego-local-transform.pl [Input Phrase Entity]

=head1 REQUIRED ARGUEMENTS
 				
=head1 OPTIONAL ARGUEMENTS

=head1 DESCRIPTION

Returns the SHA-1 and MD5 hash entities of Maltego

=head1 DEPENDENCIES

=head1 PREREQUISITES

=head1 COREQUISITES

=head1 OSNAMES

osx

=head1 SCRIPT CATEGORIES

Web

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

Please refer to the comments beginning with "TODO" in the Perl Code.

=head1 AUTHOR

Christian Heinrich

=head1 CONTACT INFORMATION

http://cmlh.id.au/contact

=head1 MAILING LIST

=head1 REPOSITORY

https://github.com/cmlh/maltego-crypto

=head1 FURTHER INFORMATION AND UPDATES

http://cmlh.id.au/tagged/maltego
http://del.icio.us/cmlh/maltego

=head1 LICENSE AND COPYRIGHT

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

Copyright 2012 Christian Heinrich
