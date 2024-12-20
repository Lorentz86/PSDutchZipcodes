function Invoke-LookupDutchZipCode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [hashtable]$Address
    )

    try {
        $defUrl = "https://api.pdok.nl/bzk/locatieserver/search/v3_1/suggest?"
        $ZipCodeQuery = @()
        foreach ($Pair in $Address.Keys) {
            switch ($Pair) {
                "StreetName" { $ZipCodeQuery += "straatnaam_verkort:$($Address[$Pair])" }
                "HouseNumber" { $ZipCodeQuery += "huis_nlt:$($Address[$Pair])" }
                "CityName" { $ZipCodeQuery += "woonplaatsnaam:$($Address[$Pair])" }
                "ZipCode" { $ZipCodeQuery += "postcode:$($Address[$Pair])" }
            }
        }

        $searchQuery = "q=" + ($ZipCodeQuery -join " AND ")
        $searchUrl = $defUrl + $searchQuery

        Write-Output "Search URL: $searchUrl"

        $Response = Invoke-WebRequest -Method Get -Uri $searchUrl
        Write-Output "Response: $($Response | Out-String)"

        $ID = Get-ZipCodeObject -IDObject $Response
        if (!$ID) {
            Write-Error "No ID found in the response"
            return $false
        }

        $DetailedResponse = Invoke-DetailedZipCodeInfo -id $ID
        Write-Output "Detailed Response: $($DetailedResponse | Out-String)"

        $Result = Get-ZipCodeObject -Object $DetailedResponse
        return $Result
    } catch {
        Write-Error "Could not get information: $_"
    }
}