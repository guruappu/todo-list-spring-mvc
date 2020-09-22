<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>ToDo</title>


<style>
body {
  margin: 0;
  padding: 0;
  background-color: #2F4F4F;
  
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -65px;
}

/* .bg-img {
  /* The image used */
  background-image: url("images/login_bg.png");

  min-height: 580px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
 */

</style>

<script type="text/javascript">

function validate() {
	
	if(document.myForm.username.value==""){
		alert("username cannot be empty");
		document.myForm.username.focus();
		return false;
	}
	
	if(document.myForm.password.value==""){
		alert("password cannot be empty");
		document.myForm.password.focus();
		return false;
	}
	
	return (true);
}


</script>

<body>
    <div id="login">
        <h3 class="text-center text-white pt-5" style="font-family: sans-serif; color: #4CAF50;">TODO LIST</h3>
        <div class="container">
        
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">


<form:form id="login-form" class="form" action="logInValidate" name="myForm" modelAttribute="login" method="POST" onsubmit="return (validate());">
<h3 class="text-center text-info">Login</h3>

<c:if test="${param.error != null}">
											            
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										Invalid username and password.
									</div>
	</c:if>								
<div class="form-group">
 <label for="username" class="text-info">Username:</label><br>
 <form:input path="username" id="username" class="form-control"/>
</div>

<div class="form-group">
<label for="password" class="text-info">Password:</label><br>
<form:password path="password" id="password" class="form-control"/>
</div>

<div class="form-group">
<input type="submit" name="LogIn" class="btn btn-info btn-md"/>
</div>

<div id="register-link" class="text-right">
<a href="${pageContext.request.contextPath}/userRegister"  class="text-info">New User? Register Here</a>
</div>

</form:form>
 </div>
  </div>
  </div>
   </div>
    </div>
 
 
</body>

</html>