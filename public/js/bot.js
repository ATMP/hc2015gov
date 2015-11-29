function question(){
        return $.ajax({
            url:"/api/v1/question",
            type: 'GET',
            data: { question : $('#question').val()},
            contentType: 'application/json; charset=utf-8',
            success:function(result){$("#answer").html(result)}
        })
          
        // console.log($('#question').val())
      }

$(document).ready(function(){
    $("#dog").click(function(){
    if($("#question").is(':visible')){
      $("#question").hide();
      $("#answer").hide();
    }
    else{
      $("#question").show();
    }
    });
  $("#question").keypress(
    function(e){
      if(e.which == 13 && $('#question').val() != ""){
        // $('#answer').val('搜尋中...');
        // $('#answer').show();
        $.when(question()).done(function(){
          $('#question').val('');
          if($('#answer').prop("scrollHeight") != 0){
            $('#answer').height('0px').height($('#answer').prop("scrollHeight") + 'px');
          }
          $('#answer').show();
        })
          
      }
    }
  )
});