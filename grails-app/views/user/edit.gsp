<head>
	<meta name="layout" content="${grailsApplication.config.nimble.layout.administration}" />
	<title><g:message code="nimble.view.user.edit.title" /></title>
</head>

<body>
	<h2>
		<g:message code="nimble.view.user.edit.heading" args="[user.username]" />
	</h2>
	<p>
		<g:message code="nimble.view.user.edit.descriptive" />
	</p>

	<n:errors bean="${user}" />

	<g:form action="update" class="form-horizontal">
		<f:with bean="user">
			<f:field property="username" label="nimble.label.username" />
			<f:field property="external" input-radio="true"	label="nimble.label.externalaccount" />
			<f:field property="federated" input-radio="true" label="nimble.label.federatedaccount" />

			<input type="hidden" name="id" value="${user.id}" />
			<input type="hidden" name="version" value="${user.version}" />
			
		</f:with>

		<div class="form-actions">
			<button type="submit" class="btn btn-primary">
				<i class="icon-ok icon-white"></i>
				<g:message code="nimble.link.updateuser" />
			</button>
			<g:link action="show" id="${user.id}" class="btn btn-warning">
				<i class="icon-arrow-left icon-white"></i>
				<g:message code="nimble.link.cancel" />
			</g:link>
		</div>
	</g:form>
</body>
