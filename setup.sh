#!/bin/bash
# setup.sh - Bootstrapper universale per il Package Manager
SRC_DIR=$(pwd)

if [ "$EUID" -ne 0 ]; then
    echo -e "\e[1;31m❌ Errore:\e[0m Esegui lo script con sudo: sudo ./setup.sh"
    exit 1
fi

# Avvia l'installazione passando la directory corrente
if [ -f "$SRC_DIR/install.sh" ]; then
    bash "$SRC_DIR/install.sh" "$SRC_DIR"
else
    echo -e "\e[1;31m❌ Errore:\e[0m install.sh non trovato."
    exit 1
fi

# Tradizione anti-bloatware JDWorld OS: auto-distruzione dei sorgenti Git
echo "🧼 Rimozione file temporanei di setup..."
cd ..
rm -rf "$SRC_DIR"

echo -e "\e[1;32m✔️  Sistema immacolato. Il Package Manager è nativo.\e[0m"
