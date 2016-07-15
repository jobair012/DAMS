$(document).ready(function(){
	$("#doctorsName").autocomplete({
		source: '${pageContext.request.contextPath}/search/getAllDoctorsName'
	});
});

function getAllDoctorsName(){
	
	var termData = $("#doctorsName").val();
	
//	alert(termData);
	
	$.ajax({
		url: "search/getAllDoctorsName",
		type: "GET",
		data: {
			"term" : termData
		},
		success: function(data) {
			var datajson = data.allDoctorsName;
			$("#doctorsName").autocomplete({
				source: datajson,
				focus: function(event, ui) {
					event.preventDefault();
					$(this).val(ui.item.label);
				},
				select: function(event, ui) {
					event.preventDefault();
					$(this).val(ui.item.label);
					$("#doctorsName").val(ui.item.value);					
				}
			});
		},
		error: function(data) {
			alert("Error occured while processing" + data);
		}
		
	});
}