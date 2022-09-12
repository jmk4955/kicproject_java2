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
        <a href="${ pageContext.request.contextPath }/member/memberInfo"><li class="center active">내정보</li></a>
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
          <span class="name center">아이디</span>test123
        </li>
        <li>
          <span class="name center">주소</span>인천 강화군 양도면 가능포로 166-13
        </li>
        <li>
          <span class="name center">이메일</span>test123@naver.com
        </li>
        <li>
          <span class="name center">전화번호</span>010-1111-1111
        </li>
        <li>
          <span class="name center">반려동물 이름</span>웃음이
        </li>
      </ul>

      <ul>
        <h2 class="center">
          작성한 게시물
          <div class="box center">
            <div class="btn">보호</div>
            <div class="btn">찾기</div>
            <div class="btn">입양</div>
            <div class="btn">후기</div>
            <div class="btn">Q&A</div>
          </div>
        </h2>
        <h2>보호중 게시판</h2>
        <li>
          <div class="name regDate center">작성일</div>
          <div class="name content center">내용</div>
          <div class="name postBtn center">보러가기</div>
        </li>

        <li>
          <div class="regDate center">2022-09-11</div>
          <div class="content">hifffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</div>
          <div class="postBtn center"><div class="btn">게시물</div></div>
        </li>
        
      </ul>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>