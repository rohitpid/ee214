#!/bin/bash

function show_help
{
	echo ""
	echo "-------------------------------------------------------"
	echo "This program extracts gain, f3dB and power usage from"
	echo "a spice file"
	echo "Usage: `basename $0` -i FILENAME.sp"
	echo "-------------------------------------------------------"
	exit $E_BADARGS
}

function extract
{
	hspice $FILENAME > ${FILENAME%.*}.lis
	cat ${FILENAME%.*}.lis | grep gainmax
	cat ${FILENAME%.*}.lis | grep f3db
	cat ${FILENAME%.*}.lis | grep watts
}

if [ $# == 0 ]
then
	show_help
	exit $E_BADARGS
fi

if [ $# == 1 ]
then
	FILENAME=$1
	extract
	exit 0	
fi

while [[ $1 == -* ]]; do
    case "$1" in
      -h|--help|-\?) show_help; exit 0;;
      -v|--verbose) verbose=1; shift;;
      -i) if (($# > 1)); then
            FILENAME=$2; shift 2
          else
            echo "-i requires an input spice file. e.g. file.sp" 1>&2
            exit $E_BADARGS
          fi ;;
      --) shift; break;;
      -*) echo "invalid option: $1" 1>&2; show_help; exit $E_BADARGS;;
    esac
done

extract
exit 0
