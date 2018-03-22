$(document).on("click", ".nav-menu a", function(e){
    sessionStorage["position"] = $(e.target).index() + 1;
});