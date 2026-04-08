@echo off
setlocal
if "%~1"=="" (
  echo Usage: deploy.bat "https://github.com/<your-username>/<repo>.git"
  exit /b 1
)
powershell -ExecutionPolicy Bypass -File "%~dp0deploy.ps1" -RemoteUrl "%~1"
