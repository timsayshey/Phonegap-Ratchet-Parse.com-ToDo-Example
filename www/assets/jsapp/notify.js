function hideOverlay()
{
	$(".overlay").hide();	
}

function showOverlay()
{
	$(".overlay").show();
}

function showMessage(msg)
{
	var $overlayBox = $(".overlay .overlay-box");
	
	$overlayBox.html(msg);
	$overlayBox.show();
	showOverlay();
}

function hideMessage()
{
	$(".overlay .overlay-box").hide();
	hideOverlay();
}

function hideLoader()
{
	$(".overlay .overlay-loader").hide();	
	hideOverlay();	
}

function showLoader()
{
	$(".overlay .overlay-loader").show();
	showOverlay();
	$("#toolong").hide();	
	setTimeout(function() { $("#toolong").show(); },30000);	
}
