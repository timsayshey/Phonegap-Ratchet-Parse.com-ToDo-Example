GLOBAL = window;

function listCategoryItems()
{
	allCategories = qCategories;
	allItems = qItems;
	var template = tmpl("categoriesItemsList_tmpl", {});
	$("#categoriesitemswrap div").html(template); 
}