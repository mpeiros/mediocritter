$(document).ready(function() {
  favoriteFormListener();
  showCommentFormListener();
  submitCommentFormListener();
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

var submitCommentFormListener = function() {
  $('.comment-form-container').on('click', '.submit-comment-button', function(event) {
    event.preventDefault();
    
    var submitCommentButton = $(this);
    var commentContainerDiv = submitCommentButton.closest('.favorite-panel').find('.comment-container');
    var submitCommentForm = $(this).closest('form');
    var addCommentButton = submitCommentButton.closest('.favorite-panel').find('.add-comment-button');

    var url = submitCommentForm.attr('action');
    var type = submitCommentForm.attr('method');
    var data = submitCommentForm.serialize();

    $.ajax({
      url: url, 
      type: type,
      data: data
    })
    .done(function(response) {
      if (commentContainerDiv.find('.comment-panel').length) {
        commentContainerDiv.after(response);
      } else {
        commentContainerDiv.append(response);
      }
    })
    .fail(function() {
      alert('Error making comment.');
    })
    .always(function() {
      submitCommentForm.remove();
      addCommentButton.show();
    });
  });
};
