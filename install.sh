#!/bin/bash
# install.sh -  del Core Package Manager per JDWorld OS
SRC_DIR=$1

echo "📦 Installazione del JDWorld OS Package Manager Universale..."
 sudo pacman -S --needed --noconfirm kitty kdialog

# 1. Crea le cartelle di archivio centralizzate per il database dei pacchetti
sudo mkdir -p /usr/share/jdwos-pkg/installed
sudo mkdir -p /usr/share/jdwos-pkg/uninstall.d

# 2. Copia tutti i binari nativi (jdw-build, jdw-install, jdw-remove, jdw-info, jdw-list)
if [ -d "$SRC_DIR/bin" ] && [ "$(ls -A $SRC_DIR/bin)" ]; then
    echo "==> Iniettando i comandi in /usr/bin/..."
    sudo cp "$SRC_DIR/bin/"* /usr/bin/
    sudo chmod +x /usr/bin/jdw-*
fi

# 3. Copia della voce atomica per il menù PyQt6
if [ -f "$SRC_DIR/comandi/jdwos-pm-stm.txt" ]; then
    sudo cp "$SRC_DIR/comandi/jdwos-pm-stm.txt" /usr/share/jdwos-stm/menu.d/
    sudo chmod 644 /usr/share/jdwos-stm/menu.d/jdwos-pm-stm.txt
    echo "==> Sottomenù Gestione Pacchetti inserito nel menù PyQt6."
fi

# ===>. Kitty Custom Profile
if [ -f "$SRC_DIR/kitty/jdwos-pm.conf" ]; then
    sudo mkdir -p /usr/share/jdwos-cfg
    sudo cp "$SRC_DIR/kitty/jdwos-pm.conf" /usr/share/jdwos-cfg
    sudo cp "$SRC_DIR/kitty/jdwos-pm.conf" /usr/share/colori.sh
    sudo chmod 644 /usr/share/jdwos-cfg/jdwos-pm.conf
    sudo chmod +x /usr/share/jdwos-cfg/colori.sh
    echo "==>  Applicata Configurazione Colori e Kitty per Packages Manager."
fi

# 4. Registrazione di sicurezza del PM stesso nel database locale
if [ -f "$SRC_DIR/jdw-package.info" ]; then
    sudo cp "$SRC_DIR/jdw-package.info" /usr/share/jdwos-pkg/installed/jdwos-pm
fi

# 4. Registrazione del disinstallatore modulare di sistema
sudo mkdir -p /usr/share/jdwos-pkg/uninstall.d
if [ -f "$SRC_DIR/remove.sh" ]; then
    sudo cp "$SRC_DIR/remove.sh" "/usr/share/jdwos-pkg/uninstall.d/jdwos-pm-remove.sh"
    sudo chmod +x "/usr/share/jdwos-pkg/uninstall.d/jdwos-pm-remove.sh"
fi

echo "✔️  JDWorld OS: Video Tool (TUI) installato e pronto all'azione!"
