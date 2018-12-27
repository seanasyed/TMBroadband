self.addEventListener('message', function(e) {
	
	var rawFile = new XMLHttpRequest();
	var currID = ""; 
	var newID = ""; 
	
	while (true) {
	    rawFile.open("GET", "input.txt", false);
	    rawFile.onreadystatechange = function ()
	    {
	        if(rawFile.readyState === 4)
	        {
	            if(rawFile.status === 200 || rawFile.status == 0)
	            {
	                newID = rawFile.responseText;
	                
	                if (currID != newID) {
	                	currID = newID; 
	                	self.postMessage(currID); 
	                }
	            }
	        }
	    }
	    
	    
	    rawFile.send(null);
    }
}); 
