<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id=null;
    String usertype="10";
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
<script>

</script>

</head>
<header >  <jsp:include page="header.jsp" />
</header>
<body>
<div class="side">
    <h1>식단 추천</h1>
    <a href="recform"><h2>식단 추천</h2></a>
    <a href="paylistform"><h2>결제 내역</h2></a>
    <%if(usertype.equals("2")){%>
    <a href="recRegform"><h2>식단등록</h2></a>
    <a href="allpaylistform"><h2>전체 결제 내역</h2></a>
    <%} %>
</div>

<form action="rec" method="POST">
<input type="submit" value="식단 추천 받기">
<input type="radio" name="rec_category" value="1" checked="checked">잡식
<input type="radio" name="rec_category" value="2">육식
<input type="radio" name="rec_category" value="3">채식
</form>


<form name="pay" action="pay" method="POST">
<input type="hidden" name="user" id="user" value="<%= id %>"/>
	<table class="blueTable">
    <thead><th>요일</th><th>아침</th><th>점심</th><th>저녁</th><th>탄단지</th><th>칼로리</th><th>가격</th></thead>
   	 	<%int i=0; 
   	 		String[] a={"월","화","수","목","금","토","일"};
   	 	%>
   	 <c:forEach items="${recommends}" var="recommends">
		<tr>	
			<td><%=a[i]%><input type="checkbox" id="ch" name="rec_id" value="${recommends.rec_id}"></td>
			<td>${recommends.rec_food1}</td>
			<td>${recommends.rec_food2}</td>
			<td>${recommends.rec_food3}</td>
			<td>${recommends.rec_nutrient}</td>
			<td>${recommends.rec_cal}</td>
			<td>${recommends.rec_price}</td>
		</tr>
		<%i=i+1; %>
	</c:forEach>
	</table>
<input type="button" value="결제하기" onclick="sub()" >
</form>

<script >

window.onload = function () {
if(<%=id%>==null){
location.href='/MnOBmi/loginform';
}
}
function sub() {
	var chkbox = document.getElementsByName('rec_id');
	var chk = false; 
	for(var i=0 ; i<chkbox.length ; i++) { 
		if(chkbox[i].checked) {
			chk = true;
			break;
			} 
		}
	
	if(chk){
		document.pay.submit();
	}
	else{
		alert('추천을 받아주세요');
}
}
</script>

</body>
</html>