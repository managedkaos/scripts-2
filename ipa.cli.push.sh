# Install ipa through cli
brew uninstall ideviceinstaller
brew uninstall libimobiledevice
brew install --HEAD libimobiledevice
brew link --overwrite libimobiledevice
brew install --HEAD  ideviceinstaller
brew link --overwrite ideviceinstaller
sudo chmod -R 777 /var/db/lockdown/
# Push to device
ideviceinstaller -i <Path_to_your_ipa> 
