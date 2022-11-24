/**
 * 
 */
 function toggleside(){
    
    document.getElementById("sidebar").style.display="flex";
}
function hidesidebar(){

    
    document.getElementById("sidebar").style.display="none";
    
    

}

var input = document.getElementById("search");


input.addEventListener("keypress", function(event) {

  if (event.key === "Enter") {
   
    event.preventDefault();
    
    document.getElementById("search-btn").click();
  }
});
  function updatepic(){
            var pic =  document.getElementById("userpic");
            
        pic.src = document.getElementById("userpicurl").value;
        }
        function disable(id,btn){
            var submitbtn = document.getElementById("submitbtn");
           
            btn.classList.toggle("button-style");
            if(id.disabled==true){
                id.disabled=false;
                btn.innerHTML = "Save";
               

            }
            else{
                id.disabled=true;
                btn.innerHTML = "Edit";
                // btn.style.color = "red"
                // btn.style.border  ="1px solid red";

            }
        }
        function activate_sbtn(){
            var submitbtn = document.getElementById("submitbtn");
            submitbtn.disabled=false;
            
        }
        function updatepic(){
            var pic =  document.getElementById("userpic");
            
        pic.src = document.getElementById("userpicurl").value;
        }
        function disable(id,btn){
            var submitbtn = document.getElementById("submitbtn");
           
            btn.classList.toggle("button-style");
            if(id.disabled==true){
                id.disabled=false;
                btn.innerHTML = "Save";
               
        
            }
            else{
                id.disabled=true;
                btn.innerHTML = "Edit";
                // btn.style.color = "red"
                // btn.style.border  ="1px solid red";
        
            }
        }
        function activate_sbtn(){
            var submitbtn = document.getElementById("submitbtn");
            submitbtn.disabled=false;
            
        }
        function hidedetails() {
            document.getElementById("account_cont").style.display="none";
            
        }
        function showdetails() {
            document.getElementById("account_cont").style.display="flex";
            
        }
        function hide(){
	        document.getElementById("cart_container").style.display="none";
}
   function showcart(){
	        document.getElementById("cart_container").style.display="flex";
}

   function add_to_cart(u_id,p_id){
        	var xhttp = new XMLHttpRequest();
        	console.log("add to cart clicked");
            xhttp.onload = function (event) {
            	let responsetxt = xhttp.responseText;
                setTimeout(function(){
                  if(responsetxt=="item added"){
            		document.getElementById("add_to_cart").innerHTML = "Go to Cart";
            		document.getElementById("add_to_cart").style.color = 'white';
            	}
                  return true; 
                },500); 
            }
            xhttp.open("post", "AddToCart", true);
            xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
            xhttp.send("user_id=" + u_id + "&p_id=" + p_id);
    }
    function remove_from_cart(c_id){
	var xhttp = new XMLHttpRequest();
        	console.log("remove from cart clicked");
        	
            xhttp.onload = function (event) {
            	let responsetxt = xhttp.responseText;
                setTimeout(function(){
                  if(responsetxt=="item removed"){
           
            	}
                  return true; 
                },500); 
            }
            xhttp.open("post", "RemoveFromCart", true);
            xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
            xhttp.send("cart_id=" + c_id);
	
}
function deleteRow(r) {
  var i = r.parentNode.parentNode.rowIndex;
  setTimeout(function(){
  document.getElementById("cart_table").deleteRow(i);
  return true; 
	 },500); 

}