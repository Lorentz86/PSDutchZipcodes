# DutchZipCode Module

## About the DutchZipCode Module
The DutchZipCode module is a PowerShell script that allows users to look up Dutch zip codes and related address information using the PDOK (Publieke Dienstverlening Op de Kaart) API. This module can be used to retrieve detailed information about addresses based on various input parameters such as street name, house number, city name, and zip code.

## Features
- Look up Dutch zip codes based on street name, house number, city name, and zip code.
- Retrieve detailed address information from the PDOK API.
- Validate zip code formats to ensure they match the expected Dutch format (e.g., 1234AB).

## Requirements
- PowerShell 5.1 or later
- Internet connection to access the PDOK API

## Installation
To use the DutchZipCode module, simply download the script files and import the module into your PowerShell session:

```powershell
Import-Module -Name "Path\To\Your\Module\DutchZipCode.psm1"
```

## Usage
Here are some examples of how to use the DutchZipCode module:

### Look up by Zip Code
```powershell
Get-DutchZipCode -ZipCode "1234AB"
```

### Look up by Street Name and House Number
```powershell
Get-DutchZipCode -StreetName "Main Street" -HouseNumber 1
```

### Look up by City Name
```powershell
Get-DutchZipCode -CityName "Amsterdam"
```

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an Issue for any bugs or feature requests.

