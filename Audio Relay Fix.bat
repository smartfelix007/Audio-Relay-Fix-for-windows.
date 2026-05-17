@echo off
title Audio Relay Launcher
color 0A
mode con: cols=95 lines=38

:: Capture your real user profile path BEFORE elevating to Admin
if not defined REAL_USER_PROFILE set "REAL_USER_PROFILE=%USERPROFILE%"

:: Check for Administrative Privileges and Auto-Elevate
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [STATUS] Requesting Administrator Privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: Force script back to its launching folder after elevation
cd /d "%~dp0"

:menu
cls
echo =========================================================================================
echo  ***  *   * ****  ***  ***     ****  ***** *      ***  *   *    ***** *** *   * 
echo  *   * *   * *   *  *  *   *    *   * *     *     *   *  * *     *      *   * *  
echo  ***** *   * *   *  *  *   *    ****  ****  *     *****   *      ****   *    *   
echo  *   * *   * *   *  *  *   *    *  *  *     *     *   *   *      *      *   * *  
echo  *   *  ***  ****  ***  ***     *   * ***** ***** *   *   *      *     *** *   *
=========================================================================================
echo.
echo /*******************************************************
echo * Copyright (c) [2026]
echo * This code is free to use Please don't modify.
echo * Copying, selling, and distributing for profit is strictly prohibited.
echo *******************************************************/
echo.
echo  [ DEVELOPER DETAILS ]
echo  --------------------------------------------------
echo  Name:    Felix Luis Fernandes
echo  Email:   Smartfelix007@gmail.com
echo  Country: India
echo  Phone:   +91-8329078820
echo  --------------------------------------------------
echo  Note: Do not close this CMD otherwise audio Relay will EXIT.
echo  --------------------------------------------------
echo.
echo  Press ENTER to continue to fix and start Audio Relay...
pause > nul

:start_app
echo.
echo  [STATUS] Navigating to AudioRelay directory...

:: --- YOUR CORE COMMANDS (SAFEGUARDED FOR ADMIN MODE) ---
cd /d "c:\Program Files (x86)\AudioRelay"
.\runtime\bin\java.exe -cp "app/audiorelay.jar" com.azefsw.audioconnect.desktop.app.MainKt > "%REAL_USER_PROFILE%\desktop\output.log" 2>&1
:: -------------------------------------------------------

echo  [STATUS] Process finished. Check output.log on your desktop for details.
echo.
echo  Press any key to return to menu...
pause > nul
goto menu
