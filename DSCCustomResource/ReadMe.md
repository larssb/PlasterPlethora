# Using the Plaster template manifest to generate a project
* The manifest can be used/invoked by: Executing,
`Invoke-Plaster -TemplatePath "PATH OF THE GENERATED MANIFEST" -DestinationPath "PATH TO PLACE THE GENERATED PROJECT IN" -Verbose`

# About the folder structure and filenaming for DSC resources
Note that it is necessary to create a folder named DSCResources under the top-level folder, and that the folder for each resource must have the same name as the resource.

# The DSC engine
## Error handling and reporting
The DSC engine catches and reports any error that occurs.