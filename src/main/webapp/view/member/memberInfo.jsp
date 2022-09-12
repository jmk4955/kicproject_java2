<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	<%@ include file="../css/member/memberInfo.css"%>
</style>
</head>
<body>
	<div class="wrapper center">
    <!-- memberMenu -->
    <nav class="memberMenu">
      <h2 class="center">마이 페이지</h2>

      <ul>
        <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=0"><li class="center active">내정보</li></a>
        <a href="${ pageContext.request.contextPath }/member/memberUpdate"><li class="center">정보 수정</li></a>
        <a href="${ pageContext.request.contextPath }/member/memberDelete"><li class="center">회원 탈퇴</li></a>
      </ul>
    </nav>
    <!-- memberMenu -->

    <!-- memberInfo -->
    <section class="memberInfo center">
      <ul>
        <h2>내정보</h2>
        <li>
          <span class="name center">아이디</span>${ mem.userId }
        </li>
        <li>
          <span class="name center">주소</span>${ mem.address }
        </li>
        <li>
          <span class="name center">이메일</span>${ mem.email }
        </li>
        <li>
          <span class="name center">전화번호</span>${ mem.tel }
        </li>
        <li>
          <span class="name center">반려동물 이름</span>${ mem.petName }
        </li>
      </ul>

      <ul>
        <h2 class="center">
          작성한 게시물
          <div class="box center">
            <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=0" class="btn">보호</a>
            <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=1" class="btn">찾기</a>
            <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=2" class="btn">입양</a>
            <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=3" class="btn">후기</a>
            <a href="${ pageContext.request.contextPath }/member/memberInfo?boardType=4" class="btn">Q&A</a>
          </div>
        </h2>
        <h2>
        	<c:if test="${ sessionScope.boardType == 0 }">
        		보호 게시판
        	</c:if>
        	<c:if test="${ sessionScope.boardType == 1 }">
        		찾기 게시판
        	</c:if>
        	<c:if test="${ sessionScope.boardType == 2 }">
        		입양 게시판
        	</c:if>
        	<c:if test="${ sessionScope.boardType == 3 }">
        		후기 게시판
        	</c:if>
        	<c:if test="${ sessionScope.boardType == 4 }">
        		Q&A 게시판
        	</c:if>
        </h2>
        <li>
          <div class="name regDate center">작성일</div>
          <div class="name content center">내용</div>
          <div class="name postBtn center">보러가기</div>
        </li>
        <c:if test="${ board == null }">
          <li>작성한 게시물이 없습니다.</li>
        </c:if>
		<c:if test="${ board != null }">
		<c:forEach var="b" items="${ board }">
        <li>
          <div class="regDate center">${ b.regDate }</div>
          <div class="content">${ b.content }</div>
          <div class="postBtn center"><a href="${ pageContext.request.contextPath }/board/petBoardInfo?postId=${ b.postId }" target="_blank" class="btn">게시물</a></div>
        </li>
        </c:forEach>
        </c:if>
        
      </ul>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>