@echo off

:: Check for Python installation
python --version 2>NUL
if errorlevel 1 (
    echo Python is not installed. Installing now...
    :: Download and install Python silently (replace with your preferred method)
    wget https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe -O python-installer.exe
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_launcher=0
)

:: Check for required libraries
pip freeze > requirements.txt
for /f "delims=" %%i in (requirements.txt) do (
    pip install %%i
)

:: Run the Python script
python automation_clicker.py