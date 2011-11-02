        ======================================== 
            mt
        ======================================== 

# $Id: mt 39 2006-11-21 02:01:33Z ffjia $

# Remember not to use both software and hardware compression on the same
# data
$ ln -s /dev/tape /dev/nst0

$ mt rewind

$ mt eod

$ mt offline

$ mt -f /dev/st0 status
