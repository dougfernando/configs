#
& 'C:\Program Files\PowertTab\Init-TabExpansion.ps1' `
     -ConfigurationLocation 'C:\Documents and Settings\douglas\My Documents\WindowsPowerShell' 
################ End of PowerTab Initialisatie Code ##########################
#

$Documents = (gp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders").Personal

$SCRIPTS = "$HOME\scripts"
$env:EDITOR = 'gvim.exe'
$maestro = "C:\_projects\maestro"

set-alias grep select-string

function ll { Get-ChildItem | Format-Wide -Column 5 }

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}


function prompt {
   # our theme
   $host.ui.RawUI.WindowTitle = "PowerShell @ " + $(get-location)
   $cdelim = [ConsoleColor]::DarkCyan
   $chost = [ConsoleColor]::Green
   $cpref = [ConsoleColor]::Cyan
   $cloc = [ConsoleColor]::Magenta
 
   write-host "$([char]0x0A7) " -n -f $cpref
   write-host ("kenobi-box") -n -f $chost
   write-host ' {' -n -f $cdelim
   write-host (shorten-path (pwd).Path) -n -f $cloc
   write-host '}' -n -f $cdelim
   return ' '
}

