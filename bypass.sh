#!/bin/bash

if ! which curl >> /dev/null; then
    echo "Error: curl not found"
    exit 1
fi

if ! which iproxy >> /dev/null; then
    echo "Error: iproxy not found"
    exit 1
fi

rm -rf ~/.ssh/known_hosts

cd "`dirname "$0"`"

idevicepair pair

iproxy 1025 44 2> /dev/null &

echo '#!/bin/bash' > respring.sh
echo 'mount -o rw,union,update /' >> respring.sh
echo 'snappy -f / -l' >> respring.sh
echo 'snappy -f / -r com.apple.os.update-5ADB2EAC7632F46066E29885799D7619A65414FE --to orig-fs' >> respring.sh
echo 'snappy -f / -l' >> respring.sh
echo 'find /private/var/containers/Data/System/ -iname 'internal'' >> respring.sh
echo 'mv RaptorActivation.pem /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem' >> respring.sh
echo 'mv lzma /sbin/lzma' >> respring.sh
echo 'mv chflags /sbin/chflags' >> respring.sh
echo 'chmod 755 /sbin/lzma' >> respring.sh
echo 'chmod 755 /sbin/chflags' >> respring.sh
echo 'mv boot.tar.lzma /boot.tar.lzma' >> respring.sh
echo 'cd / && lzma -d -v boot.tar.lzma' >> respring.sh
echo 'cd / && tar -xvf boot.tar' >> respring.sh
echo 'cd / && rm boot.tar.lzma' >> respring.sh
echo 'cd / && rm boot.tar' >> respring.sh
echo '/usr/libexec/substrate' >> respring.sh
echo 'killall backboardd' >> respring.sh
echo 'mv iuntethered.plist /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist' >> respring.sh
echo 'mv iuntethered.dylib /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib' >> respring.sh
echo 'launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist' >> respring.sh
echo 'launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist' >> respring.sh
echo 'rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.dylib' >> respring.sh
echo 'rm /Library/MobileSubstrate/DynamicLibraries/iuntethered.plist' >> respring.sh
echo 'killall backboardd' >> respring.sh
echo 'launchctl unload /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist' >> respring.sh
echo 'launchctl load /System/Library/LaunchDaemons/com.apple.mobileactivationd.plist' >> respring.sh
echo 'echo 'chflags -R nouchg  /private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist' >> respring.sh
echo 'mv com.apple.purplebuddy.plist /private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist' >> respring.sh
echo 'chflags uchg /private/var/mobile/Library/Preferences/com.apple.purplebuddy.plist' >> respring.sh
echo 'chflags -R nouchg  /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist' >> respring.sh
echo 'mv com.apple.commcenter.device_specific_nobackup.plist /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist' >> respring.sh
echo 'chflags uchg /var/wireless/Library/Preferences/com.apple.commcenter.device_specific_nobackup.plist' >> respring.sh
echo 'mkdir /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/activation_records/' >> respring.sh
echo 'mv activation_record.plist /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/activation_records/activation_record.plist' >> respring.sh
echo 'cp /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/internal/data_ark.plist /data_ark.plist' >> respring.sh
echo 'rm data_ark.plist' >> respring.sh
echo 'chflags -R nouchg /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/internal/data_ark.plist' >> respring.sh
echo 'mv /data_ark.plist /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/internal/data_ark.plist' >> respring.sh
chflags uchg /private/var/containers/Data/System/FA9517AA-488F-4998-96EC-B9CA6E42033C/Library/internal/data_ark.plist' >> respring.sh
echo 'uicache --all' >> respring.sh
echo 'killall -9 backboardd' >> respring.sh
echo 'rm /var/root/respring.sh' >> respring.sh

chmod +x sshpass

./sshpass -p alpine scp -rP 1025 -o StrictHostKeyChecking=no lzma boot.tar.lzma chflags iuntethered.dylib iuntethered.plist RaptorActivation.pem com.apple.commcenter.device_specific_nobackup.plist respring.sh com.apple.purplebuddy.plist activation_record.plist  root@localhost:/var/root/

./sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 1025 "bash /var/root/respring.sh"
