# Android Debug Bridge (adb)
######

# get android shell 
adb shell

# once in shell..
#1 Get the list of all apps
pm list packages
#2 Get the list of system apps only
pm list packages -s
#3 Get the list of all Samsung apps
pm list packages | grep 'samsung'

# remove
pm uninstall --user 0 <PACKAGE NAME>

# list emulaters
emulator -list-avds

# launch emulator for cli
cd $ANDROID_HOME/emulator

./emulator -avd test_avd_27 
