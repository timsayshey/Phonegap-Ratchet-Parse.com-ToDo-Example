<cfoutput>
	
	<!--- ------------------------------------ ----
	----- Edit Account               
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title">Edit Account</h1>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div class="form-wrapper">
					<div class="input-group">
						<div class="input-row">
							<label>Email</label>
							<input type="text" id="edit_username" placeholder="Email">
						</div>
						<div class="input-row">
							<label>Password</label>
							<input type="password" id="edit_password" placeholder="Password">
						</div>
					</div>

<a class="button-positive button-block" href="javascript:void(0)" onclick="_editAccount(); return false;">Submit</a>

				</div>
			</div>
		</div> 
	</div> 

</cfoutput>