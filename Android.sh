# Android Debug Bridge (adb)
######

# adb port forward to enable desktop head unit (android auto)
adb forward tcp:5277 tcp:5277

# list port forward to validate: 
adb forward --list

# execute head unit
LD_LIBRARY_PATH="~/android/sdk/emulator/lib64:$LD_LIBRARY_PATH" ./desktop-head-unit

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

# clean up samsung bixby crap
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.agent
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.es.globalaction
adb shell pm uninstall -k --user 0 com.samsung.android.bixbyvision.framework
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.wakeup
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.plmsync
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.voiceinput
adb shell pm uninstall -k --user 0 com.samsung.systemui.bixby
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.agent.dummy
adb shell pm uninstall -k --user 0 com.samsung.android.app.settings.bixby
adb shell pm uninstall -k --user 0 com.samsung.systemui.bixby2
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.service
adb shell pm uninstall -k --user 0 com.samsung.android.app.routines
adb shell pm uninstall -k --user 0 com.samsung.android.visionintelligence
adb shell pm uninstall -k --user 0 com.samsung.android.app.spage

# list emulaters
emulator -list-avds

# create new avd
vdmanager create avd \
  --name "DevelopmentPixel9" \
  --package "system-images;android-33-ext4;google_apis_playstore;x86_64" \
  --device "pixel_9" 
 
# launch previously created avd 
emulator -avd DevelopmentPixel9 -gpu host

# install apk on emuilator
adb install devFileName.apk

# create keystore for release
keytool -genkeypair -v -keystore tempus-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias tempus-key


