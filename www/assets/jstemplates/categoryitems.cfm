<!---  
	---------------------------
		Category Items Templates
	---------------------------
---> 

<cfsavecontent variable="templates.categoriesItemsList_tmpl">
	<% for ( var i = 0; i < categoriesObj.length; i++ ) { %>
		
		<h4><%=categoriesObj[i].categoryName%></h4>

		<% for ( var z = 0; z < allItems.length; z++ ) { %>

			<% if(categoriesObj[i].objectId === allItems[z].catId) { %>
				<%=allItems[z].itemName%> <br>
			<% } %>

		<% } %>

	<% } %>
</cfsavecontent>

<cfsavecontent variable="templates.categoryItems_tmpl">

		<% 
			var cnt = 0;
			for ( var z = 0; z < allItems.length; z++ ) 
			{ 
		%>

			<% 
				if(objectId === allItems[z].catId || objectId === 'all') 
				{ 
			%>
			
				<li>
					<a href="javascript:void(0)" class="viewItem" data-id="<%=allItems[z].objectId%>">						
						
						<div style="padding-top:10px;">
							<strong><%=allItems[z].itemName%></strong><br />
							Due: <%=allItems[z].dueDateView%>
														
							<span class="chevron"></span>
						</div>
						<br class="clear">
					</a>
					<a href="javascript:void(0)" class="editItem button-main btn2 itemEdit" data-id="<%=allItems[z].objectId%>">Edit</a> 
		<a href="javascript:void(0)" class="itemremove button-negative btn1 itemEdit" data-id="<%=allItems[z].objectId%>">Delete</a>
				</li>
			<% 
					cnt++;
				}
				
			%>

		<% } %>
		
		<%
			if(cnt === 0)
			{
		%>
				<h2 class="insettext">You haven't added any items yet.<span>Click "Create item" to go add one now.</span></h2>
		<%			
			} 
		%>
</cfsavecontent>