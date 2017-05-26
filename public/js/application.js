$(document).ready(function() {
  favoriteFormListener();
  showCommentFormListener();
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

var showCommentFormListener = function() {
  $('.add-comment-button').on('click', function(event) {
    event.preventDefault();
    
    var addCommentButton = $(this);
    var getNewCommentForm = addCommentButton.closest('form');
    var addCommentDiv = addCommentButton.closest('div')

    var url = getNewCommentForm.attr('action');

    $.ajax({
      url: url
    })
    .done(function(response) {
      addCommentDiv.prepend(response);
      addCommentButton.hide();
    })
    .fail(function() {
      alert('Error getting comment form');
    })    
  });
};
