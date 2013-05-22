function getHashValue(key) 
{
	values = key.split('#');
	return values[1];
}

window.onhashchange = function(event) 
{		
	refreshClick();	
	
	// Delay page change to prevent ghost clicks!
	setTimeout(function() 
	{  
		loadPage(event);
		_addItemEvents();
		
		// Refresh scroller
		setTimeout(function() 
		{ 
			refreshClick();	
			$('textarea').elastic();
			
			setTimeout(function() 
			{ 
				refreshClick();	
				$('textarea').elastic();
					
			}, 5000);	
		}, 100);		
	}, 200);
};

function loadPage(event)
{		
	var url = document.location.href;
	currentPage = getHashValue(url);
	$(".page").hide();	

	if(typeof currentPage === "undefined")
	{
		currentPage = "home";	
	}		
	else if(currentPage.length === 0)
	{
		currentPage = "home";	
	}		
	
	$("#" + currentPage).show();
}	
	
$(function() 
{
	$("a.goback").unbind('tapone');
	$("a.goback").bind('tapone',function(e) 
	{
		history.go(-1);
		e.preventDefault();
		e.stopImmediatePropagation();	
	});	
	
	$('#target').submit(function() 
	{
	  alert('Handler for .submit() called.');
	  return false;
	});
	
	/**/
	$("a").click(function(e) 
	{					
		e.preventDefault();
		e.stopImmediatePropagation();		
	});	
	
	$("a:not('.goback'):not('.notlink'):not('.nolink')").bind('tapone', function(e) 
	{
		if (typeof this.hash !== 'undefined' && this.hash.length) 
		{
			window.location.hash = this.hash;
		}
		else
		{
			window.location.hash = "home";
		}
	});	
	
	$(".link").bind('tapone', function(e) 
	{		
		window.open($(this).attr("href"), '_blank', 'location=yes');
		e.preventDefault();
		e.stopImmediatePropagation();
	});
	
	loadPage();
	
	$(window).smartresize(function(){
		refreshClick();	
		console.log("smartresize");
	});
	$(".page #scroller").bind('resize', function(e) {
	   refreshClick();	
	   console.log("refreshClick");
	});
});