Start-Transcript -Path "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-admin\src\assets\force_copy_log.txt"
$root = "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-admin\src\assets"
$editor = "$root\editor"
$webportal = "c:\Users\KIIT0001\Desktop\new_project\web with backend\fragment-webportal\src\assets"

Write-Host "Copying PNGs from root to editor..."
$files = Get-ChildItem -Path $root -Filter "*.png"
foreach ($f in $files) {
    if ($f.Name -ne "Blog_Page_Image.png" -and $f.Name -ne "background-pattern.png") {
        Write-Host "Copying $($f.Name) to editor"
        Copy-Item $f.FullName -Destination $editor -Force -Verbose
    }
}

Write-Host "Copying main images from webportal..."
Copy-Item "$webportal\Blog_Page_Image.png" "$root\" -Force -Verbose
Copy-Item "$webportal\background-pattern.png" "$root\" -Force -Verbose

Write-Host "Listing Editor Directory:"
Get-ChildItem $editor
Stop-Transcript
