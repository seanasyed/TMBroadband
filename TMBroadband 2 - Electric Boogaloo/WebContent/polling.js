self.addEventListener('message', function(e) {
	
	var currID = ""; 
	var idFetch = new XMLHttpRequest();
	while (true) {
		
	    rawFile.open("GET", "input.txt", false);
	    rawFile.onreadystatechange = function ()
	    {
	        if(rawFile.readyState === 4)
	        {
	            if(rawFile.status === 200 || rawFile.status == 0)
	            {
	                if (currID != rawFile.responseText) {
	                	console.log("id updated"); 
	                	self.postMessage(rawFile.responseText);
	                	currID = rawFile.responseText; 
	                }
	            }
	        }
	    }
	    rawFile.send(null);
	}
	
});