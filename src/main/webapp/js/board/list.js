
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('info_img').src = e.target.result;
      }
      reader.readAsDataURL(input.files[0]);
    }
 }
function readURL_join(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('j_img').src = e.target.result;
      }
      reader.readAsDataURL(input.files[0]);
    }
 }
function check(src){	  
    var check = "<c:out value = "${loginInfo}"/>";

    if(check == "")
    {
      alert("Please Login");
    } else {
      location.href = src;
    }  
}