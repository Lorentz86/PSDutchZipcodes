function Get-ZipCodeObject{
    param(
        $IDObject,
        $Object
    )
    try{
        if($IDObject){
            $Item = $Object.Content | ConvertFrom-Json
            $ID = $item.response.docs.id
            return $ID
        }
    }catch{Write-Error "Could not get ID: $_"}

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