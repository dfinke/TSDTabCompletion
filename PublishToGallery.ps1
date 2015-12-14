
$p = @{
    Name = "TSDTabCompletion"
    NuGetApiKey = $NuGetApiKey
    LicenseUri = "https://github.com/dfinke/TSDTabCompletion/blob/master/LICENSE.txt"
    Tag = "TabCompletion","tsd"
    ReleaseNote = "Enables tab completion for tsd commands"
    ProjectUri = "https://github.com/dfinke/TSDTabCompletion"
}

Publish-Module @p