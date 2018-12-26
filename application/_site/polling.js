self.addEventListener('message', function(e) {
	
	var file = new File([], "input.txt"); 
	
	while (true) {
		
		var rawFile = new XMLHttpRequest();
	    rawFile.open("GET", "input.txt", true);
	    rawFile.onreadystatechange = function ()
	    {
	        if (rawFile.responseText != null) {
	        	
	        	postMessage(rawFile.responseText); 
	        	
	        	$.ajax({
	    		   url: 'removefile.php',
	    		   type: 'POST', 
	    		   data: {
	    			   
	    		   }
	    		  });
	        	
	        }
	    }
	    rawFile.send();
		
	}
	
	 
	
}); 
