function ConnectToNetwork {
    Write-Output "Connecting to network"
    bitsrun login
}

while ($true) {
    $networkStatus = (bitsrun status | Select-String "bitsrun").Line.Split()[-1]

    if ($networkStatus -eq "online") {
        # Write-Output "Network is connected"
    } elseif ($networkStatus -eq "offline") {
        # Write-Output "Network is not connected"
        ConnectToNetwork > $null
    } else {
        Write-Output "Unknown network status"
        # Write-Output "$networkStatus"
    }
    Start-Sleep -Seconds 1
}