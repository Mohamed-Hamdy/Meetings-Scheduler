//Alter modal based on button clicked

$('#contactForm').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget) // Button that triggered the modal
	var recipient = button.data('whatever') // Extract info from data-* attributes
	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	var modal = $(this)
	modal.find('.modal-title').text('New message to ' + recipient)

})


//maps

function initMap() {
	var location = {
		lat : 49.876445,
		lng : -97.247000
	};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 11,
		center : location
	});
	// The marker, positioned at location
	var marker = new google.maps.Marker({
		position : location,
		map : map
	});
}