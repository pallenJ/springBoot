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
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//alert("{list}");
</script>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list}" var="board">
									<tr>
										<td><c:out value="${board.bno}" />
										<td><a class='move' href='<c:out value="${board.bno}"/>'>
												<c:out value="${board.title}" />
										</a> <%-- 	<b>
									<font color="red" size="1.5">
									[<c:out value="${board.replyCnt}"></c:out>]
									</font>
									</b>
								 --%>
										<td><c:out value="${board.writer}" />
										<td><c:out value="${board.regDate}" />

										<td><c:out value="${board.updateDate}" />
								</c:forEach>

							</tbody>
						</table>


						<%-- 						<div class = 'row'>
						<div class = 'col-lg-12'>
							<form id = 'searchForm' action="/board/list" method='get'>
								<select name='type'>
									<!-- <option value="">선택하세요</option> -->								
									<option value="TWC">전체</option>								
									<option value="T">제목</option>								
									<option value="C">내용</option>								
									<option value="W">작성자</option>								
									<option value="TC">제목/내용</option>								
									<option value="TW">제목/작성자</option>								
								</select>
								<input type="text" name = "keyword"/>
								<input type="hidden" name = "pageNum" value ="${pageMaker.cri.pageNum}"/>
								<input type="hidden" name = "amount" value ="${pageMaker.cri.amount}"/>
								<button class="btn btn-default">Search</button>
							</form>						
						</div>
					</div> --%>

						<%-- 					
					<div class = 'pull-right'>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
								<a href="${pageMaker.startPage-1}">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
							
								<li class='paginate_button ${pageMaker.cri.pageNum == num?"active":""}'>
								<a href="${num}">${num}</a>
								</li>
							
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
								<a href="${pageMaker.endPage+1}">Next</a>
								</li>
							</c:if>
						</ul>
					</div> --%>
						<!-- end Pagination -->

						<form id="actionForm" action="/board/list" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name="keyword"
								value="${pageMaker.cri.keyword}">
						</form>


						<!-- Modal -->

						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">

							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">ModalTitle</h4>

									</div>

									<div class="modal-body">처리가 완료 되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>

								</div>
								<!--/. modal-content -->
							</div>
							<!--/. modal-dialog -->
						</div>
						<!--/. modal -->

					</div>
					<!-- /.table-responsive -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

</body>
</html>