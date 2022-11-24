<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="classes.*"%>
<%@ page import="java.util.ArrayList" %>

<%
GetCart crt = new GetCart();
ArrayList<CartProduct> carts = null;
if (session.getAttribute("uid") == null) {
	response.sendRedirect("guestproduct.jsp?id=" + request.getParameter("id"));
	//response.sendRedirect("login.html");
}
Pclass p = new singleproduct().returnproduct(request.getParameter("id"));
%>

<%
User user = new User();
if(session.getAttribute("uid") ==null){
	response.sendRedirect("guestpage.jsp");
	//response.sendRedirect("login.html");
}
else{
	
	long id = Integer.parseInt(session.getAttribute("uid").toString());
	GetUserDetails gd = new GetUserDetails();
	user = gd.getuserByid(id);
}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="pcss.css">
<link rel="stylesheet" href = "newcss.css">


<title>Insert title here</title>
<style>
.account-container{
	
   
    display: none;
    
}
</style>
</head>

<body>
<script type="text/javascript">
function hidedetails() {
    document.getElementById("account_cont").style.display="none";
    
}
function showdetails() {
    document.getElementById("account_cont").style.display="flex";
    
}
</script>
<script  src="script.js">
</script>
	 <div class="cont">
        <div class="navbar-main">
            <div  class="company-logo">
                <a href="index.jsp">L O G O</a>
            </div>
            <form class="search" action="index.jsp">
                <input type="search" name="search"
                value="<%if(request.getParameter("search")!=null) out.print(request.getParameter("search"));%>"
                 placeholder="Serch Products.."  id="search">
                <button type="submit">
                <img id="search-btn" width="26px" src="https://cdn-icons-png.flaticon.com/512/3288/3288755.png" alt=""> 
                </button>
                
            </form>
            <div id="sidetoggle" onclick="toggleside();" class="toggle">
                    <hr>
                    <hr>
                    <hr>
            </div>
            <div id="navs" class="navs">
                <a href="index.jsp">
                    Home
                </a>
                <a onclick="showdetails();" > 
                    Account
                </a>
                <a onclick="showcart();">
                    Cart</a>
                 <a href="#">
                    Notifications</a>   
                <a href="logout">
                    Logout</a>
            </div>
        </div>
    </div>
    <div id="sidebar" onclick="hidesidebar();" class="sidebar">
        <div class="panel">
            <div class="nlinks">
                <a href="index.jsp">
                    Home
                </a>
                <a onclick="showdetails();">
                    Account
                </a>
                 <a onclick="showcart()">
                    Cart</a>
                 <a href="#">
                    Notifications</a> 
                <a href="logout">
                  Logout
                </a>
            </div>
        </div>
    </div>
    
   <div id="account_cont" class="account-container">
        <div class="content" >
            <table>
                <form action="#" method="get">
                <tr>
                    <td align="center" colspan="2" >
                        <div class="image">
                            <img id="userpic" src="https://image.shutterstock.com/image-photo/young-adult-profile-picture-red-260nw-1655747050.jpg" height="120px" alt="">
                        </div>
                        <input onchange="updatepic(); activate_sbtn();" type="url" placeholder="Photo URL" name="userpicurl" 
                        value="https://image.shutterstock.com/image-photo/young-adult-profile-picture-red-260nw-1655747050.jpg"
                        id="userpicurl" disabled required>
                        <span>
                            <button  id="editpic" type="button" onclick="disable(document.getElementById('userpicurl'),document.getElementById('editpic'));" >Edit</button>
                        </span>
                        
                    </td>
                   
                    
                </tr>
                <tr>
                    <td>Your Name</td>
                    <td>
                        <input type="text" name="name" id="username"  onchange="activate_sbtn();" disabled value="<%=user.getUser_name()%>"> <span>
                            <button id="editname" type="button" onclick="disable(document.getElementById('username'),document.getElementById('editname'));" >Edit</button>
                        </span>
                    </td>
                    
                </tr>
                <tr>
                    <td>Email address</td>
                    <td>
                        <input type="text" name="email" id="useremail"  onchange="activate_sbtn();" disabled value="<%=user.getUser_email()%>" required>
                        <span>
                            <button id="editemail" type="button" onclick="disable(document.getElementById('useremail'),document.getElementById('editemail'));" >Edit</button>
                        </span>
                    </td>
                    
                </tr>
                <tr>
                    <td>Phone No.</td>
                    <td>
                        <input id="userphone" 
                        onchange="activate_sbtn();"
                        type="text" value="<%=user.getUser_phone()%>" disabled required>
                        <span>
                            <button id="editphone" type="button" onclick="disable(document.getElementById('userphone'),document.getElementById('editphone'));" >Edit</button>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3"><button
                        class="button-87" id="submitbtn" type="submit" 
                        
                        disabled>Save All Changes</button>
                        <!-- HTML !-->
                        <button id="submitbtn" type="reset" onclick="hidedetails();"  class="button-87" role="button">Cancel</button>
                       
                    </td>
                </tr>
            </form>
            </table>
        </div>
    </div>
	   <div id="cart_container" class="cart_cont">
        <div class="cart">
            <table class="cart_table">
            
            <% if(carts!=null){ for(int i=0;i<carts.size(); i++) { %>
                   <% CartProduct c=carts.get(i);%>
                   <tr>
                    <td> 
                        <div class="image">
                            <img src="<%=c.getP_url()%>" alt="">
                        </div>
                        
                    </td>
                    <td>
                        <div class="pinfo_cart">                        
                            <p class="pname_cart"><%=c.getP_name()%></p>
                            <p class="p_price_cart"> &#8377;<%=c.getPriceF()%></p>
                        </div>
                        
                    </td>
                    <td>
                        <div class="action">
                            <button class="cancel" id="remove_btn" onclick="remove_from_cart(+<%=c.getCart_id()%>);"><div><img width="30px" src="delete_icon.png"></div></button>
                        </div>
                    </td>
                </tr>
                   
             <%} }%>
             
                <tr class="tr_proceed">
                    <td colspan="3" class="total_td">
                        <div class="total_action">
                            <div class="total">
                                <p>Total Amount : 13,287 </p>
                            </div>
                            <button class="checkout">
                                <p>Check Out Now<span><img width="30px" alt="" src="payment_icon_1.png"></span></p>
                            </button>
                            <button class="cancel" onclick="hide();" >Cancel</button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
	<main class="main-container">
        <div class="product-and-info">
            <div class="images-action">
                <div class="product-image-section">
                    <div>
                        <ul class="image-list">
                            <li>
                                <img src="https://rukminim1.flixcart.com/image/128/128/khdqnbk0/computer/f/y/t/apple-original-imafxfyq6x3yhzxg.jpeg?q=70" alt="">
                            </li>
                            <li>
                                <img src="https://rukminim1.flixcart.com/image/128/128/khdqnbk0/computer/f/y/t/apple-original-imafxfyq6x3yhzxg.jpeg?q=70" alt="">
                            </li>
                            <li>
                                <img src="https://rukminim1.flixcart.com/image/128/128/khdqnbk0/computer/f/y/t/apple-original-imafxfyq6x3yhzxg.jpeg?q=70" alt="">
                            </li>
                            <li>
                                <img src="https://rukminim1.flixcart.com/image/128/128/khdqnbk0/computer/f/y/t/apple-original-imafxfyq6x3yhzxg.jpeg?q=70" alt="">
                            </li>
                        </ul>
                    </div>
                    <div class="selected-image">
                        <img src="<%=p.getProduct_url()%>" alt="">
                    </div>
                </div>
                <div class="buy-add">
                    <button id="buy" onclick="" >BUY</button>
                    <button id="add_to_cart" 
                    style="color:black;background-color: rgb(255, 166, 0);" 
                    onclick="add_to_cart(<%=session.getAttribute("uid")%>,<%=p.getProduct_id()%>);" >
                    Add to Cart <img width="20px" src="loading_icon.png" >
                    </button>
                </div>
            </div>
            
            <div class="product-info">
                <div class="product-title">
                    <p class="ptitle">
                        <%=p.getProduct_name() %>
                    </p>
                    <a href="#" class="rating-and-reviews">   
                        <p class="stars">4.6 <span><img src="/star.png" alt=""></span></p>
                        <p>800 Ratings & 10 reveiws</p>
                    </a>
                    <p class="price">&#8377; <%=p.getPriceF() %> <del> &#8377;00,000</del></p>
                </div>
                <div class="specifications">
                    <table class="specification">
                        <th>General</th>
                        <tr>
                            <td>Sales Package</td>
                            <td>MacBook Air, 30 W USB-C Power Adapter, USB-C Charge Cable (2m), User Guide, Warranty Documents</td>
                        </tr>
                        <tr>
                            <td>Model Number</td>
                            <td>MJXAUDBABU1</td>
                        </tr>
                        <tr>
                            <td>Color</td>
                            <td>Silver</td>
                        </tr>
                        <tr>
                            <td>Power Supply</td>
                            <td>30W AC Adapter</td>
                        </tr>
                        <tr>
                            <td>Color</td>
                            <td>Silver</td>
                        </tr>
                    </table>
                    <table class="specification">
                        <th>Features</th>
                        <tr>
                            <td>Sales Package</td>
                            <td>MacBook Air, 30 W USB-C Power Adapter, USB-C Charge Cable (2m), User Guide, Warranty Documents</td>
                        </tr>
                        <tr>
                            <td>Model Number</td>
                            <td>MJXAUDBABU1</td>
                        </tr>
                        <tr>
                            <td>Color</td>
                            <td>Silver</td>
                        </tr>
                        <tr>
                            <td>Power Supply</td>
                            <td>30W AC Adapter</td>
                        </tr>
                        <tr>
                            <td>Color</td>
                            <td>Silver</td>
                        </tr>
                    </table>
                </div>
                <div class="reveiws"></div>

            </div>
        </div>
    </main>

	<script type="text/javascript">
function add_to_cart(id) {
	console.log("cart id = "+id);
	var xhttp = new XMLHttpRequest();

    xhttp.onload = function (event) {
    	event.preventDefault();
    	
    	let responsetxt = xhttp.responseText;
    	
    	if(responsetxt=="Login First"){
    		document.getElementById("popup").innerHTML = "Please Login to add any item in your cart";
    		document.getElementById("fullscreen").style.display = "flex";
    		
    	}
    	else{
    		document.getElementById("popup").innerHTML = "Added to cart";
    		
    		
    		
    		
    	}
    	
    
       setTimeout(function(){
     document.getElementById("fullscreen").style.display = "none";
           
            
        },4000);  
    }
    xhttp.open("post", "addtocartsvt", true);
    xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    xhttp.send("pid=" + id );
    

	
}
</script>
<script  src="script.js"></script>
</body>

</html>