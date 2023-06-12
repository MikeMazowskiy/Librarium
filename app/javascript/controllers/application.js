import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

$(document).on('click', '#add-favorite-link', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');

    $.ajax({
        type: 'POST',
        url: url,
        success: function(response) {
            console.log('Favorite added successfully');
        },
        error: function(xhr, status, error) {
            console.error('Error adding favorite:', error);
        }
    });
});