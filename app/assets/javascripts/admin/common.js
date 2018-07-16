$(document).on("turbolinks:load", function () {
    $(".data-table").DataTable({
        searching: false,
        info: false,
        autoWidth: false,
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

$(document).on('click', '.nav li', function () {
    $toggle = $('.navbar-toggle');

    if (nowuiDashboard.misc.navbar_menu_visible == 1) {
        $('html').removeClass('nav-open');
        nowuiDashboard.misc.navbar_menu_visible = 0;
        setTimeout(function () {
            $toggle.removeClass('toggled');
            $('#bodyClick').remove();
        }, 550);
    }
});