        ========================================
            Make
        ========================================

# $Id: make 39 2006-11-21 02:01:33Z ffjia $

Simple automatic variables:

Rule syntax:

    target: [ prerequisites ... ]
        [TAB]  command1
        [TAB]  -command2 # ignore errors
        [TAB]  @command3 # suppress echoing

Here [TAB] is a TAB code. Each line is interpreted by the shell after
make variable substitution. Use \ at the end of a line  to continue the
script. Use $$ to enter $ for environment values for a shell script.

Implicit rules for the target and prerequisites can be written, for
example, as:

     %: %.c header.h

or,

     %.o: %.c header.h

Here, the target contains the character % (exactly one of them). The %
can match any nonempty substring in the actual target  filenames. The
prerequisites likewise use % to show how their names relate to the
actual target name.

Suffix rules are the obsolete way of defining implicit rules for make.
They are still supported in GNU make for               compatibility,
but use equivalent pattern rules whenever possible:

     old suffix rule --> new pattern rule
     .c:             --> %  : %.c
     .c.o:           --> %.o: %.c

Automatic variables for the rule:

     foo.o: new1.c new2.c old1.c new3.c
     $@ == foo.o                         (target)
     $< == new1.c                        (first one)
     $? == new1.c new2.c new3.c          (newer ones)
     $^ == new1.c new2.c old1.c new3.c   (all)
     $* == `%' matched stem in the target pattern.

Variable references:


     foo1 := bar    # One-time expansion
     foo2  = bar    # Recursive expansion
     foo3 += bar    # Append
     SRCS := $(wildcard *.c)
     OBJS := $(foo:c=o)
     OBJS := $(foo:%.c=%.o)
     OBJS := $(patsubst %.c,%.o,$(foo))
     DIRS  = $(dir directory/filename.ext) # Extracts "directory"
      $(notdir NAMES...), $(basename NAMES...), $(suffix NAMES...) ...

Run make -p -f/dev/null to see automatic internal rules.




.PHONY : clean

clean :

        -rm edit $(objects)
