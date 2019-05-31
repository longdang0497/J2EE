// function calculate() {
//     var price = document.biForm.getElementById("biPrice").value;
//     var quantities = document.getElementById("biQuantities").value;
//     document.getElementById("biTotal").value = price * quantities;
// }

function calculate()
{
    var theForm = document.forms["biForm"];

    var price = theForm.elements["biPrice"];
    var quantities = theForm.elements["biQuantities"];

    var total = parseFloat(price) * parseFloat(quantities);
    if (!isNaN(total))
        document.getElementById("biTotal").innerHTML = total;
}