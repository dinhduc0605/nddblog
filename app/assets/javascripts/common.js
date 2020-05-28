function getCookie(cname) {
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

let old_position = 0;
$(window).on('scroll', function () {
  if (this.scrollY === 0) {
    $('#mainNav').removeClass('is-fixed is-visible');
  } else {
    $('#mainNav').addClass('is-fixed');
    if (this.scrollY > old_position) {
      $('#mainNav').addClass('is-visible');
    } else {
      $('#mainNav').removeClass('is-visible');
    }
    old_position = this.scrollY
  }
})
