**WARNING** These steps are probably out dated and will not work.

To re-sign an iOS app with another developer account, ensure that the following are in place first.

1. Distribution certificate of the other developer account
2. A provisioning profile from the other developer account

Note that the Apple requires bundle IDs to be globally unique, even across accounts. So a bundle ID i.e. `CFBundleIdentifier` from one account can't be used in a different account, even though the team id/prefix would be different.

Ensure that the new distribution certificate is in your keychain and the new provisioning profile on your disk.

1. Unzip the .ipa. This will usually unzip to `Payload/<app-name>.app/`
2. Export entitlements.plist from the app using the `codesign` utility
        
        codesign -d --entitlements :entitlements.plist /path/to/<app-name>.app/

3. Open `entitlements.plist` in your favourite editor, and modify the bundle id and prefix to that of the new dev account and app. Don't forget to update the keychain access groups.
4. Open `Info.plist` in your favourite editor and modify the bundle identifier (`CFBundleIdentifier`). It can be found at `/path/to/<app-name>.app/Info.plist`.
5. Replace the embedded provisioning profile.
        
        cp /path/to/new-profile.mobileprovision /path/to/<app-name>.app/embedded.mobileprovision

6. Install the new signature.
        
        codesign -f -s "Distribution Certificate Name" -i com.example.new_bundle_id --entitlements entitlements.plist -vv /path/to/<app-name>.app/

7. Package the application
        
        xcrun -sdk iphoneos PackageApplication -s "Distribution Certificate Name" -o /path/to/new.ipa /path/to/<app-name>.app

8. Distribute `/path/to/new.ipa` to your testers.
