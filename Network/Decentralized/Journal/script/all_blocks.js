var jsonsource = new XMLHttpRequest();
var url = "https://my-json-server.typicode.com/czantoine/c-anne/blocks";

jsonsource.onreadystatechange=function() {
  if (this.readyState == 4 && this.status == 200) {
    all_blocks(this.responseText);
  }
}
jsonsource.open("GET", url, true);
jsonsource.send();

function all_blocks(response) {
  var arr = JSON.parse(response);
  var i;
  var out = "<table>";
  for(i = 0; i < arr.length; i++) {
    out += "<tr><td>" + 
    arr[i].hashage_w +
    "</td><td>" +
    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
    arr[i].horodatage +
    "</td><td>";
  }
  out += "</table>";
  document.getElementById("all_blocks").innerHTML = out;
}
