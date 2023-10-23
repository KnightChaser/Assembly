# Just for the convenience, I created this GDB script for solving this level.
# ./embryogdb_level5 -x ~/Desktop/levelA/reverseEngineering/level5.gdb

start
break *main+709
commands
    silent
    set $randomFhttps://www.onlinegdb.com/#editor_1lag = *(unsigned long long*)($rbp-0x18)
    printf "Current Random Flag(Use this for the current session): %llx\n", $randomFlag
    continue
end
continue
