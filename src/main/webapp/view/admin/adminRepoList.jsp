<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/admin/adminUserList.css">
</head>
<body>
	 <div class="wrapper center">
    <!-- adminMenu -->
    <nav class="adminMenu">
      <h2 class="center">관리자 페이지</h2>

      <ul>
        <a href="${ pageContext.request.contextPath }/admin/adminUserList"><li class="center">회원 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=0&boardType=0"><li class="center">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=0"><li class="center">삭제된 게시물 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminRepoList"><li class="center active">신고 관리</li></a>
      </ul>
    </nav>
    <!-- adminMenu -->

    <!-- memberInfo -->
    <section class="repoList">
      
      <h2 class="center">신고 관리</h2>

      <div class="box center">
        <div class="report">
          <h2 class="center">유저신고</h2>

          <div class="list">
            <ul class="center">
              <li class="center name">신고한 회원</li>
              <li class="center name">신고 내용</li>
              <li class="center name">신고받은 회원</li>
              <li class="center name">덧글보기</li>
            </ul>

            <ul class="center">
              <li class="center">sadbc1235</li>
              <li class="center">걍맘에 안듬</li>
              <li class="center">test123</li>
              <li class="center"><div class="btn">덧글보기</div></li>
            </ul>
          </div>
        </div>
        <div class="report">
          <h2 class="center">게시물신고</h2>

          <div class="list">
            <ul class="center">
              <li class="center name">신고한 회원</li>
              <li class="center name">신고 내용</li>
              <li class="center name">신고받은 회원</li>
              <li class="center name">덧글보기</li>
            </ul>

            <ul class="center">
              <li class="center">sadbc1235</li>
              <li class="center">걍맘에 안듬</li>
              <li class="center">test123</li>
              <li class="center"><div class="btn">덧글보기</div></li>
            </ul>
          </div>
        </div>
      </div>
      
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>