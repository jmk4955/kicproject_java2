<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="#"><li class="center">내정보</li></a>
        <a href="#"><li class="center">정보 수정</li></a>
        <a href="#"><li class="center active">회원 탈퇴</li></a>
      </ul>
    </nav>
    <!-- memberMenu -->

    <!-- memberInfo -->
    <section class="memberInfo center">
      
      <ul>
        <form action="#" method="post">
          <h2>회원 탈퇴</h2>
          <li>
            <span class="name center">비밀번호</span><input type="password" name="pwd">
          </li>
          <li style="justify-content: center; border-left: 1px solid #ccc;">
            <input class="btn" type="submit" value="탈퇴">
          </li>
        </form>
      </ul>

      <ul class="memberDelete center">
        <p>
          반려동물 을 찾으셨나보내요. <br>
          탈퇴를 축하드립니다!
        </p>
      </ul>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>