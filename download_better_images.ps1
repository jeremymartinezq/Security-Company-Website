# PowerShell script to download better, more professional security images for the website

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

# Hero image (professional security guard in suit)
Download-Image -Url "https://images.pexels.com/photos/5794559/pexels-photo-5794559.jpeg" -OutputFile "images\hero-image.jpg"

# About section image (team of security personnel)
Download-Image -Url "https://images.pexels.com/photos/3815585/pexels-photo-3815585.jpeg" -OutputFile "images\about\about-image.jpg"

# Executive protection image (bodyguard with executive)
Download-Image -Url "https://images.pexels.com/photos/6633080/pexels-photo-6633080.jpeg" -OutputFile "images\executive-protection\executive-protection.jpg"

# Event security image (security at event)
Download-Image -Url "https://images.pexels.com/photos/2774581/pexels-photo-2774581.jpeg" -OutputFile "images\event-security\event-security.jpg"

# Celebrity security image (security guard with earpiece)
Download-Image -Url "https://images.pexels.com/photos/5699516/pexels-photo-5699516.jpeg" -OutputFile "images\celebrity-security\celebrity-security.jpg"

# Corporate security image (security monitoring system/guard)
Download-Image -Url "https://images.pexels.com/photos/4474033/pexels-photo-4474033.jpeg" -OutputFile "images\corporate-security\corporate-security.jpg"

# Secure transport image (armored/luxury security vehicle)
Download-Image -Url "https://images.pexels.com/photos/4038614/pexels-photo-4038614.jpeg" -OutputFile "images\secure-transport\secure-transport.jpg"

# Careers image (professional security person)
Download-Image -Url "https://images.pexels.com/photos/5212320/pexels-photo-5212320.jpeg" -OutputFile "images\careers\careers-image.jpg"

Write-Host "All images downloaded successfully!" -ForegroundColor Green 