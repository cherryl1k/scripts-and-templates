param($args)
$ErrorActionPreference = "Stop"

if ($args[0] -eq  "-clean") {
    Write-Host("clean flag set: clearing out ")
    $Clean = 1
}

$buildDir = "build"
$output = Join-Path $buildDir "output.exe"
$compiler = "clang"

$sourceDirs = @("src", "src\gui", "src\backend")  # Add more directorys if needed

# Add together the .c files
$sources = $sourceDirs | ForEach-Object {
    Get-ChildItem -Recurse -Filter *.c -Path $_ | ForEach-Object { $_.FullName }
}

if ($Clean) {
    if (Test-Path $buildDir) {
        Remove-Item $buildDir -Recurse -Force
        Write-Host "Cleaned build directory."
    } else {
        Write-Host "Nothing to clean."
    }
    exit 0
}

if (-Not (Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}

# Build
Write-Host "Compiling to $output..."
& $compiler -Wall -o $output -D_UNICODE -MD $sources -luser32 -lgdi32
Write-Host "Build completed."
