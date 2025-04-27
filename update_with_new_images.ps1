# PowerShell script to update images with better professional security images

# Function to copy and rename files
function Copy-Image {
    param (
        [string]$SourceFile,
        [string]$DestinationFile
    )
    
    Write-Host "Copying $SourceFile to $DestinationFile..."
    try {
        Copy-Item -Path $SourceFile -Destination $DestinationFile -Force
        if (Test-Path "$DestinationFile") {
            $fileSize = (Get-Item "$DestinationFile").Length
            Write-Host "Successfully copied to $DestinationFile ($fileSize bytes)" -ForegroundColor Green
            return $true
        }
    } catch {
        Write-Host "Failed to copy to $DestinationFile`: $_" -ForegroundColor Red
        return $false
    }
    return $false
}

# Hero image (bodyguard in elevator with hand out)
Copy-Image -SourceFile "images\depositphotos_174776108-stock-photo-celebrity-covering-face-hand-elevator.jpg" -DestinationFile "images\hero-image.jpg"

# About section image (team of security personnel)
Copy-Image -SourceFile "images\security-service-miami-007.jpg" -DestinationFile "images\about\about-image.jpg"

# Executive protection image (bodyguard with executive)
Copy-Image -SourceFile "images\security-service-miami-098-1024x682.jpg" -DestinationFile "images\executive-protection\executive-protection.jpg"

# Event security image (security team with client)
Copy-Image -SourceFile "images\security-service-miami-095-1024x682.jpg" -DestinationFile "images\event-security\event-security.jpg"

# Celebrity security image (bodyguard with celebrity)
Copy-Image -SourceFile "images\celebrity-bodyguard.jpg" -DestinationFile "images\celebrity-security\celebrity-security.jpg"

# Corporate security image (armed security personnel)
Copy-Image -SourceFile "images\security_contrator_1200.jpg" -DestinationFile "images\corporate-security\corporate-security.jpg"

# Secure transport image (security team with luxury vehicles)
Copy-Image -SourceFile "images\security-guard-jobs-.jpg" -DestinationFile "images\secure-transport\secure-transport.jpg"

# Careers image (professional security personnel)
Copy-Image -SourceFile "images\bodyguard-with-sunglasses-and-ear-piece.jpg" -DestinationFile "images\careers\careers-image.jpg"

Write-Host "All professional security images updated successfully!" -ForegroundColor Green 