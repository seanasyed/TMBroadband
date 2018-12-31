<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>EQUniform Database</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="main.css" />
		<link rel="icon" href="trojanhead.png" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase.js"></script>
		<script type='text/javascript' src='config.js'></script>
		<script>
		  // Initialize Firebase
		  var config = {
		    apiKey: config.apiKey,
		    authDomain: config.authDomain,
		    databaseURL: config.databaseURL,
		    projectId: config.projectId,
		    storageBucket: config.storageBucket,
		    messagingSenderId: config.messageSenderId
		  };
		  firebase.initializeApp(config);
	      initApp = function() {
	        firebase.auth().onAuthStateChanged(function(user) {
	          if (user) {
	            // User is signed in.
	            var displayName = user.displayName;
	            var email = user.email;
	            var emailVerified = user.emailVerified;
	            var photoURL = user.photoURL;
	            var uid = user.uid;
	            var phoneNumber = user.phoneNumber;
	            var providerData = user.providerData;
	            
	            
	          } else {
	            // User is signed out.
	            /* document.getElementById('sign-in-status').textContent = 'Signed out';
	            document.getElementById('sign-in').textContent = 'Sign in';
	            document.getElementById('account-details').textContent = 'null'; */
	            window.location.replace('index.html'); 
	          }
	        }, function(error) {
	          console.log(error);
	        });
	      };
	
	      window.addEventListener('load', function() {
	        initApp()
	      });
	    
    	
   		/* var w = new Worker('polling.js'); 
       	
       	w.addEventListener('message', function(e) {
       	
       		globalID = e.data; 
       		if (document.getElementById("idIn").value != e.data) {
       			document.getElementById("idIn").value = globalID; 
       		}
       	}); 
       	
       	w.postMessage('poll');  */
	    
	    function signOut() {
	    	firebase.auth().signOut().then(function() {
	    		  console.log('Signed Out');
	    		  window.location.replace('index.html'); 
	    		}, function(error) {
	    		  console.error('Sign Out Error', error);
	    		});
	    }
	    
	    function clearFields() {
	    	document.getElementById("lastIn").value = ""; 
	    	document.getElementById("firstIn").value = ""; 
	    	document.getElementById("classIn").value = ""; 
	    	document.getElementById("emailIn").value = ""; 
	    	document.getElementById("jacketIn").value = ""; 
	    	document.getElementById("EQNotesIn").value = ""; 
	    	document.getElementById("uniNotesIn").value = ""; 
	    	document.getElementById("capeIn").value = ""; 
	    	document.getElementById("pantsIn").value = ""; 
	    	document.getElementById("hangerIn").value = ""; 
	    	document.getElementById("helmetIn").value = ""; 
	    	document.getElementById("statusIn").value = ""; 
	    	document.getElementById("depositIn").value = ""; 
	    	document.getElementById("idIn").value = ""; 
	    	document.getElementById("instrumentIn").value = ""; 
	    	document.getElementById("modelIn").value = ""; 
	    	document.getElementById("lockerIn").value = ""; 
	    	document.getElementById("comboIn").value = ""; 
	    	
	    	console.log("All fields cleared."); 
	    }
	    
	    function copyFields() {
	    	document.getElementById("current").selected = "selected"; 
	    	console.log("Term changed"); 
	    }
	    
	    function changeTerm() {
	    	
	    }
	    
	    var database = firebase.database(); 
	    
	   
	    
	   	$(document).ready(function() {
	   		
	   		var currID = ""; 
		    document.getElementById("idIn").value = currID; 
	   		
	   		function getNewID() {
	   			var xhttp = new XMLHttpRequest(); 
	   			$.ajax({
	   				url: "/TMBroadband_2_-_Electric_Boogaloo/IDUpdate",
	   				type: "GET", 
	   				contentType: "application/json; charset=utf-8",
	   		        dataType: "json",
	   		        success: function (data) {
	   		            if (currID != data.id) {
	   		            	currID = data.id
	   		            	document.getElementById("idIn").value = currID; 
	   		            	
	   		            	//API call to search database for given ID
	   		            	
		   		            	return firebase.database().ref("/Fall 2018/" + currID).once('value').then(function(snapshot) {
		   		            		console.log("successfully called");
		   		            	});
	   		            	
	   		            	
	   		            	//If there's a matching document, populate the necessary fields
	   		            }
	   		        },
	   				error: function(request, state, errors) {
	   					console.log(errors);
	   				}
	   			}); 
	   		}
	   		
	   		setInterval(getNewID, 1);
	   		
	   		
	   	}); 
	    
	    </script>
	</head>
	<body>
		<div id="infoBox">
		</div>
		<hr id="vert" width="1" size="500">
		<hr id="horiz" width="500" size="0.5">
		<hr id="horiz2" width="500" size="0.5">
		<button type="button" class="button" id="signOutButton" onclick="signOut()">Sign Out</button>
		<button type="button" class="button" id="saveButton" onclick="saveFields()">Save</button>
		<button type="button" class="button" id="searchButton" onclick="searchFields()">Search</button>
		<button type="button" class="button" id="clearButton" onclick="clearFields()">Clear</button>
		<button type="button" class="button" id="inventoryButton" onclick="inventoryFields()">Inventory</button>
		<button type="button" class="button" id="mailMergeButton" onclick="mailMergeFields()">Mail Merge</button>
		<button type="button" class="button" id="copyButton" onclick="copyFields()">Copy to Current Term</button>
		<div class="info" id="lastName">
			Last: <input type="text" id="lastIn"/>
		</div>
		<div class="info" id="firstName">
			First: <input type="text" id="firstIn" />
		</div>
		<div class="info" id="class">
			Class: <input type="text" id="classIn"/>
		</div>
		<div class="info" id="instrument">
			Instrument: <input type="text" id="instrumentIn" />
		</div>
		<div class="info" id="id">
			ID: <input type="text" id="idIn" />
		</div>
		<div class="info" id="email">
			Email: <input type="text" id="emailIn" />
		</div>
		<div class="info" id="model">
			Model: <input type="text" id="modelIn" />
		</div>
		<div class="info" id="number">
			Number: <input type="text" id="numberIn" />
		</div>
		<div class="info" id="locker">
			Locker: <input type="text" id="lockerIn" />
		</div>
		<div class="info" id="combo">
			Combo: <input type="text" id="comboIn" />
		</div>
		<div class="info" id="eqnotes">
			Notes: <textarea id="EQNotesIn"></textarea>
		</div>
		<div class="info" id="jacket">
			Jacket: <input type="text" id="jacketIn" />
		</div>
		<div class="info" id="cape">
			Cape: <input type="text" id="capeIn" />
		</div>
		<div class="info" id="pants">
			Pants: <input type="text" id="pantsIn" />
		</div>
		<div class="info" id="hanger">
			Hanger: <input type="text" id="hangerIn" />
		</div>
		<div class="info" id="helmet">
			Helmet: <input type="text" id="helmetIn" /> 
		</div>
		<div class="info" id="status">
			Status: <input type="text" id="statusIn" />
		</div>
		<div class="info" id="uninotes">
			Notes: <textarea id="uniNotesIn"></textarea>
		</div>
		<div class="info" id="deposit">
			Deposit: <input type="text" id="depositIn" />
		</div>
		<div class="info" id="term">
			Term: <select id="termSelect" onclick="changeTerm()">
				<option name="Fall 2018" value="Fall 2018">Fall 2018</option>
				<option selected="selected" id="current" name="Spring 2019" value="Spring 2019">Spring 2019</option>
			</select>
		</div>
	</body>
	
	
	
</html>