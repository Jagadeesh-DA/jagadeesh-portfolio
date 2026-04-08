param(
  [string]$RemoteUrl
)

if ($RemoteUrl) {
  $RemoteUrl = $RemoteUrl.Trim()
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error 'Git is not installed or not available in PATH. Install Git and try again.'
  exit 1
}

if (-not (Test-Path .git)) {
  git init
}

# Set default git config if not set
if (-not (git config --global user.name)) {
  git config --global user.name "Jagadeesh"
}
if (-not (git config --global user.email)) {
  git config --global user.email "jagadeesh@example.com"
}

# Remove all tracked files to clean the repo
git rm -r . --cached -q 2>$null

git add .

try {
  git commit -m 'Deploy portfolio to GitHub Pages'
} catch {
  Write-Host 'No changes to commit or commit failed. Continuing to deploy.'
}

if ($RemoteUrl) {
  if ($RemoteUrl -match '^https?://([^/.]+)\.github\.io/([^/]+)/?$') {
    $RemoteUrl = "https://github.com/$($matches[1])/$($matches[2]).git"
    Write-Host "Detected GitHub Pages URL and converted to repo URL: $RemoteUrl"
  } elseif ($RemoteUrl -match '^https?://github\.com/[^/]+/[^/]+/?$') {
    if (-not $RemoteUrl.EndsWith('.git')) {
      $RemoteUrl = $RemoteUrl.TrimEnd('/') + '.git'
    }
  }

  git remote remove origin 2>$null
  git remote add origin $RemoteUrl
}

git branch -M main
git push -u origin main --force

