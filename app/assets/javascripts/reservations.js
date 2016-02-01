$(document).ready(function(){
  $("#formSubmit").on('click', function(e) {
    e.preventDefault();

    var form = $(this).closest('form');
    var url = window.location.origin + '/reservations/check_availability'

    $.ajax({
      url: url,
      type: 'GET',
      cache: false,
      data: $(form).serialize(),
      dateType: 'json',
      success: function(data) {
        if(data === true) {
          $(form).submit();
        } else {
          swal('Whoops','Looks like that time is already booked, please try another time','error');
        }
      }
    });
  });
});
