$( document ).on('submit', '.DeleteForm', function(e) {
	e.preventDefault();
	
	var $inputs = $(this).find(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['PostID'];

	$.ajax({
		url: 'deletePost.php',
		type: 'post',
		data: vals,
		success: function(output) {
			$('#' + id).empty();  // Remove child elements
			$('#' + id).remove(); // Remove html element
			$(location).attr("href", "homePage.php");
		},
		error: function(xhr, error) {
			console.debug(xhr); console.debug(error);
		}
	});;
});

$( document ).on('submit', '.EditForm', function(e) {
	e.preventDefault();

	var $inputs = $(this).find(":input");
	var vals = {};
	$inputs.each(function() {
		vals[this.name] = $(this).val();
	});
	var id = vals['PostID'];

	$(location).attr("href", "postPage.php?edit=" + id);
});

