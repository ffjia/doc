        ========================================
            Bash
        ========================================

# $Id: bash 1509 2011-08-03 00:34:33Z ffjia $

* Coding style

    - $()
    - []
    - ${}
    - (())
    - Uppercase names for constants and lowercase names for variables
    - Indent 4 spaces
    - Leaving blank around operators
    - "$VAR"
    - A long sentence \
      here
    - [[:space:]]
    - _EOF_
    - local _var


* Shell processes a script as follows:

    * split into tokens by the metacharacters: SPACE, TAB, NEWLINE, ;, (, ), <,
      >, |, &
    * check keyword if not within "..." or '...' (loop)
    * expand alias if not within "..." or '...' (loop)
    * expand brace, a{1,2} -> a1 a2, if not within "..." or '...'
    * expand tilde, ~user -> users home directory, if not within "..." or '...'
    * expand parameter, $PARAMETER, if not within '...'
    * expand command substitution, $(command), if not within '...'
    * split into words with $IFS if not within "..." or '...'
    * expand *?[] in pathname if not within "..." or '...'
    * look up command
    o function
    o built-in
    o file in $PATH
    * loop


* Special Characters

    - []
        wildcard ranges, [a-z0-9]
        condition tests, [ -s file ]

    - {}
        brace expansion, b{ar{d,n,k},ed}s
        function block, function foo {}
        substitution operators, ${VARNAME:-WORD}
        more general syntax of a variable ${VARNAME}

    - ()
        command substitute, $(COMMAND)
        (nested) subshell, ( COMMAND; COMMAND )


* Debug

         / EXIT (0)
    trap - ERR
         \ DEBUG

    $ trap 'echo “before execute line:$LINENO, a=$a,b=$b,c=$c”' DEBUG


    $LINENO

    $FUNCNAME
        ${FUNCNAME[0]} # now executing function
        ${FUNCNAME[1]} # function which use ${FUNCNAME[0]}

    $PS4 -> "+"
        export PS4='+{$LINENO:${FUNCNAME[0]}}'


* Convert lowercase to uppercase

    $ tr [:lower:] [:upper:] < a.txt >b.txt


* Delete the extension from FILENAME

    ${FILENAME%.*}

* Delete the BASENAME and keep the extension

    ${FILENAME##*.}

* The first letter of a variable

    ${VAR:0:1}

* The last letter of a variable

    ${VAR: -1}

* The letters in the middle of a variable

    ${VAR:1:${#VAR}-2}


* Get the var length

    ${#VAR}


* The last positional parameter

    ${!#}


* Parameter expansion -> Indirection

    read -p "Which variable do you want to inspect? " look_var
    echo "The value of \"$look_var\" is: \"${!look_var}\""


* Copy file with extension (bak)

    $ cp <FOOBAR>{,.bak}


* Remove space(s) in file name

    $ for x in *; do mv "$x" "${x/ /}"; done


* Read pwd path

    $ top=$(dirname -- $(readlink -f -- "$0"))


* Redirect error msg

    >& /dev/null
    > /dev/null 2>&1


* Read when user press "ENTER"

    while true; do
    read;
    [[ -z $REPLY ]] && break
    done


* Condition Tests

    Arithmetic test operators   String comparison operators
                -eq                         =
                -ne                         !=
                -gt                         >
                -lt                         <
                -ge
                -le
                                            -z
                                            -n


* Integer arithmetic

    $ let "foo = foo + 1"
    $ foo=`expr $foo + 1`
    $ echo $((foo + 1))
    $ echo "ibase=16;10" | bc

    $ echo "scale=2;7/10" | bc -q

    $ expr 4 \* 5

    for ((i=1; $i<=10; i=$i+1))
    do
        echo $i
    done

    $ seq -f %03g 1 100
    $ seq -w 1 100

    $ seq -w 4.0 0.1 5.01


* Regex

    [0-9]\{3\}\.[0-9]\{3\}\.[0-9]\{3\}\.[0-9]\{3\}

    $ echo "www.google.com.cn" | grep "[.][^.]*$"

    # Generate a list of IP addresses on a subnet $ echo 192.168.{0..4}.{0..255}

    # Get IP address and port
    $ egrep -o '([[:digit:]]+\.){3}[[:digit:]]+:[[:digit:]]+' <FILE>


* Environment Variables

    - SECONDS

    - SHELLOPTS


* Bash complete

    - Partial text begins with dollar sign, <Tab> looks for a matching
      environment variable

      <Esc>-$

    - Partial text begins with at sign, <Tab> looks for a matching
      hostname

      <Esc>-@

    - Associate .txt files with gedit

        $ complete -G "*.txt" gedit


    - Add host name and IP address completion

        $ complete -F _known_hosts xvncviewer

    - Display bindings in use

        $ complete -p


    - Turn off completion

        $ complete -r ssh scp


* List functions and bindings

    $ bind -p


* List variable names and values

    $ bind -v


* Display, edit, and reexecute commands

    $ fc -l [ first [ last ] ]
    $ fc -l keyword1 keyword2
    $ fc -e vi
    $ fc NUM
    $ fc -s NUM
    $ fc -s setenv=alias 2506


* Grab other bits

    - !:0 is the previous command name
    - !^, !:2, !:3, …, !$ are the arguments
    - !* is all the arguments
    - !-2, !-3, … are earlier commands

    # Make a directory then move into it
    $ mkdir cgi-bin; cd !#$ # !#$ is shorthand for "the first word of this command".

    # Execute the most recent command the contains the following string
    !?string

    # Globally search replace on the previous line:
    !!:gs/old/new/

    # HEADS AND TAILS
    # Ever wanted to copy a few files in the same directory, all of which have same
    # long prefix, like: cp /usr/local/etc/apache/file1.txt /usr/local/etc/apache/file2.txt
    # you can grap and reuse that prefix. It\'s named !#:1:h like:
    $ cp /usr/local/etc/apache/file1.txt !#:1:h/file2.txt !#:1:h/file3.txt

* exit_msg() {
      [[ $# -gt 1 ]] && echo "${0##*/} (${1}) - ${2}"
      exit ${1:-0}
  }


Related Links
=============

http://www.caliban.org/bash/index.shtml#completion
http://samrowe.com/wordpress/advancing-in-the-bash-shell/
http://wiki.bash-hackers.org/syntax/arrays
http://mark.stosberg.com/Tech/tips/bash.tips


# vim:filetype=sh:
