$(document).on("click", ".nav-menu a", function(e){
    var target = e.target;
    $(".nav-menu a").removeClass("active");
    sessionStorage["position"] = $(target).index() + 1;
});