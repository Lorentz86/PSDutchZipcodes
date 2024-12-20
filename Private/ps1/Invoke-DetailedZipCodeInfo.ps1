function Invoke-DetailedZipCodeInfo{
    param(
        [string]$id
    )

    $defURL = "https://api.pdok.nl/bzk/locatieserver/search/v3_1/lookup?id="
    $url = $defURL+$id
    $Response = Invoke-WebRequest -Uri $url
    return $Response

}