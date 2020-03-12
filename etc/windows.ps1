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
#endregion
#region vim
setx /m VIMCONFIG $HOME\AppData\Local\nvim
setx /m VIMDATA $HOME\AppData\Local\nvim-data
setx /m VIMWORKSPACE D:\User\Desktop
setx /m MYONIRC $HOME\AppData\Roaming\oni\config.tsx
setx /m MYWAKATIMESYNCRC D:\ProgramData\wakatime-sync\config.json
setx /m DISPLAY X
setx /m ARTISTIC_STYLE_OPTIONS $HOME\AppData\Local\nvim\neoformat\astylerc
setx /m UDISK E:\
setx /m CHORMERUNTIME $HOME'\AppData\Local\Google\Chrome\User Date\Default\Extensions'
#endregion
#region git
setx /m GITWORKSPACE $HOME\vimfiles
setx /m GITHUBWORKSPACE $HOME\vimfiles\repos\github.com
#endregion
#region dosbox
setx /m MYDOSBOXRC $HOME\AppData\Local\DOSBox\dosbox-0.74.conf
setx /m DOSBOXWORKSPACE D:\ProgramData\MSDOS
#endregion
#region tex
setx /m TEXRUNTIME D:\bin\texlive\2019\texmf-dist
setx /m TEXWORKSPACE D:\bin\texlive\texmf-local\tex\latex\local
setx /m MYTEXRC D:\ProgramData\texlive\2019\texmf.cnf
#endregion
#region matlab
setx /m MATLAB 'D:\Program Files\MATLAB\R2018a\bin'
setx /m OCTAVERUNTIME G:\bin\octave-5.1.0-w64\mingw64\share\octave\packages
setx /m MYMATLABRC D:\User\Documents\MATLAB\startup.m
setx /m MYGOCTAVERC $HOME\.config\octave\qt-settings
setx /m MYOCTAVERC $HOME\.octaverc
#endregion

