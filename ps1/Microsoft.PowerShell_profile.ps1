$DirectorySperator = [IO.Path]::DirectorySeparatorChar

function prompt {
	$TEMP = $(Get-Date -UFormat "%H:%M") + " "

	$Location = $(Get-Location).path

	if ($Workspace) {
		$PATTERN = $Projects + "*"
		if ($Location -like $PATTERN ) {
			$PROJ = $Location -split "Projects\\"
			if ($PROJ[1]) {
				$TMP = $PROJ[1].split($DirectorySperator)
				$TEMP += $TMP[0]
				if ($TMP[1]) {
					$Location = $PROJ[1] | Split-Path -Leaf
				}
				else {
					$Location = "\\."
				}
			}
		}
	}

	$TEMP += "(" + $($Location | Split-Path -Leaf) + ")> "

	return $TEMP
}
function installTool {

}

function setup {
	$PathSeperator = [IO.Path]::PathSeparator

	$Global:Workspace = Join-Path "$Home" "Workspace"
	$Global:Projects  = Join-Path "$Workspace" "Projects"
	$Global:Tools     = Join-Path "$Workspace" "Tools"
	$Global:Scripts   = Join-Path "$Tools" "Scripts"
	$Global:PSScripts = [IO.Path]::Combine("$Projects", "algos", "ps1")
	$Global:JAVA_HOME = [IO.Path]::Combine("$Tools", "Android", "Android Studio", "jre")

	$Global:GOROOT = "$Tools" + $DirectorySperator + "go"
	$Global:GOPATH = "$Projects" + $DirectorySperator + "algos" + $DirectorySperator + "go"

	## PATHS
	$GITPATH    = $(Join-Path $Tools "git"     | Join-Path -ChildPath "bin")
	$VSCODEPATH = $(Join-Path $Tools "VS Code" | Join-Path -ChildPath "bin")

	$KOTLINPATH = $(Join-Path $Tools "kotlinc" | Join-Path -ChildPath "bin")
	$PYTHONPATH = $(Join-Path $Tools "python"  | Join-Path -ChildPath "bin")

	$MYPATH  = $Scripts    + $PathSeperator
	$MYPATH += $PSScripts  + $PathSeperator

	$MYPATH += $GOROOT     + $PathSeperator
	$MYPATH += $GOPATH     + $PathSeperator
	$MYPATH += $GITPATH    + $PathSeperator
	$MYPATH += $VSCODEPATH + $PathSeperator
	$MYPATH += $KOTLINPATH + $PathSeperator
	$MYPATH += $PYTHONPATH + $PathSeperator
	$MYPATH += $(Join-Path $JAVA_HOME "bin")  + $PathSeperator

	$env:PATH = $MYPATH + $env:PATH
}

setup
Set-Location $Workspace

function SyntaxTheme($Time) {
	if ($Time -eq "Night") {

		# Host UI
		$Host.UI.RawUI.BackgroundColor = 'Black'
		$Host.UI.RawUI.ForegroundColor = 'Cyan'

		# Host Foreground
		$Host.PrivateData.ErrorForegroundColor = 'Red'
		$Host.PrivateData.WarningForegroundColor = 'Yellow'
		$Host.PrivateData.DebugForegroundColor = 'Green'
		$Host.PrivateData.VerboseForegroundColor = 'Blue'
		$Host.PrivateData.ProgressForegroundColor = 'Gray'

		# Host Background
		$Host.PrivateData.ErrorBackgroundColor = 'DarkGray'
		$Host.PrivateData.WarningBackgroundColor = 'DarkGray'
		$Host.PrivateData.DebugBackgroundColor = 'DarkGray'
		$Host.PrivateData.VerboseBackgroundColor = 'DarkGray'
		$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

		# Check for PSReadline
		if (Get-Module -ListAvailable -Name "PSReadline") {
			$options = Get-PSReadlineOption

			# Foreground
			$options.CommandForegroundColor = 'Yellow'
			$options.ContinuationPromptForegroundColor = 'DarkBlue'
			$options.DefaultTokenForegroundColor = 'DarkBlue'
			$options.EmphasisForegroundColor = 'Cyan'
			$options.ErrorForegroundColor = 'Red'
			$options.KeywordForegroundColor = 'Green'
			$options.MemberForegroundColor = 'DarkCyan'
			$options.NumberForegroundColor = 'DarkCyan'
			$options.OperatorForegroundColor = 'DarkGreen'
			$options.ParameterForegroundColor = 'DarkGreen'
			$options.StringForegroundColor = 'Blue'
			$options.TypeForegroundColor = 'DarkYellow'
			$options.VariableForegroundColor = 'Green'

			# Background
			$options.CommandBackgroundColor = 'Black'
			$options.ContinuationPromptBackgroundColor = 'Black'
			$options.DefaultTokenBackgroundColor = 'Black'
			$options.EmphasisBackgroundColor = 'Black'
			$options.ErrorBackgroundColor = 'Black'
			$options.KeywordBackgroundColor = 'Black'
			$options.MemberBackgroundColor = 'Black'
			$options.NumberBackgroundColor = 'Black'
			$options.OperatorBackgroundColor = 'Black'
			$options.ParameterBackgroundColor = 'Black'
			$options.StringBackgroundColor = 'Black'
			$options.TypeBackgroundColor = 'Black'
			$options.VariableBackgroundColor = 'Black'
		}
	}
	else {
		# Host UI
		$Host.UI.RawUI.BackgroundColor = 'White'
		$Host.UI.RawUI.ForegroundColor = 'Cyan'

		# Host Foreground
		$Host.PrivateData.ErrorForegroundColor = 'Red'
		$Host.PrivateData.WarningForegroundColor = 'Yellow'
		$Host.PrivateData.DebugForegroundColor = 'Green'
		$Host.PrivateData.VerboseForegroundColor = 'Blue'
		$Host.PrivateData.ProgressForegroundColor = 'Gray'

		# Host Background
		$Host.PrivateData.ErrorBackgroundColor = 'Gray'
		$Host.PrivateData.WarningBackgroundColor = 'Gray'
		$Host.PrivateData.DebugBackgroundColor = 'Gray'
		$Host.PrivateData.VerboseBackgroundColor = 'Gray'
		$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

		# Check for PSReadline
		if (Get-Module -ListAvailable -Name "PSReadline") {
			$options = Get-PSReadlineOption

			# Foreground
			$options.CommandForegroundColor = 'Yellow'
			$options.ContinuationPromptForegroundColor = 'DarkYellow'
			$options.DefaultTokenForegroundColor = 'DarkYellow'
			$options.EmphasisForegroundColor = 'Cyan'
			$options.ErrorForegroundColor = 'Red'
			$options.KeywordForegroundColor = 'Green'
			$options.MemberForegroundColor = 'DarkGreen'
			$options.NumberForegroundColor = 'DarkGreen'
			$options.OperatorForegroundColor = 'DarkCyan'
			$options.ParameterForegroundColor = 'DarkCyan'
			$options.StringForegroundColor = 'Blue'
			$options.TypeForegroundColor = 'DarkBlue'
			$options.VariableForegroundColor = 'Green'

			# Background
			$options.CommandBackgroundColor = 'White'
			$options.ContinuationPromptBackgroundColor = 'White'
			$options.DefaultTokenBackgroundColor = 'White'
			$options.EmphasisBackgroundColor = 'White'
			$options.ErrorBackgroundColor = 'White'
			$options.KeywordBackgroundColor = 'White'
			$options.MemberBackgroundColor = 'White'
			$options.NumberBackgroundColor = 'White'
			$options.OperatorBackgroundColor = 'White'
			$options.ParameterBackgroundColor = 'White'
			$options.StringBackgroundColor = 'White'
			$options.TypeBackgroundColor = 'White'
			$options.VariableBackgroundColor = 'White'
		}
	}
}

function LinkTheme($Time) {
	$lnk = & ("$Projects\algos\ps1\Get-Link.ps1") "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk"

	# Set Common Solarized Colors
	$lnk.ConsoleColors[0] = "#002b36"
	$lnk.ConsoleColors[8] = "#073642"
	$lnk.ConsoleColors[2] = "#586e75"
	$lnk.ConsoleColors[6] = "#657b83"
	$lnk.ConsoleColors[1] = "#839496"
	$lnk.ConsoleColors[3] = "#93a1a1"
	$lnk.ConsoleColors[7] = "#eee8d5"
	$lnk.ConsoleColors[15] = "#fdf6e3"
	$lnk.ConsoleColors[14] = "#b58900"
	$lnk.ConsoleColors[4] = "#cb4b16"
	$lnk.ConsoleColors[12] = "#dc322f"
	$lnk.ConsoleColors[13] = "#d33682"
	$lnk.ConsoleColors[5] = "#6c71c4"
	$lnk.ConsoleColors[9] = "#268bd2"
	$lnk.ConsoleColors[11] = "#2aa198"
	$lnk.ConsoleColors[10] = "#859900"

	# Set Light/Dark Theme-Specific Colors
	if ($Time -eq "Night") {
		$lnk.PopUpBackgroundColor = 0xf
		$lnk.PopUpTextColor = 0x6
		$lnk.ScreenBackgroundColor = 0x0
		$lnk.ScreenTextColor = 0x1
	}
	else {
		$lnk.PopUpBackgroundColor = 0x0
		$lnk.PopUpTextColor = 0x1
		$lnk.ScreenBackgroundColor = 0xf
		$lnk.ScreenTextColor = 0x6
	}
	$lnk.Save()
}

function NightTheme {
	LinkTheme "Night"
	SyntaxTheme "Night"
	Clear-Host
}

function DayTheme {
	LinkTheme "Day"
	SyntaxTheme "Day"
	Clear-Host
}

if ($Host.UI.RawUI.BackgroundColor -eq "White")
{
	SyntaxTheme "Day"
}
else
{
	SyntaxTheme "Night"
}

function UpdateLink {

	$obj = New-Object -ComObject WScript.Shell
	$link = $obj.CreateShortcut([io.path]::combine($env:APPDATA, "Microsoft", "Windows", "Start Menu", "Programs", "Windows PowerShell", "Windows PowerShell.lnk"))
	$link.Hotkey = "Alt+Ctrl+T"
	$link.Save()

	$obj = New-Object -ComObject WScript.Shell
	$link = $obj.CreateShortcut([io.path]::combine($env:APPDATA, "Microsoft", "Windows", "Start Menu", "Programs", "VS Code.lnk"))
	$link.TargetPath = [io.path]::combine("$Tools", "VS Code", "Code.exe")
	$link.Arguments = "-r"
	$link.Hotkey = "Alt+Ctrl+E"
	$link.Save()

	# $info = @{}
	# $info.Hotkey = $link.Hotkey
	# $info.TargetPath = $link.TargetPath
	# $info.LinkPath = $link.FullName
	# $info.Arguments = $link.Arguments
	# $info.Target = try {Split-Path $info.TargetPath -Leaf } catch { 'n/a'}
	# $info.Link = try { Split-Path $info.LinkPath -Leaf } catch { 'n/a'}
	# $info.WindowStyle = $link.WindowStyle
	# $info.IconLocation = $link.IconLocation

	# New-Object PSObject -Property $info
	# $MYPROFILE = ". \'" + $Projects + $DirectorySperator + "algos" + $DirectorySperator + "ps1" + $DirectorySperator + "Microsoft.PowerShell_profile.ps1'"
	# Write-Output $MYPROFILE > $profile
}

function Get-Shortcut {
	param(
		$path = $null
	)

	$obj = New-Object -ComObject WScript.Shell

	if ($path -eq $null) {
		$pathUser = [System.Environment]::GetFolderPath('StartMenu')
		$pathCommon = $obj.SpecialFolders.Item('AllUsersStartMenu')
		$path = dir $pathUser, $pathCommon -Filter *.lnk -Recurse
	}
	if ($path -is [string]) {
		$path = dir $path -Filter *.lnk
	}
	$path | ForEach-Object {
		if ($_ -is [string]) {
			$_ = dir $_ -Filter *.lnk
		}
		if ($_) {
			$link = $obj.CreateShortcut($_.FullName)

			$info = @{}
			$info.Hotkey = $link.Hotkey
			$info.TargetPath = $link.TargetPath
			$info.LinkPath = $link.FullName
			$info.Arguments = $link.Arguments
			$info.Target = try {Split-Path $info.TargetPath -Leaf } catch { 'n/a'}
			$info.Link = try { Split-Path $info.LinkPath -Leaf } catch { 'n/a'}
			$info.WindowStyle = $link.WindowStyle
			$info.IconLocation = $link.IconLocation

			New-Object PSObject -Property $info
		}
	}
}

function Proj($proj) {
	$setproj = $Projects + $DirectorySperator + $proj
	Set-Location $setproj
}
function Tool($tool) {
	$settool = $Tools + $DirectorySperator + $tool
	Set-Location $settool
}
function Script($script) {
	$setscript = $Scripts + $DirectorySperator + $script
	Set-Location $setscript
}

function update {
	$CWDIR = Get-Location

	Proj algos
	git pull

	$MYPROFILE = "ps1" + $DirectorySperator + "Microsoft.PowerShell_profile.ps1"
	Copy-Item $MYPROFILE $PROFILE

	Set-Location $CWDIR
}

# https://dl.google.com/go/go1.10.3.linux-386.tar.gz

# https://github.com/JetBrains/kotlin/releases/download/v1.2.51/kotlin-compiler-1.2.51.zip
# https://dl.google.com/go/go1.10.3.windows-amd64.zip
# https://www.python.org/ftp/python/3.7.0/python-3.7.0-embed-amd64.zip