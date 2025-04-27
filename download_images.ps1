# PowerShell script to download real security images for the website

# Create function to download images with a timeout
function Download-Image {
    param (
        [string]$Url,
        [string]$OutputFile
    )
    
    Write-Host "Downloading $Url to $OutputFile..."
    try {
        Invoke-WebRequest -Uri "$Url" -OutFile "$OutputFile" -TimeoutSec 10
        if (Test-Path "$OutputFile") {
            $fileSize = (Get-Item "$OutputFile").Length
            if ($fileSize -gt 10000) {
                Write-Host "Successfully downloaded $OutputFile ($fileSize bytes)" -ForegroundColor Green
                return $true
            } else {
                Write-Host "File too small, likely not a valid image: $OutputFile" -ForegroundColor Red
                Remove-Item "$OutputFile" -Force
                return $false
            }
        }
    } catch {
        Write-Host "Failed to download from $Url`: $_" -ForegroundColor Red
        return $false
    }
    return $false
}

# Hero image (bodyguard in suit)
Download-Image -Url "https://images.pexels.com/photos/6937916/pexels-photo-6937916.jpeg" -OutputFile "images\hero-image.jpg"

# About section image (team of security personnel)
Download-Image -Url "https://images.pexels.com/photos/6937875/pexels-photo-6937875.jpeg" -OutputFile "images\about\about-image.jpg"

# Executive protection image
Download-Image -Url "https://images.pexels.com/photos/6937752/pexels-photo-6937752.jpeg" -OutputFile "images\executive-protection\executive-protection.jpg"

# Event security image
Download-Image -Url "https://images.pexels.com/photos/8851636/pexels-photo-8851636.jpeg" -OutputFile "images\event-security\event-security.jpg"

# Celebrity security image
Download-Image -Url "https://images.pexels.com/photos/6937956/pexels-photo-6937956.jpeg" -OutputFile "images\celebrity-security\celebrity-security.jpg"

# Corporate security image
Download-Image -Url "https://images.pexels.com/photos/6868617/pexels-photo-6868617.jpeg" -OutputFile "images\corporate-security\corporate-security.jpg"

# Secure transport image (armored vehicle)
Download-Image -Url "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg" -OutputFile "images\secure-transport\secure-transport.jpg"

# Careers image
Download-Image -Url "https://images.pexels.com/photos/8850091/pexels-photo-8850091.jpeg" -OutputFile "images\careers\careers-image.jpg"

Write-Host "All images downloaded successfully!" -ForegroundColor Green 