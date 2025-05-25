#!/bin/sh

npm install -g @apidevtools/swagger-cli

BASEDIR=/IF
SERVICES="bff"

for SERVICE in $SERVICES; do
    echo "Merging ${SERVICE}..."
    INFILE=${BASEDIR}/${SERVICE}/01_IF/openapi.yaml
    OUTFILE=${BASEDIR}/${SERVICE}/01_IF/openapi_merged.yaml

    if [ -f "$INFILE" ]; then
        swagger-cli bundle -o ${OUTFILE} -t yaml ${INFILE}
    else
        echo "Error: ${INFILE} not found"
    fi
done
