self.addEventListener('message', function(e) {
	while (true) {
		var rawFile = new XMLHttpRequest();
	    rawFile.open("GET", "https://github.com/seanasyed/TMBroadband/blob/master/application/input.txt", false);
	    rawFile.onreadystatechange = function ()
	    {
	        if(rawFile.readyState === 4)
	        {
	            if(rawFile.status === 200 || rawFile.status == 0)
	            {
	                self.postMessage(rawFile.responseText.match(/<td id="LC1" class="blob-code blob-code-inner js-file-line">(.*)/);
	                
	            }
	        }
	    }
	    rawFile.send(null);
	}
	
}); 
