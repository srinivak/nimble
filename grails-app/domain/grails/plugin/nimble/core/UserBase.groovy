/*
 *  Nimble, an extensive application base for Grails
 *  Copyright (C) 2010 Bradley Beddoes
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package grails.plugin.nimble.core

import grails.util.Holders as ConfigurationHolder // Since Grails 2.x ConfigurationHolder is deprecated 

/**
 * Represents a user within a Nimble Application
 *
 * @author Bradley Beddoes
 */

class UserBase implements Serializable {

	String username
	String realm
	String passwordHash
	String actionHash

	boolean enabled
	boolean external
	boolean federated
	boolean remoteapi = false

	Date expiration
	Date dateCreated
	Date lastUpdated

	static belongsTo = [Role, Group]
	static hasOne = [profile:ProfileBase]

	static hasMany = [
		passwdHistory: String,
		loginRecords: LoginRecord,
		roles: Role,
		groups: Group,
		permissions: Permission
	]

	static fetchMode = [
		groups: 'eager'
	]

	static mapping = {
		sort username:'desc'

		cache usage: 'read-write', include: 'all'
		table ConfigurationHolder.config.nimble.tablenames.user

		profile fetch: 'join'

		//roles cache: true, cascade: 'none'
		groups cache: true, cascade: 'none'
		permissions cache: true, sort:'target'
	}

	static constraints = {
		username(blank: false, unique: true, minSize: 4, maxSize: 255)
		passwordHash(nullable: true, blank: false)
		actionHash(nullable: true, blank: false)
		realm(nullable: true, blank: false)

		profile()

		expiration(nullable: true)

		dateCreated(nullable: true) // must be true to enable grails
		lastUpdated(nullable: true) // auto-inject to be useful which occurs post validation
	}

	// Transients
	static transients = ['pass', 'passConfirm']
	String pass
	String passConfirm
}
