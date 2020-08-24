# setup app bypass

# How to use

- Jailbreak your device
- Open terminal and run the following commands
- git clone https://github.com/khevin014/setupapp.git
- cd setupapp
- chmod +x bypass.sh
- run ./bypass.sh
- setup your device as usual

# How to use in case running ./bypass.sh didn't work

- Jailbreak your device
- Open terminal and run the following commands
- git clone https://github.com/khevin014/setupapp.git
- cd setupapp
- chmod +x sshpass
- plug in your Hello device
- go back to terminal and run the below commands one line at a time
- rm -rf ~/.ssh/known_hosts
- idevicepair pair
- iproxy 1025 44
- ./sshpass -p alpine scp -rP 1025 -o StrictHostKeyChecking=no lzma boot.tar.lzma chflags RaptorActivation.pem untethered.dylib com.apple.commcenter.device_specific_nobackup.plist untethered.plist iuntethered.dylib iuntethered.plist respring.sh root@localhost:/var/root/

- Open new terminal window and proceed with the following commands
- ssh root@localhost -p 1025 (if it asks for a password, use <b>alpine</b>)
- mount -o rw,union,update /
- rm -r /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem
- mv RaptorActivation.pem /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem
- chown 444 /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem
- snappy -f / -r `snappy -f / -l | sed -n 2p` -t orig-fs
- mv lzma /usr/bin/
- chmod +x /usr/bin/lzma
- lzma -d -v boot.tar.lzma
- tar -C / -xvf boot.tar && rm -r boot.tar
- mv untethered.plist /Library/MobileSubstrate/DynamicLibraries/
- mv untethered.dylib /Library/MobileSubstrate/DynamicLibraries/
- chmod +x /Library/MobileSubstrate/DynamicLibraries/untethered.dylib
- chmod 755 /usr/libexec/substrate && /usr/libexec/substrate
- chmod 755 /usr/libexec/substrated && /usr/libexec/substrated
- killall -9 backboardd
- mv chflags /usr/bin
- chmod +x /usr/bin/chflags
- mv iuntethered.dylib /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
- mv iuntethered.plist /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist
- chmod +x /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib
- killall -9 SpringBoard mobileactivationd
- rm -r /Library/MobileSubstrate/DynamicLibraries/untethered.dylib
- rm -r /Library/MobileSubstrate/DynamicLibraries/untethered.plist
- chflags nouchg /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist
- rm -r /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist
- mv com.apple.commcenter.device_specific_nobackup.plist /var/wireless/Library/Preferences/
- chflags uchg /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist
- rm -r /var/mobile/Library/Logs/mobileactivationd

##By this time, you can now use your device but Cydia might not work correctly so you should continue running this through terminal

- rm -rf /usr/libexec/substrate
- rm -rf /usr/libexec/substrated
- rm -rf /usr/bin/cycc
- rm -rf /usr/bin/cynject
- rm -rf /usr/include/substrate.h
- rm -rf /usr/lib/cycript0.9
- rm -rf /usr/lib/libsubstrate.dylib
- rm -rf /usr/lib/substrate
- rm -rf /Library/Frameworks/CydiaSubstrate.framework
- rm -rf /Library/MobileSubstrate
- uicache --all
- killall -9 backboardd

- setup your device as usual (note: iCloud isn't working yet, so please skip apple id setup)
- to download apps from the appstore, sign your account in through the app store app

## still under development
- iServices
- Notifications
- Calls & SMS

If you'd like to buy me a beer, https://paypal.me/khevinski014
