<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%
User user = new User();
GetCart crt = new GetCart();
ArrayList<CartProduct> carts = null;
if(session.getAttribute("uid") ==null){
	response.sendRedirect("guestpage.jsp");
	//response.sendRedirect("login.html");
}
else{
	carts = crt.getCart(session.getAttribute("uid").toString());
	long id = Integer.parseInt(session.getAttribute("uid").toString());
	GetUserDetails gd = new GetUserDetails();
	user = gd.getuserByid(id);
	
}
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.*" %>
<% 
ArrayList<Pclass> record= new servproduct().returnproduct();
ArrayList<Pclass> searchP = null;
if(request.getParameter("search")!=null){
	 searchP= new servSproduct().returnSproduct('%'+request.getParameter("search")+'%');
}
if(session.getAttribute("uid") ==null){
	
}

    %>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500;700;900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href = "newcss.css">

    <title>Insert title here</title>
    <style>
        * {
            font-family: 'Nunito', sans-serif;
            text-decoration: none;
            list-style: none;
            margin: 0;
        }


        .container {
            display: flex;
            flex-direction: column;
            border: 2px solid gray;
        }

        .navbar {
            z-index: 1;
            position: fixed;
            background-color: rgba(255, 255, 255, 1);
            width: 95vw;
            padding-left: 20px;
            padding-right: 20px;
            height: 80px;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid gray;

        }

        .lists {
            margin: 0;
            padding-left: 20px;
            padding-right: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            min-width: fit-content;
            flex-direction: row;

        }

        .search {
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 300px;
            min-width: 100px;
            width: fit-content;
            margin: 5px;
            overflow-x: hidden;

        }

        .search input {
            display: flex;
            width: 90%;
            height: 40px;
            border-radius: 10px;
            outline-color: rgb(9, 66, 255);
            padding-left: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-right: 35px;

        }

        .search input:focus {
            width: 100%;
            padding-left: 20px;
        }



        .navlinks {
            vertical-align: middle;
            display: flex;
            width: fit-content;

            overflow-y: hidden;
            justify-content: space-evenly;
            max-width: 120%;
            max-height: 68px;
            min-width: 270px;
        }

        .navlinks button {
            color: white;
            background-color: rgb(46, 46, 46);
            border: 0;
            border-radius: 10px;
            height: 40px;
            margin-left: 10px;
            padding-left: 10px;
            padding-right: 10px;
            margin-top: auto;
            margin-bottom: auto
        }

        .links {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            vertical-align: middle;
        }

        .links a {
            border-radius: 5px;
            height: 20px;
            padding: 10px;
            color: white;
            margin: 10px;
            padding-left: 10px;
            padding-right: 10px;
            background-color: blue;
        }

        .loginpanel {

            display: none;
            flex-direction: column;
            padding: 10px;
            width: 400px;
            height: 90vh;
            border: 2px solid rgb(255, 102, 102);
            justify-content: center;
            position: fixed;
            z-index: 2;
            background-color: rgb(209, 213, 255);
            right: -10px;
            top: 80px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .loginpanel input {
            width: 100%;
            height: 30px;
            padding-left: 10px;
            outline-color: blueviolet;

        }

        .form table {
            border-collapse: collapse;
        }

        .form table td {
            padding: 5px;
        }

        .form {
            height: 300px;
            width: 95%;
            margin-left: auto;
            margin-right: auto;

        }

        .form table,
        tr,
        td {
            border: 0px solid black;
        }

        .form table button {
            width: 100px;
            height: 30px;
            border-radius: 5px;
            color: rgb(0, 0, 0);
            background-color: rgb(0, 229, 11);
        }

        .products {
            position: relative;
            top: 90px;

            width: 98vw;
            height: 80vh;

        }

        .productgrid {
        padding:10px 0px;
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
            align-items: center;
            display: grid;
            margin-bottom:0px;
            border-bottom:2px solid lightgray;
            color: white;
            gap: 40px 30px;
            grid-template-columns: auto auto auto auto;
            grid-template-rows: auto;

        }
  
  @media screen and (max-width: 860px) {
    .productgrid{
        grid-template-columns: auto auto auto;
        grid-template-rows: auto;
    }
    }
      
         @media screen and (max-width: 660px) {
    .productgrid{
        grid-template-columns: auto auto;
        grid-template-rows: auto;
    }
    }  
     .productgrid li {
            color: rgb(0, 0, 0);
            background-color: rgb(255, 255, 255);
            padding: 5px;
			display:flex;
			justify-content:center;
			align-items:center;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 200px;
            height:320px;
            
            transition: 100ms;
            border-radius: 10px;
            
        }
        
        .productgrid li:hover {
            background-color: rgb(240, 240, 240);
            transform: scale(1.03);
            border: 2px solid blue;
        }
        .producti{
        width:200px;
        border:0px solid green;
        padding:5px 10px;
        
        }
            .producti div {
           

            display: flex;
            flex-direction:column;
            
            
            margin-bottom: 10px;
            margin-top: 10px;
        }
        .producti h4{
         overflow: hidden;
  vertical-align: middle;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
        
        margin-bottom:8px;
        }



        .producti img {
           width:100%;
           
            margin-bottom:10px;
        }

        .producti div button {
            color: white;
            height: 40px;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            background-color: rgb(255, 73, 73);
            max-width: 45%;
            min-width: 40%;

        }
        
  @media screen and (max-width: 460px) {
    .productgrid{
    margin-top:-40px;
        grid-template-columns: 100%;
        grid-template-rows: auto;
        gap: 10px 30px;
    }
    .producti img{
    height:100%;
    
    }
    .producti{
        display:flex;
        border:0px solid green;
        width:100%;
        height:140px;
        
     	justify-content: space-around;
        }
        .productgrid li{
        height: 150px;
        width:100%;
        padding:4px 10px;
     justify-content: flex-start;
        }
        .pimage{
        display:flex;
       justify-content: center;
       align-items: center; 
       width: 150px;
        
        }
        .pimage img{
        height: 100%;
        margin-bottom:0;
        max-width:140px;
        margin-right:5px;
        width: fit-content;
        }
        .p_info_index{
        width: 100%;
        padding:5px 10px;
        align-items: unset;
        justify-content: space-around;
        }
        
    
  }
    
  

       



    

        .response {
            position: reletive;
            top: 100px;
        }
        .fullscreen{
        z-index:50;
            display: flex;
            width: 100vw;
            height: 100vh;
            position: absolute;
            top: 0;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.127);
        }
        
/* CSS */
    </style>
</head>

<body>
   
 <script src="script.js">   </script>
  

   <div class="cont">
        <div class="navbar-main">
             <div  class="company-logo">
                <a href="index.jsp">L O G O</a>
            </div>
            <form class="search" action="#">
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
                <a href="#" onclick="showcart()">
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
                 <a onclick="showcart();">
                    Cart</a>
                 <a href="#">
                    Notifications</a> 
                <a href="logout">
                  Logout
                </a>
            </div>
        </div>
    </div>
    
   <div id="account_cont"   class="account-container">
        <div class="content"  >
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
            <table id="cart_table" class="cart_table">
            
            <% 
            if(carts!=null){
            for(int i=0;i<carts.size(); i++) {%>
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
                            <button class="cancel" id="remove_btn" onclick="remove_from_cart(<%=c.getCart_id()%>);deleteRow(this);"><div><img width="30px" src="delete_icon.png"></div></button>
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
   <div class="products">
   <div class="grid">
   <% if(searchP!=null){%>
	   <h3 align="center" >Showing Search Results</h3><hr>
	   <% }%>
    <ul class="productgrid">
     <% if(searchP!=null){%>
                            	 <% for(int i=0;i<searchP.size(); i++) {%>
                                    <% Pclass p1=(Pclass)searchP.get(i);%>
                                    <a href="product.jsp?id=<%=p1.getProduct_id()%>" >
                                        <li>
                                            <div class="producti">
                                            <div>
												<img src="<%=p1.getProduct_url()%>" alt="Product">
                                            </div>
                                            <div class="pname_price">
                                            	<h4>
                                                    <%=p1.getProduct_name() %>
												</h4>
												<h2>
                                                      &#8377;<%=p1.getPriceF() %><span></span>
                                                  </h2>
                                            </div>
                                            </div>
                                        </li>

                                        </a>
                                        <%} %>
                            	 
                            <% }%>
    
    </ul>
    
   </div>
   <div class="grid">
                        <h3 align="center" >Showing all Products</h3>
                            <ul class="productgrid">
                             
                            
                                <% for(int i=0;i<record.size(); i++) {%>
									
                                    <% Pclass p1=(Pclass)record.get(i);%>
                                    <a href="product.jsp?id=<%=p1.getProduct_id()%>" >
                                        <li>
                                            <div class="producti">
                                                <div class="pimage" >
													 <img src="<%=p1.getProduct_url()%>" alt="Product">
                                                </div>
												<div class="p_info_index">
												
												<h4>
                                                    <%=p1.getProduct_name() %>
                                                       </h4>
                                                        <h2>
                                                            &#8377;<%=p1.getPriceF() %><span></span>
                                                        </h2>
												</div>
                                                
                                                
                                                
                                                
                                            </div>
                                        </li>

                                        </a>
                                        <%} %>
                            </ul>
                        </div>
                    </div>
<script type="text/javascript">
function addtocart(id) {
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

</body>

</html>