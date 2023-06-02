# $PathApp = "$env:ProgramFiles\Mozilla Thunderbird\thunderbird.exe"
# $NameAppTask = "Thunderbird"
# $GroupIdFrench = "BUILTIN\Administrateurs" # English "BUILTIN\Administrators"

# $PathApp = "$env:USERPROFILE\Documents\8.Github\windows-desktop-switcher\desktop_switcher.ahk"
# $NameAppTask = "WindowsDesktopSwitcher"
# $GroupIdFrench = "BUILTIN\Administrateurs" # English "BUILTIN\Administrators"

$PathApp = "$env:USERPROFILE\Documents\1.Scripts\.exe_Files\WindowsVirtualDesktopHelper.exe"
$NameAppTask = "WindowsVirtualDesktopHelper"
$GroupIdFrench = "BUILTIN\Administrateurs" # English "BUILTIN\Administrators"

$A = New-ScheduledTaskAction -Execute $PathApp
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal -GroupId "$GroupIdFrench" -RunLevel Highest
$S = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit 0
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
Register-ScheduledTask "$NameAppTask" -InputObject $D -TaskPath "\NonoOs"

timeout.exe /T 3