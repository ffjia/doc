        ========================================
            C
        ========================================

# $Id: c 1334 2010-08-18 05:04:43Z ffjia $

1. glibc
2. gcc
3. glibc_header

$ g++ -m64 -print-file-name=libstdc++.a

# http://en.gentoo-wiki.com/wiki/Safe_Cflags
$ cc -march=native -E -v - </dev/null 2>&1 | grep cc1

