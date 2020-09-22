<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<title>ToDo</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

body {
 background-color: #2F4F4F;
}
form {
  width: 60%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #8BC34A;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-active {
  top: -3em;
}

button {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: #8BC34A;
  color: #ffffff;
}

</style>

<script type="text/javascript">

function validate() {
	
	if(document.myForm.name.value==""){
		alert("name cannot be empty");
		document.myForm.name.focus();
		return false;
	}
	
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
	
	if(document.myForm.email.value==""){
		alert("email cannot be empty");
		document.myForm.email.focus();
		return false;
	}
	
	return (true);
}


</script>

<body>


<form:form action="saveUser" modelAttribute="regCmd" method="POST" name="myForm" onsubmit="return (validate());">

<p style="font-family:courier; font-size:180%;">Register Here</p>
<label>
<p class="label-txt">NAME</p>
<form:input path="theRegister.name" class="input" id="name"/>
<div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
  <label>
    <p class="label-txt">USERNAME</p>
<form:input path="theRegister.username" class="input" id="username"/>
 <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
  <label>
    <p class="label-txt">PASSWORD</p>
<form:password path="theRegister.password" class="input" id="password"/>
<div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
  <label>
    <p class="label-txt">EMAIL</p>
<form:input path="theRegister.email" class="input" id="email"/>
<div class="line-box">
      <div class="line"></div>
    </div>
  </label>

<!-- <input type="submit" name="Register"> -->
<button type="submit">submit</button>

</form:form>


</body>


</html>