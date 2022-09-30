#myindex = get-netipinterface -interfacealias ethernet | Select-object -property ifIndex

# Remove-NetIPAddress -InterfaceIndex $myindex.ifindex -Address family IPv4 -confirm:$false

#Script #2 SetupNET .ps1 - Configure IP/DG/DNS, instlls AD, configures forest
$myip = Read-Host -Prompt 'Please enter the IP Address of the server (i.e. 192.168.50.1):'
$mysubnet = read-host -Prompt 'Please enter the CIDR bitmask size (i.e. 16 or 24):'
$mygateway = read-host -prompt 'Please enter the Default Gateway (i.e. 192.168.50.1):'

New-NetIPAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -IPAddress $myip -PrefixLength $mysubnet -DefaultGateway $mygateway

Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses $Myip

#Script #1 RENAMECOMP . ps1
Rename-Computer -Newname GEX-52W-SRV2019 -Restart
