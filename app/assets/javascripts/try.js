$(document).on('turbolinks:load', function() {

  $('#manager').on('click', function(e) {
    e.preventDefault();
    console.log('click');
    $('.managable').toggle();
  })

});//$ready function ending
