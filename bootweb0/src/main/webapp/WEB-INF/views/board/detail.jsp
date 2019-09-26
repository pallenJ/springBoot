<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	<div class="container">
		<div class="card">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="btn-group form-inline" role="group" aria-label="Basic example">
					<span class="form-group">
						Board detail
					</span>

						
					</div>
						<small class = "pull-right text-black-50"> ip:<c:out value="${board.ip_address}"></c:out></small> 
				</div>
				
<%-- 				<c:if test="${fn:length(editHistory) > 0 }"> --%>
				<c:if test="${board.state eq 'UPDATED' }">
						<small class="btn pull-right text-info" data-toggle= "modal" data-target = "#historyModal"> 수정내역보기</small>
				</c:if>
				
				<!-- /.panel-heading -->
				
			
				<div class="panel-body">
					<form action="/board/register" method="post" id = "board_form">
					<div class="form-group" id= "bno_div" hidden="">
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
				<div id = "content_include_div" class="card panel border border-dark">
				
				<div id = "content_header_div" class = "panel-head border-primary content-div bg-primary">content</div>
				<div id = "content_div" class = "panel-body border-primary content-div container-fluid summernote-trs"><c:out value='${board.content}'></c:out></div>
				
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
					          
					<button data-oper="modify" class="btn btn-secondary btn-icon-split" id = "brd_modify"><span class="fa fas fa-edit active"></span> <span>Modify</span> </button>
					<button data-oper="list" class="btn btn-info btn-go btn-for-detail" title="list"><i class="fa fas fa-clipboard"></i> List</button>
					<button data-oper="register" class="btn btn-primary btn-for-detail btn-go" title ="register"><i class="fa fas fa-pencil"></i> new Post</button>
					<button data-oper="cancel" class="btn btn-danger btn-go btn-for-edit" title = "remove" id = "remove_brd_btn"><i class = "fa fa-trash"></i> remove</button>
					<button data-oper="cancel" class="btn btn-warning btn-go btn-for-edit" title = "cancel" id = "cancel_brd_btn">cancel</button>
					<div class="pull-right brd-date-info">
						<small>작성일자 : <c:out value="${board.regDate}"></c:out></small> <br>
						<small>최종수정일자 : <c:out value="${board.updateDate}"></c:out></small>
				
				</div>
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

<div class="modal fade" id = "historyModal">
  <div class="modal-dialog modal-lg" role="dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">수정내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <jsp:include page="detail_history.jsp"></jsp:include>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(function () {

	
	
if("${board.state}"=="DELETED"){
	alert("삭제된 게시물 입니다")
	history.back();
}



$(".btn-for-edit").hide();

//alert(content);
//$("#content_div").html(content);
$("#brd_modify").click(function() {
	
	
	var isDiv = ($("#content_div").prop("class")).indexOf( "content-div")>-1;
	if(isDiv){
		//$("#passwordModal").modal();
		modifyActive();
	}else{
		//$("#board-form").submit();
		$("#modifyModal").modal();
		
	}
	
	$("#passwordSubmit").click(function() {
		var insertPW = $("#modalPWCheck").val();
		if(insertPW!=''&&insertPW!='${board.password}'){
			$("input[type=password]").parent("div").addClass("has-danger");
			$("input[type=password]").addClass("is-invalid");
			$("#modalPWCheck").addClass("has-danger")			
		return;
		}
		modifyActive();
	})
	
	$(".btn-modal-save").click(function() {
		$("input[name='content']").prop("value",$('#content_div').summernote("code"));
		$("#board_form").submit();
	})

	
	
});

function modifyActive() {
	$("#passwordModal").hide();
	$("#content_div").summernote({
		"code":$("#content_div").val(),
		"display": "none"});
	
	$("#content_div").prop("data-toggle", "modal")
	$("#content_div").prop("data-target", "#modifyModal")
	$("input[name!='writer']").prop("readonly", false);
	
	$("#bno_div").hide();
	$(".brd-date-info").hide();
	$(".btn-for-detail").hide();
	$(".btn-for-edit").show();
	
	$("#content_include_div").removeClass();
	$("#content_header_div").hide();
	
	$("#content_div").removeClass("content-div");
}


$(".btn-go").click(function() {
	var go_url = $(this).prop("title");
	if(go_url ==( null || "" ||"cancel")){
		location.reload();	
		
	return;
	}else if(go_url.indexOf("remove")>-1&&go_url.indexOf("remove?")==-1){
		$("#removeModal").modal();
	}else{
		
	$(location).attr("href", $(this).prop("title"));
	}
})





});
</script>



</html>