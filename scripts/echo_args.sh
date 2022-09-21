#!/usr/bin/bash
echo "Nb args: $#"

echo "Program: $0"

echo "All args: $@"
echo "All args: $*"

echo "Arg 1: $1"
echo "Arg 2: $2"
echo "Arg 3: $3"
echo "Arg 4: $4"

echo "Bouclons sur les arguments avec for"
for a in $*
do
	echo "- arg: $a"
done


echo "Bouclons sur les arguments avec while"
while (( $# > 0 ))
do
	case $1 in
		-h) echo "host: $2"
		    shift;;
	    	-d) echo "db name: $2"
    		    shift;;
    		*) echo "option/arg inconnu: $1"
	esac
	shift
done

