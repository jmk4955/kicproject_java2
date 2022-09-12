<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/admin/adminUserList.css">

<script type="text/javascript">
	const updateAuth = (userId, userType) => {
			
		const con = confirm(userId+"님의 관리자권한을 업데이트 하겠습니까?");
		if(con) {
			console.log(con);
			location.href = "${ pageContext.request.contextPath }/admin/updateAuth?userId="+userId+"&userType="+userType;
		} else {
			console.log(con);
			return;
		}
		
	}
	
	const deleteUser = (userId) => {
		
		const con = confirm(userId+"님을 삭제 하겠습니까?");
		if(con) {
			console.log(con);
			location.href = "${ pageContext.request.contextPath }/admin/deleteUser?userId="+userId;
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
        <a href="${ pageContext.request.contextPath }/admin/adminUserList"><li class="center active">회원 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=0&boardType=0"><li class="center">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=0"><li class="center">삭제된 게시물 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminRepoList"><li class="center">신고 관리</li></a>
      </ul>
    </nav>
    <!-- adminMenu -->

    <!-- memberInfo -->
    <section class="memberList center">
      <article>
        <h2 class="center">일반 회원</h2>
        <ul class="center name">
          <li class="center">아이디</li>
          <li class="center">전화번호</li>
          <li class="center">가입일</li>
          <li class="center">신고</li>
          <li class="center">권한 부여</li>
          <li class="center">회원 삭제</li>
        </ul>
        
        <c:if test="${ normal == null }">
          <p>회원이 없습니다.<p>
        </c:if>
        
        <c:if test="${ normal != null }">
        <c:forEach var="b" items="${ normal }">
        <ul class="center">
          <li class="center">${ b.userId }</li>
          <li class="center">${ b.tel }</li>
          <li class="center">${ b.regDate }</li>
          <li class="center">${ b.userReortCnt }</li>
          <li class="center">
			<a href="javascript:updateAuth('${ b.userId }', ${ b.userType == 0 ? 2 : 0})" class="btn">권한</a>
		  </li>
          <li class="center">
		  	<a href="javascript:deleteUser('${ b.userId }')" class="btn">삭제</a>
		  </li>
        </ul>
        </c:forEach>
        </c:if>
      </article>
      <article>
        <h2>관리자</h2>
        <ul class="center name">
          <li class="center">아이디</li>
          <li class="center">전화번호</li>
          <li class="center">가입일</li>
          <li class="center">신고</li>
          <li class="center">권한 삭제</li>
          <li class="center">회원 삭제</li>
        </ul>
        <c:if test="${ admin == null }">
          <ul><li>관리자 회원이 없습니다.</li></ul>
        </c:if>
        
        <c:if test="${ admin != null }">
        <c:forEach var="b" items="${ admin }">
        <ul class="center">
          <li class="center">${ b.userId }</li>
          <li class="center">${ b.tel }</li>
          <li class="center">${ b.regDate }</li>
          <li class="center">${ b.userReortCnt }</li>
          <li class="center">
			<a href="javascript:updateAuth('${ b.userId }', ${ b.userType == 0 ? 2 : 0})" class="btn">권한</a>
		  </li>
          <li class="center">
		  	<a href="javascript:deleteUser('${ b.userId }')" class="btn">삭제</a>
		  </li>
        </ul>
        </c:forEach>
        </c:if>
      </article>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>