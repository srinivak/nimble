<head>
   <meta name="layout" content="${grailsApplication.config.nimble.layout.administration}" />
   <title>
      <g:message code="nimble.view.user.show.title" args="[user.username?.encodeAsHTML()]" />
   </title>
   <r:script>
      <njs:user user="${user}" />
      <njs:permission parent="${user}" />
      <njs:role parent="${user}" />
      <njs:group parent="${user}" />
   </r:script>
</head>
<body>
   <div class="row-fluid">
      <div class="span5 ">
         <div class="well">
            <div class="btn-group pull-right">
               <a class="btn dropdown-toggle btn-primary" data-toggle="dropdown" href="#">
               <i class="icon-cog icon-white"></i>
               Action
               <span class="caret"></span>
               </a>
               <g:render template="actions" model="[user:user]"></g:render>
            </div>            
             <h2>
                <g:message code="nimble.view.user.show.heading" args="[user.username?.encodeAsHTML()]" />
             </h2>
            <h3>
               <g:message code="nimble.view.user.show.details.heading" />
            </h3>
            <table class="table no-border">
               <tbody>
                  <tr>
                     <th>
                        <g:message code="nimble.label.username" />
                     </th>
                     <td>${user.username?.encodeAsHTML()}</td>
                  </tr>
                  <tr>
                     <th>
                        <g:message code="nimble.label.created" />
                     </th>
                     <td>
                        <g:formatDate format="E dd/MM/yyyy HH:mm:s:S" date="${user.dateCreated}" />
                     </td>
                  </tr>
                  <tr>
                     <th>
                        <g:message code="nimble.label.lastupdated" />
                     </th>
                     <td>
                        <g:formatDate format="E dd/MM/yyyy HH:mm:s:S" date="${user.lastUpdated}" />
                     </td>
                  </tr>
                  <tr>
                     <th>
                        <g:message code="nimble.label.type" />
                     </th>
                     <g:if test="${user.external}">
                        <td class="value">
                           <g:message code="nimble.label.external.managment" />
                        </td>
                     </g:if>
                     <g:else>
                        <td class="value">
                           <g:message code="nimble.label.local.managment" />
                        </td>
                     </g:else>
                  </tr>
                  <tr>
                     <th>
                        <g:message code="nimble.label.state" />
                     </th>
                     <td class="value">
                        <div id="disableduser">
                           <span class="icon icon_tick">&nbsp;</span>
                           <g:message code="nimble.label.enabled" />
                        </div>
                        <div id="enableduser">
                           <span class="icon icon_cross">&nbsp;</span>
                           <g:message code="nimble.label.disabled" />
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <th>
                        <g:message code="nimble.label.remoteapi" />
                     </th>
                     <td class="value">
                        <div id="enabledapi">
                           <span class="icon icon_tick">&nbsp;</span>Enabled
                        </div>
                        <div id="disabledapi">
                           <span class="icon icon_cross">&nbsp;</span>Disabled
                        </div>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>
   <div id="tabs" class="tabbable">
      <ul class="nav nav-tabs">
         <li class="active">
            <a href="#tab-extendedinfo" class="icon icon_user" data-toggle="tab">
               <g:message code="nimble.label.extendedinformation" />
            </a>
         </li>
         <g:if test="${user.federated}">
            <li>
               <a href="#tab-federation" class="icon icon_world" data-toggle="tab">
                  <g:message code="nimble.label.federatedaccount" />
               </a>
            </li>
         </g:if>
         <li>
            <a href="#tab-permissions" class="icon icon_lock" data-toggle="tab">
               <g:message code="nimble.label.permissions" />
            </a>
         </li>
         <li>
            <a href="#tab-roles" class="icon icon_cog" data-toggle="tab">
               <g:message code="nimble.label.roles" />
            </a>
         </li>
         <li>
            <a href="#tab-groups" class="icon icon_group" data-toggle="tab">
               <g:message code="nimble.label.groups" />
            </a>
         </li>
         <li>
            <a href="#tab-logins" class="icon icon_key" data-toggle="tab">
               <g:message code="nimble.label.logins" />
            </a>
         </li>
      </ul>
      <div class="tab-content">
         <div id="tab-extendedinfo" class="tab-pane active">
            <g:render template="/templates/nimble/user/extendedinformation" contextPath="/" model="[user:user]" />
         </div>
         <g:if test="${user.federated}">
            <div id="tab-federation" class="tab-pane">
               <g:render template="/templates/nimble/user/federationinformation" contextPath="/" model="[user:user]" />
            </div>
         </g:if>
         <div id="tab-permissions" class="tab-pane">
            <g:render template="/templates/admin/permissions" contextPath="${pluginContextPath}" model="[parent:user]" />
         </div>
         <div id="tab-roles" class="tab-pane">
            <g:render template="/templates/admin/roles" contextPath="${pluginContextPath}" model="[parent:user]" />
         </div>
         <div id="tab-groups" class="tab-pane">
            <g:render template="/templates/admin/groups" contextPath="${pluginContextPath}" model="[parent:user]" />
         </div>
         <div id="tab-logins" class="tab-pane">
            <g:render template="/templates/admin/logins" contextPath="${pluginContextPath}" model="[parent:user]" />
         </div>
      </div>
   </div>
</body>