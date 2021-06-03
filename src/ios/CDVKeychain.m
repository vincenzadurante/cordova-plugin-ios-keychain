/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "CDVKeychain.h"
#import "A0SimpleKeychain.h"

@implementation CDVKeychain

- (void) get:(CDVInvokedUrlCommand*)command {
  [self.commandDelegate runInBackground:^{
    NSArray* arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;

    if([arguments count] < 2) {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
      messageAsString:@"incorrect number of arguments for getWithTouchID"];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
      return;
    }

    NSString *key = [arguments objectAtIndex:0];
    NSString *keychainGroup = [arguments objectAtIndex:1];
    NSString *accessGroup = [arguments objectAtIndex:2];

    A0SimpleKeychain *keychain = nil;
    
    if (keychainGroup == [NSNull null]) {
      keychain = [A0SimpleKeychain keychain];
    } else {
      
      keychain = [A0SimpleKeychain keychainWithService: keychainGroup accessGroup: accessGroup];
    }

    keychain.useAccessControl = YES;
    keychain.defaultAccessiblity = A0SimpleKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly;

    NSString *value = [keychain stringForKey:key];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  }];
}

- (void) set:(CDVInvokedUrlCommand*)command {
  [self.commandDelegate runInBackground:^{
    NSArray* arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;

    if([arguments count] < 3) {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
      messageAsString:@"incorrect number of arguments for setWithTouchID"];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
      return;
    }

    NSString* key = [arguments objectAtIndex:0];
    NSString* value = [arguments objectAtIndex:1];
    NSString* keychainGroup = [arguments objectAtIndex:2];
    NSString *accessGroup =[arguments objectAtIndex:3];
   
    A0SimpleKeychain *keychain = nil;
    
    if (keychainGroup == [NSNull null]) {
      keychain = [A0SimpleKeychain keychain];
    } else {
      
      keychain = [A0SimpleKeychain keychainWithService: keychainGroup accessGroup: accessGroup];
    }

    [keychain setString:value forKey:key];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  }];
}

- (void) remove:(CDVInvokedUrlCommand*)command {
  [self.commandDelegate runInBackground:^{
    NSArray* arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;

    if([arguments count] < 1) {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
      messageAsString:@"incorrect number of arguments for remove"];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
      return;
    }

    NSString *key = [arguments objectAtIndex:0];
    NSString *keychainGroup = [arguments objectAtIndex:1];
    NSString *accessGroup = [arguments objectAtIndex:2];
   
    A0SimpleKeychain *keychain = nil;
    
    if (keychainGroup == [NSNull null]) {
      keychain = [A0SimpleKeychain keychain];
    } else {
      keychain = [A0SimpleKeychain keychainWithService: keychainGroup accessGroup: accessGroup];
    }

    [keychain deleteEntryForKey:key];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  }];
}

@end
