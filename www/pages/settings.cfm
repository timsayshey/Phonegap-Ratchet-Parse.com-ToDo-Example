<cfoutput>

	<!--- ------------------------------------ ----
	----- Settings                 
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title" data-id="all">Settings</h1>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				 <ul class="list inset">
					<li class="list-divider">Account</li>	
					<li>
						<a href="##" id="logout" onclick='_logout(); return false;'>
							<strong>Logout</strong>
						</a>
					</li>	
					<li>
						<a href="##edit_account">
							<strong>Edit Account</strong>
						</a>
					</li>	
					<li class="list-divider">Tools</li>	
					<li>
						<a href="javascript:void(0)" id="exportData">
							<strong>Export and email data</strong>
						</a>
					</li>		
				</ul>
			</div>
		</div>
	</div>

</cfoutput>