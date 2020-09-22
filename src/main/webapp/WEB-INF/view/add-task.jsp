<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<title>ToDo</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

body{
		background-color: #2F4F4F;
	}
	.contact{
		padding: 4%;
		height: 400px;
	}
	.col-md-3{
		background: #ff9b00;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:focus{
		box-shadow:none;
	}
	
	
	.button {
   width: 10%;
  background-color:	#ff9b00;
  color: white;
  padding: 10px 15px;
  margin: 9px 5px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
	
</style>

<script type="text/javascript">

function validate() {
	if(document.myForm.title.value==""){
		alert("Title cannot be empty");
		document.myForm.title.focus();
		return false;
	}
	
	if(document.myForm.description.value==""){
		alert("Description cannot be empty");
		document.myForm.description.focus();
		return false;
	}
	
	if(document.myForm.priority.value==""){
		alert("Priority cannot be empty");
		document.myForm.priority.focus();
		return false;
	}
	
	return (true);
}





</script>

<body>



<hr>
 <form action="${pageContext.request.contextPath}/logOut">
<input type="submit" value="LogOut" class="button" style="position: absolute; right: 0;">
</form>
<div class="container contact">
	<div class="row">
		<div class="col-md-3">
			<div class="contact-info">
				<h2>welcome ${user.username}</h2>
				<br><br>
				<h4>Add your task(s)</h4>
			</div>
		</div>

<div class="col-md-9">
<div class="contact-form">
<div class="form-group">

<form:form action="saveTask" modelAttribute="task" method="POST" name="myForm" onsubmit="return (validate());">

<form:hidden path="toDoUserId"/>
<label class="control-label col-sm-2" for="title">Title:</label>
<div class="col-sm-10"> 
<form:input path="title" id="title" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="description">Description:</label>
<div class="col-sm-10"> 
<form:textarea path="description" id="description" class="form-control"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-sm-2" for="priority">Priority:</label>
<div class="col-sm-10"> 
<form:radiobutton path="priority" value="a" id="priority" class="form-control"/>
<label for="high" class="control-label col-sm-2" for="priority">HIGH</label>
 
<form:radiobutton path="priority" value="b" id="priority" class="form-control"/>
<label for="medium" class="control-label col-sm-2" for="priority">MEDIUM</label>
     
<form:radiobutton path="priority" value="c" id="priority" class="form-control"/>
<label for="low" class="control-label col-sm-2" for="priority">LOW</label>

</div>
</div>

<div class="form-group">        
<div class="col-sm-offset-2 col-sm-10">
<input type="submit" name="Add Task" class="btn btn-default"/>
</div>
</div>
</div>
</div>
</form:form>
</body>
</html>