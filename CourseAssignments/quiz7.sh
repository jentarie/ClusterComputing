#!/bin/sed

sed -n '/dta10/,/tcbowman/p' /etc/passwd
sed -n -r '/([a-zA-Z0-9]*):([x]):([0-9]*):([0-9]*):([a-zA-Z ]*):([\/a-z]*) \5/p'

sed -n -r '/([:alnum:]):([:alpha:]):([:digit:]):([:digit:]):([[:alpha:] ]+):([[:alpha:]\/]+) \5/p' passwd.out
sed -n -r '/^[^:]*,[^:]*,[^:]*,[^:]*,[^:]*,[^:]*,[a-z\/]*,/\5/p' passwd.out
sed -n -r '/^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[a-z\/]*,/\5/p' passwd.out
sed      's/^[^:]*:[^:]*:[^:]*:[^:]*://' | sed 's/:.*//'
sed -n -r 's/^[^:]*:[^:]*:[^:]*:[^:]*:([^:]*):[^:]*:[^:]*/\1/p' passwd.out #WTF?!

sed -n -r '/^\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([^:]*\),\([a-z\/]*\),/\5/p' passwd.out
sed -n -r '/^\([^:]*\):\([^:]*\):/\2/p' passwd.out