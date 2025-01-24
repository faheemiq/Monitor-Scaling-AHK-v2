# Monitor Scaling(DPI) HotKey AHK v2

Press Pause/Break key to change Monitor Scaling from 100% to 125% and from 125% to 100%.

Created so don't have to manually change the scaling after connecting to an extended display every time.

Copied from this article: [Hotkey For Scaling In Windows 10?](https://www.tenforums.com/graphic-cards/171539-hotkey-scaling-windows-10-a.html)

## Before Use:

Please change the current monitor registry path
  1. Open Registry Editor and in the URL bar paste: Computer\HKEY_CURRENT_USER\Control Panel\Desktop\PerMonitorSettings\
  2. Copy the Monitor ID(you can look at the method below to find your monitor) whose scaling you wish to change on HotKey press and replace it with the previous one in the file.
  
It will tell you if current scaling is not 100% or 125% so you can adjust in the file.

You can also adjust the number of tabs or open and closing delay if your Windows Version is different(current setting is for Windows 11 Pro 24H2).

You can also Auto Start it by pasting the file or it's shortcut in: C:\Users\(UserName)\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\

## Update

Some things which are changed are:
1. Updated to AutoHotKey v2 syntax.
2. Updated the number of tabs to reach the scale setting.
3. Changed the Display Settings windows wait timer from 4 to 2 seconds.
4. Added 3 seconds delay before Display Settings window closing to fix the window being closed before the tabbing was done issue.

## Find the correct monitor ID:

Here is another approach you can try which should show you the monitor your looking for. 
1. Press Windows Key + I to open Windows Settings. 
2. Type 'Display Settings' into the search field and then Click on the 'Display Settings' search result.
3. From there select your monitor(whose scaling you want to change every time you press the hotkey). Then scroll down and in the 'Related Settings' section, click 'Advanced display'.
4. On the screen that appears look for a link that reads: Display Adapter Properties for Display 1. Click it.
5. A new window will appear. Click on the Monitor tab.
6. Click on the Properties button.
7. A new window will appear. Click on the Details tab.
8. There is a dropdown box. Click on it and select Hardware Ids from the list that appears.
9. Information will be listed. In my case it is: MONITOR\CMN153B.
10. Head back over to the registry and look for an entry that begins with the value that came after Monitor above. In my case I am looking for CMN153B and found CMN153B0_2A_07E4_21^007854C671615D991A7F59821F1C5461.
