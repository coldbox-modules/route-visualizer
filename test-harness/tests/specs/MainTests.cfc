component extends="coldbox.system.testing.BaseTestCase" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		setup();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "Route Visualizer", function(){
			it( "can render out", function(){
				var event = this.get( "/route-visualizer" );
				expect( event.getRenderedContent() ).toInclude( "ColdBox Route Visualizer" );
			} );
		} );
	}

}
