# Define parameters
[CmdletBinding()]
[OutputType([Boolean])]
param(
    [Parameter(Mandatory, ParameterSetName="Default")]
    [ValidateNotNullOrEmpty()]
    $TestData
)

#############
# Execution #
#############

$true