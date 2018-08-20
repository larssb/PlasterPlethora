# Specify the special type 'Ensure' as an enum.
enum Ensure
{
    Absent
    Present
}

# Declare and implement the DSCResource class.
<#
    - EXPLAIN_WHAT_THE_CLASS_DOES
#>
[DSCResource()]
class RENAME_ME {
    ##############
    # PROPERTIES #
    ##############
    <#
        - DOCUMENT_THE_PROPERTY
    #>
    [DscProperty(Key)]
    [CHANGE_TO_VALID_TYPE]$PARAMETER_NAME

    <#
        - DOCUMENT_THE_PROPERTY
    #>
    [DscProperty(Mandatory)]
    [Ensure]$Ensure

    <#
        - DOCUMENT_THE_PROPERTY
    #>    
    [DscProperty(NotConfigurable)]
    [CHANGE_TO_VALID_TYPE]$PARAMETER_NAME

    <#
        - DOCUMENT_THE_PROPERTY
    #>    
    [DscProperty()]
    [CHANGE_TO_VALID_TYPE]$PARAMETER_NAME

    ###########
    # METHODS #
    ###########
    <#
        - Get(), Set() and Test() method implementations. Equivalent of Get-TargetResource, Set-TargetResource and Test-TargetResource.
        
        - Get() == Returns an instance of the class which is used to check the Key resource properties and return their current settings
        on the node in the format of a hash table. This detail is then used by the Local Configuration Manager to determine whether it 
        actually needs to run the Set-Target Resource function to apply the desired state.
        - Set() == Sets the resource to the desired state.
        - Test() == Shows whether the resource is in a desired state. Should return True or False to check on this.
    #>
    ####
    # GET METHODS
    ####
    <#
        - DOCUMENT_THE_METHOD

        TODO: DO_THE_FINAL_IMPLEMENTATION
    #>
    [RENAME_ME_TO_THE_NAME_OF_THIS_CLASS] Get() {
        $present = $this.TEST_HELPER_METHOD_TO_CALL($this.PARAMETER_TO_USE)

        if ($present) {
           #

           $this.Ensure = [Ensure]::Present
        } else {
            #

            $this.Ensure = [Ensure]::Absent
        }

        # Return
        return $this
    }

    ####
    # TEST METHODS
    ####
    <#
        - The base method that tests for the state of this resource. 

        TODO: DO_THE_FINAL_IMPLEMENTATION
    #>
    [bool] Test() {
        $present = $this.TEST_HELPER_METHOD_TO_CALL($this.PARAMETER_TO_USE)
        
        if ($this.Ensure -eq [Ensure]::Present) {
            return $present
        } else {
            return -not $present
        }
    }

    <# 
        - DOCUMENT_THE_METHOD

        TODO: DO_THE_FINAL_IMPLEMENTATION
    #>
    [bool] TEST_HELPER_METHOD_TO_CALL() {
        $present )= $true

        # 
        $ = CODE_TO_TEST_STATE

        if ($) {
            $present = PowerShell_BOOLEAN
        } elseif ($) {
            throw
        }

        # Return the result of the test
        return $present
    }

    ####
    # ENSURE STATE METHODS ( Set() )
    ####
    <#
        - DOCUMENT_THE_METHOD

        TODO: DO_THE_FINAL_IMPLEMENTATION
    #>
    [void] Set() {
        $resourceStateResult = $this.TEST_HELPER_METHOD_TO_CALL($this.PARAMETER_TO_USE)

        if ($this.Ensure -eq [Ensure]::Present) {
            if (-not $resourceStateResult) {
                #
                $this.SET_HELPER_METHOD_TO_CALL()
            }
        } else {
            if ($resourceStateResult) {
                #

            }
        }
    }

    <#
        - DOCUMENT_THE_METHOD

        TODO: DO_THE_FINAL_IMPLEMENTATION
    #>
    [void] SET_HELPER_METHOD_TO_CALL() {
        #

    }
}