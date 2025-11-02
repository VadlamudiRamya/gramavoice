@echo off
echo ============================================
echo   Push GramaVoice to GitHub
echo ============================================
echo.

REM Check if remote exists
git remote -v >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Step 1: Setting up GitHub connection...
    echo.
    echo Please provide your GitHub repository URL:
    echo Example: https://github.com/YOUR_USERNAME/gramavoice.git
    echo.
    set /p GITHUB_URL="Enter your GitHub repository URL: "
    
    if "%GITHUB_URL%"=="" (
        echo.
        echo ERROR: GitHub URL is required!
        echo.
        echo Instructions:
        echo 1. Go to https://github.com
        echo 2. Create a new repository named "gramavoice"
        echo 3. Copy the repository URL
        echo 4. Run this script again
        pause
        exit /b 1
    )
    
    echo.
    echo Adding remote repository...
    git remote add origin %GITHUB_URL%
    if %errorlevel% neq 0 (
        echo ERROR: Failed to add remote
        pause
        exit /b 1
    )
    
    echo Remote added successfully!
    echo.
)

REM Check current branch
git branch --show-current >nul 2>&1
for /f %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

echo Step 2: Renaming branch to 'main' (if needed)...
if "%CURRENT_BRANCH%"=="master" (
    git branch -M main
    echo Branch renamed to 'main'
) else (
    echo Already on 'main' branch
)

echo.
echo Step 3: Pushing code to GitHub...
echo.
echo Note: You may be prompted for GitHub username and password/token
echo.

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ============================================
    echo   SUCCESS! Code pushed to GitHub!
    echo ============================================
    echo.
    echo Your repository URL:
    git remote get-url origin
    echo.
    echo Next step: Go to Render.com and connect this repository!
    echo.
) else (
    echo.
    echo ============================================
    echo   PUSH FAILED
    echo ============================================
    echo.
    echo Possible issues:
    echo 1. Repository doesn't exist on GitHub - create it first
    echo 2. Authentication failed - use Personal Access Token
    echo 3. Wrong repository URL
    echo.
    echo To fix:
    echo 1. Create repo at https://github.com/new
    echo 2. Use GitHub Personal Access Token as password
    echo    (Settings ^> Developer settings ^> Personal access tokens)
    echo.
)

pause

