<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript">
	var page=5;
	
	function loadPost(){
		$.ajax({
			url: '/dogDisease/post.load',
			type:"GET",
			data:{"page":page},
			success: function(posts){
				$.each(posts,function(ii,cc){
					$("#loadPostContainer").append($("<div></div>").text(cc.pp_picture));
				});
				page+=5;
			}
		});
	}
	
	$(function(){
		$(window).scroll(function(){
			if ($(window).scrollTop()== $(document).height() - $(window).height()){
				loadPost();
			}
		});
	})
</script>
</head>
<body>
<div class="h-full w-8/12">
	<c:if test="${!empty sessionScope.user }">
	<div class="py-5 font-bold" align="left">
			<button data-modal-target="default-modal" data-modal-toggle="default-modal" class="p-2 text-xl font-bold rounded-lg shadow-md hover:text-gray-400">글 쓰기</button>
			
			<div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
				<div class="w-4/12 h-4/12 bg-white shadow dark:bg-gray-700">
					<div>
						<div class="p-2 mb-2 text-xl font-bold">게시물 작성</div>
						<form name="postWriteForm" action="post.write" onsubmit="return WriteCheck();" method="post" enctype="multipart/form-data">
							<input name="token" value="${token }" type="hidden">
							<input name="pp_content" class="p-2 w-full" placeholder="게시물 작성 시 사진을 반드시 포함해야 합니다">
							<input name="pp_picture" type="file">
							<button class="p-2 text-xl font-bold hover:text-gray-600">submit</button>
						</form>
					</div>
				</div>	
			</div>		
	</div>
	</c:if>
	<h1 class="text-4xl font-bold">SNS Page</h1>
	<c:forEach var="p" items="${posts }">
		<div class="py-5 w-10/12" align="left">
			<div class="shadow-lg" align="left">
				<div class="text-sm text-gray-600">
					${p.pm_nickname } / <fmt:formatDate value="${p.pp_date }" type="both" dateStyle="short" timeStyle="short"/>
				</div>
				<p>${p.pp_content }</p>
				<img src="resources/post/${p.pp_picture }" alt="${p.pp_picture}" style="max-height:600px; max-width:600px;"/>
			</div>
			<c:if test="${p.pp_writer == sessionScope.user.pm_id or sessionScope.user.pm_admin == 4}">
				<div class="">
					<form action="post.delete" onsubmit="return deletePostCheck()" method="post">
							<input name="pp_no" type="hidden" value="${p.pp_no }"/>
							<input name="pp_picture" type="hidden" value="${p.pp_picture }"/>
							<button>delete</button>
					</form>
				</div>
			</c:if>
			<c:if test="${!empty sessionScope.user }">
				<form name="replyForm" action="reply.write" onsubmit="return postReplyWriteCheck();" method="post">
					<div>
						<input name="pr_pp_no" value="${p.pp_no }" type="hidden"/>
						${sessionScope.user.pm_id } :<input name="pr_content"/>
						<button class="bg-gray-200 shadow-md">submit</button>
					</div>
				</form>
			</c:if>
			<c:forEach var="r" items="${p.pp_replys }">
				<div class="grid grid-cols-2" align="left">
					<div class="col-auto">
						<div class="bg-gray-200 text-lg font-bold">
							${r.pr_writer } : ${r.pr_content }
						</div>
					</div>
					<div class="col-auto w-16 bg-gray-400">
						<c:if test="${r.pr_writer == sessionScope.user.pm_id or sessionScope.user.pm_admin == 4}">
							<form action="reply.delete" onsubmit="return deletePostCheck();" method="post">
								<input name="pr_no" type="hidden" value="${r.pr_no }"/>
								<button>delete</button>
							</form>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:forEach>
	<div id="loadPostContainer">
	</div>
</div>
</body>
</html>