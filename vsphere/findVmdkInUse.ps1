$vmdkName = '\[volumename\] GW021/GW021.*\.vmdk'
Get-View -ViewType VirtualMachine -Property Name,Config.Hardware.Device |

where{$_.Config.Hardware.Device | where{$_ -is [VMware.Vim.VirtualDisk] -and $_.Backing.Filename -match $vmdkName}} |

Select Name