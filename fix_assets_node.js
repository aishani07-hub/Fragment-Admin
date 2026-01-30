const fs = require('fs');
const path = require('path');

const srcRoot = "c:/Users/KIIT0001/Desktop/new_project/web with backend/fragment-webportal/src/assets";
const destRoot = "c:/Users/KIIT0001/Desktop/new_project/web with backend/fragment-admin/src/assets";
const destEditor = path.join(destRoot, 'editor');

if (!fs.existsSync(destEditor)) {
    console.log("Creating editor directory...");
    fs.mkdirSync(destEditor, { recursive: true });
}

// Copy Main Images
try {
    fs.copyFileSync(path.join(srcRoot, 'Blog_Page_Image.png'), path.join(destRoot, 'Blog_Page_Image.png'));
    console.log("Copied Blog_Page_Image.png");
} catch (e) {
    console.error("Error copying Blog_Page_Image:", e.message);
}

try {
    fs.copyFileSync(path.join(srcRoot, 'background-pattern.png'), path.join(destRoot, 'background-pattern.png'));
    console.log("Copied background-pattern.png");
} catch (e) {
    console.error("Error copying background-pattern:", e.message);
}

// Move Editor Icons from assets/ to assets/editor/
const icons = ['bold.png', 'bullets.png', 'doublequotes.png', 'italic.png', 'link.png', 'numbering.png', 'redo.png', 'strikeout.png', 'underline.png', 'undo.png'];

icons.forEach(icon => {
    const wrongPath = path.join(destRoot, icon);
    const rightPath = path.join(destEditor, icon);

    if (fs.existsSync(wrongPath)) {
        try {
            // Check if destination exists (from previous attempts), if so delete it first
            if (fs.existsSync(rightPath)) fs.unlinkSync(rightPath);
            fs.renameSync(wrongPath, rightPath);
            console.log("Moved " + icon);
        } catch (e) {
            console.error("Error moving " + icon + ": " + e.message);
        }
    } else {
        // If not in root, try copying from source webportal
        const srcPath = path.join(srcRoot, 'editor', icon);
        if (fs.existsSync(srcPath)) {
            try {
                fs.copyFileSync(srcPath, rightPath);
                console.log("Copied " + icon + " from webportal");
            } catch (e) {
                console.error("Error copying " + icon + ": " + e.message);
            }
        } else {
            console.log("Could not find " + icon);
        }
    }
});
