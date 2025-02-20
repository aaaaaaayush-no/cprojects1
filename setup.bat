@echo off
set SDL2_URL=https://github.com/libsdl-org/SDL/releases/download/release-2.30.0/SDL2.dll
set SDL2_FILE=SDL2.dll

if not exist %SDL2_FILE% (
    echo SDL2.dll not found! Downloading...
    powershell -Command "Invoke-WebRequest -Uri %SDL2_URL% -OutFile %SDL2_FILE%"
    if exist %SDL2_FILE% (
        echo Download complete.
    ) else (
        echo Download failed. Please check your internet connection.
        exit /b
    )
)

echo Running server...
start server.exe

echo Running client...
start client.exe

echo Setup complete. Press any key to exit.
pause
