# PlasterPlethora

This is a collection of Plaster templates. In other words a plethora of Plaster templates. For your convenience and ease of use. I started this project as I was in need of a good way to share Plaster templates. Looking at the issue discussion in the Plaster project (e.g. https://github.com/PowerShell/Plaster/issues/224 or https://github.com/PowerShell/Plaster/issues/213 and there are more) I also thought that this is a general need of the PowerShell community. So here we are.

__Plaster__
Plaster is a scaffolding engine for PowerShell related projects. Like [yeoman][<http://yeoman.io/>] is for WebApps. It helps you define, via a manifest file, the structure, the included tools and so forth. Of a module to be generated with Plaster. This makes it easy to generated e.g. a new PowerShell module when you are in need of that. At the same time you don't "forget" to include logging or a specific structure of a project. You thereby indirectly free brain capacity to think about the real work at hand instead of navigating the standard details of creating 'x' coding project.

__Hopes__
I hope to kickstart a way to share Plaster templates in the PowerShell community. Doing it here on GitHub might certainly not be the perfect way. But, it is a start. I hope that as time goes by. More people will join the project. Add templates. And that we together can find a good way of sharing Plaster templates.

## Getting started with the templates

1. Make sure that you have installed Plaster.
        2. If you haven't it can be done by `Install-Module -Name Plaster` (which will download the module from the PSGallery).
2. Look at the code of the template that you wish to use. In order to feel safe about the code. This is always a good idea!
3. Download the latest release from the [releases][<https://github.com/larssb/PlasterPlethora/releases>] tab.
4. Extract the release to your favorite folder for containing Plaster templates.
5. Use either:
        5. The Invoke-Plaster cmdlet by pointing it to the `content` folder of the template you wish to use. This will execute Plaster on the template manifest inside the `content` folder and generate a project based on the input you give to the template.
        5. The Get-PlasterTemplate cmdlet to lightly inspect the templates in the folder to which you extracted the templates. `...this cmdlet will provide details about each individual template that was retrieved....`
                5. Then use Invoke-Plaster to genereate a project.

## The structure of the templates

### Naming

The naming of a template follows this "convention" > [LANGUAGE-ProjectType+Tooling]. To which there is three parts.

    - LANGUAGE = the main programming language which the generated project will be based on.
    - `-` = a delimiter. Delimiting the `LANGUAGE` part and the `ProjectType` part.
    - ProjectType = The type of project represented by the template. E.g. if the project is an `advanced PowerShell project` the type could be = AdvModule AKA an advanced module.
    - `+` = a delimiter. Delimiting the `ProjectType` part and the `Tooling` parts of the naming convention.
    - Tooling = a `+` character delimited list of tools being used in the template. E.g. `PS-AdvModule+Pester` is a template generating a advanced PowerShell module which utilizes Pester.

### Folders

__Required structure__
"TEMPLATE_NAME" > The root folder
└───content > The folder containing the actual contents of the template
    ├───"SUB_FOLDER"
    │   └───"SUB_SUB_FOLDER"
    ├───"SUB_FOLDER"
    |───PlasterManifest.xml > the Plaster template manifest file. This is the file in which you define the specifics of the project to be generated.

Here is a good example of what could be the structure of a Plaster template.

PS-AdvModule+Pester > The root folder
└───content > The folder containing the actual contents of the template
    ├───docs
    │   └───en-US
    ├───dummyFiles
    ├───editor
    │   └───VSCode
    │       ├───extensions
    │       └───snippets
    ├───git_SCM
    ├───InvokeBuild
    │   └───GeneralFiles
    ├───logging
    ├───Pester_Tests
    └───PSScriptAnalyzer

## Various

Thank you for reading along and I hope you will enjoy the project.