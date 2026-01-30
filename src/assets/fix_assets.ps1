Start-Transcript -Path "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-admin\src\assets\fix_log.txt"
$root = "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-admin\src\assets"
$editor = "$root\editor"
$webportal = "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-webportal\src\assets"

if (!(Test-Path $editor)) { New-Item -ItemType Directory -Path $editor -Force }

Write-Host "Moving files..."
$files = @("bold.png", "bullets.png", "doublequotes.png", "italic.png", "link.png", "numbering.png", "redo.png", "strikeout.png", "underline.png", "undo.png")
foreach ($file in $files) {
    if (Test-Path "$root\$file") {
        Write-Host "Moving $file"
        Move-Item "$root\$file" "$editor\" -Force -Verbose
    } else {
        Write-Host "$file not found in root, looking in webportal..."
        if (Test-Path "$webportal\editor\$file") {
             Copy-Item "$webportal\editor\$file" "$editor\" -Force -Verbose
        } else {
             Write-Error "Could not find $file anywhere!"
        }
    }
}

Write-Host "Copying main images..."
Copy-Item "$webportal\Blog_Page_Image.png" "$root\" -Force -Verbose
Copy-Item "$webportal\background-pattern.png" "$root\" -Force -Verbose

Write-Host "Verification:"
Get-ChildItem $root
Get-ChildItem $editor
Stop-Transcript
