<!---  
	---------------------------
		Category Templates
	---------------------------
---> 

<cfsavecontent variable="templates.categoryform_tmpl">
	<input type="text" placeholder="Category Name" id="catName" value="<%=categoryName%>" /><br>	
	<a href="javascript:void(0)" class="btn btn-primary" id="<%=submitCategoryEdit%>" 
	<% if(submitCategoryEdit == "categoryName") { %>
		data-id="<%=objectId%>"
	<% } %>
	>Submit</a>
</cfsavecontent>

<cfsavecontent variable="templates.category_tmpl">
	<li>
		<a href="javascript:void(0)" class="viewCategory" data-id="<%=objectId%>">
			<strong><%=categoryName%></strong>
			<span class="chevron"></span>
			<span class="count">1</span>
		</a>
		<a href="javascript:void(0)" class="editCategory button-main btn2 catEdit" data-id="<%=objectId%>">Edit</a> 
		<a href="javascript:void(0)" class="catremove button-negative btn1 catEdit" data-id="<%=objectId%>">Delete</a>
	</li>
</cfsavecontent>

<cfsavecontent variable="templates.categorypage_tmpl">
	<div id="wrapper3" data-id="<%=objectId%>">
		<div id="scroller">					
			<ul class="list inset">
				<%=categoryName%>
			</ul>
		</div>
	</div>
</cfsavecontent>

<cfsavecontent variable="templates.categoryselector_tmpl">
	<select id="catId">
		<% for ( var i = 0; i < categoriesObj.length; i++ ) { %>
			<option value="<%=categoriesObj[i].objectId%>" 
			<% if(thisCatId === categoriesObj[i].objectId) { %>
				selected
			<% } %>
			><%=categoriesObj[i].categoryName%></option>
		<% } %>
	</select>
</cfsavecontent>

<cfsavecontent variable="templates.itemCategoryName_tmpl">
	<strong>Category:</strong> <%=categoryName%>
</cfsavecontent>
