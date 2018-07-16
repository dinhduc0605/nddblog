$(document).on("turbolinks:load", function () {
    $(".data-table").DataTable({
        searching: false,
        info: false,
        autoWidth: true,
        stateSave: true,
        lengthChange: false,
        columnDefs: [
            { targets: "no-sort", sortable: false }
        ]
    });
} );

$(document).on("turbolinks:before-cache", function () {
    var datatable = $(".data-table").DataTable();
    if (datatable !== null) {
        datatable.destroy();
        datatable = null;
    }
} );