
#path for drivers
$path = "C:\windows\temp\bypass39111942-vmware\XeroxDrivers\"

#file name
$filename = "Xerox PS Driver.zip"

try
{

#function for unzipping the driver
function unzip ($file,$ExtractPath) {
    expand-archive -Path $file -DestinationPath $ExtractPath -Force
}
#calls function unzip to unzip driver
unzip $path$filename $path

Get-ChildItem $path -Filter *.inf -Recurse | % {pnputil.exe /a $_.FullName}


#Add driver
Add-PrinterDriver -Name "HP ColorLaserJet MFP M278-M281 PCL-6 (V4)"

#add printer port
Add-PrinterPort -Name "HUB-ACCT-FL5-M281fdw" -PrinterHostAddress 10.10.30.18

#add printer with port
Add-Printer -Name "HUB-ACCT-FL5-M281fdw" -DriverName "HP ColorLaserJet MFP M278-M281 PCL-6 (V4)" -Portname "HUB-ACCT-FL5-M281fdw"
}
catch [system.exception]
{
	$err = $_.Exception.Message
	Write-Host "Unable to deploy printer, `r`nError: $err"
}


Remove-Item $Path -force -recurse

exit $LastExitCode