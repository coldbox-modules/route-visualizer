<cfoutput>
	<h1 class="display-5">
		<i class="bi bi-signpost-split"></i>
		ColdBox Route Visualizer
	</h1>

	<p class="alert alert-info">
		<i class="bi bi-exclamation-square"></i>
		Routes as they are traversed for matching in specific order.
	</p>

	<div class="mb-2">
		<input
			type="text"
			name="filter"
			id="filter"
			placeholder="Filter Routes"
			autofocus
			class="form-control">
	</div>

	#view(
		view : "home/routeTable",
		args : { routes = prc.aRoutes, type = "root" }
	)#
	</cfoutput>
