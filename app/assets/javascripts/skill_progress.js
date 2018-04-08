var lang = {
    "html": "80%",
    "css": "60%",
    "javascript": "30%",
    "php": "50%",
    "angular": "50%"
};

var multiply = 3;

$.each( lang, function( language, pourcent) {

    var delay = 700;

    setTimeout(function() {
        $('#'+language+'-pourcent').html(pourcent);
    },delay*multiply);

    multiply++;

});