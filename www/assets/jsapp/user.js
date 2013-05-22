function _initParseSession(sessionToken)
{
	$.parse.init({  
		session_token: sessionToken
	});
	
	return true;
}	

function _resetPassword() 
{
	$.parse.requestPasswordReset(
		$("#reset_username").val(), 
		function(e) // Success
		{
			console.log("success:",e);	
			window.location.hash = "signin";	
			
			setTimeout(function() 
			{ 
				showMessage("<h2>Success!</h2>Instructions for resetting your password have been sent to your email address successfully! Don't forget to check your spam.<br><br><a href='#' class='button-positive' onclick='hideMessage();return false;'>Okay</a>");
					
			}, 1);
			
		},
		function(e) // Fail
		{
			window.location.hash = "forgotpass";
			doFail(e);
		}
	);
}

function _login(email,pass) 
{
	$.parse.login(
		email,
		pass,
		function(e) // Success
		{
			console.log("success:",e);
			_logininit(e.sessionToken,e.objectId);
			
			amplify.store("logininfo",{ email: email, password: pass });			
		},
		function(e) // Fail
		{
			doFail(e);
			window.location.hash = "signin";
		}
	);
}

function _signup() 
{
	GLOBAL.noACL = 1;
	var email = $("#sign_username").val();
	var pass = $("#sign_password").val();
	
	$.parse.signup({ 
			username : email, 
			password : pass, 
			email : email
		},
		function(e) // Success
		{
			console.log("success:",e);	
			_logininit(e.sessionToken,e.objectId);	
			
			amplify.store("logininfo",{ email: email, password: pass});	 
		},
		function(e) // Fail
		{
			window.location.hash = "signup";
			doFail(e);
		}
	);
	
	delete GLOBAL.noACL;
}

function _loadSignupForm()
{
	//var signupForm = tmpl("signup_tmpl");
	//$("#mainwrap").html(signupForm);
	$("#sign_submit").bind('tapone', function() { _signup(); });
	$("#log_submit").bind('tapone',function() {
		_login($("#log_username").val(), $("#log_password").val());
	});
	$("#reset_submit").bind('tapone', function() { _resetPassword(); });
}

function _editAccount() {
	GLOBAL.noACL = 1;
	
	$.parse.put("users/" + GLOBAL.userid, 
		{ 
			username: $("#edit_username").val(),
			password: $("#edit_password").val(),
			email: $("#edit_username").val()			
		}, 
		function(json) // Success
		{
			refresh();
			window.location.hash = "settings";	
		},
		function(e)  // Fail
		{
			doFail(e);
			window.location.hash = "edit_account";	
		}
	);	
	
	delete GLOBAL.noACL;
}

function _logout() 
{
	delete window.some_var;
	delete qCategories; 
	delete qItems; 
	
	delete sessionid;
	delete sessionToken;
	delete GLOBAL.userid;
	
	amplify.store("logininfo", null);
	
	getItems();
	listCategories();	
	
	window.location.hash = "signin";	
}

function _logininit(sessionid,userid) 
{
	//add events
	sessionid = sessionid;
	GLOBAL.userid = userid;
	_initParseSession(sessionid);

	_addItemEvents();
	_addCategoryEvents();

	// Disable back so user can't go back to login form with logging out
	for (var i=0;i<20;i++)
	{
		history.replaceState({nogo: 'back'}, 'NoGoBack', '#');
		history.pushState({nogo: 'back'}, 'NoGoBack', '#');
	}
	
	window.location.hash = "home";

	refresh();
}	

var hide_checked_count_timer;

function refresh()
{	
	showLoader();
	
	delete qCategories; 
	delete qItems; 
	listCategories();
	getItems();

	requiresQCat();
	
	waitForRefresh = setInterval(function() {
		if(typeof qCategories !== 'undefined' && typeof qItems !== 'undefined')
		{
			clearInterval(waitForRefresh);
			_viewCategory($("#cat_view h1.title"),"dontredirect");			
			_addItemEvents();
			addItemCountToCategories();
		}
	} , 100);
}

function requiresQCat(){
	clearTimeout(hide_checked_count_timer);

    hide_checked_count_timer = setTimeout(function() {
        if(typeof qCategories != 'undefined' && 
           typeof qItems != 'undefined')
		{			
			_loadItemForm();

			_addCategoryEvents();
			listCategoryItems();
			
			_categoryEditToggle();
			_itemEditToggle();
			
			_addItemEvents();
			refreshClick();
			
			hideLoader();
			
			refreshDateSelect();
		}
		else
		{
			requiresQCat();
		}
    },1);
}

