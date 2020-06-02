$('.share-btn').click(function () {
  let $socialBtns = $(this).siblings('.social-btns')
  if ($socialBtns.hasClass('social-btns-active')) {
    $socialBtns.removeClass('social-btns-active')
  } else {
    $socialBtns.addClass('social-btns-active')
  }
})

$(function () {
  if (getCookie('liked')) {
    $('.like-btn').addClass('active')
  }
})

$('.like-btn').click(function () {
  let $this = $(this);
  let $liked = getCookie('liked');
  $.ajax({
    method: 'PATCH',
    url: document.location.href + '/toggle_like',
    data: {
      value: $liked ? -1 : 1
    },
    dataType: 'json',
    success: function (data) {
      if ($liked) {
        $this.removeClass('active')
        setCookie('liked', null, -1)
      } else {
        $this.addClass('active')
        setCookie('liked', true, 365)
      }
      $this.siblings('.total-like').text(data.clap_count)
    },
    error: function () {
      alert('Xảy ra lỗi không thể vỗ tay :(');
    }
  });
})