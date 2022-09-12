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
        <a href="${ pageContext.request.contextPath }/admin/adminUserList"><li class="center">회원 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser"><li class="center active">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost"><li class="center">삭제된 게시물 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminRepoList"><li class="center">신고 관리</li></a>
      </ul>
    </nav>
    <!-- adminMenu -->

    <!-- memberInfo -->
    <section class="memberSearch">
      <form action="${ pageContext.request.contextPath }/admin/adminSearch" class="center" name="f" method="get">
        <div class="searchBox center">
          <input type="hidden" name="boardType" value="1"/>
          <input type="text" name="userId" placeholder="회원 아이디를 검색해주세요">
          <div class="searchIcon">
            <svg viewBox="0 0 512 512">
              <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
            </svg>
          </div>
        </div>
       </form>

       <div class="infoBox center">
        <article class="userInfo">
          <h2 class="center">회원 정보</h2>
          <ul>
            <li class="center">
              <span class="name center">아이디</span>test123
            </li>
            <li class="center">
              <span class="name center">주소</span>인천 강화군 양도면 가능포로 166-13
            </li>
            <li class="center">
              <span class="name center">이메일</span>test123@naver.com
            </li>
            <li class="center">
              <span class="name center">전화번호</span>010-1111-1111
            </li>
            <li class="center">
              <span class="name center">동물 이름</span>웃음이
            </li>
            <li class="center">
              <span class="name center">신고횟수</span>99회
            </li>
          </ul>
        </article>
        <article class="userComm">
          <h2 class="center">덧글 기록</h2>
          <ul class="list">
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">덧글아이디</span>12
                </li>
                <li class="center">
                  2022-09-22
                  <div class="btn">삭제</div>
                </li>
              </ul>
              <textarea readonly></textarea>
            </li>
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">덧글아이디</span>11
                </li>
                <li class="center">
                  2022-09-22
                  <div class="btn">삭제</div>
                </li>
              </ul>
              <textarea readonly></textarea>
            </li>
          </ul>
        </article>
        <article class="userComm">
          <h2 class="center">게시물 기록</h2>
          <ul class="list">
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">게시글아이디</span>12
                </li>
                <li class="center">
                  2022-09-22
                  <div class="btn">보기</div>
                  <div class="btn">삭제</div>
                </li>
              </ul>
              <textarea readonly></textarea>
            </li>
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">덧글아이디</span>11
                </li>
                <li class="center">
                  2022-09-22
                  <div class="btn">보기</div>
                  <div class="btn">삭제</div>
                </li>
              </ul>
              <textarea readonly></textarea>
            </li>
          </ul>
        </article>
       </div>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>