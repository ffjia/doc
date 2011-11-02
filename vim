        ========================================
            VIM
        ========================================

# $Id: vim 1339 2010-08-18 11:49:01Z ffjia $

Editing
=======

    - Edit the file whose name is under or after the cursor

        *[count]gf*


Starting
========

    - Write a Vim script that restores the contents of the current window

        :mkvie[w][!] [file]

    - Load the view for the current file

        :lo[adview] [nr]


Repeat
======

    - Repeat last command-line [count] times

        *@:*

    - Delete all lines in pattern

        :g/pattern/d

    - Delete all lines except in pattern

        :v/pattern/d

    - Delete all the blank lines (including <Tab>s and SPACES)

        :g/^\s*$/d or :%s/\(\s*\n\)\+/\r/

    - Add a blank line after each line

        A.  :%s/$/\r/
        B.  :g/./normal o or {VISUAL LINE}, :g/./normal o

    - Revert the whole content

        :g/^/m 0

    - Copy contents in "pattern" (to A), paste

        :g@keyword@y A
        *"A, p*


Windows
=======

    - Create a new window and start editing an empty file in it, vertically

        :[N]new [++opt] [+cmd] {file}
        :[N]vne[w] [++opt] [+cmd] [file]

    - Split/split vertically current window in two

        *CTRL-W, S* *CTRL-W, CTRL-S* *:split*
        *CTRL-W, V* *CTRL-W, CTRL-V* *:vsplit*

    - Readonly split/vsplit for this buffer

        :sview
        :vert sview


Motion
======

    - Go to {count} percentage in the file

        *N%*

    - Go to the {count} column of current line

        *N|*

    - Same as :Next

        :[count]prev[ious] [count] [++opt] [+cmd]

    - Switch between the last two files

        *CTRL+^*

    - Go to [count] older/newer cursor position in jump list

        *CTRL-O* / *CTRL-I*

    - Open files have been edited

        *`0-9*

    - To the position before latest jump, or where the last "m'" or "m`"
      command was given

        *''*

    - To the position where the last change was made

        *`.*

    - Lowercase marks, valid within one file

        *'a-'z*
        *`a-`z*

    - Uppercase marks, also called file marks, valid between files

        *'A-'Z*
        *`A-`Z*

    - Delete from current line to line of mark

        *d'<mark>*

    - Delete from current cursor position to mark

        *d`<mark>*

    - Yank text to unnamed buffer from cursor to mark

        *y`<mark>*

    - Yank text to unnamed buffer from current line to mark

        *y'<mark>*

    - Numbered marks, set from .viminfo file

        *'0-'9*

    - List the marks that are mentioned in {arg}

        :marks {arg}

    :jumps


Pattern
=======

    - To jump to the declaration of a local variable in a C program

        *gd*

    - To jump to the declaration of a global variable in a C program

        *gD*


Insert
======

    - Delete the word before the cursor

        *CTRL-W*

    - Delete all entered characters in the current line

        *CTRL-U*

    - Insert the file [name] (default: current file) below the cursor

        :r[ead] [name]

    - Insert the file [name] above the first line

        :0r[ead] [name]

    - Insert the current working directory below the last line

        :$r !pwd

    - File name completion, in Insert Mode

        *i_CTRL-X_CTRL-F* (CTRL-N go to next match)

    - Copy the above line

        *i_CTRL-X_CTRL-L*

    - Insert previously inserted text

        *i_CTRL-A*

    - Insert previously inserted text and stop insert

        *i_CTRL-@*

    - Insert the contents of a numbered or named register

        *i_CTRL-R, {0-9a-z"%#*+:.-=}*


Fold
======

    - Operator to create a fold

        *zf{motion}* or *{Visual}zf*

    - Delete one fold/folds recursively at the cursor

        *zd* *zD*

    - Invert 'foldenable'

        *zi*

    - When on a closed fold: open it

        *za*

    - Set the width for a column on the side to indicate folds

        :set foldcolumn=4

    - Define the folds automatically

        # vim:set foldmethod=marker:

            /* foobar () {{{ */

            /* }}} */

        # vim:set foldmethod=indent:

    - # vim:set nofoldenable:


Cmdline
=======

    - Print the history of last entered commands

        :his[tory]
        :his[tory] [{name}] [{first}][, [{last}]]
            List the contents of history {name} which can be:
            c[md]    or :   command-line history
            s[earch] or /   search string history

        :[Up]/[Down]

    - Put the contents you yank into :

        *c_CTRL-R, "*

        or

        *"ay*, *c_CTRL-R, a*

    - Put word under cursor into :

        *c_CTRL-R_CTRL-W*

    - Put search word into :

        *c_CTRL-R, /*

    - Search select words

        *v3e*, *y*, */*, *CTRL-R*, *"*


Digraph
=======

    - Show currently defined digraphs

        :dig[raphs]

        *i_CTRL-K, Co* -> 
        *i_CTRL-K, Rg* -> ®
        *i_CTRL-K, TM* -> ™
        *i_CTRL-K, Ye* -> ¥
        *i_CTRL-K, Pd* -> £
        *i_CTRL-K, "a* -> ä
        *i_CTRL-K, ^e* -> e with a hat


Change
======

    - Shift {motion} lines one 'shiftwidth' leftwards/rightwards

        *<{motion}*
        *>{motion}*

    - Shift the highlighted lines [count] 'shiftwidth' leftwards/rightwards

        *{Visual}[count]<*
        *{Visual}[count]>*

    - Copy last execute command

        *":*

    - Make highlighted text uppercase

        {Visual}*U*

    - Make current line lowercase

        *guu*

    - Switch case of current line

        *g~~*

    - Make current word uppercase

        *gUaw*

    - Delete trailing "SPACE"

        # \s means <Tab>s and SPACES
        :%s/ *$// or :%s/\s\+$//

    - Copy contents double

        :%s/.*/&\r&/ or :g/^/t.

    - Change "URL" to <a href=URL>URL</a>

        :s%http://\(?\|&\|\f\)*%<a href="&">&</a>

    - Change all UPPER CASE text to First Capital Case

        :%s/\<\(\u\)\(\u\+\)\>/\1\L\2/g

* Change string position

    Doe, John -> John Doe

    :%s/\([^,]*\), \(.*\)/\2 \1/



Various
=======

    - Print the ascii value of the character under the cursor

        *ga*


Tricky Part
===========

* Add number to non-blank line

    :%!nl

* Add a line-number to every line

    :%!awk '{print NR,$0}
    :%!nl -ba
    :%!cat -n

* Using vim as calculator (insert-mode)

    *i_CTRL-R*, *=*, *2+2*, *ENTER*

* Increase all \(\d\+\)pt by 4

    :%s/\(\d\+\)pt/\=(submatch(0) + 4).'pt'/g

* Word count

    *g*, *CTRL-G*

* Word used for how many times

    :%s/word/&/gn

* Search !8bit char(s)

    /[^\x00-\xff]

* Search only "/" not "/*, // or /="

    /[/*]\@<!\/[*=/]\@!

* Convert iamges files

    1. Create a file list
    $ ls *.gif | vim -

    2. Transform into commands
    :%s/\v(.*)\.gif/convert & \1.png

    3. Run them
    :w !sh
    :q!

* Translate // style comment to /*  */  and vice vesa

    The '|' concatenate servals ex-command in one line.  It's the key to
    translate // style comments to /* */ style :g#^s{-}//#s##/*# | s#$#*/#

    The '|' keep the current line matchs ^s{-}// to perform s#$#*/

    /* ... */ ---> //style
    :g#/*(.{-})*/#//1#

    /* ....
       ....
       .....
    */
    =====>
    //......
    //......
    //......

* Insert current time

    *i_CTRL-R*, =strftime("%I:%M %p %m/%d/%Y")

* Show the current colorscheme

    :echo g:colors_name

* Clear passwd

    A.
        1. :X
        2. :wq

    B.
        1. :set key=
        2. :wq

* Hex

    :%!xxd     ->hex
    :%!xxd -r  ->back to before

    "Seach hex code
    /\%x

* Easter eggs

    :help!
    :help 42
    :help holy-grail

    :hi!


VIM 7
======

* Spellcheck

    - *]s* Move to the next misspelled word
    - *[s* Move to the previous misspelled word
    - *zg* Add a word to dictionary
    - *z=* See suggestions
    - *zug* Undo an addition to the dictionary

* Undo

    - Revert to earlier state

        :earlier 2h

    - Reinstate changes

        :later 2h

    - Show the "leafs" in the change tree

        :undolist

* Docs

    :viusage
    :exusage


Related Links
=============

http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
http://cscope.sourceforge.net/cscope_vim_tutorial.html
http://www.linuxjournal.com/article/8289
http://www.vim.org/scripts/script.php?script_id=
http://www.vim.org/tips/tip.php?tip_id=
http://www.zzapper.co.uk/vimtips.html


# vim:set filetype=help:
