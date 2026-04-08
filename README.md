# Jagadeesh Portfolio

This repository contains a static portfolio website built with a single `portfolio.html` file.

## Deploying to GitHub

1. Install Git: https://git-scm.com/downloads
2. Open terminal in `c:\jagadeesh`
3. Run:
   ```powershell
   git init
   git add .
   git commit -m "Initial commit"
   ```
4. Create a new GitHub repository:
   - Go to https://github.com/new
   - Name it `portfolio` or another preferred name.
5. Add the remote and push:
   ```powershell
   git remote add origin https://github.com/<your-username>/<repo>.git
   git branch -M main
   git push -u origin main
   ```
6. Enable GitHub Pages:
   - Go to repository Settings -> Pages
   - Select branch: `main`
   - Select folder: `/ (root)`
   - Save

Your site should be available at `https://<your-username>.github.io/<repo>/`.

## Automatic GitHub Pages deploy

This repo includes `.github/workflows/pages.yml`, which deploys your site automatically on each push to `main`.

## Deployment helper script

A PowerShell helper script is included as `deploy.ps1`, and a batch wrapper is available as `deploy.bat` for systems with restricted execution policy.

The script will:
- Remove all previously tracked files from the repository
- Add the current files
- Commit and force-push to overwrite the remote repository

Run either command from `c:\jagadeesh` with your repository URL:

```powershell
.\deploy.bat "https://github.com/<your-username>/<repo>.git"
```

or:

```powershell
powershell -ExecutionPolicy Bypass -File .\deploy.ps1 -RemoteUrl "https://github.com/<your-username>/<repo>.git"
```

You can also supply a GitHub Pages URL such as:

```powershell
.\deploy.bat "https://<your-username>.github.io/<repo>/"
```

The script will automatically convert that Pages URL into the correct Git repository URL for you.

If you omit `-RemoteUrl`, the script will still initialize the repository and commit locally.

## Notes

- The repository currently contains only `portfolio.html`.
- If you want the page to open at the root URL, rename `portfolio.html` to `index.html`.
