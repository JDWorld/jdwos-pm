
### ⚙️ Il Core Package Manager: .JDW

Il gestore pacchetti `jdw` è l'infrastruttura nativa e indipendente progettata per la gestione dei pacchetti proprietari `.jdw` su JDWorld OS. A differenza dei pacchetti standard, il PM non viene distribuito come binario precompilato, ma richiede un bootstrap iniziale direttamente dai sorgenti per garantire l'integrità del sistema.

---

### ⚒️ La struttura del Package Manager è ridotta ai minimi termini:

```
jdwos-pm/
├── jdw-install          <-- L'installatore nativo
├── jdw-remove           <-- Il disinstallatore nativo
├── jdw-info             <-- Il visualizzatore di schede tecniche
└── jdw-list             <-- L'elenco dei pacchetti a bordo
```

---

### 🛠️ Protocollo di Installazione Pulita (Bootstrap)

Per agganciare `jdwos-pm` al tuo terminale locale ed eliminare automaticamente le tracce di compilazione, esegui i seguenti comandi nel terminale di bordo:

```
git clone https://github.com/JDWorld/jdwos-pm
cd jdwos-pm && chmod +x setup.sh
sudo ./setup.sh # [auto-clean]
```

_Nota: Lo script `setup.sh` installerà i binari core e provvederà a piallare chirurgicamente la cartella temporanea scaricata da Git, lasciando il sistema operativo totalmente pulito da scorie residue._

---

### 📜 Regolamento e Licenza d'Uso

Il codice sorgente del Package Manager `jdw` è ufficialmente rilasciato sotto licenza **BSD a 2 Clausole (Simplified BSD License)**. 

Questo garantisce all'utente la massima libertà d'uso e modifica, tutelando al contempo l'esclusività e la chiusura dei moduli di sviluppo privati.

```text
Copyright (c) 2002-2026, JDWorld / JDWorld OS. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
```

---

**Sviluppato come parte del sistema operativo personalizzato [JÐWØ®LÐ ØS](https://JDWorld.github.io/jdworldos)**
