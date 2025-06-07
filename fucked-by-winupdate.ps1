# Checar se esta sendo iniciado como admin, caso nao, avise e feche

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Write-Host -BackgroundColor DarkYellow "Is admin: $isAdmin"

Write-Host "Winupddate zoou o meu Windows, preciso restaurar... thanks microsoft"

Write-Host -BackgroundColor DarkGreen "[*] Executando sfc..."
Invoke-Expression "sfc /scannow"

Write-Host "[*] Executando DISM CheckHealth..."
Invoke-Expression "DISM /Online /Cleanup-Image /CheckHealth"

Write-Host "[*] Executando DISM ScanHealth..."
Invoke-Expression "DISM /Online /Cleanup-Image /ScanHealth"

Write-Host "[*] Executando DISM RestoreHealth..."
Invoke-Expression "DISM /Online /Cleanup-Image /RestoreHealth"