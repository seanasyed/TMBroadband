self.addEventListener('message', function(e) {
	while (true) {
		var rawFile = new XMLHttpRequest();
	    rawFile.open("GET", "https://raw.githubusercontent.com/seanasyed/TMBroadband/master/application/input.txt", false);
	    rawFile.onreadystatechange = function ()
	    {
	        if(rawFile.readyState === 4)
	        {
	            if(rawFile.status === 200 || rawFile.status == 0)
	            {
	                self.postMessage(rawFile.responseText);
	                
	            }
	        }
	    }
	    rawFile.send(null);
		
	}
	
}); 
