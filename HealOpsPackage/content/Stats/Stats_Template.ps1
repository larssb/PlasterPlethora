<#
.DESCRIPTION
    LONG_DESCRIPTION
.INPUTS
    <none>
.OUTPUTS
    A [System.Collections.Generic.List`1[MetricItem]] type collection, containing the [MetricItem]'s the function collected.
.NOTES
    Set to output [Void] in order to comply with the PowerShell language. Also if [Void] wasn't used, an error would be thrown when invoking the function.
    As the output type [System.Collections.Generic.List`1[MetricItem]] would not be known by PowerShell, when this function is invocated.
.EXAMPLE
    PS C:\> USAGE_EXAMPLE
    EXPLAIN_THE_EXAMPLE
#>

# Define parameters
[CmdletBinding(DefaultParameterSetName = "Default")]
[OutputType([Void])]
Param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    $NAMEOFPARAMETER
)

#############
# Execution #
#############
Begin {
    <#
        - Declare variables, that will be re-used throughout the script.
    #>
    # YOUR_COMMENT

    # Initiate a collection to hold stats data.
    $MetricsCollection = Out-MetricsCollectionObject
}
Process {
    <#
        - YOUR_COMMENT
    #>
    # YOUR_CODE

    # Get a MetricItem object and populate its properties
    $MetricItem = Out-MetricItemObject
    $MetricItem.Metric = "name.of.the.metric"
    $MetricItem.MetricData = @{
        "Value" = VALUE
    }

    # Add the result to the Stats collection.
    $MetricsCollection.Add()
}
End {
    # Return the gathered stats to caller.
    ,$MetricsCollection
}