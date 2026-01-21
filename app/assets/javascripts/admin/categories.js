$(document).on('turbolinks:load', function() {
  $.uploadPreview({
    input_field: "#category_image",
    preview_box: "#background-preview",
    no_label: true
  });
});
