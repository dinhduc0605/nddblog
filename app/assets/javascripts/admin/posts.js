$(document).on('turbolinks:load', function () {
  $.uploadPreview({
    input_field: "#post_cover",   // Default: .image-upload
    preview_box: "#background-preview",  // Default: .image-preview
    no_label: true                 // Default: false
  });

  $("#form-tags").tagit({
    singleField: true,
    autocomplete: {
      source: function (search, showChoices) {
        $.ajax({
          url: "/admin/tags.json",
          data: search,
          success: function (choices) {
            showChoices(choices.map(function (choice) {
              return choice.name;
            }));
          }
        });
      }
    }
  });
});
