Keychain Plugin for Apache Cordova
=====================================
created by Shazron Abdullah

[Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html) except for the SFHFKeychainUtils code that is under **src/ios/SFHFKeychainUtils**

Follows the [Cordova Plugin spec](https://github.com/apache/cordova-plugman/blob/master/plugin_spec.md), so that it works with [Plugman](https://github.com/apache/cordova-plugman), or you can install it manually below.
 
1. Add the SFHFKeychainUtils files **(SFHFKeychainUtils.m, and SFHFKeychainUtils.h)** in Xcode (add as a group)
2. Add the plugin files **(CDVKeychain.h, CDVKeychain.m)** in Xcode (add as a group)
3. Add **keychain.js** to your **www** folder, and reference it in a script tag, after your cordova.js
4. 
	a. For __Cordova.plist__, under the **'Plugins'** key, add a new row: key is **"Keychain"** and the value is **"CDVKeychain"**
	
	b. For __config.xml__, under the **&lt;plugins&gt;** tag, add this (deprecated, 2.7.0 and below):
	     
	     <plugin name="Keychain" value="CDVKeychain" />
	
	c. For __config.xml__, add a new **&lt;feature&gt;** tag (2.8.0 and up):

         <feature name="Keychain">
            <param name="ios-package" value="CDVKeychain" />
         </feature>
	
5. Add the framework **"Security.framework"**
    
The plugin's JavaScript functions are called after getting the plugin object thus:
 
        var kc = cordova.require("cordova/plugin/keychain");
        kc.getForKey(win, fail, "some_key", "some_servicename");
        
**Important:**

        If you are saving a JSON string value in setForKey, for example after applying JSON.stringify on an object, you must escape the characters in that string, if not you cannot retrieve it using getForKey.        
        
        var obj = { foo: 'bar' };
        var value = JSON.stringify(obj);
        value = value 
              .replace(/[\\]/g, '\\\\')
              .replace(/[\"]/g, '\\\"')
              .replace(/[\/]/g, '\\/')
              .replace(/[\b]/g, '\\b')
              .replace(/[\f]/g, '\\f')
              .replace(/[\n]/g, '\\n')
              .replace(/[\r]/g, '\\r')
              .replace(/[\t]/g, '\\t');
              
See the **example** folder for example usage.

        // Get a reference to the plugin first
        var kc = cordova.require("cordova/plugin/keychain");

        /*
         Retrieves a value for a key and servicename.
         
         @param successCallback returns the value as the argument to the callback when successful
         @param failureCallback returns the error string as the argument to the callback, for a failure
         @param key the key to retrieve
         @param servicename the servicename to use
         */
        kc.getForKey(successCallback, failureCallback, 'key', 'servicename');
        
        /*
         Sets a value for a key and servicename.
         
         @param successCallback returns when successful
         @param failureCallback returns the error string as the argument to the callback, for a failure
         @param key the key to set
         @param servicename the servicename to use
         @param value the value to set
         */
        kc.setForKey(successCallback, failureCallback, 'key', 'servicename', 'value');
        
        /*
         Removes a value for a key and servicename.
         
         @param successCallback returns when successful
         @param failureCallback returns the error string as the argument to the callback
         @param key the key to remove
         @param servicename the servicename to use
         */
        kc.removeForKey(successCallback, failureCallback, 'key', 'servicename');
