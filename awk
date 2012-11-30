        ========================================
            Awk
        ========================================

# $Id: awk 1506 2011-08-03 00:30:19Z ffjia $

Behold the Power
================

* Opens and reads all input files listed on the command line

* Handles memory management for all variables

* Parses each line and splits it into fields using the field separator

* Presents each line of text to your program as variable $0

* Presents each field from each line in predefined variables,
  starting with $1, $2, ... $N

* Maintains many internal variables for your use, such as (but not
  limited to):

      o RS = record separator
      o FS = field separator
      o NF = number of fields in the current record
      o NR = number of records processed so far

* Automatically handles conversion between internal data types
  (string, floating point, array)

* Executes the BEGIN block before processing any records (a good
  place to initialize variables)

* Executes the END block after processing all records (a good place
  to calculate report totals)

* Closes all input files listed on the command line


One liner
===========

* Remove the same line(s)

    $ awk '!a[$0]++' <FILE>


* Display digits in XXX way

    $ echo <NUM> | awk '{printf("%03d\n", $1);}'


* Show user names whose UID is equal or greater than 500

    $ cat /etc/passwd | sort | gawk '$3 >= 500 {print $1 }' FS=":"


* Graph # of connections for each hosts

    $ netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'

    $ route -Cn | grep eth0 | awk '{print $2}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'


* Cpu and memory usage top 10 under Linux. It's like `prstat -t` under Solaris

    $ ps -eo user,pcpu,pmem | tail -n +2 | awk '{num[$1]++; cpu[$1] += $2; mem[$1] += $3} END{printf("NPROC\tUSER\tCPU\tMEM\n"); for (user in cpu) printf("%d\t%s\t%.2f%\t%.2f%\n",num[user], user, cpu[user], mem[user]) }'


* Print local ip addr

    $ ifconfig | grep -v '127.0.0.1' | awk '/inet (addr:)?/{sub("addr:","");print $2}'


* Print from the 3rd column

    $ echo $LINE | awk '{ i = 3; while (i<=NF) {print $i; i++}}'
    $ echo $LINE | awk '{ for (i=3; i<=NF; i++) printf ("%s ", $i); }'
    $ echo $LINE | awk '{for(x=3;x<=NF;x++) {printf $x " "; if(x==NF) printf "\n";}}'


* Print TCP state

    $ netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

* Print HTTP error code 500

    $ awk '$9 == 500 { print $0}' /opt/nginx/logs/access.log
    $ ssh remote_host "awk '\$9 ~ /5[0-9][0-9]/ {print \$0}' /opt/nginx/logs/access.log"

* Print PID of Firefox

    $ ps aux | awk '{ if (match($11, /^\/Applications\/.*firefox/)) print $2 }'


Related Links
=============

http://www.cyberciti.biz/faq/bash-scripting-using-awk/
