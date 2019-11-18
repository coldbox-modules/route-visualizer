/**
 * Visualize system routes
 */
component{

	function index( event, rc, prc ){
		if( wirebox.containsInstance( name="router@coldbox" ) ){
			var oRouter = controller.getRoutingService().getRouter();
			prc.aModuleRoutes = oRouter.getModuleRoutingTable();
		} else {
			var oRouter = getInterceptor( "SES" );
			prc.aModuleRoutes = oRouter.getModulesRoutingTable();
		}

		prc.aRoutes          = oRouter.getRoutes();
		prc.aNamespaceRoutes = oRouter.getNamespaceRoutingTable();

		event.setView( "home/index" );
	}

}
