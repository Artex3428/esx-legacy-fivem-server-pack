$(function(){
  xHair = {}
  xHair.show = function(data){
    $('.crosshair-wrapper').show();
  };

  xHair.hide = function() {
    $(".crosshair-wrapper").hide();
  };
  window.addEventListener('message', function(event) {
    switch(event.data.display) {
      case 'crosshairShow':
				xHair.show(event.data);
      break;
      case 'crosshairHide':
				xHair.hide(event.data);
      break;
    }
  });
});