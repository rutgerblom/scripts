$vmhost = Get-VMHost "esxi01.demo.local"
$esxcli = Get-EsxCli -VMHost $vmhost
$esxcli.software.vib.install("/vmfs/volumes/demo_nfs01/QLogic-Network-iSCSI-FCoE-v2.0.95-offline_bundle-14038984.zip") 
