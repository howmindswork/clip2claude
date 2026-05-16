Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$img = [System.Windows.Forms.Clipboard]::GetImage()
if ($null -eq $img) { exit }

$dir = "E:\Pictures\Screenshots"
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }

$ts = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$file = "$dir\screenshot_$ts.png"
$img.Save($file, [System.Drawing.Imaging.ImageFormat]::Png)
$img.Dispose()

$wslPath = "/mnt/e/Pictures/Screenshots/screenshot_$ts.png"
[System.Windows.Forms.Clipboard]::SetText($wslPath)
