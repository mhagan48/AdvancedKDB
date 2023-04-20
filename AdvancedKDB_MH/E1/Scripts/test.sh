#! /bin/bash

#returning running components + info.
ps -ef | grep 'TICK\|RDB1\|RDB2\|CEP\|FH' | grep -v grep
