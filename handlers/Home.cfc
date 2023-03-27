/**
 * Visualize system routes
 */
component {

	function index( event, rc, prc ){
		var oRouter          = controller.getRoutingService().getRouter();
		prc.aModuleRoutes    = oRouter.getModuleRoutingTable();
		prc.aRoutes          = oRouter.getRoutes();
		prc.aNamespaceRoutes = oRouter.getNamespaceRoutingTable();

		event.setView( "home/index" );
	}

}
