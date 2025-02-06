# Servizi da controllare
$serviceNames = @("XblAuthManager", "PrintNotify" ,"Spooler","FDResPub", "fdPHost", "RemoteRegistry","DusmSvc", "LanmanServer", "SharedAccess", "WdiSystemHost", "WdiServiceHost", "TapiSrv", "BthAvctpSvc", "SEMgrSvc", "RetailDemo", "MapsBroker", "DiagTrack", "dmwappushservice", "WalletService", "WPCMonSvc", "XblAuthManager", "XblGameSave", "XboxGipSvc", "XboxNetApiSvc", "lfsvc", "SharedRealitySvc", "MixedRealityOpenXRSvc", "TabletInputService", "BTAGService", "BthAvctpSvc", "bthserv", "RasMan", "LanmanWorkstation")
# Dizionario con la descrizione dei servizi
$serviceDescriptions = @{
    "XblAuthManager" = "Gestisce l'autenticazione su Xbox Live"
    "PrintNotify" = "Notifiche di stampa per stampanti connesse"
    "Spooler" = "Gestisce la coda di stampa"
    "FDResPub" = "Pubblicazione risorse per il rilevamento di rete"
    "fdPHost" = "Host del provider per individuazione funzioni"
    "RemoteRegistry" = "Consente modifiche del registro da remoto"
    "DusmSvc" = "Gestione aggiornamenti dispositivi"
    "LanmanServer" = "Server di condivisione file e stampanti"
    "SharedAccess" = "Internet Connection Sharing (ICS)"
    "WdiSystemHost" = "Diagnostica di sistema"
    "WdiServiceHost" = "Servizio diagnostico"
    "TapiSrv" = "Gestisce l'interfaccia TAPI per telefonia"
    "BthAvctpSvc" = "Supporto audio/video Bluetooth"
    "SEMgrSvc" = "Gestione dispositivi di sicurezza"
    "RetailDemo" = "Modalità demo per i negozi"
    "MapsBroker" = "Servizio di mappe online"
    "DiagTrack" = "Telemetry di Windows"
    "dmwappushservice" = "Push notification di Windows"
    "WalletService" = "Gestione del portafoglio digitale"
    "WPCMonSvc" = "Controllo genitori di Windows"
    "XblGameSave" = "Salvataggio giochi Xbox Live"
    "XboxGipSvc" = "Gestione input per Xbox"
    "XboxNetApiSvc" = "API di rete Xbox"
    "lfsvc" = "Servizio geolocalizzazione"
    "SharedRealitySvc" = "Funzioni AR/VR di Windows"
    "MixedRealityOpenXRSvc" = "Supporto realtà mista"
    "TabletInputService" = "Tastiera virtuale e scrittura a mano"
    "BTAGService" = "Supporto Bluetooth"
    "bthserv" = "Servizio Bluetooth per connessioni" 
    "RasMan" = "Connection Manager di Accesso remoto VPN o connessioni remote"
    "LanmanWorkstation" = "Condivisione di file/cartelle in rete"
    "ASUSLiveUpdateAgent" = "Disattivabile (puoi aggiornare manualmente)"
}
$index = 1
# Loop
foreach ($serviceName in $serviceNames) {
  
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
$startMode = (Get-CimInstance -ClassName Win32_Service -Filter "Name='$serviceName'").StartMode

# Confronta con il dizionario
$description = $serviceDescriptions[$serviceName]
    
# Analizza il valore di StartMode
switch ($startMode) {
        'Disabled' {
                Write-Host "$index. Il servizio $($service.Name) è disabilitato. ($description)" -ForegroundColor Green
                Write-Host ""
                }
        'Manual' { 
                Write-Host "$index. Il servizio $($service.Name) è impostato su avvio manuale. ($description)" -ForegroundColor Yellow  
                Stop-Service -Name $($service.Name) -Force
                Set-Service -Name $($service.Name) -StartupType Disabled
                Write-Host ""
                }
        'Auto' {
                Write-Host "$index. Il servizio $($service.Name) è impostato su avvio automatico. ($description)" -ForegroundColor Yellow
                Stop-Service -Name $($service.Name) -Force
                Set-Service -Name $($service.Name) -StartupType Disabled
                Write-Host ""
                }
        default {
                Write-Host "$index. Il tipo di avvio del servizio $serviceName è sconosciuto o non specificato." -ForegroundColor Red
                }
        }
$index++
    } else {
        Write-Host "$index. Il servizio $serviceName non esiste su questo sistema." -ForegroundColor Red
    }
$service
}
# Chiedere all'utente se vuole disattivare gli aggiornamenti automatici
$choice = Read-Host "Vuoi disattivare gli aggiornamenti automatici di Windows? (S/N)"

if ($choice -match "^[SsYy]$") {
    Write-Host "Disattivazione degli aggiornamenti automatici..." -ForegroundColor Yellow
    
    # Ferma il servizio Windows Update
    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
    
    # Disabilita il servizio Windows Update
    Set-Service wuauserv -StartupType Disabled
    
    Write-Host "Gli aggiornamenti automatici di Windows sono stati disattivati." -ForegroundColor Green
} else {
    Write-Host "Nessuna modifica apportata. Gli aggiornamenti automatici rimarranno attivi." -ForegroundColor Cyan
}
Write-Output ""
Write-Output "NOTA INFORMATIVA"
Write-Output "Per riattivare i servizi chiusi, accedere manualmente nel pannello services.msc"
Read-Host
Write-Host "Script completato."

