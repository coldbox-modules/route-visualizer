component extends="coldbox.system.testing.BaseTestCase"{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		setup();
	}

	function afterAll(){
		super.afterAll();
	}


    function get(
        string route = "",
        struct params = {},
        struct headers = {},
        boolean renderResults = true
    ) {
        arguments.method = "GET";
        return variables.request( argumentCollection = arguments );
    }

/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "Route Visualizer", function(){

			it( "can render out", function(){
				var event = get( "/route-visualizer" );
				expect( event.getRenderedContent() ).toINclude( "ColdBox Route Visualizer" );
			});

		});

	}

}