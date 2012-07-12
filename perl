        ========================================
            Perl
        ========================================

# $Id: perl 1337 2010-08-18 05:07:29Z ffjia $

Coding Principles
=================

$ perldoc perlstyle

* Compile and run with "use strict" and "use warnings" enabled

* Use "File::Spec::Functions" and "File::Basename" to construct and parse
  file paths.

* Use "File::Path" for creating or removing paths

* Always check return values from system calls, including open(),
  close(), mkdir(), or anything else that talks directly to the system.

* Constants are in all caps

* Make the name descriptive

* Methods and Functions (except for special cases, like AUTOLOAD) begin
  with a verb, with words following to complete the action. Multi-word
  names should be all lower-case, separated by underscores).

* Methods and Functions beginning with _ are not to be used outside the
  current file.

* Package names begin with a capital letter in each word, followed by
  lower case letters.

* Maximum line lengths should be 77 columns (or 75 columns for an
  unbroken line of characters). This is for maximum portability to
  different peoples development environments and for decent transmission
  through e-mail to a wide array of e-mail clients (i.e. for patches).

* No space before a semicolon that closes a statement.

* Line up corresponding items vertically.

* Put blank lines between groups of code that do different things. Put
  blank lines after your variable declarations. Put a blank line before a
  final return() statement. Put a blank line following a block (and
  before, with the exception of comment lines).

* For control structures, there is a space between the keyword and
  opening parenthesis.

* Always include parentheses after functions, even if there are no
  arguments. There are some exceptions, such as list operators (like
  print) and unary operators (like undef, delete, uc).

* There is no space inside the parentheses, unless it is needed for
  readability.

* On multi-line expressions, match up the closing parenthesis with
  either the opening statement, or the opening parenthesis, whichever
  works best.

* When in doubt, parenthesize.

* There is always a space befor the opening brace.

* A one-line block may be put on one line, and the semicolon may be
  omitted. Otherwise, finish each statement with a semicolon, put the
  keyword and opening curly on the first line, and the ending curly lined
  up with the keyword at the end.

* Uncuddled elses

    if ($foo) {
        print;
    }
    else {
        die;
    }

* Put space around most operators. The primary exception is the for
  aesthetics; e.g., sometimes the space around "**" is ommitted, and
  there is never a space before a "," but always after.

* Put space around a complex subscript inside the brackets or braces.

    $foo{ $bar{baz}{buz} };

* Use single-quotes around literals, and double-quotes when the text
  needs to be interpolated.

* When making compound statements, put the primary action first.

* Use here-docs instead of repeated print statements.


Comparison Operators
====================

    Greater Than    >   gt
    Less Than   <   lt
    Equal to    ==  eq
    Not equal   !=  ne
    Less than or equal to   <=  le
    Greater than or equal to    >=  ge


Perl module
===========

    $ perl -e 'printf "%d %s\n", $i++, $_ for @INC'

    $ perl -MCPAN -le 'print $INC{"CPAN.pm"}'

    $ perldoc perlmodinstall

    # Install module in a private/non-standard directory
    $ perl Makefile.PL LIB=/home/foobar/mylib PREFIX=/home/foobar/mylib

    # Remove installed modules
    ExtUtils::Installed ExtUtils::Packlist


CPAN
====

    # Required libtest-harness-perl
    $ perl -MCPAN -e shell

        notest install <MODULE::NAME>

        # Re-initialized MyConfig.pm
        o conf init

        # List settings
        o conf

        # Set make
        o conf make /usr/bin/make

        o conf make_install_make_command 'sudo make'

        o conf makepl_arg "LIB=~/lib"

        o o conf init /color/

        o conf commit

        o debug package
        o debug -package
        o debug all

        # Install a new version module
        o conf make_install_arg UNINST=1


        ##### Programming Examples #####
        # Install everything that is outdated on my disk:
        perl -MCPAN -e 'CPAN::Shell->install(CPAN::Shell->r)'

        # Install my favorite programs if necessary:
        for $mod (qw(Net::FTP Digest::SHA Data::Dumper)){
            CPAN::Shell->install($mod);
        }

        # List all modules on my disk that have no VERSION number
        for $mod (CPAN::Shell->expand("Module","/./")){
            next unless $mod->inst_file;
            # MakeMaker convention for undefined $VERSION:
            next unless $mod->inst_version eq "undef";
            print "No VERSION in ", $mod->id, "\n";
        }

        # Find out which distribution on CPAN contains a module:
        print CPAN::Shell->expand("Module","Apache::Constants")->cpan_file
        ##### Programming Examples #####


    $ perl -MCPAN -e 'install <MODULE::NAME>'

    $ perl Makefile.PL PREFIX="/usr/local" LIB="/usr/local/lib/site_perl"

    # Installing packages system-wide [0]
    $ env PERL_MM_USE_DEFAULT=1 cpan
    # Answer 'yes' if CPAN asks to configure itself automatically
    cpan> o conf make_install_make_command '/usr/bin/sudo /usr/bin/make'
    cpan> o conf mbuild_install_build_command '/usr/bin/sudo ./Build'
    cpan> o conf prerequisites_policy follow
    cpan> o conf commit
    cpan> install Some::Module

    # Sites

        http://mirrors.xueron.com/CPAN/
        http://cpan.mirror.edu.cn/


Perldoc
=======

    # Find module and print its location
    $ perldoc -l Test::Tutorial

    # Show plain, unrendered text
    $ perldoc -m Test::MockObject

    # Webify perldoc FIXME
    $ perldoc -oHTML -dperltoc.html perltoc

    $ perldoc perlmodinstall

    $ perldoc CPAN

    $ perldoc perldelta

    # Perl predefined variables
    $ perldoc perlvar


Using module
============

* Using Base64 module

    $ perl -MCPAN -e 'install MIME::Base64;'
    $ perldoc MIME::Base64
    $ perl -MMIME::Base64 -ne 'print decode_base64($_)' < <BASE64_FILE> > NEWFILE


* Decode quoted-printing strings

    use MIME::QuotedPrint qw(encode_qp);
    use MIME::QuotedPrint qw(decode_qp);
    use Encode qw(encode);

    $decoded = decode_qp(encode("gb2312","=FF"));
    print $decoded;


* Regexp::Common::net

    /^$RE{net}{IPv4}$/


* Cwd

    $ perl -MCwd=abs_path -e "print abs_path('../')"


One-liner
=========

* Check /etc/shadow

    $ sudo perl -F: -ane 'print if not $F[1];' /etc/shadow


* Show account which UID is 0 or null

    $ perl -F: -ane 'print if not $F[2];' /etc/passwd


* Comma insertions

    $ perl -pe '$_=reverse;s/\d{3}(?=\d)(?!.*?\.)/$&,/g;$_=reverse'


* Omit same line(s)

    $ perl -ne '$seen{$_}++ or print' your_file


* Convert Epoch to standard date/time

    $ perl -e 'print scalar(localtime(1234567890)), "\n"'


Related Links
=============

http://www.officevision.com/pub/p5ee/software/htdocs/P5EEx/Blue/perlstyle.html
http://www.dev411.com/perl/cpancompare
http://cpanratings.perl.org/
http://cpandeps.cantrell.org.uk/?module=Email%3A%3AMIME
http://testers.cpan.org/
http://search.cpan.org/
[0] http://sipb.mit.edu/doc/cpan/


# vim:filetype=perl:
