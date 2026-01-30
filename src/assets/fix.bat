@echo off
if not exist editor mkdir editor
move *.png editor\
copy "..\..\..\fragment-webportal\src\assets\Blog_Page_Image.png" .
copy "..\..\..\fragment-webportal\src\assets\background-pattern.png" .
dir
dir editor
