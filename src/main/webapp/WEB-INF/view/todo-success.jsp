<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<title>ToDo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<h2> welcome ${user.username}</h2>

        
        


<style>

body{
		background-color: #2F4F4F;
	}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  color: white;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #2F4F4F;}

#customers tr:hover {background-color: #2F4F4F;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #2F4F4F;
  color: white;
}

.button {
   width: 10%;
  background-color:	#FF00FF;
  color: white;
  padding: 10px 15px;
  margin: 9px 5px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

a:hover, a:active {
  background-color: red;
}

.button1 {
   width: 40%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 9px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

a:link, a:visited {
  background-color: #2F4F4F;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
}
</style>
</style>
<body>

        <div>
            <jsp:include page="header.jsp"/>
        </div>
        
<div class="search">
            <form action="search" class="example" style="width:300px"/>               
                 <input type="text" placeholder="Search.." name="freetext">
                  <button type="submit"><i class="fa fa-search"></i></button>
            </form>
 </div>
 
 <form action="${pageContext.request.contextPath}/logOut">
<input type="submit" value="LogOut" class="button" style="position: absolute; right: 0;">
</form>
 <br><br>
 <br><br>       
<table id="customers">

   <tr>
      <th>TITLE</th>
      <th>DESCRIPTION</th>
      <th>PRIORITY</th>
      <th>ACTION</th>
   </tr>


<c:forEach var="tempTask" items="${task}">

<!-- UPDATE LINK -->
<c:url var="updateLink" value="/updateTask">
<c:param name="toDoUserId" value="${tempTask.toDoUserId}"></c:param>
</c:url>
 
 <!-- DELETE LINK -->
 
 <c:url var="deleteLink" value="/deleteTask">
 <c:param name="toDoUserId" value="${tempTask.toDoUserId}"></c:param>
 </c:url>
  <tr>
     <td>${tempTask.title}</td>
     <td>${tempTask.description}</td>
     <c:if test="${tempTask.priority == 'a'}">
     <td>High</td>
     </c:if>
     
      <c:if test="${tempTask.priority == 'b'}">
     <td>Medium</td>
     </c:if>
     
      <c:if test="${tempTask.priority == 'c'}">
     <td>Low</td>
     </c:if>
     <td>
     <a href="${updateLink}">Update</a>
     |
     <a href="${deleteLink}"
      onClick="if(!(confirm('Are you sure you want to delete the task'))) return false">Delete</a>
     </td>
  </tr>


</c:forEach>

</table>



</body>














</html>