<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id=null;
    String usertype=null;
for(int i = 0 ; i<cookies.length; i++){                        
	if(cookies[i].getName().equals("id")){
		 id=cookies[i].getValue();
	}
	if(cookies[i].getName().equals("usertype")){
		usertype=cookies[i].getValue();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        background: rosybrown;
    }
.side{
	float: left;
  width: 30%;
  height: 700px; 
}
.list{
    margin-top: 100px;
    text-align: left ;
    font-size: 50px;
}

select{
    width: 80px;
    height: 50px;
    font-size: 30px;
}
header{
text-align: right;
background-color: skyblue;
}
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: skyblue;
}
ul:after{
    content:'';
    display: block;
    clear:both;
}
li {
    float: left;
    position: relative;
}

li a {
    display: block;
    color: black;
    font-size: 20px;
    text-align: center;
    padding: 14px 36px;
    text-decoration: none;
}
li a:hover:not(.active) {
    background-color: yellowgreen;
}
.active {
    background-color: #4CAF50;
}

table.blueTable {
  border: 1px solid #1C6EA4;
  border-radius: 20px;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  width: 700px;
    
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
  text-align: center;
 
}
table.blueTable tbody td {
  font-size: 20px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}
 input{
    font-size: 20px;
    margin: 5px;
} 

</style>


</head>
<header >  <jsp:include page="header.jsp" />
</header>
<body>
<div class="side">
    <h1>식단 내역</h1>
    <a href="Diet"><h2>식단 등록</h2></a>
    <a href="Diet_info_List"><h2>식단 내역</h2></a>
</div>

<form action="List" method="POST">
<input type="hidden" name="user" id="user" value="<%= id %>"/>


<label>날짜 :</label>
<input type="date" id="date1" name="date1"/>
    <label>~</label>
   <input type="date" id="date2" name="date2"/>
   <input type="submit" value="조회하기">
   
	<table class="blueTable">
    <thead><th>날짜</th><th>음식종류</th><th>음식</th><th>섭취량</th><th>섭취칼로리</th></thead>
   	<c:if test="">
   	
   	</c:if>
   	 <c:forEach items="${diet_infolist}" var="diet_infolist">
		<tr>	
			<td>${diet_infolist.dates}</td>
			<td>${diet_infolist.foodtype}</td>
			<td>${diet_infolist.foodname}</td>
			<td>${diet_infolist.eat}</td>
			<td>${diet_infolist.cal}</td>		
		</tr>
	</c:forEach>
	</table>

</form>
</body>
<script>
window.onload = function () {
	
var date=new Date().toISOString().slice(0, 10);
document.getElementById('date2').value=date;
document.getElementById('date1').value=a();
}
	

function a() {
	var d = new Date();
	 d.setTime(new Date().getTime() - (7 * 24 * 60 * 60 * 1000)); //1일전
	   return d.toISOString().slice(0, 10);
}

</script>
</html>