# README: PowerShell Script in Intune Instellen

## 1. Maak een PowerShell-script in Intune

Volg deze stappen om een PowerShell-script te maken en toe te voegen in Microsoft Intune:

1. Log in op de [Microsoft Endpoint Manager Admin Center (Intune)](https://endpoint.microsoft.com).
   
2. Ga naar **Devices** > **Scripts** > **Add** > **Windows 10 and later**.

3. Selecteer **Add** en kies **Windows 10 and later** > **PowerShell script**.

4. Geef het script een naam, bijvoorbeeld **AutodeskForceLicence**.

5. Upload het script:
   - Klik op **Select file** en kies je PowerShell-scriptbestand (`AutodeskForceLicence.ps1`).
   - Kies **Yes** voor **Run this script using the logged-on credentials** als het script zonder beheerdersrechten moet draaien.
   - Stel **Enforce script signature check** in op **No** als het script niet ondertekend is.

6. Configureer de uitvoeringsinstellingen:
   - Stel **Run script in 64-bit PowerShell** in op **Yes** als je wilt dat het script in een 64-bits omgeving wordt uitgevoerd.

7. Klik op **Next** en koppel het script aan de gewenste apparaten of groepen.

## 2. Instellen dat het script bij opstarten draait

Houd er rekening mee dat Intune PowerShell-scripts meestal worden uitgevoerd op basis van gebruikers- of apparaatinstellingen en niet noodzakelijk bij elke opstart. Intune biedt echter mogelijkheden om het script regelmatig uit te voeren:

- **Gebruikersgerichte toewijzing**: Wijs het script toe aan gebruikersgroepen als het moet draaien wanneer een gebruiker zich aanmeldt.
  
- **Apparaatgerichte toewijzing**: Wijs het script toe aan apparaatgroepen als het moet draaien wanneer een apparaat opstart.

## 3. Gebruik een PowerShell-werkstroom om het script periodiek uit te voeren (optioneel)

Je kunt het script ook als een **Scheduled Task** laten aanmaken via Intune om bij elke opstart uit te voeren. Dit kan door een ander Intune-script te gebruiken om een geplande taak te maken die jouw stop-script start bij het opstarten.

## 4. Gegevens voor de Autodesk Licensing Service

In het PowerShell-script zijn de volgende variabelen gedefinieerd:

```powershell
$serviceName = "AdskLicensingService"  # Autodesk Licensing Service name
$toolPath = "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing\Current\AdskLicensingService\AdskLicensingService.exe"  # Pas dit aan naar het juiste pad
