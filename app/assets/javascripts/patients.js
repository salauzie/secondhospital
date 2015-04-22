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

$(document).on('click', '.waiting', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/wait_patient',
		dataType: 'script'
	});
});

$(document).on('click', '.check-up', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/checkup_patient',
		dataType: 'script'
	});
});

$(document).on('click', '.x-ray', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/xray_patient',
		dataType: 'script'
	});
});

$(document).on('click', '.surgery', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/surgery_patient',
		dataType: 'script'
	});
});

$(document).on('click', '.leaving', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/leave_patient',
		dataType: 'script'
	});
});

$(document).on('click', '.billing', function() {
	console.log("test")
	var clinic_id = $(this).attr(".clinic-id")
	var patient_id = $(this).attr(".patient-id")
	$.ajax({
		type: 'POST',
		url: '/clinics/' + clinic_id + '/patients/' + patient_id, '/bills_patient',
		dataType: 'script'
	});
});
