<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
a{
    color: black;
}


.hr{
    position: fixed;
    top: 0;
    z-index: 1111;
    background-color: rgb(243, 25, 25);
    border-width: 0;
    width: 100%;
    height:2.5px;
}



.name {
    display: flex;
    width: 300px;
    flex-direction: row;
    margin-left: -35px;
    justify-content: flex-end;
    align-items: center;
    font-size: x-large;
    font-weight: bolder;
    padding-left: 70px;
    padding-right: 20px;
    border-radius: 35px;
   	height: 70px;
    margin-right: 10px;
    text-shadow: 5px 5px 10px rgba(0, 0, 0, 0.562);
    overflow-x: hidden;
    background-color: rgb(93, 255, 225);
    color: rgb(0, 0, 0);
    box-shadow: inset 10px 10px 10px rgba(0, 0, 0, 0.5);
}
.image {
    height: 70px;
    transform: translateX(-14px);
    box-shadow: inset;
    box-shadow: 5px 5px 4px #00000030;
    border-radius: 35px;
    transition: 100ms;
}



@keyframes rotation {
    from {
        transform: rotate(0deg);
    }

    to {
        transform: rotate(359deg);
    }
}


.navs {
    display: none;
    justify-content: space-evenly;
    
    width: 500px;
    color: black;
    font-weight: 400;
    text-shadow: 5px 5px 5px rgba(0, 0, 0, 0.367);
}
.navs a{
    margin-left: 20px;
    margin-right: 20px;
    width: 110px;
    justify-content: space-evenly;
    align-items: center;
    border-bottom: 2px solid red;
    
    display: flex;
    text-align: center;
    vertical-align: middle;
    margin-top: auto;
    margin-bottom: auto;
    
}
.nlinks{
    display: flex;
    flex-direction: column;
    list-style: none;
   
    
   

}
.nlinks a{
    display: flex;
    width: 300px;
    border-bottom: 2px solid red;
 height: 50px;
    align-items: center;
    justify-content: left;
    
    font-weight: 200;
}
.sidebar{
    position: fixed;
    right: 0;
    display: none;
    width: 100vw;
    z-index: 10;
    background-color: rgba(0, 0, 0, 0.725);
    height: 100%;
}
.panel{
    display: flex;
    flex-direction: column;
    transform: translateX(0px);
    transition: 200ms ease-in;
    padding-top: 50px;
    padding-left: 20px;
    background-color: white;
    width: 300px;
    position: absolute;
    right: 0;
    height: 100%;
}
.toggle{
    z-index: 11;
    display: flex;
    flex-direction: column;
    cursor: pointer;
    height: 30px;
   width: 30px;
   padding: 2px;
    justify-content: space-evenly;
    margin-right: 60px;
}
.toggle hr{
    background-color: rgb(0, 0, 0);
    margin: 2px;
    height: 4px;
    width: 100%;
    border-radius: 2px;
    
}
.home {
    align-items: center;
    display: flex;
    padding: 30px;
    padding-top: 80px;
    overflow: hidden;
    flex-direction: column;
    color: white;

    background-color: rgb(255, 255, 255);
}
@media screen and (min-width:800px) {
    .home {
        justify-content: space-around;
        flex-direction: row;
        align-items: center;
        padding: 100px;
        padding-top: 80px;
    }
    .navs {
        display: flex;
        justify-content: center;
       
    }
    .toggle{
        display:none;
        
    }
    
}

/* .nlinks li a:hover{
    background-color: rgb(40, 83, 255);
    font-size: large;
    padding: 5px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 10px;
    color: white;
    transition: 0.3 ease-in;
} */






/* .links a {
    text-shadow: 2px 4px 3px rgb(0, 0, 0);
    display: flex;
    justify-content: center;
    align-items: center;
    border: 2px solid white;
    margin-right: 20px;
    background-color: rgb(99, 99, 99);
    width: 100px;
    text-align: center;
    height: 40px;
vertical-align: middle;
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 1);
    border-radius: 20px;
    color: white;
    text-decoration: none;
    transition: 100ms;

} */

/* .links a:hover {
    margin-top: auto;
    margin-bottom: auto;
    font-size: larger;
    background-color: rgb(255, 57, 57);
    width: 130px;
    height: 45px;

} */

.themeicon {
    display: none;
    margin-right: 20px;
    border: 2px solid rgb(255, 255, 255);
    border-radius: 27px;
    padding: 5px;
    color: white;
}

header {
    position: fixed;
    z-index: 1;
    width: 100%;
    background-color: rgb(255, 255, 255);
   
    height: 80px;
    display: flex;
    flex-direction: row;
    
    
    box-shadow: 0px 6px 9px rgba(0, 0, 0, 0.3);
    justify-content: space-between;
    align-items: center;
    padding-right: 8%;
}

</style>
</head>
<body>
<hr class="hr">
    <header>
        <div class="name">
            <img class="image" src="me.jpg" alt="">
            <p ">Yogendra Singh</p>
        </div>
        <div id=" sidetoggle" onclick="toggleside();" class="toggle">
                <hr>
                <hr>
                <hr>
        </div>
        <nav id="navs" class="navs">

            <a href="my_portfolio.html"><img src="/home.gif" alt="" width="30px">
                Home</a>

            <a href="https://drive.google.com/file/d/18DdAwC0CtLgSRL6mgbwHYyxLJ0Sz_N1H/view" "> <img style="
                margin-left: 8px;" src="google-drive.png" alt="" width="30px">

                Resume

            </a>

            <a href="/project.html"><img src="/idea.gif" width="30px">
                Projects</a>






        </nav>

    </header>
    <div id="sidebar" onclick="hidesidebar();" class="sidebar">
        <div class="panel">

            <div class="nlinks">

                <a href="my_portfolio.html" >
                    <img src="home.gif" style="margin-right:10px;" width="30px">
                    Home
                </a>


                <a href="https://drive.google.com/file/d/18DdAwC0CtLgSRL6mgbwHYyxLJ0Sz_N1H/view" ">
                    <img src="google-drive.png" style="margin-right:10px;"  width="30px">

                    Resume
                </a>


                <a href="project.html">

                    <img src="idea.gif" style="margin-right:10px;" width="30px">Projects


                </a>

            </div>
        </div>
    </div>
    <div class="home">
	</div>
	<script type="text/javascript">
	function toggleside(){
	    
	    document.getElementById("sidebar").style.display="flex";
	}
	function hidesidebar(){

	    
	    document.getElementById("sidebar").style.display="none";
	    
	    

	}
	</script>
</body>
</html>