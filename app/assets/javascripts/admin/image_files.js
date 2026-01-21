$(function() {
  $('#images-index').on('click', '.btn-copy-url', function() {
    var container = $(this).closest('.image-file-card');
    var input = container.find('#url input');
    input.select();
    document.execCommand('copy');

    var feedback = container.find('.copied-feedback');
    feedback.addClass('show');

    setTimeout(function() {
      feedback.removeClass('show');
    }, 2000);
  });
});
