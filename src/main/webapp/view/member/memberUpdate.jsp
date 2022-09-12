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
        <a href="#"><li class="center active">정보 수정</li></a>
        <a href="#"><li class="center">회원 탈퇴</li></a>
      </ul>
    </nav>
    <!-- memberMenu -->

    <!-- memberInfo -->
    <section class="memberInfo center">
      
      <ul>
        <form action="#" method="post">
          <h2>정보 수정</h2>
          <li>
            <span class="name center">아이디</span><input type="text" nmae="userId">
          </li>
          <li>
            <span class="name center">주소</span><input readonly type="text" name="place"><div class="btn">주소검색</div>
          </li>
          <li>
            <span class="name center">이메일</span><input type="email" name="email">
          </li>
          <li>
            <span class="name center">전화번호</span><input type="number" name="tel">
          </li>
          <li>
            <span class="name center">반려동물 이름</span><input type="text">
          </li>
          <li style="justify-content: center; border-left: 1px solid #ccc;">
            <input class="btn" type="submit" value="수정">
          </li>
        </form>
      </ul>

      <ul>
        <form action="#" method="post">
          <h2>비밀번호 수정</h2>
          <li>
            <span class="name center">현재 비밀번호</span><input type="password" name="pwd">
          </li>
          <li>
            <span class="name center">변경 비밀번호</span><input type="password" name="pwd">
          </li>
          <li>
            <span class="name center">비밀번호 확인</span><input type="password" name="pwd">
          </li>
          <li style="justify-content: center; border-left: 1px solid #ccc;">
            <input class="btn" type="submit" value="수정">
          </li>
        </form>
      </ul>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>