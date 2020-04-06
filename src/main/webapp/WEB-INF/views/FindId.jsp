<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css" />
    <title>아이디 찾기</title>
      <script>
      function idfind() {
    	var name=document.getElementById("name");
      	var ssn=document.getElementById("ssn");
      	var ch=true;
  	      	 if(name.value=="" || ssn.value==""){
  	      		alert("재대로 입력해주세요");  		 
  	      	 }
  	      	 else{
	      			 <c:forEach items = "${memberlist}" var = "members">	
	  		    	  if("${members.name}"==name.value && "${members.ssn}"==ssn.value){
	  		    		alert("id 는 "+"${members.id}"+" 입니다");
	  		    		ch=false;
		  			 }   
	  			   </c:forEach>    
  					if(ch){
  						alert("확인된 정보가 없습니다.");  		 
  					}
  	      	 } 	 
  	    }
  	 
      
      </script>
  </head>
  <body class="loginForm">
    <header>
      <nav></nav>
    </header>
    <section>
      <article>
        <h1>아이디 찾기</h1>
       
          <h2>아이디 찾기</h2>
          <hr/>
          <div>이름</div>
          <input type="text" name="name" id="name" />
          <div>주민번호</div>
          <input type="number" name="ssn" id="ssn" />
         <input type="button" value="확인" onclick="idfind()" />
             <a href="loginform">돌아가기</a>
        
      </article>
      
    </section>
    <footer></footer>
  </body>
</html>
