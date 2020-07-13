Get-Module DataONTAP
Import-Module DataONTAP


$CSVinput = Import-CSV -Path C:\script\test.csv


Connect-NcController 10.4.0.3 -Credential admin -ErrorAction SilentlyContinue

$CSVinput | Foreach{
    ## REMOVING QUOTA
    Remove-NcQuota -volume Home -User ($_."user") -VserverContext svm-cifs01 -Qtree "" -ErrorAction SilentlyContinue
  }

