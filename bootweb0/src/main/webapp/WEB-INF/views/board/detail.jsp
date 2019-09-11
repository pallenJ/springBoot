<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<!-- include summernote-ko-KR -->
<title>Board</title>
</head>
<body>
	<%-- <h1>${bno}</h1> --%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="btn-group" role="group" aria-label="Basic example">
						Board detail
					</div>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno}"></c:out>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"></c:out>'
							readonly="readonly">
					</div>
					<div class="form-group">

						<label>TextArea</label>
						<!-- <textarea class="form-control" name="bno" rows="3"
							readonly="readonly">
				</textarea> -->
				<div class="card border-primary">
				<div id = "content-div"></div>
				
				</div>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"></c:out>'
							readonly="readonly">
					</div>
					<div>
					<button data-oper="modify" class="btn btn-secondary" id = "brd-modify">Modify</button>


					<button data-oper="list" class="btn btn-info">List</button>
					
					<button data-oper="new" class="btn btn-primary">new Post</button>
					</div>
					<%-- 				<form id = "operForm" action="/board/modify" method="get">
					<input type="hidden" id = "bno" name ="bno" value ='<c:out value="${board.bno}"></c:out>'>
					<input type="hidden" id = "pageNum" name ="pageNum" value ='<c:out value="${param.pageNum}"></c:out>'>
					<input type="hidden" id = "amount" name ="amount" value ='<c:out value="${param.amount}"></c:out>'>
					<input type="hidden" id = "type" name ="type" value ='<c:out value="${param.type}"></c:out>'>
					<input type="hidden" id = "keyword" name ="keyword" value ='<c:out value="${param.keyword}"></c:out>'>
				</form>
 --%>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>


</body>

<script type="text/javascript">

var content = "<c:out value='${board.content}'></c:out>"
.replace(/&lt;/gi, "<")
.replace(/&gt;/gi, ">")
.replace(/&quot;/gi, "\"")
.replace(/&#034;/gi,"\"")
.replace(/&#039;/gi,"\'")
;

//alert(content);
$("#content-div").html(content);
$("#brd-modify").click(function() {
$("#content-div").summernote("code",content);
	
})
</script>

</html>