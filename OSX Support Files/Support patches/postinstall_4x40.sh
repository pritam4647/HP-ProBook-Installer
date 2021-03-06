#!/bin/bash
set -x
osxver=`/usr/libexec/PlistBuddy -c 'Print ProductVersion' "${3}"/System/Library/CoreServices/SystemVersion.plist`
case $osxver in
10.6.8)	echo "OS X Snow Leopard $osxver detected."
		./KextPatch.sh ./list_4x40sl "${3}"
		cp ./boot_sl.plist "${3}"/Extra/org.chameleon.Boot.plist
		;;	
10.7.5)	echo "OS X Lion $osxver detected."
		./KextPatch.sh ./list_4x40l "${3}"
		cp ./boot_ml.plist "${3}"/Extra/org.chameleon.Boot.plist
		;;
10.8*)	echo "OS X Mountain Lion $osxver detected."
		./KextPatch.sh ./list_4x40ml "${3}"
		cp ./boot_ml.plist "${3}"/Extra/org.chameleon.Boot.plist
		;;
10.9*)	echo "OS X Mavericks $osxver detected."
		./KextPatch.sh ./list_4x40mav "${3}"
		cp ./boot_ml.plist "${3}"/Extra/org.chameleon.Boot.plist
		;;
*)		echo "Unknown or unsupported OS X version, aborting."
		;;
esac
# disabling Software Update schedule.
softwareupdate --schedule off
# triggering kext cache rebuilding
/usr/libexec/PlistBuddy -c "Set :KextCacheRebuild yes" /tmp/PBI.plist