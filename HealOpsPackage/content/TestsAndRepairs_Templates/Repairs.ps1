# Define parameters
[CmdletBinding(DefaultParameterSetName="Default")]
[OutputType([Boolean])]
param(
    [Parameter(Mandatory, HelpMessage="Data from the result of testing the state of an IT Service/Entity.")]
    [ValidateNotNullOrEmpty()]
    $TestData
)

#############
# Execution #
#############

$true