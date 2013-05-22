<!---
	---------------------------
		Item Templates
	---------------------------
---> 

<cfsavecontent variable="templates.itemform_tmpl">
	<div class="input-group">
		<div class="input-row">
			<label>Name</label>
			<input type="text" placeholder="Name" id="itemName" value="<%=itemName%>" />
		</div>
		<div class="input-row">
			<label>Category</label>
			<div id="categorySelect"></div>
		</div>		
		<div class="input-row">
			<label>Due Date</label>
			<input type="text" placeholder="Due Date" class="datepicker" id="dueDate" value="<%=dueDateView%>" />
		</div>
		<div class="input-row">
			<label>Location</label>
			<input type="text" placeholder="Location" id="location" value="<%=location%>" />
		</div>
		<div class="input-row">
			<label>Description</label>
			<textarea id="description" placeholder="Description"><%=description%></textarea>
		</div>
		<div class="input-row">
			<label>Assigned to</label>
			<input type="text" placeholder="Assigned to" id="assignedTo" value="<%=assignedTo%>" />
		</div>
		<div class="input-row">
			<label>Notes</label>
			<textarea id="notes" placeholder="Notes"><%=notes%></textarea>
		</div>
	</div>
</cfsavecontent>

<cfsavecontent variable="templates.itemformsubmit_tmpl">
	<a class="button-positive notlink itemsubmit" href="javascript:void(0)" id="<%=submitItemEdit%>"		
		<% if(typeof objectId !== "undefined") { %>
			data-id="<%=objectId%>"
		<% } %>
	>Submit</a>
</cfsavecontent>

<cfsavecontent variable="templates.item_tmpl">
	<tr data-id="<%=objectId%>">
		<td> 
		  <a class="icon-trash itemremove" href="javascript:void(0)"></a> 
		</td>
		<td class="body"><a href="javascript:void(0)" class="viewItem" data-id="<%=objectId%>"><%=itemName%></a> - <a href="javascript:void(0)" class="editItem" data-id="<%=objectId%>">Edit</a>
		</td>
	</tr>
</cfsavecontent>

<cfsavecontent variable="templates.itempage_tmpl">
	<ul class="list inset">
		<li class="list-divider">Primary Information</li>
		<li>
			<h3><%=itemName%></h3>
			<h5>Due: <%=dueDateView%></h5>
			<%=description%>
		</li>
		<li class="list-divider">Additional Information</li>
		<li id="itemCategoryName"></li>		
		<li><strong>Location:</strong> <%=location%></li>
		<li><strong>Assigned to:</strong> <%=assignedTo%></li>
		<li class="list-divider">Notes</li>
		<li><%=notes%></li>
	</ul>
</cfsavecontent>