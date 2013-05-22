<cfoutput>
	
	<!--- ------------------------------------ ----
	----- Recover Password                              
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">		
			<a href="##signin" class="button-main">Back</a>
			<h1 class="title">Recover Password</h1>			
		</header>
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div class="form-wrapper">
				
					<div class="input-group">					
						<div class="input-row">
							<label class="full">
								Enter your email address and submit it. You will then recieve an email with will allow you to reset your password.
							</label>
						</div>
						<div class="input-row">
							<label>Email</label>
							<input type="text" id="reset_username" placeholder="Email">
						</div>						
					</div>
					
					<a class="button-positive button-block notlink" href="javascript:void(0)" id="reset_submit">Reset</a>						
					
				</div>
			</div>
		</div> 
		
	</div> 

</cfoutput>