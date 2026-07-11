#!/bin/bash
# remove.sh - Script di disinstallazione specifico per jdwos-stm
TARGET_HOME="/home/${SUDO_USER}"

echo "==> Eliminazione file di sistema del PM (Root)..."
rm -rf /usr/share/jdwos-stm/menu.d/jdwos-pm-stm.txt

# Rimuove anche i binari dell'installatore e del disinstallatore
# se hai scelto di includerli in questo pacchetto core
rm -f /usr/bin/jdw-info
rm -f /usr/bin/jdw-install
rm -f /usr/bin/jdw-list
rm -f /usr/bin/jdw-remove
rm -f /usr/share/jdwos-pkg/installed/jdwos-pm
rm -f /usr/share/jdwos-stm/menu.d/jdwos-pm-stm.txt

echo "==> Eliminazione file utente nella Home di ${SUDO_USER}..."
rm -rf "${TARGET_HOME}/.local/share/jdwos-stm/menu.d/jdw-pm-stm.txt"


echo "✔️ Pulizia jdwos-pm-stm completata!"
