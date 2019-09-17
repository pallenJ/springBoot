<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../include/header.jsp"%>

<title>Board</title>
</head>
<body>
	<%-- <h1>${bno}</h1> --%>
	<c:set var = "modal_name" value="modify"></c:set>
	<c:set var = "modal_msg" value="정말 수정하시겠습니까?"></c:set>
	<div class="row container">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="btn-group" role="group" aria-label="Basic example">
						Board detail
					</div>
				</div>
				<!-- /.panel-heading -->
				
			
				<div class="panel-body">
					<form action="/board/register" method="post" id = "board_form">
					<div class="form-group" id= "bno_div">
						<label>Bno</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno}"></c:out>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"></c:out>'
							readonly="readonly" required/>
					</div>
					<div class="form-group">

				<div>	
				<div class="card panel border border-dark">
				
				<div id = "" class = "panel-head border-primary content-div bg-primary">content</div>
				<div id = "content_div" class = "panel-body border-primary content-div container-fluid"></div>
				
				</div></div>
				<input type="hidden" name = "content">
					</div>
				
					</form>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"></c:out>'
							readonly="readonly" required/>
					</div>
					
					<div id = "detail-pg-btns">
					<button data-oper="modify" class="btn btn-secondary" id = "brd_modify">Modify</button>
					<button data-oper="list" class="btn btn-info btn-go" title="list">List</button>
					<button data-oper="register" class="btn btn-primary btn-go" title ="register">new Post</button>
					<button data-oper="cancel" class="btn btn-danger btn-go" title = "cancel" id = "cancel_brd_btn">cancel</button>
					</div>
					
					<div>
					
					
					
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
$(function () {
	
var content = "<c:out value='${board.content}'></c:out>"
.replace(/&lt;/gi, "<")
.replace(/&gt;/gi, ">")
.replace(/&quot;/gi, "\"")
.replace(/&#034;/gi,"\"")
.replace(/&#039;/gi,"\'")
;



$("#cancel_brd_btn").hide();

//alert(content);
$("#content_div").html(content);
$("#brd_modify").click(function() {
	
	var isDiv = ($("#content_div").prop("class")).indexOf( "content-div")>-1;
	if(isDiv){
	$("#content_div").summernote({
		"code":content,
		"display": "none"});
	$("#content_div").prop("data-toggle", "modal")
	$("#content_div").prop("data-target", "#modifyModal")
	$("input[name!='writer']").prop("readonly", false);
	$("#bno_div").hide();
	$("#new-brd-btn").hide();
	$("#cancel_brd_btn").show();
	$("#content_div").removeClass("content-div")
	}else{
		//$("#board-form").submit();
		$("#modifyModal").modal();
		
	}
	
	$(".btn-modal-save").click(function() {
		$("input[name='content']").prop("value",$('#content_div').summernote("code"));
		$("#board_form").submit();
	})
	
});


$(".btn-go").click(function() {
	var go_url = $(this).prop("title");
	if(go_url ==( null || "" ||"cancel")){
		
	}
		location.reload();	
	return;
	$(location).attr("href", $(this).prop("title"));
})





});
</script>


<%@include file="../include/modals.jsp"%>
</html>