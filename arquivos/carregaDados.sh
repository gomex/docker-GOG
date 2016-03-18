#!/bin/sh
DATABASE=GOG
USERNAME=clelsonrodrigues

HOSTNAME=10.0.0.217
# Verifica o valor da variável de ambiente
if [ -n "$HOSTNAMELINK" ]; then
    HOSTNAME=$HOSTNAMELINK
fi

PORT=5432
PASSWORD=123456
export PGPASSWORD=123456

echo "Vai executar o script SQL para CARGA DO DOMÍNIO DE DADOS..."
psql -q -h $HOSTNAME -p $PORT -U $USERNAME $DATABASE -f /opt/ScriptCargaDominio.sql

echo "Vai executar o script SQL para CARGA DE DADOS COMPLEMENTARES..." 
psql -q -h $HOSTNAME -p $PORT -U $USERNAME $DATABASE -f /opt/ScriptCargaComplementar.sql

echo "Vai executar o script SQL para CRIAÇÃO DA VIEW DE ESTATÍSTICAS DE MANIFESTAÇÃO"
psql -h $HOSTNAME -p $PORT -U $USERNAME $DATABASE -f /opt/ScriptCreateVWEstatisticasManifestacao.sql

echo "Vai executar o script SQL para CRIAÇÃO DA VIEW DE ÚLTIMO TRAMITE"
psql -h $HOSTNAME -p $PORT -U $USERNAME $DATABASE -f /opt/ScriptCreateVWUltimoTramite.sql




 
