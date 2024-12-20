function Get-ZipCodeObject{
    param(
        $IDObject,
        $Object
    )
    try{
        if($IDObject){
            $Item = $IDObject.Content | ConvertFrom-Json
            if($Item.response.numFound -eq 0){
                Write-Error "No results found"
                return $false
            }
            $ID = $item.response.docs.id
            return $ID
        }
    }catch{Write-Error "Could not get ID: $_"}S

    try {
        if($Object){
            $Item = $Object.Content | ConvertFrom-Json 
            $ReturnObject = $Item.response.docs
            return $ReturnObject
        }
    }
    catch {
       Write-Error "Could not get Detailed information from object: $_"
    }
}