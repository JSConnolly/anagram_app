$(document).ready(function(){
  $('form').submit(function(e){
    e.preventDefault();

    var data = $(this).serialize();
    $.ajax({
      type: "POST",
      url: '/check_term',
      data: data
    }).done(function(response){
      console.log("hello");
      console.log(response);
      $('#anagrams').text(response)});
  });

});
