$fontUrls = @{
    "Inter-Regular.ttf" = "https://github.com/google/fonts/raw/main/ofl/inter/static/Inter-Regular.ttf"
    "Inter-Medium.ttf" = "https://github.com/google/fonts/raw/main/ofl/inter/static/Inter-Medium.ttf"
    "Inter-SemiBold.ttf" = "https://github.com/google/fonts/raw/main/ofl/inter/static/Inter-SemiBold.ttf"
    "Inter-Bold.ttf" = "https://github.com/google/fonts/raw/main/ofl/inter/static/Inter-Bold.ttf"
}

foreach ($font in $fontUrls.GetEnumerator()) {
    $outputPath = "assets/fonts/$($font.Key)"
    Write-Host "Downloading $($font.Key)..."
    Invoke-WebRequest -Uri $font.Value -OutFile $outputPath
} 