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
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script> 
<script type="text/javascript">
	var page=5;
	
	function loadPost(){
		$.ajax({
			url: '/dogDisease/post.load',
			type:"GET",
			data:{"page":page},
			success: function(posts){
				$.each(posts,function(ii,cc){
					var replywrapper = $("<div class='flex w-full'></div>");
					$.each(cc.pp_replys,function(i,r){
						var reply = $("<div class='flex bg-gray-200 text-lg font-bold place-self-start shadow-md'></div>").text(r.pm_nickname + " : " + r.pr_content);
						var delreplybutton = $("<button id='delreply' class='p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700'></button>").text("댓글 삭제");
						var delreply = $("<div class='flex'></div>").append(delreplybutton);
						var replynum = $("<input name='pr_no' type='hidden'></input>").attr("value",r.pr_no);
						var delreplyform = $("<form action='reply.delete' onsubmit='return deletePostCheck();' method='post'></form>").append(replynum,delreply);
						var wrapper = $("<div class='flex p-2 grid grid-cols-2 gap-x-8'></div>").append(reply,delreplyform);
						replywrapper.append(wrapper);
					});
					
					var delbutton = $("<button id='delpost' class='p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700'></button>").text("게시물 삭제");
					var post_pic = $("<input name='pp_picture' type='hidden'></input>").attr("value",cc.pp_picture);
					var post_no = $("<input name='pp_no' type='hidden'></input>").attr("value",cc.pp_no);
					var delform = $("<form action='post.delete' onsubmit='return deletePostCheck();' method='post'></form>").append(post_no,post_pic,delbutton);
					
					var replybutton = $("<button class='p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700'></button>").text("댓글 작성");
					var writereply = $("<input name='pr_content'></input>");
					var postnum = $("<input name='pr_pp_no' type='hidden'></input>").attr("value",cc.pp_no);
					var writereplyform = $("<form name='replyForm' action='reply.write' onsubmit='return postReplyWriteCheck();' method='post'></form>").append(writereply,postnum,replybutton);
					var writereplywrapper = $("<div></div>").append(writereplyform);
					
					var picture = $("<img style='max-height:600px; max-width:600px;'></div>").attr("src","resources/post/"+cc.pp_picture);
					var picturewrapper = $("<div></div>").append(picture);
					var content = $("<p></p>").text(cc.pp_content);
					var writer = $("<div class='text-sm text-gray-600'></div>").text(cc.pm_nickname);
					
					var template = $("<div class='py-5 w-10/12' align='left'></div>").append(writer,content,picturewrapper,delform,writereplywrapper,replywrapper);
					$("#loadPostContainer").append($("<div></div>").append(template));
				});
				page+=5;
			}
		});
	}
	
	$(function(){
		$(window).scroll(function(){
			if ($(window).scrollTop()==$(document).height()-$(window).height()){
				loadPost();
			}
		});
	})
</script>
</head>
<body>
<div class="smallArea">
	<c:if test="${!empty sessionScope.user and sessionScope.user.pm_admin>=3}">
	<div class="py-5 font-bold" align="left">
			<button data-modal-target="default-modal" data-modal-toggle="default-modal" class="p-2 text-xl font-bold rounded-lg shadow-md hover:text-white hover:bg-gray-700">글 쓰기</button>
			
			<div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
				<div class="w-4/12 h-4/12 rounded-lg bg-white shadow dark:bg-gray-700">
					<div>
						<div class="p-2 mb-2 text-xl font-bold">게시물 작성</div>
						<form name="postWriteForm" action="post.write" onsubmit="return WriteCheck();" method="post" enctype="multipart/form-data">
							<input name="token" value="${token }" type="hidden">
							<input name="pp_content" class="p-2 w-full" placeholder="게시물 작성 시 사진을 반드시 포함해야 합니다">
							<input name="pp_picture" type="file">
							<button class="p-2 rounded-lg shadow-md text-xl font-bold hover:text-white hover:bg-gray-900">게시물 작성</button>
						</form>
					</div>
				</div>	
			</div>		
	</div>
	</c:if>
	<h1 class="font-bold" id="joinTitle" align='center'>자유게시판</h1>
	<div class="space-y-12">
	<c:forEach var="p" items="${posts }">
		<div class="py-5 w-10/12" align="left">
			<div class="w-auto shadow-lg" align="left">
				<div class="text-xl text-gray-600">
					${p.pm_nickname } / <fmt:formatDate value="${p.pp_date }" type="both" dateStyle="short" timeStyle="short"/>
				</div>
				<p class="m-2 text-xl font-bold">${p.pp_content }</p>
				<img src="resources/post/${p.pp_picture }" alt="${p.pp_picture}" style="max-height:600px; max-width:600px;"/>
			</div>
			<c:if test="${p.pp_writer == sessionScope.user.pm_id or sessionScope.user.pm_admin == 4}">
				<div>
					<form action="post.delete" onsubmit="return deletePostCheck()" method="post">
							<input name="pp_no" type="hidden" value="${p.pp_no }"/>
							<input name="pp_picture" type="hidden" value="${p.pp_picture }"/>
							<button class="p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700">게시물 삭제</button>
					</form>
				</div>
			</c:if>
			<c:if test="${!empty sessionScope.user }">
				<form name="replyForm" action="reply.write" onsubmit="return postReplyWriteCheck();" method="post">
					<div class="mt-2">
						<input name="pr_pp_no" value="${p.pp_no }" type="hidden"/>
						<input name="pr_content"/>
						<button class="p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700">댓글 작성</button>
					</div>
				</form>
			</c:if>
			<c:forEach var="r" items="${p.pp_replys }">
				<div class="flex w-full gap-x-2">
					<div class="flex p-2 col-auto grid grid-cols-2 place-items-start shadow-md">
						<div class="flex bg-gray-200 text-lg font-bold place-self-start">
							${r.pm_nickname } : ${r.pr_content }
						</div>
						<div class="flex text-lg place-self-end"><fmt:formatDate value="${r.pr_date }" type="both" dateStyle="short" timeStyle="short"/></div>
					</div>
					<div class="flex-initial place-items-end">
						<c:if test="${r.pr_writer == sessionScope.user.pm_id or sessionScope.user.pm_admin == 4}">
							<form action="reply.delete" onsubmit="return deletePostCheck();" method="post">
								<input name="pr_no" type="hidden" value="${r.pr_no }"/>
								<button class="p-2 rounded-lg shadow-md font-bold hover:text-white hover:bg-gray-700">댓글 삭제</button>
							</form>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:forEach>
	<div>
		<div id="loadPostContainer">
		</div>
	</div>
</div>
</div>
</body>
</html>