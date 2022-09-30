Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName SuntoWater.com -DomainNetBIOSName S2W -InstallDNS


