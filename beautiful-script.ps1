# part 1 Logs einspeisen
# löschen der konsolenausgabe zum anfang des scriptes
Clear-Host              
$logEintraege = @( 
    "INFO;User:Anna;Login erfolgreich", 
    "ERROR;User:Markus;Datenbank Verbindung fehlgeschlagen", 
    "WARNING;User:Lisa;Speicherplatz gering", 
    "INFO;User:Markus;Logout", 
    "ERROR;User:Anna;Timeout bei Anfrage", 
    "CRITICAL;User:Admin;Systemabsturz", 
    "ERROR;User:Markus;Unbekannter Fehler" 
)


#part 2 Filtern
#wenn log  error oder critical enthält
$fehler = $logEintraege | Where-Object { $_ -match "CRITICAL" -or $_ -match "ERROR" }
#ausgabebeispiel: CRITICAL;User:Admin;Systemabsturz

#part 3 extrahieren der user und zählen der fehler
$benutzernamen = $fehler | ForEach-Object {
    $split = $_ -split ";"
    $benutzersplit = $split[1]  
    $benutzer = $benutzersplit -split ":"  
    $benutzer[1] 
} | Group-Object


Write-Output $benutzernamen

#Write-Output "Fehler pro Benutzer:"