#Requires -Module Plaster
<#
    -   ABOUT   -

    This file generates a Plaster manifest that:
        - Is ready for scaffolding a HealOps packages
#>
# Make sure that the content folder exists
if ( (Test-Path -Path "$PSScriptRoot/content") -eq $false ) {
    New-Item -Name "content" -ItemType Directory -Force | Out-Null
}

$manifestProperties = @{
    Author = [String]$env:USERNAME.ToString()
    AddContent = $true
    Description = 'Scaffolds a HealOps package. With the folder structure and anything needed to quickly get going when programming *.Tests.ps1 and *.Repairs.ps1 files and the
    other related content required to build a HealOps package.'
    Id = [guid]::NewGuid()
    Path = "$PSScriptRoot/content/plasterManifest.xml"
    Tags = 'HealOps','HealOps package','monitoring','healing','self-healing'
    TemplateName = 'HealOpsPackage'
    TemplateVersion = '1.0.0'
    Title = "HealOps Package"
}

try {
    New-PlasterManifest @manifestProperties

    # Inform
    Write-Host "Successfully generated the manifest." -ForegroundColor Green
} catch {
    Write-Error -Message "Generating the manifest failed with > $_"    
}