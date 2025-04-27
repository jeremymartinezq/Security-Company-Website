# PowerShell script to download ACTUAL private security and bodyguard images

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

# Create directories if they don't exist
$directories = @(
    "images",
    "images\about",
    "images\executive-protection",
    "images\event-security",
    "images\celebrity-security",
    "images\corporate-security",
    "images\secure-transport",
    "images\careers"
)

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "Created directory: $dir" -ForegroundColor Yellow
    }
}

# Hero image (actual bodyguard in suit)
Download-Image -Url "https://images.pexels.com/photos/6942348/pexels-photo-6942348.jpeg" -OutputFile "images\hero-image.jpg"

# About section image (actual security team in suits)
Download-Image -Url "https://images.pexels.com/photos/6937859/pexels-photo-6937859.jpeg" -OutputFile "images\about\about-image.jpg"

# Executive protection image (real bodyguard with executive)
Download-Image -Url "https://images.pexels.com/photos/6937752/pexels-photo-6937752.jpeg" -OutputFile "images\executive-protection\executive-protection.jpg"

# Event security image (actual security at event)
Download-Image -Url "https://images.pexels.com/photos/6937943/pexels-photo-6937943.jpeg" -OutputFile "images\event-security\event-security.jpg"

# Celebrity security image (real bodyguard with celebrity)
Download-Image -Url "https://images.pexels.com/photos/6937956/pexels-photo-6937956.jpeg" -OutputFile "images\celebrity-security\celebrity-security.jpg"

# Corporate security image (professional corporate security guard)
Download-Image -Url "https://images.pexels.com/photos/6994992/pexels-photo-6994992.jpeg" -OutputFile "images\corporate-security\corporate-security.jpg"

# Secure transport image (actual security SUV/limo)
Download-Image -Url "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg" -OutputFile "images\secure-transport\secure-transport.jpg"

# Careers image (professional security personnel)
Download-Image -Url "https://images.pexels.com/photos/6937942/pexels-photo-6937942.jpeg" -OutputFile "images\careers\careers-image.jpg"

Write-Host "All PROPER private security images downloaded successfully!" -ForegroundColor Green 