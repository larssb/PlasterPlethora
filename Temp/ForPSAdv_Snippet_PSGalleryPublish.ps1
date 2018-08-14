$Splatting = @{
    Path = "/gitRepos/PowerShellTooling/Public/PowerShellInfo/Out-PSModuleCallGraph.ps1"
    Version = '1.0.0' # http://semver.org ;)
    # GUID will randomly auto-generate for new scripts
    # Only specify GUID if you're going to overwrite existing properties on an updated script version
    Author = 'Lars Bengtsson | https://github.com/larssb | https://bengtssondd.it/'
    Description = 'Use Out-PSModuleCallGraph to generate a call-graph on a PowerShell module. The call-graph helps you get an overview on the inner workings of "X" PowerShell module.
    What commands are the public commands of the module calling, what are those commands calling and so forth. In other words. A way for you to get a look behind the scenes. 
    And thereby an idea into which commands to go-to in specific situations.

    Out-PSModuleCallGraph analyzes the scope of the commands in the module. How they call eachother and finally uses the PowerShell module PSGraph to generate the call-graph. 
    The call-graph is styled with colors and the like in order to heigthen the readability of the graph. It is possible to control parts of the process generating the graph. 
    E.g. the direction of the graph.'
    # CompanyName
    # Copyright
    Tags = @('analysis','call-graph','callgraph','call graph','analyze','static analysis','help','tooling')
    RequiredModules = @{ ModuleName="PSGraph"; ModuleVersion="2.1.21" }  # or any module name published on the PS Gallery
    # ExternalModuleDependencies = 'qwerty' # any module name not published on the PS Gallery
    # RequiredScripts = 'asdf'              # any script published on the PS Gallery
    # ExternalScriptDependencies = 'jkl'    # you get the idea
    ProjectURI = 'https://github.com/larssb/PowerShellTooling'
    LicenseURI = 'https://github.com/larssb/PowerShellTooling/blob/master/LICENSE'
    # IconURI
    # ReleaseNotes   # http://info.sapien.com/index.php/scripting/scripting-modules/get-release-notes
    Force = $true
}
Update-ScriptFileInfo @Splatting