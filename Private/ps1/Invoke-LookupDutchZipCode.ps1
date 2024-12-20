function Invoke-LookupDutchZipCode{
    [CmdletBinding()]
    param(
        [hashtable]$Address
    )

    try {
        $defUrl = "https://api.pdok.nl/bzk/locatieserver/search/v3_1/suggest?"
        $ZipCodeQuery= @()
        foreach($Pair in $Address.Keys){
            switch($pair){
                "StreetName"{$ZipCodeQuery += "straatnaam_verkort:$($Address[$pair])" }
                "HouseNumber"{$ZipCodeQuery += "huis_nlt:$($Address[$pair])" }
                "CityName"{$ZipCodeQuery += "woonplaatsnaam:$($Address[$pair])" }
                "ZipCode"{$ZipCodeQuery += "postcode:$($Address[$pair])" }
            }
        }
    
        $searchQuery = "q=" + $($ZipCodeQuery -join " AND ")
        $searchUrl = $defUrl + $searchQuery
    
        $Response = Invoke-WebRequest -Method Get -Uri $searchUrl
        $Result = Invoke-DetailedZipCodeInfo -Object $Response
        return $Result
    }
    catch {
        Write-Error ""
    }
}