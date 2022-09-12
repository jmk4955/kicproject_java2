<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="${ pageContext.request.contextPath }/admin/adminUserList"><li class="center active">회원 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser"><li class="center">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost"><li class="center">삭제된 게시물 관리</li></a>
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
        <ul class="center">
          <li class="center">test123</li>
          <li class="center">010-1111-1111</li>
          <li class="center">2022-09-22</li>
          <li class="center">99</li>
          <li class="center"><div class="btn">권한</div></li>
          <li class="center"><div class="btn">삭제</div></li>
        </ul>
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
        <ul class="center">
          <li class="center">test123</li>
          <li class="center">010-1111-1111</li>
          <li class="center">2022-09-22</li>
          <li class="center">99</li>
          <li class="center"><div class="btn">권한</div></li>
          <li class="center"><div class="btn">삭제</div></li>
        </ul>
      </article>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>