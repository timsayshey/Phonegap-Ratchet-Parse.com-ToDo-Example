GLOBAL = window;
function _removeCategory(el) 
{
	if (confirm('Are you sure want to permanently delete this category?'))
	{ 	
		var id;
	
		id = $(el).attr("data-id");
		
		$.parse.delete("categories/" + id,
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

function _categoryEditToggle() {
	
	//reset
	$('.list [class*="button"].btn1').css({ right: '-137' });
	$('.list [class*="button"].btn2').css({ right: '-70' });
	$(".catEditInit").html("<b>Edit Category</b>");
	$(".catEditInit").unbind('tapone');
	
	// toggle
	var catEditToggle = 1;    
	
	$(".catEditInit").bind('tapone',
		function(e) 
		{
			if(catEditToggle) 
			{
				$('.catEdit.btn1').stop().animate({ right: '10' });
				$('.catEdit.btn2').stop().animate({ right: '80' });
				$(this).html("<b>End Editing</b>");	
				catEditToggle = 0;
			}
			else if(!catEditToggle)
			{
				$('.catEdit.btn1').stop().animate({ right: '-137' });
				$('.catEdit.btn2').stop().animate({ right: '-70' });
				$(this).html("<b>Edit Category</b>");
				catEditToggle = 1;
			}			
		});
}

function _newCategory(e) {	
	window.location.hash = "cat_form";
	
	$("#cat_form #catName").attr("value","");
	$("#cat_form .submitbtn").unbind('tapone');	
	$("#cat_form .submitbtn").attr("data-id","");		
	
	$("#cat_form .submitbtn").bind('tapone', function(e) 
	{
		_newCategorySubmit();
	});
}
	
function _newCategorySubmit(e) {
	var categoryObj = 
	{
		categoryName: $("#catName").val()
	};    

	$.parse.post('categories', categoryObj, 
		function(json)  // Success
		{
			categoryObj.objectId = json.objectId;
			category = tmpl("category_tmpl", categoryObj);
			$("#category_list").append(category);		
			//$('#myTab a:contains("Categories")').trigger('click');
			
			refresh();
			
			window.location.hash = "cats_view";
		},
		function(e)  // Fail
		{
			doFail(e);
			window.location.hash = "cats_view";
		}
	);	
}

function _editCategory(el)
{
	var thisId = $(el).attr("data-id"), 
		category,	
		html;
	
	$.parse.get("categories/" + thisId , 
		function(json) // Success
		{			
			$("#cat_form #catName").attr("value",json.categoryName);
			$("#cat_form .submitbtn").unbind('tapone');
			$("#cat_form .submitbtn").attr("data-id",json.objectId);					
			
			window.location.hash = "cat_form";
			
			$("#cat_form .submitbtn").bind('tapone', function() 
			{
				_editCategorySubmit(thisId);
			});
	
			refresh();
			
			window.location.hash = "cat_form";
		},
		function(e)  // Fail
		{
			doFail(e);
		}
	);
}  

function _editCategorySubmit(id)
{
	var thisId = id;
	
	var categoryObj = 
	{
		categoryName: $("#catName").val()
	};  
	
	$.parse.put("categories/" + thisId, categoryObj, 
		function(json) // Success
		{
			refresh();
			window.location.hash = "cats_view";
			clearAllForms();
		},
		function(e)  // Fail
		{
			doFail(e);
			window.location.hash = "cats_view";
		}
	);
}

function _viewCategory(e,redir)
{
	var thisId = $(e).attr("data-id"), 
		category, 
		html,
		currCat = _getCategory(thisId);	
	
	if(thisId == "all")
	{
		currCat = {
			categoryName: "All To Do's",
			objectId: "all"
		};
	}
	
	allItems = qItems;
	
	html = tmpl("categoryItems_tmpl", currCat);
	
	$("#cat_view .itemlist").html(html);
	
	$("#cat_view h1.title").text(currCat.categoryName);
	$("#cat_view h1.title").attr("data-id",currCat.objectId);
	_addItemEvents();
	
	if(typeof redir == 'undefined') 
	{
		window.location.hash = "cat_view";	
	}
}  

function _getCategory(objectid) 
{
	getCategory = $.grep(qCategories, function(n, i){ 
		return n.objectId == objectid;
	});

	return getCategory[0];
}

function getCategoryName(currentCatId)
{
	thisCategory = _getCategory(currentCatId);
	
	if(typeof thisCategory !== 'undefined')
	{
		html = "";
		html += tmpl("itemCategoryName_tmpl", thisCategory);
		
		$("#itemCategoryName").html(html);	
	}
}

function loadCategorySelector(currentCatId) 
{	
	categoriesObj = qCategories;  
	$("#categorySelect").html(tmpl("categoryselector_tmpl", {thisCatId: currentCatId})); 	
}

function addItemCountToCategories() 
{
	jQuery.grep(qCategories, function(qCat)
	{
		var itemCount = getCategoryItemCount(qCat.objectId);
		var html = '<span class="count">' + itemCount + '</span>';
		
		$(".viewCategory[data-id*='" + qCat.objectId + "'] .count").remove();
		$(".viewCategory[data-id*='" + qCat.objectId + "']").append(html);
	});
}

function getCategoryItemCount(categoryId)
{
	var itemcount = 0;
	
	jQuery.grep(qItems, function(qItem)
	{
		if(qItem.catId === categoryId)
		{
			itemcount++;
		}
	});		
	
	return itemcount;
}

function listCategories()
{
	$.parse.get("categories", 
		function(json) // Success
		{
			var html;
			var cnt = 0;
	
			qCategories = json.results;
			html = "";
			
			//update app status label
			$("#app-status")
				.removeClass('label-important')
				.addClass('label-success')
				.text('App Ready!');
				
			qCategories.forEach(function(category) 
			{			
				html += tmpl("category_tmpl", category);
				cnt++;
			});
			
			if(cnt === 0)
			{
				html = '<h2 class="insettext">You haven\'t added any categories yet.<span>Click "Create Category" to go add one now.</span></h2>';	
			} 
			
			$("#category_list").html(html);	
		},
		function(e)  // Fail
		{
			doFail(e);
		}
	); 
}

function _addCategoryEvents() 
{
	 // return _this.parent().text(val);		
	$("a.catremove").unbind('tapone');
	$("a.linkNewCategory").unbind('tapone');
	$(".viewCategory").unbind(	'tapone');
	$(".editCategory").unbind(	'tapone');
	
	$(".catremove").bind(		'tapone',function(e) { _removeCategory(this); 	});
	$(".linkNewCategory").bind(	'tapone',function(e) { clearAllForms(); _newCategory(this);  });
	$(".viewCategory").bind(	'tapone',function(e) { _viewCategory(this);  	});
	$(".editCategory").bind(	'tapone',function(e) { _editCategory(this);  	});	
	
	$("a").click(function(e) 
	{					
		e.preventDefault();
		e.stopImmediatePropagation();		
	});
	/**/
	//$("new_category").bind("keydown", _newCategory);
	//$.subscribe && $.subscribe('parse.log');

}