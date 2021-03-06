function Get-VSKeys {
	$jsondata  = Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "De Register.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Focus.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Cancel.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Cursor.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Editor.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Source Browser.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "UI.json") | ConvertFrom-Json

	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Config"   | Join-Path -ChildPath "Key Bindings.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Config"   | Join-Path -ChildPath "Settings.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Config"   | Join-Path -ChildPath "Tasks.json") | ConvertFrom-Json

	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Panel"    | Join-Path -ChildPath "Debug.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Panel"    | Join-Path -ChildPath "Output.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Panel"    | Join-Path -ChildPath "Problems.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Panel"    | Join-Path -ChildPath "Terminal.json") | ConvertFrom-Json

	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Debug.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Explorer.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Extensions.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Find And Replace.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Git.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Side Bar" | Join-Path -ChildPath "Jira.json") | ConvertFrom-Json

	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Widgets"  | Join-Path -ChildPath "Quick Open.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Widgets"  | Join-Path -ChildPath "Find And Replace.json") | ConvertFrom-Json
	$jsondata += Get-Content -Encoding UTF8 $(Join-Path $PSScriptRoot "Widgets"  | Join-Path -ChildPath "Suggest Widget.json") | ConvertFrom-Json

	$jsondata | ConvertTo-Json | Out-File -Encoding UTF8 ([IO.Path]::Combine($env:APPDATA, "Code", "User", "keybindings.json"))
}
