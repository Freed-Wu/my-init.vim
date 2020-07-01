#region 关键代码：强迫以管理员权限运行
$currentWi = [Security.Principal.WindowsIdentity]::GetCurrent()
	$currentWp = [Security.Principal.WindowsPrincipal]$currentWi
if( -not $currentWp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
	$boundPara = ($MyInvocation.BoundParameters.Keys | foreach{
			'-{0} {1}' -f  $_ ,$MyInvocation.BoundParameters[$_]} ) -join ' '
		$currentFile = (Resolve-Path  $MyInvocation.InvocationName).Path

		$fullPara = $boundPara + ' ' + $args -join ' '
		Start-Process "$psHome\powershell.exe"   -ArgumentList "$currentFile $fullPara"   -verb runas
		return
}
#endregion

#region init.vim
setx /m XDG_CONFIG_HOME $HOME\AppData\Local
setx /m XDG_DATA_HOME $HOME\AppData\Local\nvim-data
setx /m WAKATIME_HOME $XDG_DATA_HOME
setx /m GITHUBWORKSPACE $HOME\vimfiles\repos\github.com
#endregion

