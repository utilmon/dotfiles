Set-Alias -Name vi -Value nvim
Set-Alias -Name py -Value python
Set-Alias -Name open -Value Explorer
oh-my-posh init pwsh --config "C:\Users\qwane\Documents\WindowsPowerShell\mytheme.omp.json" | Invoke-Expression

Import-Module PSReadLine
Import-Module syntax-highlighting

# Make the 'End' key accept the PSReadLine inline suggestion (autocomplete).
Set-PSReadLineKeyHandler -Chord "End" -Function ForwardChar
Set-PSReadLineKeyHandler -Chord "Ctrl+Spacebar" -Function Forwardword
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function Forwardword

## Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

$env:DISPLAY = "localhost:0"