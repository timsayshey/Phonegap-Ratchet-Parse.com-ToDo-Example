<cfoutput>
	
	<!--- ------------------------------------ ----
	----- Sign Up                             
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">						
			<h1 class="title">Sign Up</h1>			
		</header>
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div class="form-wrapper">
				
					<div class="input-group">
						<div class="input-row">
							<label>Email</label>
							<input type="text" id="sign_username" placeholder="Email">
						</div>
						<div class="input-row">
							<label>Password</label>
							<input type="password" id="sign_password" placeholder="Password">
						</div>
					</div>
					
					<a class="button-positive button-block notlink" href="javascript:void(0)" id="sign_submit">Sign Up</a>			
					<a href="##signin" class="button">Need to login?</a>
					
				</div>
			</div>
		</div>
		 
	</div> 

</cfoutput>