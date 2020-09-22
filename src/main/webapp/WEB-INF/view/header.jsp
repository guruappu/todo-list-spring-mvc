<html>
 
 
 
 <title>ToDo</title>
 
 <body>
 
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin: 0px;
                border: 0px;

            }
           
            #link1{
                color: white;
                text-decoration: none;
                padding: 15px;
                vertical-align: central;
                padding-right: 80px;

            }
            #link1:hover{

                color: green;
           }

            .navbar2{
                width:100%;
                height: 45px;
                position: fixed ;
                top: 0;
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                background-color: #2F4F4F;
                position: fixed;
                display: block;
                text-align: center;
                opacity: 0.8;
                border-collapse: collapse;
            }
            .navbar2 ul{
                margin:0px;
                padding:0px;
                list-style: none;
            }
            .navbar2 ul li{
                float:left;
                width:180px;
                height:40px;


            }
            .navbar2 ul li a{

                text-decoration: none;
                display:block;
                color:white;


            }
            .navbar2 ul li a:hover{
                color:#2F4F4F;
            }
            .navbar2 ul li ul li{
                display:none;
            }
            .navbar2 ul li:hover ul li{
                display:block;
                background-color:#4b0d2b;
                color:black;
            }

            #link{
                margin-left:710px;
            }


        </style>
 
   <center>
        <c:if test="${sessionScope.userId !=null}">
            <div class="navbar2">
                <ul>
                    <li> <a href="addTask">ADD NEW TASK</a></li>
                           
                            <li>  
                                <a href="high">TASK(s) WITH HIGH PRIORITY</a>
                            </li>
                            <li>                              
                                <a href="medium">TASK(s) WITH MEDIUM PRIORITY</a>
                            </li>
                           
                            <li>                                
                                <a href="low">TASK(s) WITH LOW PRIORITY</a>
                            </li> 
                            
                            <li>                                
                                <a href="ViewToDoList">ALL TASK(s)</a>
                            </li>                           
                            <li>
                            <a href="userInfo">ABOUT ME</a>
                            </li>
                        </ul>

                    </li>

                   
                </ul>
            </div>
        </c:if>
    </center>

 
 </body>                   
 </html> 