$(document).ready( function(){

$("#error").fadeOut(5000);
$("#notice").fadeOut(5000);

$( ".form-control").blur(function() {
	console.log( $(this).val());
	if ($('.form-control').val().length > 0){
			$('.button').removeAttr("disabled");
	}
	else {
		$('.button').attr("disabled");
	}
});

});
$(document).on('click', '.search-patients', function() {
	console.log("hospital");
	clinic_id = $(".clinic-id").val()
	var search = $(".patient-search").val()
	$.ajax({
		type: 'GET',
		url: '/clinics/' + clinic_id + '/patients/search_results',
		dataType: 'script',
		data: {q: search}
	});
	console.log(search);
	console.log(clinic_id);
});