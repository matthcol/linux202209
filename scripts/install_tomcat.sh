#!/usr/bin/bash

# Script to install Tomcat
# usage (exo 1): install_tomcat src_dir dest_base_dir
# usage (exo 2): install_tomcat src_dir dest_base_dir [version]

echo "analyse des paramètres"


SRC_DIR=$1
ARCHIVE=apache-tomcat-10.0.23.tar.gz
DEST_BASE_DIR=$2

if (( $# != 2 ))
then
	echo "Erreur: l'installer a besoin de 2 arguments"
	exit -1
fi

if [ ! -d "$SRC_DIR" ] 
then
	echo "Erreur: la source n'est pas un répertoire"
	exit -2
fi

if [ ! -x "$SRC_DIR" ] 
then
	echo "Erreur: le répertoire source n'est pas traversable"
	exit -3
fi

if [ ! -r "$SRC_DIR" ] 
then
	echo "Erreur: le répertoire source n'est lisible"
	exit -4
fi

if [ ! -d "$DEST_BASE_DIR" ] 
then
	echo "Erreur: la destination n'est pas un répertoire"
	exit -5
fi

if [ ! -x "$DEST_BASE_DIR" ] 
then
	echo "Erreur: le répertoire destination n'est pas traversable"
	exit -6
fi

if [ ! -w "$DEST_BASE_DIR" ] 
then
	echo "Erreur: le répertoire destination n'est modifable"
	exit -7
fi
echo "Prêt à installer tomcat provenant de ${DEST_BASE_DIR} dans ${DEST_BASE_DIR}"


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

tar xf  ${SRC_DIR}/${ARCHIVE} -C ${DEST_DIR} 

# TODO: faire le lien jusq'au repertoire de tomcat
if [ -e ${DEST_BASE_DIR}/current_tomcat ] 
then
	rm ${DEST_BASE_DIR}/current_tomcat 
fi
ln -s  ${DEST_DIR} ${DEST_BASE_DIR}/current_tomcat

echo "Tomcat installed successfully"
