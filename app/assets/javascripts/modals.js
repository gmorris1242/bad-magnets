BadMagnets.openModal = function(modal) {
  $(modal).removeClass('hide');
  $(modal).css('display','flex');
  console.log('load modal script')
};

//CLOSE MODALS
$(document).ready(function() {
  $('.modal, .exit').click(function() {
    $('.modal').hide();
  });

  $('.modal .content').click(function(e) {
    e.stopPropagation();
  })
})
