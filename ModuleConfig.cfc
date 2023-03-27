/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title              = "Route Visualizer";
	this.author             = "Ortus Solutions";
	this.webURL             = "https://www.ortussolutions.com";
	this.description        = "A development module to visualize your application routes";
	this.version            = "@build.version@+@build.number@";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint         = "route-visualizer";
	// Inherit Entry Point
	this.inheritEntryPoint  = false;
	// Model Namespace
	this.modelNamespace     = "route-visualizer";
	// Auto-map models
	this.autoMapModels      = true;
	// Module Dependencies
	this.dependencies       = [];

	function configure(){
		// module settings - stored in modules.name.settings
		settings = {};

		// Home Route
		router.route( "/" ).to( "Home.index" );

		// Layout Settings
		layoutSettings = { defaultLayout : "Main.cfm" };
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
