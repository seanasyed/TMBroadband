var globalID = "";

self.addEventListener('message', function(e) {
	
	var rawFile = new XMLHttpRequest();
	var currID = ""; 
	var newID = ""; 
	
	while (true) {
		
		var newID = globalID;  
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
	    
	    console.log(globalID); 
	    rawFile.send(null);
    }
}); 
