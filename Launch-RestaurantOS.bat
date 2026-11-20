@echo off
title RestaurantOS System Launcher
cd /d "%~dp0"

echo ===================================================
echo             RESTAURANTOS SYSTEM LAUNCHER
echo ===================================================
echo.
echo Starting RestaurantOS Server...
echo Directory: %~dp0
echo.

:: Check if port 3000 is already active
netstat -ano | findstr :3000 | findstr LISTENING >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] RestaurantOS is already running on port 3000.
) else (
    echo [INFO] Starting Next.js Dev Server...
    start /min "RestaurantOS Server" cmd /c "npm run dev"
    timeout /t 3 /nobreak >nul
)

echo [INFO] Opening RestaurantOS in browser...
start http://localhost:3000

echo.
echo ===================================================
echo [CUSTOMER PORTAL] http://localhost:3000
echo [ADMIN & POS PANEL] http://localhost:3000/admin
echo.
echo Staff Login: owner@example.com / ChangeMe123!
echo (Click "Autofill" button on login screen for one-click access)
echo ===================================================
timeout /t 5 >nul
exit
