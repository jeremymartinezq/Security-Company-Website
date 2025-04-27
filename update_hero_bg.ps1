# Script to add a professional security image to the hero section background

# 1. Create a CSS file for the custom styles
$cssContent = @"
/* Custom styles for the hero section */
.hero {
    position: relative;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    overflow: hidden;
    background-image: url('../images/vip-bodyguard-service-los-angeles.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

#hero-video {
    display: none; /* Hide the video element */
}
"@

# Create the custom CSS file
Set-Content -Path "css\custom.css" -Value $cssContent
Write-Host "Created custom CSS file with hero background image" -ForegroundColor Green

# 2. Update the index.html to include the custom CSS file
$htmlFile = Get-Content -Path "index.html" -Raw
$updatedHtml = $htmlFile -replace '<link rel="stylesheet" href="css/styles.css">', '<link rel="stylesheet" href="css/styles.css">`n    <link rel="stylesheet" href="css/custom.css">'
Set-Content -Path "index.html" -Value $updatedHtml
Write-Host "Updated index.html to include custom CSS" -ForegroundColor Green

# 3. Copy the image file to ensure it's in the correct location
Copy-Item -Path "images\vip-bodyguard-service-los-angeles.jpg" -Destination "images\vip-bodyguard-service-los-angeles.jpg" -Force
Write-Host "Ensured the background image is in the correct location" -ForegroundColor Green

Write-Host "Hero section background image added successfully!" -ForegroundColor Green 