<#
    -   ABOUT   -

    This file generates a Plaster manifest that:
        - Is ready for Pester
        - Which purpose is to help you quickly get going in regards to programming custom DSC resources.
#>
# Make sure that the content folder exists
if ( (Test-Path -Path "$PSScriptRoot/content") -eq $false ) {
    New-Item -Name "content" -ItemType Directory -Force | Out-Null;
}

$manifestProperties = @{
    Author = 'YOUR_NAME | URI'
    AddContent = $true
    Description = 'Scaffolds a DSC custom resource project. Making it easy to get started writting DSC custom resources.'
    Id = [guid]::NewGuid()
    Path = "$PSScriptRoot/content/plasterManifest.xml"
    Tags = 'pester','dsc','resource','custom','powershell'
    TemplateName = 'dscCustomResource'
    TemplateVersion = '1.0.0'
    Title = "DSC Custom resource Plaster template."
}

New-PlasterManifest @manifestProperties -Verbose;