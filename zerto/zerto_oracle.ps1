# Start of script - Configure the variables below
$OracleUser = "system"
$OraclePassword = "password"
$OracleServer = "OracleServer"
$ZVMServerIP = "123.123.123.123"
$ZVMPort = "9080"
$ZVMUser = "administrator"
$ZVMPassword = "password"
$VPGName = "Oracle"
$CheckpointTag = "HotBackup"
# Nothing to configure below here, load Zerto PowerShell commands
add-pssnapin "Zerto.PS.Commands"
# Connect to Oracle and place the database in hot backup mode
$OracleConnectionString = $OracleUser + "/" + $OraclePassword + "@" + $OracleServer
sqlplus $OracleConnectionString
ALTER DATABASE BEGIN BACKUP;
EXIT
# Insert a checkpoint in the Zerto journal for the defined VPG
Set-Checkpoint -VirtualProtectionGroup $VPGName -Tag $CheckpointTag -ZVMIP $ZVMServerIP -ZVMPort $ZVMPort -Username $ZVMUser -Password $ZVMPassword
# Connect to Oracle and resume normal database operations
sqlplus $OracleConnectionString
ALTER DATABASE END BACKUP;
EXIT
# End of script