<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="classes.*" %>    
<% 

if(session.getAttribute("uid")!=null){
	response.sendRedirect("product.jsp?id="+request.getParameter("id"));
}
Pclass p= new singleproduct().returnproduct(request.getParameter("id"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="">
    <title>Insert title here</title>
    <style>
        * {
            font-family: 'Nunito', sans-serif;
            text-decoration: none;
            list-style: none;
            margin: 0;
        }


       

        .navbar {
            z-index: 1;
            position: fixed;
            background-color: rgba(255, 255, 255, 0.9);
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
            max-width: 400px;
            min-width: 100px;
            
            margin: 5px;
            overflow-x: hidden;

        }

        .search input {
            display: flex;
            width: 100%;
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
            
            display: flex;
            width: fit-content;
			align-items:center;
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

        
         .fullscreen{
            z-index:50;
            display: none;
            width: 100vw;
            height: 100vh;
            position: fixed;
            top: 0;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.0);
            
        }
        .msg{
            background-color: rgb(233, 233, 233);
            width:400px;
            display: flex;
            border:2px solid blue;
            box-shadow: inset 10px 10px 10px rgba(0, 0, 0, 0.233);
            
            
            height: 200px;
            position: relative;
            justify-content:center;
        	align-items:center;

        }
        .msg button{
            width: 70px;
            background-color: rgb(200, 0, 0);
            color: white;
            font-weight: 400;
            height: 40px;
            position: absolute;
            right: 5px;
            top:5px;
            border-radius:5px;
        }
        .msg a{
        display:flex;
        border-radius:5px;
        background-color:blue;
        color:white;
        height:50px;
        width:90%;
        text-align:center;
        justify-content:center;
        align-items:center;
        position:absolute;
        bottom:10px;
        max-width:200px;
        }
        .msg p{
        color:black;
       font-size:1.3rem;
        }
       /* .navbar,.producti{
       filter: blur(8px);
        } */
       
    </style>
    <script type="text/javascript">
    function popup() {
    	document.getElementsByClassName('fullscreen')[0].style.display='none';
        document.getElementsByClassName('navbar')[0].style.filter = 'blur(0px)';
        document.getElementsByClassName('producti')[0].style.filter = 'blur(0px)';
		
	}
    </script>
</head>
<body>
  <div class="fullscreen">
        <div class="msg" >
            <p id="popup" >Please login to add items in cart</p>
           
            <a href="login.html">Login</a>
            <button onclick='popup();' >Close</button>
        </div>
    </div>
    <nav class="navbar">
        <ul class="lists">
            <li class="logo">
                <img src="https://www.logodesign.net/logo/dollar-sign-incorporated-with-shopping-cart-5404ld.png"
                    width="70px" alt="logo">
                <h3>My Store</h3>
            </li>
            <li>
                <div class="search">
                    <input type="search" placeholder="Search products"> <span> <img
                            style="position:relative ; right:36px "
                            src="https://www.system-concepts.com/wp-content/uploads/2018/09/Search-Icon-Blue.jpg"
                            width="30px" alt="search"></span>

                </div>
            </li>
            <li>
                <div class="navlinks">
                    <div class="links">

                        <a href="index.jsp">Home Page</a>
                        <a href="login.html">Login Page</a>

                    </div>
                    <h2 class="usernameinnav"></h2>


                </div>
            </li>
        </ul>

    </nav>
    <div class="productpage">
        <div class="producti">
            <div class="pimage">
                <img src="<%=p.getProduct_url()%>"  alt="Product">
            </div>

            <div class="pinfo">
                <div>
                    <%=p.getProduct_name() %>
                </div>
                <div style="font-weight:bolder" ;>
                    &#8377;<%=p.getProduct_price() %><span>/kg</span>
                    <span style="font-size: small;border-radius: 4px;padding: 4px;background-color: rgb(0, 255, 72);color:rgb(0, 0, 0)" ;>20% off</span>
                </div>

            </div>
              <div class="paction">
                <button style="font-weight:bolder;color:black;background-color:rgb(242, 201, 0);" >Buy</button>

                <button onclick = addtocart(<%=p.getProduct_id()%>); >Add To Cart</button>
            </div>
            
        </div>
    </div>

<script type="text/javascript">
function addtocart(id) {
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
            
     //todo 
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