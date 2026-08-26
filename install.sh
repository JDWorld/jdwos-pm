#!/bin/bash
# install.sh -  del Core Package Manager per JDWorld OS
clear
# Iniezione immediata della libreria condivisa centralizzata di Jack
source "/usr/share/jdworldos/jdwos-lib/jdwos-hfcore.sh" 2>/dev/null
source "/usr/share/jdworldos/jdwos-lib/jdwos-icore.sh" 2>/dev/null
source "/usr/share/jdworldos/jdwos-lib/jdwos-rgb.sh" 2>/dev/null

SRC_DIR=$1

echo "📦 Installazione del JDWorld OS Package Manager Universale..."
# Blocco rivelamento PM e Installazione Dipendenze (pacman/apt)
echo -e "${orange}[*] Sincronizzazione delle dipendenze di sistema su base $DISTROS...${reset}"
# 1. RILEVAMENTO HARDWARE DEL PACKAGE MANAGER ATTIVO
rivela_pm

case "$PKGS" in
    pacman)
         sudo pacman -S --needed --noconfirm kdialog
        ;;
    apt)
        # Sincronizzazione specchi Debian obbligatoria prima del push
        sudo apt-get update -y && sudo apt-get install -y kdialog
        ;;
    *)
        echo "Distribuzione non supportata"
        echo "Visita https://JDWrld.github.io/jdworldos per maggiori info."
        exit 1
        ;;
esac

# 2. CONTINUAZIONE DEL DEPLOY COMUNE (Copia degli asset, permessi, etc.)
echo -e "${green}[✓] Dipendenze verificate. Procedo con il trasferimento dei moduli...${reset}"
# Fine Blocco rivelamento PM


# 1. Crea le cartelle di archivio centralizzate per il database dei pacchetti
sudo mkdir -p /usr/share/jdworldos/jdwos-pkg/installed
sudo mkdir -p /usr/share/jdworldos/jdwos-pkg/uninstall.d

# 2. Copia tutti i binari nativi (jdw-build, jdw-install, jdw-remove, jdw-info, jdw-list)
if [ -d "$SRC_DIR/bin" ] && [ "$(ls -A $SRC_DIR/bin)" ]; then
    echo "==> Iniettando i comandi in /usr/bin/..."
    sudo cp "$SRC_DIR/bin/"* /usr/bin/
    sudo chmod +x /usr/bin/jdw-*
fi

# 4. Registrazione di sicurezza del PM stesso nel database locale
if [ -f "$SRC_DIR/jdw-package.info" ]; then
    sudo cp "$SRC_DIR/jdw-package.info" /usr/share/jdworldos/jdwos-pkg/installed/jdwos-pm
fi

# 4. Registrazione del disinstallatore modulare di sistema
sudo mkdir -p /usr/share/jdworldos/jdwos-pkg/uninstall.d
if [ -f "$SRC_DIR/remove.sh" ]; then
    sudo cp "$SRC_DIR/remove.sh" "/usr/share/jdworldos/jdwos-pkg/uninstall.d/jdwos-pm-remove.sh"
    sudo chmod +x "/usr/share/jdworldos/jdwos-pkg/uninstall.d/jdwos-pm-remove.sh"
fi

sudo jdw-install jdwos-corelib

echo "✔️  JDWorld OS: Gestore dei Pacchetti JDW installato e pronto all'azione!"
cd ..
