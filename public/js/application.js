$(document).ready(function() {
  favoriteFormListener();
});

var favoriteFormListener = function() {
  $('.favorite-form').on('submit', function(event) {
    event.preventDefault();
    
    favoriteForm = $(this);
    favoriteButton = favoriteForm.find('button');

    var url = favoriteForm.attr('action');
    var type = favoriteForm.attr('method');

    $.ajax({
      url: url,
      type: type
    })
    .done(function(response) {
      favoriteButton.remove();
      favoriteForm.append(response);
    })
    .fail(function() {
      alert('Error favoriting tweet.');
    })
  });
};
