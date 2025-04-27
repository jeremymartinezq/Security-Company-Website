# Update executive protection and corporate security images

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

# Executive protection image - using the bodyguards escorting client image
Copy-Image -SourceFile "images\67f82b821be1257618b33d1ed5c6ed8d.jpg" -DestinationFile "images\executive-protection\executive-protection.jpg"

# Corporate security image - using higher quality image of armed security team
Copy-Image -SourceFile "images\shutterstock_Body-guard.jpg" -DestinationFile "images\corporate-security\corporate-security.jpg"

Write-Host "Executive protection and corporate security images updated successfully!" -ForegroundColor Green 