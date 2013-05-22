<cfoutput>
	
	<!--- ------------------------------------ ----
	----- HOME PAGE                                
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page">
	
		<header class="bar-title">
			<a class="button-main goback" href="javascript:void(0)">Back</a>
			<h1 class="title">Categories</h1>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">			
				
				<h2 class="textinset">Choose a category:</h2>
				
				<ul class="list inset" id="category_list"></ul>	
				
				<ul class="list inset">	
					<li>
						<a href="javascript:void(0)" class="catEditInit">
							<strong>Edit Category</strong>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)" class="linkNewCategory notlink">
							<strong>Create Category</strong>
							<span class="chevron"></span>
						</a>
					</li>				
				</ul>			
			</div>
		</div>
		
	</div>

</cfoutput>