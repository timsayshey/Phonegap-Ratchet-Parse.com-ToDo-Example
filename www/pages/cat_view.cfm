<cfoutput>

	<!--- ------------------------------------ ----
	----- VIEW CATEGORY                 
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title" data-id="all">All To Do's</h1>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				 <ul class="itemlist list inset"></ul>
				 <ul class="list inset">	
					<li>
						<a href="javascript:void(0)" class="itemEditInit">
							<strong>Edit To Do</strong>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)" class="linkNewItem notlink">
							<strong>Create To Do</strong>
							<span class="chevron"></span>
						</a>
					</li>				
				</ul>
			</div>
		</div>
	</div>

</cfoutput>