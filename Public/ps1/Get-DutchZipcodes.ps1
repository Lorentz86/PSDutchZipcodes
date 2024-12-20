function Get-DutchZipCodes{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Name of the street")]
        [string]$StreetName,

        [Parameter(Mandatory=$false, HelpMessage="Number of the house/company")]
        [int]$HouseNumber,

        [Parameter(Mandatory=$false, HelpMessage="Name of the city.")]
        [string]$CityName,

        [Parameter(Mandatory=$false, HelpMessage="The numbers of the zipcode.")]
        [string]$ZipCode

    )
    if ($Zipcode -match '^\d{4}[A-Za-z]{2}$') {
        Write-Information -MessageData "Valid zipcode format"
    } else {
        throw "Invalid Zipcode format. The zipcode should be as this format: 1234AB"
    }

    #$StreetName = "Campbellhof"
    #$HouseNumber = "20"
    #$CityName = "Dronten"
    #$ZipCodeNumber = "8251"
    try {
        $Address = @{}
        if($StreetName){$Address["StreetName"] = $StreetName}
        if($HouseNumber){$Address["HouseNumber"] = [string]$HouseNumber}
        if($CityName){$Address["CityName"] = $CityName}
        if($ZipCode){$Address["ZipCode"] = [string]$ZipCode}
        
        $Object = Invoke-LookupDutchZipCode -address @Address
        return $Object   
    }
    catch {
        Write-Error "Could not get Information $_"
    }
}