/*
PRE-REQUISITE: Install the Keychain plugin using the Cordova cli or plugman
*/
const APP_GROUP = 'com.myapp.group';
const ACCESS_GROUP = 'accesscode.com.myapp.group';

function onBodyLoad() {
    document.addEventListener("deviceready", onDeviceReady, false);
}

/* When this function is called, PhoneGap has been initialized and is ready to roll */

function onDeviceReady() {
    try {

        // do your thing!
    } catch (e) {
        debug.error(e);
    }
}

function onGet() {
    var key = document.getElementById("keytoget").value;

    var win = function(value) {
            alert("GET SUCCESS - Key: " + key + " Value: " + value);
        };
    var fail = function(error) {
            alert("GET FAIL - Key: " + key + " Error: " + error);
        };

    Keychain.get(win, fail, key, APP_GROUP, ACCESS_GROUP);
}

function onSet() {
    var key = document.getElementById("keytoset").value;
    var value = document.getElementById("valuetoset").value;

    var win = function() {
            alert("SET SUCCESS - Key: " + key);
        };
    var fail = function(error) {
            alert("SET FAIL - Key: " + key + " Error: " + error);
        };

    Keychain.set(win, fail, key, value, APP_GROUP, ACCESS_GROUP);
}

function onRemove() {
    var key = document.getElementById("keytoremove").value;

    var win = function() {
            alert("REMOVE SUCCESS - Key: " + key);
        };
    var fail = function(error) {
            alert("REMOVE FAIL - Key: " + key + " Error: " + error);
        };

    Keychain.remove(win, fail, key, APP_GROUP, ACCESS_GROUP);
}
