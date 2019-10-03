#Requires -Module Plaster
<#
.DESCRIPTION
    This script scaffolds a Plaster template.
.PARAMETER ContentPath
    Specify the path to the content that is to be used with the created template.
    Use this if you have content outside the root of the PlasterPlethora module.
.EXAMPLE
    CreatePlasterTemplate -ContentPath ./MyFolder
    > Creates a Plaster template based on the provided input and copies the content in the
    "ContentPath" to the content folder of the template and reflects this in the manifest
    file created by the Plaster module.
#>

    [CmdletBinding(DefaultParameterSetName="Default")]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [String]$ContentPath
    )

####
# Handle pre-requisites for creating the template
####
$TemplateName = Read-Host -Prompt "What will be the name of the Plaster template"
if (-not (Test-Path -Path $PSScriptRoot/$TemplateName)) {
    $TemplateFolder = New-Item -Path $PSScriptRoot -Name $TemplateName -ItemType Directory
}
$TemplateDescription = Read-Host -Prompt "Describe the purpose of the template"
$TemplateTags = Read-Host -Prompt "State the tags that describe the template. Like so: education,stateful,ai"
if ($PSBoundParameters.ContainsKey('ContentPath')) {
    Copy-Item -Path $ContentPath -Destination $PSScriptRoot/$TemplateName -Recurse -ErrorAction Stop
} elseif($null -ne $TemplateFolder) {
    # Control if there is any content in the existing template folder (pre-created to running this script)
    $Content = Get-ChildItem -Path $PSScriptRoot/$TemplateName -Recurse -ErrorAction Stop
}

####
# Splat the values to pass to New-PlasterManifest
####
$ManifestProperties = @{
    AddContent = $false
    Author = [String]$env:USERNAME.ToString()
    Description = "$TemplateDescription"
    ErrorAction = "Stop"
    Id = [guid]::NewGuid()
    Path = "$($PSScriptRoot + "/" + $TemplateName)/PlasterManifest.xml"
    Tags = "$TemplateTags"
    TemplateName = "$TemplateName"
    TemplateType = "Item"
    TemplateVersion = '1.0.0'
    Title = "$TemplateName"
}

if ($PSBoundParameters.ContainsKey('ContentPath') -or $null -ne $Content) {
    $ManifestProperties.AddContent = $true
}

####
# Create the template
####
try {
    New-PlasterManifest @ManifestProperties
    Write-Host "Successfully generated the manifest." -ForegroundColor Green
} catch {
    Write-Error -Message "Generating the manifest failed with > $_"    
}