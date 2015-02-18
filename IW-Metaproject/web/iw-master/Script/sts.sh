#!/bin/bash

#
# Script para evitar problemas de permisos lanzando los
# servidores embebidos de Spring STS
#
# Probado en el laboratorio 4. Si has instalado STS manualmente
# en tu ordenador personal, seguramente tendrás permisos sobre
# la carpeta de instalación, y no necesitarás este script
#

ROOT_STS=/usr/local/java/sts-bundle
LOCAL_STS=${HOME}/sts
STS_WSPACE=${LOCAL_STS}/proyectos
OLD_LAUNCHER=STS-3.6.1-jdk7-64bits.sh

echo "verificando permisos de escritura..."
if [ ! -d ${LOCAL_STS} ] ; then
	echo "sin permisos: copiando archivos (tarda unos 15s)..."
	cp -r ${ROOT_STS} ${LOCAL_STS}
	cp $0 ${LOCAL_STS}
	rm ${LOCAL_STS}/sts # symlink..
	rm ${LOCAL_STS}/${OLD_LAUNCHER} 
	echo "...acabo de instalarlo en ${LOCAL_STS}"
else
	echo "...ya estaba instalado en ${LOCAL_STS}"
fi

echo "lanzando sts (usando ${STS_WSPACE} para proyectos)..."
echo
echo "-----------------------------------------------------"
# esto evita problemas con GTK3
export SWT_GTK3=0
${LOCAL_STS}/sts-3.6.1.RELEASE/STS -data ${STS_WSPACE}

