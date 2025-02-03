function Get-ZipCodeObject{
    param(
        $IDObject,
        $Object
    )
    try{
        if($IDObject){
            $Item = $IDObject.Content | ConvertFrom-Json -Depth 10
            if($Item.response.numFound -eq 0){
                return $false
            }
            if($item.response.numFound -gt 2){
                Write-Information -MessageData "Multiple Instences found.Here are some suggestions or provide more information."
                $Result = $item.response.docs | Select-Object -Property type,weergavenaam,id
                return $result
            }
            $ID = $item.response.docs.id
            return $ID
        }
    }catch{Write-Error "Could not get ID: $_,why do i get"}

    try {
        if($Object){
            $Item = $Object.Content | ConvertFrom-Json -Depth 10
            $ReturnObject = $Item.response.docs | Select-Object -Property @{Name='StreetName';Expression={$_.straatnaam}},
                                                              @{Name='HouseNumber';Expression={$_.huisnummer}},
                                                              @{Name='PostalCode';Expression={$_.postcode}},
                                                              @{Name='CityName';Expression={$_.woonplaatsnaam}},
                                                              @{Name='ProvinceName';Expression={$_.provincienaam}},
                                                              @{Name='ID';Expression={$_.id}}
            return $ReturnObject
        }
    }
    catch {
       Write-Error "Could not get Detailed information from object: $_, this one then?"
    }
}