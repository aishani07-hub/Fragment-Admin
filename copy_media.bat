@echo off
xcopy "..\fragment-webportal\src\assets\Blog_Page_Image.png" "src\assets\" /Y
xcopy "..\fragment-webportal\src\assets\background-pattern.png" "src\assets\" /Y
if exist "src\assets\Blog_Page_Image.png" echo SUCCESS_BLOG
if exist "src\assets\background-pattern.png" echo SUCCESS_BG
