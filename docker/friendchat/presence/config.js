/*©agpl*************************************************************************
*                                                                              *
* This file is part of FRIEND UNIFYING PLATFORM.                               *
*                                                                              *
* This program is free software: you can redistribute it and/or modify         *
* it under the terms of the GNU Affero General Public License as published by  *
* the Free Software Foundation, either version 3 of the License, or            *
* (at your option) any later version.                                          *
*                                                                              *
* This program is distributed in the hope that it will be useful,              *
* but WITHOUT ANY WARRANTY; without even the implied warranty of               *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                 *
* GNU Affero General Public License for more details.                          *
*                                                                              *
* You should have received a copy of the GNU Affero General Public License     *
* along with this program.  If not, see <http://www.gnu.org/licenses/>.        *
*                                                                              *
*****************************************************************************©*/

// DO NOT EDIT example.config.js! Changes will be overwritten.
// Override defaults by adding them to config.js. 
// config.js is created by the installer.

const server = {
	mysql : {
		host : 'mariadb',
		port : 3306,
		user : 'presence',
		pass : 'presence',
		name : 'presence',
	},
	tls : {
		keyPath  : '/var/www/html/friendchat/server/TLS/key.pem',
		certPath : '/var/www/html/friendchat/server/TLS/cert.pem',
		key      : null,
		cert     : null,
	},
	// failure to provide a working FQDN means invites wont work
	domain : 'myfriendup.com',
	tcp : {
		port  : 27960,
		proxy : null,
	},
	ws : {
		port  : 27970,
		//proxy : null,
		proxy : '/presence/guest/',
	},
	friendcore : {
		useTLS      : false,
		host        : 'friendup',
		port        : 6502,
		proxy       : null,
		wsPort      : 6498,
		wsProxy     : null,
		serviceKey  : 'presencekey',
		serviceName : 'presence',
	},
	account : {
		settings : {
		},
	},
	room : {
		settings : {
		},
	},
	workroom : {
		subsHaveSuperView  : true,
		supersHaveSubRoom  : true,
		supersSubHideSuper : true,
	},
	messages : {
		forceShowRead : false,
	},
	tinyAvatar : {
		imageSidePX : 128,
	},
	live : {
		userLimit   : 0,
		webRTCProxy : null,
		isStream    : null,
		isRecording : null,
		recordPath  : null,
	},
	janus : {
		api_url    : null,
		api_secret : null,
		domain     : 'localhost',
		port       : 13131,
	},
};

const shared = {
	rtc : {
		iceServers : [
			{
				urls : [
					"stun:https://coturn:4443",
				],
			},
			{
				urls : [
					"turn:https://coturn:4443",
				],
				username   : 'TINA',
				credential : 'TURNER',
			},
		],
	},
};

const conf = {
	shared : shared,
	server : server,
};

module.exports = conf;
