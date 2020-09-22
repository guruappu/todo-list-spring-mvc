<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<title>toDo</title>

<style>

body {
 
  background-color: #2F4F4F;
  
  
}

#myTable {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  color:white
}

#myTable td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#myTable tr:nth-child(even){background-color: #2F4F4F;}

#myTable tr:hover {background-color: #ddd;}

#myTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #2F4F4F;
  color: white;
}

.new {
    display: block;
    width: 100px;
    height: 25px;
    background: #4E9CAF;
    padding: 5px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
}


.button {
   width: 10%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 9px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

</style>


<body>


<table cellpadding="6"
		style="border: none; width: 80%; font: 15px Open Sans;" id="myTable" align="center">
   <tr><td><b>NAME:</</b></td><td align="center">${user.name}</td></tr>
   <tr><td><b>USER NAME:</</b></td><td align="center">${user.username}</td></tr>
   <tr><td><b>EMAIL:</</b></td><td align="center">${user.email}</td>
</table>











</body>














</html>