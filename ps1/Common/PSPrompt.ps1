function prompt {
	$TEMP = $(Get-Date -UFormat "%H:%M") + " "

	$Location = $(Get-Location).path

	if ($Workspace) {
		$PATTERN = $Projects + "*"
		if ($Location -like $PATTERN ) {
			$PROJ = $Location -split $("Projects")
			if ($PROJ[1]) {
				$TMP = $PROJ[1].split($DirectorySperator)
				$TEMP += $TMP[1]
				if ($TMP[2]) {
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
