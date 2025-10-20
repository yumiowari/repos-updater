#!/bin/bash

if [ -n "$1" ]; then
    BASE_DIR="$1"
else
    BASE_DIR="."
fi

if [ ! -d "$BASE_DIR" ]; then
    echo "    Erro: '$BASE_DIR' não é um diretório válido."
    exit 1
fi

echo "Atualizando repositórios em: $BASE_DIR"
echo

for dir in "$BASE_DIR"/*; do
    if [ -d "$dir/.git" ]; then
        echo "    Repositório encontrado: $dir"
        cd "$dir" || continue

        git fetch --all --prune
	    git pull

        echo
        cd - >/dev/null || exit
    fi
done

echo "Atualização concluída."

exit 0
