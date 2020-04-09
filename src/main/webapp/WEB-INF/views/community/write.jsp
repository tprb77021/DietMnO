<!-- write.jsp -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<form role="form" method="post" enctype="multipart/form-data">
<h1>커뮤니티</h1>
<hr>
	<div class="box-body">
	
		<!-- page와 perPageNum  추가 -->
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Enter Title"/>		
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" class="form-control" rows="3" placeholder="Enter"></textarea>		
		</div>
		
			<input type="hidden" name="writer" id="writer" class="form-control" value="<%=id%>"/>		
		
		<div class="form-group"></div>
		<label for="upload">업로드</label> 
		<input type="file" name="uploadFile" id="uploadFile" class="form-control"/>
	</div>
	<div>
		<button type="submit" class="btn btn-primary">글쓰기</button>
			<a href="/community/listPage${cri.makeQuery()}" class="btn btn-danger">작성 취소</a>
	</div>
</form>
<%@include file="../include/footer.jsp" %>