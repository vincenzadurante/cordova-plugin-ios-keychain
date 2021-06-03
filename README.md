Keychain Plugin for Apache Cordova
=====================================
created by Shazron Abdullah

Updated by Max Lynch max@ionic.io

Updated by [YJ Ang](https://github.com/yj-ang)
 - Add on: Keychain Sharing capabilities

Updated by [vincenzadurante](https://github.com/vincenzadurante)
 - Add on: Added access group attribute
 - Removed: Attributes for touch id

### Installation

```shell
cordova plugin add https://github.com/vincenzadurante/cordova-plugin-ios-keychain
```

### iCloud keychain enabled

iCloud keychain synchonizing is enabled, so the keychain will be mirrored across all devices *if* the user is signed in to iCloud (Settings > iCloud) and has iCloud keychain turned on (Settings > iCloud > Keychain)

### Usage
              
See the **example** folder for example usage.

```js
/*
 Retrieves a value for a key
 
 @param successCallback returns the value as the argument to the callback when successful
 @param failureCallback returns the error string as the argument to the callback, for a failure
 @param key the key to retrieve
 @param keychainGroup The name of keychain group (Optional)
 @param keychainAccessGroup The name of keychain access group (Optional)
 */
Keychain.get(successCallback, failureCallback, 'key', 'com.group.sharedKeysApp1andApp2', 'XXXXXX.com.group.sharedKeysApp1andApp2');

/*
 Sets a value for a key
 
 @param successCallback returns when successful
 @param failureCallback returns the error string as the argument to the callback, for a failure
 @param key the key to set
 @param value the value to set
 @param keychainGroup The name of keychain group (Optional)
 @param keychainAccessGroup The name of keychain access group (Optional)
 */
Keychain.set(successCallback, failureCallback, 'key', 'value', 'com.group.sharedKeysApp1andApp2', 'XXXXXX.com.group.sharedKeysApp1andApp2');

/*
 Removes a value for a key
 
 @param successCallback returns when successful
 @param failureCallback returns the error string as the argument to the callback
 @param key the key to remove
 @param keychainGroup The name of keychain group (Optional)
 @param keychainAccessGroup The name of keychain access group (Optional)
 */
Keychain.remove(successCallback, failureCallback, 'key', 'com.group.sharedKeysApp1andApp2', 'XXXXXX.com.group.sharedKeysApp1andApp2');

/*
 Sets a JSON value for a key 
 
 @param successCallback returns when successful
 @param failureCallback returns the error string as the argument to the callback, for a failure
 @param key the key to set
 @param value the value to set
 @param keychainGroup The name of keychain group (Optional)
 @param keychainAccessGroup The name of keychain access group (Optional)
 */
Keychain.setJson(successCallback, failureCallback, 'key', 'value','com.group.sharedKeysApp1andApp2', 'XXXXXX.com.group.sharedKeysApp1andApp2');

/*
 Gets a JSON value for a key 
 
 @param successCallback returns when successful
 @param failureCallback returns the error string as the argument to the callback, for a failure
 @param key the key to set
 @param value the value to set
 @param keychainGroup The name of keychain group (Optional)
 @param keychainAccessGroup The name of keychain access group (Optional)
 */
Keychain.getJson(successCallback, failureCallback, 'key', 'com.group.sharedKeysApp1andApp2', 'XXXXXX.com.group.sharedKeysApp1andApp2');
```

### License 

[Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html) except for the Auth0 SimpelKeychain code that is under MIT
