function clearAllForms() 
{
	 var $fileselect = $("#fileselect");
	 $fileselect.replaceWith($fileselect = $fileselect.clone(true));	 
	 $("input").val("");
	 $("textarea").val("");	 
	 $('select').prop('selectedIndex',0);
}

function refreshDateSelect()
{
	pickadate = $('[type=date], .datepicker').pickadate({
		format: 'yyyy-mm-dd',
		formatSubmit: 'yyyy-mm-dd',
		onOpen: function() {
        	$(".bar-tab").css("z-index","0");
		},
		onClose: function() {
			$(".bar-tab").css("z-index","5");
		}
	});	
}

function getCurrentDate()
{
	var d = new Date();
    var date = d.toISOString();
	var date = date.split("T");
	
	return date[0];
}

(function($,sr){

  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null;
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100);
      };
  }
  // smartresize 
  jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
