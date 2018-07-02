#Requires -Module Plaster
<#
    -   ABOUT   -

    This file generates a Plaster manifest that:
        - Is ready for Pester
        - Which purpose is to create an advanced PowerShell module project
#>
# Make sure that the content folder exists
if ( (Test-Path -Path "$PSScriptRoot/content") -eq $false ) {
    New-Item -Name "content" -ItemType Directory -Force | Out-Null;
}

$manifestProperties = @{
    Author = 'Lars Bengtsson | https://github.com/larssb'
    AddContent = $true
    Description = 'Scaffolds a PowerShell project utilizing advanced functions and a folder structure resembling what should be encapsulated. Furthermore, readies the PowerShell project for Pester tests.'
    Id = [guid]::NewGuid()
    Path = "$PSScriptRoot/content/plasterManifest.xml"
    Tags = 'pester','advanced functions','powershell project','powershell module'
    TemplateName = 'powerShellAdvMod_pester'
    TemplateVersion = '1.0.0'
    Title = "PowerShell Adv. Module with Pester"
}

New-PlasterManifest @manifestProperties -Verbose;