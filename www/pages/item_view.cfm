<cfoutput>
	
	<!--- ------------------------------------ ----
	----- VIEW ITEM                                
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
		
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title">View To Do</h1>
			<a class="button-main editItem" href="javascript:void(0)" data-id="">Edit</a>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div id="itemPage"></div>
			</div>
		</div>
		
	</div>

</cfoutput>