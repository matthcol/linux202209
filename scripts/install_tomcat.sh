#!/usr/bin/bash

# Script to install Tomcat
SRC_DIR=~/Documents
ARCHIVE=apache-tomcat-10.0.23.tar.gz
DEST_BASE_DIR=~/servers

cd ${DEST_BASE_DIR}
# CPT=`ls -d * 2> /dev/null | grep -E "^[0-9]+$" | sort -n | tail -1` 
CPT=$(ls -d * 2> /dev/null | grep -E "^[0-9]+$" | sort -n | tail -1)

# DEBUG: echo "#${CPT}#"

if [ -z "$CPT" ]
then
	echo "No subdirectory yet => 1"
	CPT=1
else
	echo "Last subdirectory found ${CPT}  => +1"
	(( CPT++ ))
fi

# DEBUG: echo "#${CPT}#"

DEST_DIR=${DEST_BASE_DIR}/${CPT}
echo "Tomcat will be installed in ${DEST_DIR}"

mkdir ${DEST_DIR}

# tar xvf ${SRC_DIR}/${ARCHIVE} 

