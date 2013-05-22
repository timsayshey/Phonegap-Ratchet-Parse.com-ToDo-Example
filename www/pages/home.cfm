<cfoutput>

	<!--- ------------------------------------ ----
	----- Settings                 
	----- ------------------------------------ --->
	
	<div id="#pageid#" class="page" style="display:none;">
	
		<header class="bar-title">
			<h1 class="title" data-id="all">To Do</h1>
		</header>
		
		<cfinclude template="../includes/navbar.cfm">
		
		<div id="wrap-#pageid#">
			<div id="scroller">
				<div id="boxes">
					<div class="box">
						<a href="javascript:void(0)" class="viewCategory box-click" data-id="all">
							<img src="assets/images/icon-view-items.png" /><br />
							View To Do List
						</a>
					</div>
					<div class="box">
						<a href="javascript:void(0)" class="linkNewItem notlink box-click">
							<img src="assets/images/icon-add-item.png" /><br />
							Add To Do
						</a>
					</div>
					<div class="box">
						<a href="##cats_view" class="box-click">
							<img src="assets/images/icon-view-cats.png" /><br />
							View Categories
						</a>
					</div>
					<div class="box">
						<a href="javascript:void(0)" class="linkNewCategory notlink box-click">
							<img src="assets/images/icon-add-cat.png" /><br />
							Add Category
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</cfoutput>