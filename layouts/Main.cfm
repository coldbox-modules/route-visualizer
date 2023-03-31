<cfoutput>
	<!doctype html>
	<html lang="en">
		<head>
			<!-- Required meta tags -->
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<!-- Bootstrap CSS -->
			<!--- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> --->

			<!---
				CSS
				- Bootstrap
				- Bootstrap Icons
			--->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

			<title>ColdBox Route Visualizer</title>
		</head>

		<body>
			<div class="container-fluid">
				#renderView()#
			</div>

			<!-- Optional JavaScript -->
			<!-- jQuery first, then Popper.js, then Bootstrap JS -->
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

			<script>
				// self executing function here
				(function() {
					// your page initialization code here
					// the DOM will be available here
					const aTooltips = document.querySelectorAll( '[data-bs-toggle="tooltip"]' );
					const tooltipList = [...aTooltips ].map( el => new bootstrap.Tooltip( el ) );

					$( "##filter" ).keyup( function(){
						var value = $( this ).val();
						$( "td.pattern" ).each( function(){
							var el = $( this );

							if( !value.length ){
								el.closest( "tr" ).show();
								return;
							}

							if( el.text().toLowerCase().indexOf( value ) > 0 ){
								el.closest( "tr" ).show();
							} else {
								el.closest( "tr" ).hide();
							}
						} );
					} );
				})();
			</script>
		</body>
	</html>
	</cfoutput>
