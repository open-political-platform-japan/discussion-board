setInterval(function(){
  if($('#auto_refresh').is(":checked")){
    $.get(window.location, null, null, 'script')
  }
  }
, 1000 * 5)
