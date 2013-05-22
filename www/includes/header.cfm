<cfoutput>   

	<meta charset="utf-8">
	
	<title>BaconStash ToDo</title>	
	
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">

	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/images/touch-icons/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/images/touch-icons/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="assets/images/touch-icons/apple-touch-icon-57x57.png">
	
	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:900,700,600,400,300|Roboto:900,700,400,500|Source+Sans+Pro:900,700,600,400,300|Advent+Pro:600,700,500,400,300|Dosis:800,600,700,500,400' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="assets/css/ratchet.css">
	<link rel="stylesheet" href="assets/css/app.css">
	<link rel="stylesheet" href="assets/css/iscroll.css">
	<link rel="stylesheet" href="assets/css/form.css">
	
	<!--- JS --->
	<script src="assets/jsapp/mobilestart.js"></script>  
	
	<script src="assets/jsvendor/jquery-2.0.0.min.js"></script>  
	<script src="assets/jsvendor/jquery.elastic.source.js"></script>  
	<script src="assets/jsvendor/amplify.min.js"></script>
	<script src="assets/jsvendor/iscroll4.js" type="text/javascript"></script>
	<script src="assets/jsvendor/history/scripts/bundled/html4html5/jquery.history.js"></script>	 
	<script src="assets/jsvendor/tmpl.js"></script>
	<script src="assets/jsvendor/jquery.parse.js"></script>
	<script src="assets/jsvendor/jgestures.min.js"></script>
	<script src="assets/jsvendor/strftime-min.js"></script>
	
	<script src="assets/jsapp/mobile.js"></script>  
	
	
	<link rel="stylesheet" href="assets/jsvendor/pickadate/themes/pickadate.01.default.css">
	<script src="assets/jsvendor/pickadate/source/pickadate.legacy.js"></script>	

	<cfset scrollCnt = qPages.recordcount>       
	<script>
		
		jQuery = $;
		var myScroll;
		function loaded() 
		{		  
			<cfloop list="#pageList#" index="pageid">
				myScroll#pageid# = new iScroll('wrap-#pageid#', {
					useTransform: true,
					onBeforeScrollStart: function (e) {
						var target = e.target;
						while (target.nodeType != 1) target = target.parentNode;
			
						if (target.tagName != 'SELECT' && target.tagName != 'INPUT' && target.tagName != 'TEXTAREA')
							e.preventDefault();
					}
				});               
			</cfloop>
		}           
		
		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
		
		$(function() {
			loaded();
		});
		
	</script> 
	
	<cfset wrapperList = "">
	<cfloop list="#pageList#" index="pageid">
		<cfset wrapperList = ListAppend(wrapperList,"##wrap-#pageid#")>
	</cfloop>
			
	<style type="text/css">
	
		#wrapperList# {
			position:absolute;  
			/* 
				z-index:1; 
				Disabled due to android browser bug 
				Kind of outlined here:
				https://groups.google.com/forum/?fromgroups=##!topic/iui-developers/qjE3iQlN790
			*/ 
			top:44px; /* Set to height of header */
			bottom:48px; /* Set to height of footer */  
			left:0;
			width:100%;
			overflow:auto;			        
		} 
		##scroller  {
			padding-top:10px !important;        	
		}
		
		##wrap-cat_view {
			-moz-transition: all 1px;
			-ms-transition: all 1px;
			transition: all 1px;
		}
		
		##wrap-home ##scroller  {
			padding-top:0px !important;        	
		}
		
	</style>
	
	<!--- JS Application --->	
	<script src="assets/jsapp/framework.js"></script>  	
	<script src="assets/jsapp/common.js"></script>  	
	<script src="assets/jsapp/item.js"></script>
	<script src="assets/jsapp/category.js"></script>
	<script src="assets/jsapp/categoryitems.js"></script>	
	<script src="assets/jsapp/user.js"></script>
	<script src="assets/jsapp/notify.js"></script>
	<script src="assets/jsapp/init.js"></script>
	
	
	<!--- Set JS Templates --->
	<cfinclude template="../assets/jstemplates/item.cfm">
	<cfinclude template="../assets/jstemplates/category.cfm">
	<cfinclude template="../assets/jstemplates/categoryitems.cfm">
	
	<!--- Render JS Templates --->
	<cfoutput>
		<cfloop list="#structKeyList(templates)#" index="i">
			<script type="text/html" id="#i#">
				#templates[i]#
			</script>
		</cfloop>			
	</cfoutput>	
	
	<script type="text/javascript"> 
		var currentPage = 'home';
		
		$(function() {
			scrollRefreshInterval();
		});
		
		function scrollRefreshInterval() {		   
		   refreshClick();
		   setTimeout(scrollRefreshInterval,5000);
		}
		
		function refreshScroll() 
		{  
			$(function() {
				<cfloop list="#pageList#" index="pageid">
					<cfset selector = "$my#pageid#">
					var #selector# = $("###pageid#");
					if(#selector#.is(':visible')) 
					{ 
						myScroll#pageid#.refresh(); 
					};
				</cfloop>
			});
		}
		
		function refreshClick()
		{
			
			setTimeout(function() 
			{  
				refreshScroll();
			
				setTimeout(function()
				{
					$('#wrapperList#').css('min-height',$(window).height() - 100);
					
					refreshScroll();
				},500);	
				
			}, 100);
		}
			
		$(function() {	 
			
			$('a').bind('tapone', function()
			{   
				refreshClick();
			});			      
		});
	</script>
	
</cfoutput>

	<link rel="stylesheet" href="assets/css/shame.css">