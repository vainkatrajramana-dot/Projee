@echo off
echo ========================================
echo  ProjectGen AI - GitHub Push Script
echo ========================================
echo.
echo Step 1: Setting up Git identity...
git config --global user.email "your@email.com"
git config --global user.name "vainkatrajramana-dot"
echo.
echo Step 2: Initializing repo...
git init
git remote remove origin 2>nul
git remote add origin https://github.com/vainkatrajramana-dot/PROJECTGEN.git
echo.
echo Step 3: Adding all files...
git add .
echo.
echo Step 4: Committing...
git commit -m "feat: complete Vercel-ready ProjectGen AI"
echo.
echo Step 5: Pushing to GitHub...
git branch -M main
git push -f origin main
echo.
echo ========================================
echo  DONE! Check your GitHub repo now.
echo ========================================
pause
