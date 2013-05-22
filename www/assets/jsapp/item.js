GLOBAL = window;
function _removeItem(el) 
{
	if (confirm('Are you sure want to permanently delete this item?'))
	{ 
		var id;
		
		id = $(el).attr("data-id");
		
		$.parse.delete("items/" + id,
			function(e)  // Success
			{
				refresh();					
			},
			function(e)  // Fail
			{
				doFail(e);
			}
		);
	};
}

function _newItem(e) {
	var itemObj = 
	{
		catId: $("#catId").val(),
		dueDate: { "__type":"Date", "iso":$("#dueDate").val() + "T16:19:38.000Z" },
		dueDateView: $("#dueDate").val(),
		itemName: $("#itemName").val(),
		location: $("#location").val(),
		description: $("#description").val(),
		assignedTo: $("#assignedTo").val(),
		notes: $("#notes").val()
	};    

	$.parse.post('items', itemObj, 
		function(json) // Success
		{ 
			itemObj.objectId = json.objectId;
			item = tmpl("item_tmpl", itemObj);
			$("#item_list").append(item);
	
			refresh();
			
			window.location.hash = "cat_view";	
		},
		function(e) // Fail
		{
			doFail(e);
		}
	);
}

function _loadItemForm()
{
	// Create Empty Item Object
	var itemObj = 
	{
		catId: "",
		dueDate: getCurrentDate(),
		dueDateView: getCurrentDate(),
		itemName: "",
		location: "",
		description: "",
		assignedTo: "",
		notes: ""
	};
	
	// Insert Item Form
	html = "";
	html += tmpl("itemform_tmpl", itemObj);
	
	$("#itemformwrap div").html(html);
		
	// Add submit button
	_insertItemSubmitBtn({ submitItemEdit: "new_item" });
	
	// Insert Category Select
	loadCategorySelector();	
	
	// Refresh date selector
	refreshDateSelect();
}

function _insertItemSubmitBtn(tmplObj) {
	
	// Item submit button
	$("#item_form .itemsubmit").remove();
	submitbtn = tmpl("itemformsubmit_tmpl",tmplObj);
	$("#item_form .bar-title").append(submitbtn);	
}

function _getItem(objectid) 
{
	getItem = $.grep(qItems, function(n, i){ 
		return n.objectId == objectid;
	});

	return getItem[0];
}

function _editItem(el)
{
	var thisId = $(el).attr("data-id"), item,	html;

	thisItem = _getItem(thisId);

	// Fill form with item info
	html = "";
	html += tmpl("itemform_tmpl", thisItem);
	
	$("#itemformwrap div").html(html);
	//$('#myTab a[href="#itemformwrap"]').trigger('click');
	
	// Add submit button
	_insertItemSubmitBtn({ objectId: thisId, submitItemEdit: "submitItemEdit" });
	
	// Refresh date selector
	refreshDateSelect();
	
	$("#submitItemEdit").unbind('tapone');
	$("#submitItemEdit").bind('tapone', function() 
	{
		_editItemSubmit(thisId);
	});
	
	// Insert Category Select
	loadCategorySelector(thisItem.catId);
	
	window.location.hash = "item_form";	
}  

function _editItemSubmit(id)
{
	var thisId = id;
	
	var itemObj = 
	{
		catId: $("#catId").val(),
		dueDate: { "__type":"Date", "iso":$("#dueDate").val() + "T16:19:38.000Z" },
		dueDateView: $("#dueDate").val(),
		itemName: $("#itemName").val(),
		location: $("#location").val(),
		description: $("#description").val(),
		assignedTo: $("#assignedTo").val(),
		notes: $("#notes").val()
	};  
	
	$.parse.put("items/" + thisId, itemObj, 
		function(json) // Success
		{
			refresh();
			window.location.hash = "cat_view";	
			clearAllForms();
		},
		function(e)  // Fail
		{
			doFail(e);
		}
	);
}

function _viewItem(el)
{
	var thisId = $(el).attr("data-id"), item, html;

	// Get Item
	thisItem = _getItem(thisId);
	
	// Create Item HTML and Append
	html = "";
	html += tmpl("itempage_tmpl", thisItem);
	
	$("#item_view #itemPage").html(html);
	
	// Update view item edit btn
	$("#item_view .editItem").attr("data-id",thisId);
	_addItemEvents();
	
	// Create Category HTML and Append
	getCategoryName(thisItem.catId);
	
	window.location.hash = "item_view";
	refreshClick();
}  

function getItems()
{
	$.parse.get("items?order=-dueDate,itemName", 
		function(json) // Success
		{
			var results, html;
	
			qItems = json.results;
			html = "";
			
			//update app status label
			$("#app-status")
				.removeClass('label-important')
				.addClass('label-success')
				.text('App Ready!');
				
			qItems.forEach(function(item) 
			{
				html += tmpl("item_tmpl", item);
			});
			$("#item_list").html(html);
			//$('#myTab a[href="#itemwrap"]').trigger('click');
			
		},
		function(e)  // Fail
		{
			doFail(e);
		}
	);   

}

function _itemEditToggle() {
	
	//reset
	$('.list [class*="button"].btn1').css({ right: '-137' });
	$('.list [class*="button"].btn2').css({ right: '-70' });
	$(".itemEditInit").html("<b>Edit To Do</b>");
	$(".itemEditInit").unbind('tapone');
	
	// toggle
	var itemEditToggle = 1;    
	
	$(".itemEditInit").bind('tapone',
		function(e) 
		{
			if(itemEditToggle) 
			{
				$('.itemEdit.btn1').stop().animate({ right: '10' });
				$('.itemEdit.btn2').stop().animate({ right: '80' });
				$(this).html("<b>End Editing</b>");	
				itemEditToggle = 0;
			}
			else if(!itemEditToggle)
			{
				$('.itemEdit.btn1').stop().animate({ right: '-137' });
				$('.itemEdit.btn2').stop().animate({ right: '-70' });
				$(this).html("<b>Edit To Do</b>");
				itemEditToggle = 1;
			}			
		});
}

function _addItemEvents() 
{
	 // return _this.parent().text(val);
	$(".itemremove")		.unbind('tapone');
	$(".linkNewItem")		.unbind('tapone');
	$("#new_item")			.unbind('tapone');
	$(".viewItem")			.unbind('tapone');
	$(".editItem")			.unbind('tapone');	
	
	$(".itemremove")		.bind('tapone',function(e) { _removeItem(this); });		
	$("#new_item")			.bind('tapone',function(e) { _newItem(this); });		
	$(".viewItem")			.bind('tapone',function(e) { _viewItem(this); });	
	$(".editItem")			.bind('tapone',function(e) { _editItem(this); });
	$(".linkNewItem")		.bind('tapone',function(e) { 
		clearAllForms();
		_loadItemForm();
		loadCategorySelector($("#cat_view h1.title").attr("data-id"));			
		window.location.hash = "item_form";  
	});
	
	$("new_item").bind("keydown", _newItem);
	$.subscribe && $.subscribe('parse.log');
}