# SERVICES_WIN10
# 🌟 Ottimizzatore di Servizi di Windows 🌟

Ho creato uno script in PowerShell con l'intento di semplificare e ottimizzare :rocket: l'esperienza degli utenti di Windows. Questo script disattiva i principali servizi di sistema che normalmente un utente medio non utilizza, liberando risorse preziose e migliorando le prestazioni complessive del computer e della RAM.

:gear: :wrench: Caratteristiche Principali:

1. Disattivazione Intelligente: Identifica e disattiva i servizi non essenziali che possono rallentare il sistema.

2. Miglioramento delle Prestazioni: Libera risorse di sistema per un'esperienza utente più fluida e reattiva.

3. Facile da Usare: Semplici comandi per eseguire lo script e ottenere immediatamente i benefici.

> [!IMPORTANT]
> ⚠️Prima di eseguire lo script, è consigliabile creare un punto di ripristino del sistema o un backup, per garantire che qualsiasi modifica possa essere facilmente annullata in caso di necessità.
> Direttamente da qui **`SystemPropertiesProtection`**

## Avviare la PowerShell con diritti da Amministratore, utilizzando un file batch
```
@echo off
echo Esecuzione di PowerShell con privilegi di amministratore...
set "DESKTOP_PATH=%USERPROFILE%\Desktop"
:: Questo comando avvia PowerShell con privilegi di amministratore ed esegue i comandi specificati
PowerShell -Command "Start-Process PowerShell -ArgumentList '-NoExit -Command ""& {Set-ExecutionPolicy Bypass -Scope Process; & ""%DESKTOP_PATH%\SERVICES_WIN10.ps1""}""' -Verb RunAs"
```

## Elenco dei processi che verranno chiusi con lo script

### Servizi di Stampa
| Servizio | Descrizione |
| --- | --- |
| Spooler | Gestisce la coda di stampa |
| PrintNotify | Notifiche di stampa per stampanti connesse |

### Servizi di Rete
| Servizio | Descrizione |
| --- | --- |
| LanmanServer | Server di condivisione file e stampanti |
| LanmanWorkstation | Condivisione di file/cartelle in rete |
| FDResPub | Pubblicazione risorse per il rilevamento di rete |
| fdPHost | Host del provider per individuazione funzioni |
| RemoteRegistry | Consente modifiche del registro da remoto |
| SharedAccess | Internet Connection Sharing (ICS) |
| ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) RasMan | Connection Manager di Accesso remoto VPN o connessioni remote |
> [!CAUTION]
> RasMan lasciarlo attivo se utilizzate una VPN

### Servizi Bluetooth
| Servizio | Descrizione |
| --- | --- |
| BthAvctpSvc | Supporto audio/video Bluetooth |
| BTAGService | Supporto Bluetooth |
| bthserv | Servizio Bluetooth per connessioni |

### Servizi Xbox
| Servizio | Descrizione |
| --- | --- |
| XblAuthManager | Gestisce l'autenticazione su Xbox Live |
| XblGameSave | Salvataggio giochi Xbox Live |
| XboxGipSvc | Gestione input per Xbox |
| XboxNetApiSvc | API di rete Xbox |

### Servizi di Diagnostica
| Servizio | Descrizione |
| --- | --- |
| WdiSystemHost | Diagnostica di sistema |
| WdiServiceHost | Servizio diagnostico |

### Servizi di Telemetria e Notifiche
| Servizio | Descrizione |
| --- | --- |
| DiagTrack | Telemetry di Windowsm disattivabile per la privacy. |
| dmwappushservice | Push notification di Windows |

### Servizi di Geolocalizzazione e Mappe
| Servizio | Descrizione |
| --- | --- |
| lfsvc	Servizio | geolocalizzazione |
| MapsBroker | Servizio di mappe online |

### Servizi di Realtà Mista e AR/VR
| Servizio | Descrizione |
| --- | --- |
| SharedRealitySvc | Funzioni AR/VR di Windows |
| MixedRealityOpenXRSvc | Supporto realtà mista |

### Servizi di Input e Interfaccia
| Servizio | Descrizione |
| --- | --- |
| TabletInputService | Tastiera virtuale e scrittura a mano |
| TapiSrv | Gestisce l'interfaccia TAPI per telefonia |

### Servizi di Sicurezza e Gestione
| Servizio | Descrizione |
| --- | --- |
| SEMgrSvc | Gestione dispositivi di sicurezza NFC o pagamenti elettronici |
| WalletService | Gestione del portafoglio digitale |
| ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) WPCMonSvc | Controllo genitori di Windows |
| DusmSvc | Disattivabile se non vuoi il monitoraggio del consumo dati |
> [!WARNING]
> Controllo genitori di Windows.

### Servizi Retail e Demo
| Servizio | Descrizione |
| --- | --- |
| RetailDemo | Modalità demo per i negozi |

### Servizi ASUS
| Servizio | Descrizione |
| --- | --- |
| ASUSLiveUpdateAgent | Disattivabile (puoi aggiornare manualmente) |

> [!NOTE]
> Per riattivare i servizi chiusi, accedere manualmente nel pannello eseguendo il servizio **`services.msc`**




