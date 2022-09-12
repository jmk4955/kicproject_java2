<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/admin/adminUserList.css">
<script>	
	const deletePost = (userId, postId) => {
		
		const con = confirm("게시물 을 완전히 삭제 하겠습니까?");
		if(con) {
			console.log(con);
			location.href = "${ pageContext.request.contextPath }/admin/adminDelPost?userId="+userId+"&postId="+postId;
		} else {
			console.log(con);
			return;
		}
		
	}
</script>
</head>
<body>
	  <div class="wrapper center">
    <!-- adminMenu -->
    <nav class="adminMenu">
      <h2 class="center">관리자 페이지</h2>

      <ul>
        <a href="${ pageContext.request.contextPath }/admin/adminUserList"><li class="center">회원 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=0&boardType=0"><li class="center">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=0"><li class="center active">삭제된 게시물 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminRepoList"><li class="center">신고 관리</li></a>
      </ul>
    </nav>
    <!-- adminMenu -->

    <!-- memberInfo -->
    <section class="disPost">
      <h2 class="center">
        삭제된 게시물 관리 - 보호 게시판

        <div class="box center">
          <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=0" class="btn">보호</a>
          <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=1" class="btn">찾기</a>
          <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=2" class="btn">입양</a>
          <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=3" class="btn">후기</a>
        </div>
      </h2>

      <div class="list">
        <ul class="center">
          <li class="center name">게시물 번호</li>
          <li class="center name">구분</li>
          <li class="center name">작성자</li>
          <li class="center name">내용</li>
          <li class="center name">작성일</li>
          <li class="center name">신고</li>
          <li class="center name">보기</li>
          <li class="center name">삭제</li>
        </ul>
		<c:if test="${ board != null }">
		<c:forEach var="b" items="${ board }">
        <ul class="center">
          <li class="center">${ b.postId }</li>
          <li class="center">
          <c:if test="${ boardType == 0 }">
            보호게시판
          </c:if>
          <c:if test="${ boardType == 1 }">
            찾기게시판
          </c:if>
          <c:if test="${ boardType == 2 }">
            입양게시판
          </c:if>
          <c:if test="${ boardType == 3 }">
            후기게시판
          </c:if>
          </li>
          <li class="center">${ b.userId }</li>
          <li>${ b.content }</li>
          <li class="center">${ b.regDate }</li>
          <li class="center">${ b.postReportCnt }</li>
          <li class="center"><a href="${ pageContext.request.contextPath }/board/petBoardInfo?postId=${b.postId}" target="_blank" class="btn">보기</a></li>
          <li class="center"><a href="javascript:deletePost('${ b.userId }', ${ b.postId })" class="btn">삭제</a></li>
        </ul>
        </c:forEach>
        </c:if>
      </div>
      
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>