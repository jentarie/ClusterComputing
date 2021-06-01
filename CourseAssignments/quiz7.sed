#!/bin/sed

sed -n '/dta10/,/tcbowmab/p' /etc/passwd
sed -n -r '/([:alnum:]):([:alpha:]):([:digit:]):([:digit:]):([[:alpha:] ]+):([[:alpha:]\/]+) \5/p' passwd.out
sed -n -r '/^[^:]*,[^:]*,[^:]*,[^:]*,[^:]*,[^:]*,[a-z\/]*,/\5/p' passwd.out
sed -n -r '/^\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([a-z\/]*\),/\5/p' passwd.out
