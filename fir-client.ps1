#requires -version 2
<#
.SYNOPSIS
    Fast Incident Response API Client

.DESCRIPTION
    PowerShell implementation of the Fast Incident Response REST API

.PARAMETER u
    URL of your Fast Incident Response server

.PARAMETER t
    API Token for your FIR user account

.PARAMETER ep
    The API endpoint to interact with

.OUTPUTS
    Log file stored in $CWD/fir_client.log>

.NOTES
  Version:        1.0
  Author:         @byt3smith
  Creation Date:  08/2016
  Purpose/Change: Initial script development

.EXAMPLE
 powershell -File fir-client.ps1 -u https://<fir-host>.com -t <token> -ep incidents
   
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Accept parameters
param(
  [string]$u = "url",
  [string]$t = "token",
  [string]$ep = "endpoint"
)

#Set Error Action to Silently Continue
#$ErrorActionPreference = "Silently Continue"

#Dot Source required Function Libraries
#. "C:\Scripts\Functions.ps1"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$sScriptVersion = "1.0"

#Log File Info
$sLogFile = "fir-client.log"

#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function Log-Write
{
   Param ([string]$logstring)

   Add-Content $sLogfile $logstring
}

Function IfGet {

}

Function IfPost {

}

Function Main {
  #Display supplied arguments
  Write-Host "URL: $u"
  Write-Host "Endpoint: $ep"
  Write-Host ""

  $fullUrl = "$u/api/$ep"

  #log start of script execution
  Log-Write("[*] Making API call to $u..")

  Try {
    $headerParams = @{"Authorization"="Token $t"}
    $res = Invoke-RestMethod -URI $fullUrl -Method Get -Headers $headerParams
    if ($res.results.length -eq 0) {
      Write-Host "[-] No Results"
    }
    else {
      Write-Host $res.results
    }
  }

  Catch {
    Write-Host "[-] Error: See Log File"
    Log-Write($_.Exception)
    Break
  }

  Log-Write("[+] Completed Successfully.")
  Log-Write(" ")
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------

#Script Execution starts here
Main
