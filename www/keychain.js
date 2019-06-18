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

// This is installed as a <js-module /> so it doesn't have a cordova.define wrapper

var exec = require('cordova/exec');


var Keychain = {
	serviceName: "Keychain",

	get: function(success, error, key, touchIDMessage, keychainGroup) {
		touchIDMessage = !touchIDMessage ? null : touchIDMessage;
		keychainGroup = !keychainGroup ? null : keychainGroup;
		exec(success, error, this.serviceName, "get", [key, touchIDMessage, keychainGroup]);
	},

	set: function(success, error, key, value, useTouchID, keychainGroup) {
		keychainGroup = !keychainGroup ? null : keychainGroup;
		exec(success, error, this.serviceName, "set", [key, value, !!useTouchID, keychainGroup]);
	},

	setJson: function(success, error, key, obj, useTouchID, keychainGroup) {
		keychainGroup = !keychainGroup ? null : keychainGroup;
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

		exec(success, error, this.serviceName, "set", [key, value, !!useTouchID, keychainGroup]);
	},

	getJson: function(success, error, key, touchIDMessage, keychainGroup) {
		keychainGroup = !keychainGroup ? null : keychainGroup;
		var cb = function(v) {
			if(!v) {
				success(null);
				return;
			}
			v = v.replace(/\\\"/g, '"');

			try {
				var obj = JSON.parse(v);
				success(obj);
			} catch(e) {
				error(e);
			}
		};
		exec(cb, error, this.serviceName, "get", [key, touchIDMessage, keychainGroup]);
	},

	remove: function(successCallback, failureCallback, key, keychainGroup) {
		keychainGroup = !keychainGroup ? null : keychainGroup;
		exec(successCallback, failureCallback, this.serviceName, "remove", [key, keychainGroup]);
	}
};

module.exports = Keychain;
