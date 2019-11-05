# Set up logging
$log4NetConfigFile = "$PSScriptRoot/Artefacts/Logging/Config/Log4Net.Config.xml"
$LogFilesPath = "$PSScriptRoot/Artefacts/Logging"
$global:log4netLogger = initialize-log4net -log4NetConfigFile $log4NetConfigFile -logfileName "<%=$PLASTER_PARAM_ModuleName -replace ' '%>" -loggerName "Error" -LogFilesPath $LogFilesPath
$global:log4netLoggerDebug = initialize-log4net -log4NetConfigFile $log4NetConfigFile -logfileName "<%=$PLASTER_PARAM_ModuleName -replace ' '%>" -loggerName "Debug" -LogFilesPath $LogFilesPath

# Make the log more viewable.
$log4netLoggerDebug.debug("--------------------------------------------------")
$log4netLoggerDebug.debug("----------------- Logging started ----------------")
$log4netLoggerDebug.debug("------------- $((get-date).ToString()) -----------")
$log4netLoggerDebug.debug("--------------------------------------------------")

# Define the foldernames
$functionFolders = @('Public', 'Private')

# Run over each folder and look for files to include/inject into the PSD1 manifest file
ForEach ($folder in $functionFolders) {
    $folderPath = Join-Path -Path $PSScriptRoot -ChildPath $folder

    If (Test-Path -Path $folderPath) {
        Write-Verbose -Message "Importing from $folder"
        $functions = Get-ChildItem -Path $folderPath -Filter '*.ps1' -Recurse;

        ForEach ($function in $functions) {
            Write-Verbose -Message "  Importing $($function.BaseName)"
            . $($function.FullName)
        }
    }
}
$publicFunctions = (Get-ChildItem -Path "$PSScriptRoot\Public" -Filter '*.ps1' -Recurse).BaseName

# Export the public functions
Export-ModuleMember -Function $publicFunctions