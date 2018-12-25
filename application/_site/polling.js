self.addEventListener('message', function(e) {
	
	var file = new File([], "input.txt"); 
	
	while (true) {
		
		var rawFile = new XMLHttpRequest();
	    rawFile.open("GET", "input.txt", false);
	    rawFile.onreadystatechange = function ()
	    {
	        if (rawFile.responseText != null) {
	        	
	        	postMessage(rawFile.responseText); 
	        	
	        	$.ajax({
	    		   url: 'removefile.php',
	    		   type: 'post'
	    		  });
	        	
	        }
	    }
	    rawFile.send();
		
	}
	
	 
	
}); 
