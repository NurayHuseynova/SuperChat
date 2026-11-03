@echo off
cd /d "%~dp0"
echo SuperChat running at http://localhost:8000  (Ctrl+C to stop)
python -m http.server 8000
