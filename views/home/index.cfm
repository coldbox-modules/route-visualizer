<cfoutput>
<h1 class="display-4">ColdBox Route Visualizer</h1>

<p class="lead">Routes as they are traversed for matching in specific order.</p>

<div class="form-group">
	<input type="text" name="filter" id="filter" placeholder="Filter Routes" autofocus class="form-control">
</div>

#view(
    view = "home/routeTable",
    args = { routes = prc.aRoutes, type = "root" }
)#
</cfoutput>
