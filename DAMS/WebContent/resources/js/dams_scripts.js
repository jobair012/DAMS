/* * * * * * Logout function * * * * * */
function formSubmit() {
	document.getElementById("logoutForm").submit();
}

/* * * * * * Date Picker Code * * * * * */
$(document).ready(function() {
    $("#datepicker").datepicker({ dateFormat: 'yy/mm/dd'} );
  });

/*$(document).ready(function(){
	$(function() {		
		$("#doctorsName").autocomplete({
			source: function (request, response) {
	            $.getJSON("search/getAllDoctorsName", {
	                term: request.term
	            }, response);
	        }
		});
	});
});*/
 

function searchDoctor(){
	var doctorName = $("#doctorsName").val();
	alert(doctorName);
	var speciality = $("#speciality").val();
	alert(speciality);
	var area = $("#area").val();
	alert(area);
	var gender = $("#gender").val();
	alert(gender);
	
	
	$.ajax({
		url: "search/searchDoctor",
		type: "POST",
		data: {
			"doctorName" : doctorName,
			"speciality" : speciality,
			"area" : area,
			"gender" : gender
		},
		success: function(data){
			jQuery('#searchDoctor').html(data);
		}
	});
}

/*
$(document).ready(function() {

	$('#doctorsName').autocomplete({
		alert("OK");
		serviceUrl: '${pageContext.request.contextPath}/search/getAllDoctorsName',
		paramName: "tagName",
		delimiter: ",",
	    transformResult: function(response) {
	    	
	        return {
	        	
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	
	                return { value: item.tagName, data: item.id };
	            })
	            
	        };
	        
	    }
	    
	});
	
	
});

*/


/*
$(document).ready(function() {
	$(function() {
		$("#doctorsName").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "search/getAllDoctorsName",
					type : "GET",
					data : {
						term : request.term
					},

					dataType : "json",

					success : function(data) {
						response($.map(data, function(v, i) {
							return {
								label : v.term,
								value : v.term
							};
						}));
					},					
					error: function(data) {
						alert("Error occured while processing" + data);
					}
				});
			}
		});
	});
});
*/
function getAllDoctorsName() {

	var termData = $("#doctorsName").val();

	// alert(termData);

	$.ajax({
		url : "search/getAllDoctorsName",
		type : "GET",
		data : {
			"term" : termData
		},
		success : function(data) {
			var datajson = data.allDoctorsName;
			$("#doctorsName").autocomplete({
				source : datajson,
				focus : function(event, ui) {
					event.preventDefault();
					$(this).val(ui.item.label);
				},
				select : function(event, ui) {
					event.preventDefault();
					$(this).val(ui.item.label);
					$("#doctorsName").val(ui.item.value);
				}
			});
		},
		error : function(data) {
			alert("Error occured while processing" + data);
		}

	});
}