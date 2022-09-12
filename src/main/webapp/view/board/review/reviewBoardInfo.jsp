<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardInfo.css">
<style>
    .boardImg {
      background-image: url("${ pageContext.request.contextPath }/view/images/banner/adoptBoard.jpg");
      background-position: center;
    }
  </style>
</head>
<body>
	<!-- boardImg -->
  <div class="boardImg center">
    <div class="box center">
      <h2 class="boardName">입양공고</h2>
      <div class="bar"></div>
      <p>
        입양은 호기심이 아닌 책임입니다.
      </p>
    </div>
  </div>
<!-- boardImg -->

<!-- content -->
  <section class="content">
    <div class="inner center">

      <div class="contentHead center">
        <ul class="regDate center">
          <li>
            <span class="name">작성일 : </span>2022-09-16
          </li>
          <li>
            <span class="name">조회수 : </span>99
          </li>
        </ul>

        <div class="box center">
          <div class="btn">수정</div>
          <div class="btn">삭제</div>
          <div class="btn">신고</div>
          <div class="btn">목록</div>
        </div>
      </div>

      <div class="contentImg">
        <img src="${ pageContext.request.contextPath }/view/images/dog/profile1.jpg" alt="img">
      </div>

      <div class="contentInfo">
        <ul class="center info1">
          <li>
            <span class="name">이름 : </span>웃음이
          </li>
          <li>
            <span class="name">종류 : </span>강아지
            <span class="name">성별 : </span>남아
          </li>
        </ul>

        <ul class="center info1">
          <li>
            <span class="name">특징 : </span>귀여움
          </li>
          <li>
            <span class="name">보호자 전화번호 : </span>010-1111-1111
          </li>
        </ul>
        
        <ul class="center info1">
          <li>
            <span class="name">중성화 : </span>완료
          </li>
          <li>
            <span class="name">예방접종 : </span>완료
          </li>
        </ul>
        <ul class="info1">
          <li>
            <span class="name">위치 : </span> 인천 강화군 양도면 가능포로 166-13
          </li>
        </ul>
        <div class="info1">
          <div class="name">상세설명</div>
          <textarea readonly>test</textarea>
        </div>
      </div>

    </div>
  </section>
<!-- content -->

<!-- comment -->
  <section class="comment">
    <h2>덧글</h2>
    <ul class="commentList">
      <li>
        <ul class="commentInfo center">
          <li>
            아이디 : test123
          </li>
          <li class="center">
            작성일 : 2022-09-22
            <div class="btn">신고</div>
            <div class="btn">삭제</div>
          </li>
        </ul>
        <textarea readonly>강아지가 너무 귀엽내요</textarea>
      </li>
    </ul>

    <form action="#" method="post" class="center">
      <textarea name="content"></textarea>
      <input type="submit" value="작성">
    </form>
  </section>
<!-- comment -->
</body>
</html>