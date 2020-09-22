<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<title>ToDo</title>

<style>

body{
		background-color: #2F4F4F;
	}
	
.button {
   width: 10%;
  background-color: #FFA07A;
  color: white;
  padding: 14px 20px;
  margin: 9px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

a:hover, a:active {
  background-color: red;
}

.button1 {
   width: 40%;
  background-color: #FFA07A;
  color: white;
  padding: 14px 20px;
  margin: 9px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}










</style>
<body>








 <form action="${pageContext.request.contextPath}/logOut">
<input type="submit" value="LogOut" class="button" style="position: absolute; right: 0;">
</form>
 <br><br>
 <br><br> 
 
<div align="center">
<form action="${pageContext.request.contextPath}/addTask">
<input type="submit" value="Go To Task Page" class="button1">
</form>

</div>

<div align="center">
<form action="${pageContext.request.contextPath}/ViewToDoList">
<input type="submit" value="View ToDo List" class="button1">
</form>

</div>

<div align="center">
<form action="${pageContext.request.contextPath}/userInfo">
<input type="submit" value="Your Info" class="button1">
</form>

</div>


</body>


</html>