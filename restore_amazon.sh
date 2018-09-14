#!/bin/bash

CAMINHO_RESTORE=/home/edi/restore_mutillidae_amazon

aws s3 sync s3://edicarlosdasilva-shell/$(date +%F) $CAMINHO_RESTORE

cd $CAMINHO_RESTORE
if [ -f  $1.sql ]
then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "O restore foi realizado com sucesso"
	fi
else
	echo "O arquivo procurado nao existe no diretório"
fi


