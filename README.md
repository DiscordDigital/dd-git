# dd-git
A quick and easy batch file to download from the DiscordDigital repositories using curl.
## Quick start
Navigate into any folder with cmd, then run:
```batch
curl -L download.discord.digital/dd-git > dd.bat
```
Then you can run dd.bat from command line.  
If you have elevated admin permissions you can install/uninstall it by typing:  
```
dd setup
```  
When done correctly you can start navigating to any folder using cmd,  
for example type: `dd ui.py` and it should download ui.pi into that folder.  
**Info:** The URL is a redirect to the github raw page of dd.bat  
This only works when curl is installed. It is installed by default in Windows 10.

*Hint: You can elevate a command prompt by right clicking it and hitting "Run as Administrator"*
