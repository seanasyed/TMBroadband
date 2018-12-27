self.addEventListener('message', function(e) {
	
	var currID = ""; 
	var rawFile = new XMLHttpRequest();
	while (true) {
		console.log('loop run'); 
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