# Name: AutodeskForsLicenc.ps1
# Description: Script to check and start Autodesk Desktop Licensing Service
# Version: 1.0.1
# Last Modified: 2024-11-04
# Author: Arne De Ganck
# Contact: arne.deganck@richtpuntzottegem.be

#------------------------------------------------------------------------------------------------------------------------------------

$serviceName = "AdskLicensingService"  # Autodesk Licensing Service name
$toolPath = "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing\Current\AdskLicensingService\AdskLicensingService.exe"  # Pas dit aan naar het juiste pad

# Check if the service exists
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service -eq $null) {
    Write-Output "The Autodesk Licensing Service is not installed on this machine."
} else {
    # Check if the service is running
    if ($service.Status -ne 'Running') {
        Write-Output "Starting Autodesk Licensing Service..."
        Start-Service -Name $serviceName

        # Verify if the service started successfully
        $service.Refresh()
        if ($service.Status -eq 'Running') {
            Write-Output "Autodesk Licensing Service started successfully."
        } else {
            Write-Output "Failed to start Autodesk Licensing Service."
        }
    } else {
        Write-Output "Autodesk Licensing Service is already running."
    }
}

# Check if the Autodesk Licensing Tool exists
if (Test-Path $toolPath) {
    Write-Output "Autodesk Licensing Tool found at $toolPath."
} else {
    Write-Output "Autodesk Licensing Tool not found. Please verify the installation path."
}
