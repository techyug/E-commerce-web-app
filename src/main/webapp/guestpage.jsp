<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.*" %>
<% ArrayList<Pclass> record= new servproduct().returnproduct();
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


        .container {
            display: flex;
            flex-direction: column;
            border: 2px solid gray;
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
            border: 1px solid black;
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
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
            align-items: center;
            display: grid;
            color: white;
            gap: 40px 30px;
            grid-template-columns: auto auto auto;
            grid-template-rows: auto;

        }

        .productgrid li {
            color: rgb(0, 0, 0);
            background-color: rgb(255, 255, 255);
            padding: 5px;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 200px;
            height: max-content;
            transition: 100ms;
            border-radius: 10px;
            border: 1px solid black;
        }

        .productgrid li:hover {
            background-color: rgb(228, 228, 228);
            transform: scale(1.03);
        }



        .producti div {
            padding-left: 20px;

            display: flex;
            justify-content: center;
            align-items: center;
            justify-content: space-around;
            margin-bottom: 10px;
            margin-top: 10px;
        }



        .producti img {
            width: 100%;
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

        .response {
            position: reletive;
            top: 100px;
        }
    </style>
</head>

<body>
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
   <div class="products">
                        <div class="grid">
                            <ul class="productgrid" >
                                <% for(int i=0;i<record.size(); i++) {%>

                                    <% Pclass p1=(Pclass)record.get(i);%>
                                       <a href="product.jsp?id=<%=p1.getProduct_id()%>" >
                                        <li>
                                            <div class="producti" >
                                                <img src="<%=p1.getProduct_url()%>" alt="Product">

                                                <h4>
                                                    <%=p1.getProduct_name() %>
                                                        <h2>
                                                            &#8377;<%=p1.getProduct_price() %><span>/kg</span>
                                                        </h2>
                                                </h4>
                                                
                                            </div>
                                        </li>

                                       </a> 
                                        <%} %>
                            </ul>
                        </div>
                    </div>

</body>

</html>