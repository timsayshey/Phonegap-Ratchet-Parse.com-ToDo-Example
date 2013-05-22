/*
function toggleCon(e) 
{
	console.log("Called",e.type);
	if(e.type == "offline") 
	{
		navigator.notification.alert("Oops, you are offline. The app may not work as expected.", function() {}, "Offline!");
		hideLoader();
	} else {
		navigator.notification.alert("Yay, you are back online.", function() {}, "Online!");
		hideLoader();
	}
}

function onDeviceReady() 
{		
	document.addEventListener("online", toggleCon, false);
	document.addEventListener("offline", toggleCon, false);
}

if(isPhonegapEnabled())
{
	document.write(unescape('%3Cscript src="cordova-2.7.0.js"%3E%3C/script%3E'));			
	document.addEventListener("deviceready", onDeviceReady, false);
}
*/