<#
.SYNOPSIS
    1-Click Laptop Migration & Environment Bootstrapper for D:\MY project
.DESCRIPTION
    Installs GitHub CLI, configures Antigravity CLI aliases (agy, antigravity),
    validates Git/Python tooling, and scans all sub-repositories.
#>

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Antigravity Workspace & CLI Bootstrapper (New Laptop Setup)   " -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Check & Install GitHub CLI
Write-Host "[1/4] Checking GitHub CLI (gh)..." -ForegroundColor Yellow
$ghExists = Get-Command gh -ErrorAction SilentlyContinue
if (-not $ghExists) {
    $defaultGhPath = "C:\Program Files\GitHub CLI\gh.exe"
    if (Test-Path $defaultGhPath) {
        Write-Host "   GitHub CLI binary found at $defaultGhPath" -ForegroundColor Green
        $env:Path += ";C:\Program Files\GitHub CLI\"
    } else {
        Write-Host "   Installing GitHub CLI via winget..." -ForegroundColor Cyan
        try {
            winget install --id GitHub.cli --source winget --accept-package-agreements --accept-source-agreements
            $env:Path += ";C:\Program Files\GitHub CLI\"
            Write-Host "   GitHub CLI installed successfully!" -ForegroundColor Green
        } catch {
            Write-Host "   Failed to auto-install GitHub CLI. You can install it manually from https://cli.github.com/" -ForegroundColor Red
        }
    }
} else {
    Write-Host "   GitHub CLI is already installed: $(gh --version | Select-Object -First 1)" -ForegroundColor Green
}

# 2. Configure Antigravity CLI shortcuts (agy, antigravity)
Write-Host "`n[2/4] Configuring Antigravity CLI shortcuts..." -ForegroundColor Yellow
$antigravityIdeBin = "$env:LOCALAPPDATA\Programs\Antigravity IDE\bin"
if (Test-Path $antigravityIdeBin) {
    if ($env:Path -notlike "*$antigravityIdeBin*") {
        $env:Path += ";$antigravityIdeBin"
    }

    # Ensure cmd wrappers exist in bin folder
    $agyCmd = Join-Path $antigravityIdeBin "agy.cmd"
    $antigravityCmd = Join-Path $antigravityIdeBin "antigravity.cmd"
    
    if (-not (Test-Path $agyCmd)) {
        "@echo off`r`n`"$antigravityIdeBin\antigravity-ide.cmd`" %*" | Set-Content -Path $agyCmd -Encoding ASCII
    }
    if (-not (Test-Path $antigravityCmd)) {
        "@echo off`r`n`"$antigravityIdeBin\antigravity-ide.cmd`" %*" | Set-Content -Path $antigravityCmd -Encoding ASCII
    }
    Write-Host "   CLI wrappers 'agy' and 'antigravity' configured in $antigravityIdeBin" -ForegroundColor Green
} else {
    Write-Host "   Antigravity IDE bin directory not found yet ($antigravityIdeBin). Install Antigravity IDE to enable CLI launch." -ForegroundColor DarkYellow
}

# Ensure PowerShell profile has aliases
$profileDir = Split-Path $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
$profileContent = if (Test-Path $PROFILE) { Get-Content -Path $PROFILE -Raw } else { "" }
if ($profileContent -notmatch "function agy") {
    $aliasSnippet = @"
`r`n# Antigravity Shortcuts
function agy { & "antigravity-ide" `$args }
function antigravity { & "antigravity-ide" `$args }
"@
    Add-Content -Path $PROFILE -Value $aliasSnippet -Encoding utf8
    Write-Host "   PowerShell profile aliases updated ($PROFILE)" -ForegroundColor Green
} else {
    Write-Host "   PowerShell profile aliases already present" -ForegroundColor Green
}

# 3. Verify Python & Git
Write-Host "`n[3/4] Verifying Git and Python..." -ForegroundColor Yellow
$gitVer = git --version 2>$null
if ($gitVer) {
    Write-Host "   $gitVer" -ForegroundColor Green
} else {
    Write-Host "   Git not found in PATH! Please install Git from https://git-scm.com/" -ForegroundColor Red
}

$pyVer = python --version 2>$null
if ($pyVer) {
    Write-Host "   $pyVer" -ForegroundColor Green
} else {
    Write-Host "   Python not found in PATH!" -ForegroundColor Red
}

# 4. Scan Sub-Repositories
Write-Host "`n[4/4] Scanning Workspace Sub-Projects..." -ForegroundColor Yellow
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (Test-Path (Join-Path $scriptDir "git_all.py")) {
    python (Join-Path $scriptDir "git_all.py") status
} else {
    Write-Host "   git_all.py not found in current directory." -ForegroundColor Yellow
}

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Workspace is fully initialized and ready on this laptop!      " -ForegroundColor Green
Write-Host "   You can now run 'agy .' or 'git-all status' from any shell.   " -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
