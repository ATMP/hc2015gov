function question(){
        $.ajax({
          url:"/api/v1/question",
          type: 'GET',
          data: { question : $('#question').val()},
          contentType: 'application/json; charset=utf-8',
          success:function(result){$("#answer").html(result)}
          })
        // console.log($('#question').val())
      }


$(document).ready(
  function(){
    // $("#start").click(
    //   question()
    // )
    $("#question").keypress(
      function(e){
        if(e.which == 13 &&  $('#question').val()!='' ) {
          question()
        }
      }
    )
  }
)