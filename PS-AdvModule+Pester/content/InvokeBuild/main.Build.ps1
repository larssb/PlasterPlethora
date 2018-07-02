###############
#### PREP. ####
###############
# Include: Settings
#. "$PSScriptRoot/settings.Build.ps1"

# Include: build utils
. "$PSScriptRoot/utils.Build.ps1"

<#
    - Shared InvokeBuild settings and prep.
#>
$ModuleRoot = "$BuildRoot/../"
$ModuleName = (Get-Item -Path $ModuleRoot* -Include *.psm1).BaseName
$buildOutputRoot = "$BuildRoot/BuildOutput/$ModuleName"

# Handle the buildroot folder
if(-not (Test-Path -Path $buildOutputRoot)) {
    # Create the dir
    New-Item -Path $buildOutputRoot -ItemType Directory | Out-Null
} else {
    # clean the dir
    try {
        Remove-Item -Path $buildOutputRoot -Recurse -Force
    } catch {
        $_
    }
}

# Determine run mode
$runmode = [Environment]::UserInteractive
###############
#### TASKS ####
###############
<#
    - The below task will be the default build task in the Invoke-Build New-VSCodeTask.ps1 script generated VS Code tasks.json file.
    Simply because it is the first declared task in this build file.
#>
task build {
    
}

task publish {

}

task test {

}
    
task BuildPublish build, publish