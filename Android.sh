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

