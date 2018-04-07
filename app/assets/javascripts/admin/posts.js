$(document).on('turbolinks:load', function () {
    $.uploadPreview({
        input_field: "#post_cover",   // Default: .image-upload
        preview_box: "#background-preview",  // Default: .image-preview
        label_field: "#image-label",    // Default: .image-label
        label_default: "Choose File",   // Default: Choose File
        label_selected: "Change File",  // Default: Change File
        no_label: true                 // Default: false
    });

    $("#form-tags").tagit({
        singleField: true,
        autocomplete: {
            source: function(search, showChoices) {
                $.ajax({
                    url: "/admin/tags.json",
                    data: search,
                    success: function(choices) {
                        showChoices(choices.map(function (choice) {
                            return choice.name;
                        }));
                    }
                });
            }
        }
    });

    new InscrybMDE();
});