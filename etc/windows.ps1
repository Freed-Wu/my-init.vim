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

#region system
setx /m FONTS C:\WINDOWS\Fonts
setx /m APPLICATIONS 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
setx /m UDISK E:\
#endregion
#region init.vim
setx /m VIMCONFIG $HOME\AppData\Local\nvim
setx /m VIMDATA $HOME\AppData\Local\nvim-data
setx /m WAKATIME_HOME $HOME/.config/nvim/.vim-wakatime
setx /m GITWORKSPACE $HOME\vimfiles
setx /m GITHUBWORKSPACE $HOME\vimfiles\repos\github.com
setx /m DISPLAY X
#endregion

