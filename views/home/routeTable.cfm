<cfoutput>
	<table class="table table-sm table-hover" id="table-routes">
		<thead class="thead-dark">
			<tr>
				<th>route</th>
				<th class="text-center">verb(s)</th>
				<th>terminator</th>
				<th width="125" class="text-center">module</th>
				<th width="150" class="text-center">actions</th>
			</tr>
		</thead>

		<tbody class="table-group-divider">
		<cfset index = 1>
		<cfloop array="#args.routes#" index="thisRoute">
			<cfparam name="thisRoute.handler" default="">
			<cfparam name="thisRoute.action" default="">
			<cfparam name="thisRoute.event" default="">
			<cfparam name="thisRoute.redirect" default="">
			<cfparam name="thisRoute.view" default="">
			<cfset thisRoute.id = hash( thisRoute.toString() )>
			<tr>
				<td <cfif args.type eq "root">class="pattern"</cfif>>

					<div class="mb-1">
						<strong>Pattern:</strong> <code>#thisRoute.pattern#</code>
					</div>

					<cfif thisRoute.name.len()>
						<div class="mb-1">
							<strong>Name:</strong> <code>#thisRoute.name#</code>
						</div>
					</cfif>

					<cfif thisRoute.keyExists( "domain" ) && thisRoute.domain.len()>
						<div>
							<strong>Domain:</strong>
							<span title="domain" class="badge text-bg-info">#thisRoute.domain#</span>
						</div>
					</cfif>
				</td>
				<td class="text-center">
					<cfif thisRoute.keyExists( "verbs" ) && thisRoute.verbs.len()>
						<span class='badge text-bg-info'>#thisRoute.verbs#</span>
					<cfelse>
						<span class="badge text-bg-light">any</span>
					</cfif>
				</td>
				<td>
					<cfif thisRoute.handler.len() ?: 0>
						<strong>Handler:</strong> <code>#thisRoute.handler#</code><br>
					</cfif>

					<cfif isStruct( thisRoute.action )>
						<strong>Action:</strong> <code>#serializeJSON( thisRoute.action )#</code>
					<cfelseif thisRoute.action.len() ?: 0>
						<strong>Action:</strong> <code>#thisRoute.action.toString()#</code>
					</cfif>

					<cfif thisRoute.event.len() ?: 0>
						<strong>Event:</strong> <code>#thisRoute.event.toString()#</code>
					</cfif>

					<cfif thisRoute.redirect.len() ?: 0>
						<strong>Redirect:</strong> <code>#thisRoute.statusCode ?: ''#: #thisRoute.redirect#</code>
					</cfif>

					<cfif thisRoute.view.len() ?: 0>
						<strong>View:</strong> <code>#thisRoute.view#</code><br>
						<strong>No Layout:</strong> <code>#thisRoute.viewNoLayout#</code><br>
						<strong>Layout:</strong> <code>#thisRoute.layout#</code>
					</cfif>

					<cfif thisRoute.keyExists( "response" ) and isSimpleValue( thisRoute.response ) and thisRoute.response.len()>
						<strong>Simple Response:</strong><br>
						<pre class="card"><code>
							#htmlCodeFormat( thisRoute.response )#
						</code></pre>
					</cfif>

					<cfif thisRoute.keyExists( "response" ) and isClosure( thisRoute.response )>
						<strong>Lambda Response</strong>
						<br>
						<small>Look at the code</small>
					</cfif>
				</td>
				<td class="text-center">
					<cfif thisRoute.moduleRouting.len()>
						<div class="d-grid">
							<button
								class="btn btn-light btn-sm btn-block"
								onclick="$( '##module-#thisRoute.id#' ).toggle()"
								title="Open Router"
								data-bs-toggle="tooltip"
							>
								#thisRoute.moduleRouting#<br>
								<i class="bi bi-arrows-expand"></i>
							</button>
						</div>
					</cfif>
				</td>
				<td class="text-center">
					<button
						class="btn btn-light btn-sm"
						onclick="$( '##debug-#thisRoute.id#' ).toggle()"
						title="Debug"
						data-bs-toggle="tooltip"
					>
						<i class="bi bi-bug"></i>
					</button>
					<a
						href="#event.buildLink( thisRoute.pattern )#"
						target="_blank"
						class="btn btn-sm btn-light"
						title="Open Route"
						data-bs-toggle="tooltip"
						>
						<i class="bi bi-link-45deg"></i>
					</a>
				</td>
			</tr>

			<!-- Debug Span -->
			<tr class="table-danger" id="debug-#thisRoute.id#" style="display:none">
				<td colspan="7">
					<button
						class="float-right btn btn-light btn-sm"
						onclick="$( '##debug-#thisRoute.id#' ).toggle()"
						title="close"
						data-bs-toggle="tooltip"
					>
						<i class="bi bi-x-square"></i>
					</button>
					<h3>Route Dump</h3>
					<cfdump var="#thisRoute#">
				</td>
			</tr>

			<!-- Module Routing -->
			<cfif thisRoute.moduleRouting.len()>
			<tr class="table-light" id="module-#thisRoute.id#" style="display:none">
				<td colspan="7">
					<div class="d-grid">
						<button
							class="float-right btn btn-light btn-sm"
							onclick="$( '##module-#thisRoute.id#' ).toggle()"
							title="close"
							data-bs-toggle="tooltip"
						>
							<i class="bi bi-arrows-collapse"></i>
						</button>
					</div>
					<h3 class="text-bg-dark p-2">#thisRoute.moduleRouting#</h3>
					#view(
						view : "home/routeTable",
						args : { routes = prc.aModuleRoutes[ thisRoute.moduleRouting ], type = "module" }
					)#
				</td>
			</tr>
			</cfif>

			<!-- Namespace Routing -->
			<cfif thisRoute.namespaceRouting.len()>
				<tr class="table-success" id="namespace-#thisRoute.id#" style="display:none">
				<td colspan="7">
					<button class="float-right btn btn-danger btn-sm" onclick="$( '##namespace-#thisRoute.id#' ).toggle()">Close</button>
					<h3>#thisRoute.namespaceRouting#</h3>
					#view(
						view : "home/routeTable",
						args : { routes = prc.aNamespaceRoutes[ thisRoute.namespaceRouting ], type = "namespace" }
					)#
				</td>
			</tr>
			</cfif>

		</cfloop>
		</tbody>
	</table>
	</cfoutput>
