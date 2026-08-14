#!/bin/bash
# install.sh -  del Core Package Manager per JDWorld OS
SRC_DIR=$1

echo "📦 Installazione del JDWorld OS Package Manager Universale..."
 sudo pacman -S --needed --noconfirm kdialog

# 1. Crea le cartelle di archivio centralizzate per il database dei pacchetti
sudo mkdir -p /usr/share/jdworldos/jdwos-pkg/installed
sudo mkdir -p /usr/share/jdworldos/jdwos-pkg/uninstall.d

# 2. Copia tutti i binari nativi (jdw-build, jdw-install, jdw-remove, jdw-info, jdw-list)
if [ -d "$SRC_DIR/bin" ] && [ "$(ls -A $SRC_DIR/bin)" ]; then
    echo "==> Iniettando i comandi in /usr/bin/..."
    sudo cp "$SRC_DIR/bin/"* /usr/bin/
    sudo chmod +x /usr/bin/jdw-*
fi

sudo jdw-install jdwos-corelib

echo "✔️  JDWorld OS: Gestore dei Pacchetti JDW installato e pronto all'azione!"
