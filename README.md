# PlasterPlethora

This is a useful collection of Plaster templates. In other words a plethora of Plaster templates. For your convenience and ease of use. 

I started this project as I was in need of a good way to share Plaster templates. Looking at the issue discussion in the Plaster project (e.g. https://github.com/PowerShell/Plaster/issues/224 or https://github.com/PowerShell/Plaster/issues/213 and there are more) I also thought that this is a general need of the PowerShell community. So here we are.

__Plaster__
Plaster is a scaffolding engine. Like [yeoman](http://yeoman.io/) is for WebApps. It helps you define, via a manifest file, the structure, included tools and so forth. For a module to be generated with Plaster. This makes it easy to scaffold e.g. a new PowerShell module. E.g. to avoid forgetting to include logging.

Your brain capacity is hereby freed to think about the real challenge at hand, instead of navigating the standard details of creating 'x' coding project.

__Hopes__
I hope to kickstart a way to share Plaster templates. Doing it here on GitHub might certainly not be the perfect way. But, it's a start none the less. I hope, as time goes by. More people will join the project. Add templates.

Together can find a good way of sharing Plaster templates.

## Pre-requisites

1. Plaster has to be installed
    1. If you haven't, it can be done by executing `Install-Module -Name Plaster` (which will download the module from the PSGallery & install it)
1. Download the latest Plaster Plethora release from [releases](https://github.com/larssb/PlasterPlethora/releases) or `git clone` it
    1. If you downloaded it, extract the release to a folder of your liking

## Templating

### Templates included

Please see the [template list](https://github.com/larssb/PlasterPlethora/wiki/Templates#template-list) wiki page for an overview and details on the included templates

### Using the included templates

1. Look at the code of the template that you wish to use. In order to feel safe about the code. This is always a good idea! (`Get-PlasterTemplate` can be used to inspect a template)
1. To use a specific template: Use the `Invoke-Plaster` cmdlet by pointing it to the `content` folder of the template you wish to use. This will execute Plaster on the template manifest inside the `content` folder and generate a project based on the input you give to the template. Here is an example: `Invoke-Plaster -TemplatePath .\PS-AdvModule+InvokeBuild+Log4Net+Pester\content -DestinationPath ..\testing`

### Creating a new Plaster template

1. If you have content, that you want included in the template. Start by either creating a folder in the root of the **PlasterPlethora** folder and put your content here or you can alternatively use the `-ContentPath` parameter to the `CreatePlasterTemplate` script. In order to specify an alternative folder where you have stored your content
1. Then execute: `./CreatePlasterTemplate.ps1`

## The structure of the templates

### Naming

The naming of a template follows this "convention" > [LANGUAGE-ProjectType+Tooling]. To which there is three parts.

- LANGUAGE = the main programming language which the generated project will be based on.
- `-` = a delimiter. Delimiting the `LANGUAGE` part and the `ProjectType` part.
- ProjectType = The type of project represented by the template. E.g. if the project is an `advanced PowerShell project` the type could be = AdvModule AKA an advanced module.
- `+` = a delimiter. Delimiting the `ProjectType` part and the `Tooling` parts of the naming convention.
- Tooling = a `+` character delimited list of tools being used in the template. E.g. `PS-AdvModule+Pester` is a template generating a advanced PowerShell module which utilizes Pester.

### Folders

__Suggested folder structure__

```txt
"TEMPLATE_NAME" > The root folder
└───"SUB_FOLDER"
└───"SUB_SUB_FOLDER"
    └───"SUB_FOLDER"
|───PlasterManifest.xml > the Plaster template manifest file. This is the file in which you define the specifics of the entity to be scaffolded.
```

Here is a good example of what could be the structure of a Plaster template.

```txt
PS-AdvModule+Pester > The root folder
└───Docs
    └───en-US
    ├───OverOfMyApp.md
└───Editor
    └───VSCode
    ├───extensions
    └───snippets
└───InvokeBuild
└───Logging
└───Tests
└───PSScriptAnalyzer
|───PlasterManifest.xml
```