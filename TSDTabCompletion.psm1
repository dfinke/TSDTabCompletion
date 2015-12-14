Import-Module TabExpansionPlusPlus

function TSDCompletion {
    param($wordToComplete, $commandAst)

    Set-Alias -Name nct -Value New-CommandTree

    $commandTree = & {
        nct install 'install definitions using one or more globbing patterns' {
            nct -Argument "--save" "Package will appear in your dependencies"
            nct -Argument "--date" "filter on commit date (string) `r`n: example: '<2012-12-31'"
            nct -Argument "--overwrite" "overwrite existing files"
            nct -Argument "--semver" "filter on version postfix (string, default: latest)
: semver-range | latest | all
: example: '>0.2.4'"
        }

        nct query 'search definitions using one or more globbing patterns' {
            nct -Argument "--info" "display definition file info"
            nct -Argument "--history" "display commit history"
        }

        nct settings 'display config settings'
        nct version 'display tsd version info'
        nct settings 'display config settings'
        nct rate 'check github rate-limit'

        nct reinstall 're-install definitions from config' {
            nct -Argument "--clean" "reinstall from tsd.json and remove all unreferenced files"
            nct -Argument "--overwrite" "overwrite existing files"
            nct -Argument "--save" "save changes to config file"
        }

        nct update 'update definitions from config' {
            nct -Argument "--overwrite" "overwrite existing files"
            nct -Argument "--save" "save changes to config file"
        }

        nct rebundle 'update & clean reference bundle'
        nct link 'link definitions from package managers'
    }

    Get-CommandTreeCompletion $wordToComplete $commandAst $commandTree
}

TSDCompletion

Register-ArgumentCompleter -Command 'tsd'  -Native -ScriptBlock $function:TSDCompletion  -Description 'Complete parameters and arguments to tsd.cmd'