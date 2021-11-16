$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

$PDC = ($domainObj.PdcRoleOwner).Name

$SearchString = "LDAP://"

$SearchString += $PDC + "/"

$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"

$SearchString +=$DistinguishedName

$SearchString

$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)

$objDomain = New-Object System.DirectoryServices.DirectoryEntry

$Searcher.SearchRoot = $objDomain

$Searcher.filter="(name=IT Admins)"

$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{
	$obj.Properties.member
}









#---------
#$Searcher.filter="samAccountType=805306368"


#$Result = $Searcher.FindAll()

#Foreach($obj in $Result)
#{
#	Foreach($prop in $obj.Properties)
#	{
#		$prop
#	}
#	
#	Write-Host "-------------------------------"
#}



#$Searcher.filter="name=Administrator"
#
#$Result = $Searcher.FindAll()
#
#Foreach($obj in $Result)
#{
#	Foreach($prop in $obj.Properties)
#	{
#		$prop
#	}
#	
#	Write-Host "-------------------------------"
#}

