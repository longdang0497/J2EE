// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}

$(document).ready(function () {
    var hrefIndex = $('#index').attr('href');

    $('#index').click(function() {
        $(this).attr('href','');
    });
});