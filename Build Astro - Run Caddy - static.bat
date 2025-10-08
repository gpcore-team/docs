taskkill /f /im caddy_default.exe

title IW4x Docs - build
start "build" cmd /c npm run build
timeout /t 4
:check
timeout 1
if not exist "d:\WWW\IW4x-Docs\docs\dist\sitemap-index.xml" goto check

timeout /t 2
title Caddy - static website "IW4x Docs - 10.147.18.3:4820"
cd /d "d:\WWW\Caddy\"
start "" cmd /c caddy_default.exe run --config Caddyfile_static
timeout 1
start "" https://10.147.18.3:4820/ru/