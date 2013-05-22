<cfoutput>
	
	<!--- ------------------------------------ ----
	----- Sign In                             
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">			
			<h1 class="title">Sign In</h1>
		</header>
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div class="form-wrapper">
				
					<div class="input-group">
						<div class="input-row">
							<label>Email</label>
							<input type="text" id="log_username" value="" placeholder="Email">
						</div>
						<div class="input-row">
							<label>Password</label>
							<input type="password" id="log_password" value="" placeholder="Password">
						</div>
					</div>
					
					<a class="button-positive button-block notlink" href="javascript:void(0)" id="log_submit">Login</a>
					
					<a href="##signup" class="button">Need to sign up?</a>
					<a href="##forgotpass" class="button" style="float:right;">Forgot Pass?</a>					
					
				</div>
			</div>
		</div> 
		
	</div> 

</cfoutput>