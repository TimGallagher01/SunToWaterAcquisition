#Script #3 CreateOUUSER.ps1 - Create OUs and create users in correct OUs from csv
#Import-Module -name ActiveDirectory

Import-csv c:\s2w-OU.csv | new-ADOrganizationalUnit -passthru

# Script #4 Create Users

$password = (convertto-securestring -asplaintext "PassW0rd!" -force)

Import-CSV c:\s2w-users.csv | new-aduser -password $password
