# create cordova plugin with plugman
cordova create nite com.nite nite
cd nite/
plugman create --name camera --plugin_id in.foobars --plugin_version 0.0.1
cd camera/
plugman platform add --platform_name android
cd ..
cordova platform add android
plugman install --platform android --project platforms/android --plugin camera
cordova build android
