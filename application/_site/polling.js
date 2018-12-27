self.addEventListener('message', function(e) {
	
	function createCookie(name,value,days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		}
		else var expires = "";
		document.cookie = name+"="+value+expires+"; path=/";
	}

	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		}
		return null;
	}

	function eraseCookie(name) {
		createCookie(name,"",-1);
	}
	
	document.cookie = "refresh=0; id=null"; 
	while (true) {
		
		if (readCookie("refresh") == "1") {
			
			console.log("change detected");
			eraseCookie("refresh"); 
			createCookie("refresh", "0"); 
			
			this.postMessage(readCookie("id"));
		} else {
			console.log("change not detected");
		}
		
	}
	
	 
	
}); 
