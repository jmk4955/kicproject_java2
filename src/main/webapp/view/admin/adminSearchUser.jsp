<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/admin/adminUserList.css">

<script>
	window.onload = () => {
		const searchBtn = document.querySelector(".searchIcon");
		searchBtn.addEventListener("click", () => {
			document.f.submit();
		})
	}
	
	const deleteComm = (userId, commId) => {
		
		const con = confirm(userId+"님의 덧글을 삭제 하겠습니까?");
		if(con) {
			console.log(con);
			location.href = "${ pageContext.request.contextPath }/admin/adminDelComm?userId="+userId+"&commId="+commId;
		} else {
			console.log(con);
			return;
		}
		
	}
	
	const deletePost = (userId, postId) => {
		
		const con = confirm(userId+"님의 게시물을 삭제 하겠습니까?");
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
        <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=0&boardType=0"><li class="center active">회원 조회</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminDisPost?boardType=0"><li class="center">삭제된 게시물 관리</li></a>
        <a href="${ pageContext.request.contextPath }/admin/adminRepoList"><li class="center">신고 관리</li></a>
      </ul>
    </nav>
    <!-- adminMenu -->

    <!-- memberInfo -->
    <section class="memberSearch">
      <form action="${ pageContext.request.contextPath }/admin/adminSearchUser" class="center" name="f" method="get">
        <div class="searchBox center">
          <input type="hidden" name="boardType" value="0"/>
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
              <span class="name center">아이디</span>${ mem.userId }
            </li>
            <li class="center">
              <span class="name center">주소</span>${ mem.address }
            </li>
            <li class="center">
              <span class="name center">이메일</span>${ mem.email }
            </li>
            <li class="center">
              <span class="name center">전화번호</span>${ mem.tel }
            </li>
            <li class="center">
              <span class="name center">동물 이름</span>${ mem.petName }
            </li>
            <li class="center">
              <span class="name center">신고횟수</span>${ mem.userReortCnt }
            </li>
          </ul>
        </article>
        <article class="userComm">
          <h2 class="center">덧글 기록</h2>
          <ul class="list">
          <c:if test="${ comm == null }">
          	<li>덧글 기록이 없습니다.</li>
          </c:if>
          <c:if test="${ comm != null }">
          <c:forEach var="b" items="${ comm }">
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">덧글아이디</span>${ b.commId }
                </li>
                <li class="center">
                  ${ b.regDate }
                  <a href="javascript:deleteComm('${ b.userId }', ${ b.commId })" class="btn">삭제</a>
                </li>
              </ul>
              <textarea readonly>${ b.content }</textarea>
            </li>
          </c:forEach>
          </c:if>
            
          </ul>
        </article>
        <article class="userComm">
          <h2 class="center">
          	게시물 기록 - 
          	<c:if test="${ boardType == 0 }">
          		보호
          	</c:if>
          	<c:if test="${ boardType == 1 }">
          		찾기
          	</c:if>
          	<c:if test="${ boardType == 2 }">
          		입양
          	</c:if>
          	<c:if test="${ boardType == 3 }">
          		후기
          	</c:if>
          	<div class="box center">
              <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=${ mem.userId }&boardType=0" class="btn">보호</a>
              <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=${ mem.userId }&boardType=1" class="btn">찾기</a>
              <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=${ mem.userId }&boardType=2" class="btn">입양</a>
              <a href="${ pageContext.request.contextPath }/admin/adminSearchUser?userId=${ mem.userId }&boardType=3" class="btn">후기</a>
            </div>
          </h2>
          <ul class="list">
          <c:if test="${ board == null }">
          	<li>게시물 기록이 없습니다.</li>
          </c:if>
          
          <c:if test="${ board != null }">
          <c:forEach var="b" items="${ board }">
            <li>
              <ul class="box center">
                <li class="center">
                  <span class="name center">게시글아이디</span>${ b.postId }
                </li>
                <li class="center">
                  ${ b.regDate }
                  <div class="btn">보기</div>
                  <a href="javascript:deletePost('${ b.userId }', ${ b.postId })" class="btn">삭제</a>
                </li>
              </ul>
              <textarea readonly>${ b.content }</textarea>
            </li>
          </c:forEach>
          </c:if>
            
          </ul>
        </article>
       </div>
    </section>
    <!-- memberInfo -->
  </div>
</body>
</html>