<cfoutput>
	
	<!--- ------------------------------------ ----
	----- CATEGORY FORM               
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title">Category</h1>
			<a href="javascript:void(0)" class="button-positive submitbtn" id="new_category">Submit</a>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div class="form-wrapper">
					<div class="input-group">
						<div class="input-row">
							<label>Category Name</label>
							<input type="text" placeholder="Name" id="catName" />
						</div>
					</div>					
				</div>
			</div>
		</div>
		
	</div>

</cfoutput>