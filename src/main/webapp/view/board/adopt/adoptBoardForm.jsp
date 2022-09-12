<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoardForm.css">
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
  <form action="#" method="post">
    <section class="content">
      <div class="inner center">

        <div class="contentImg">
          <img src="${ pageContext.request.contextPath }/view/images/video_cover_pattern.png" alt="img">
          <div class="btn">사진넣기</div>
        </div>

        <div class="contentInfo">
          <ul class="center info1">
            <li class="center">
              <span class="name">이름 : </span><input class="petName" type="text">
            </li>
            <li class="center">
              <span class="name">종류 : </span>
              <label>
                <input type="radio" name="petType" checked value="0">강아지
              </label>
              <label>
                <input type="radio" name="petType" value="1">고양이
              </label>
            </li>
            <li class="center">
              <span class="name">성별 : </span>
              <label>
                <input type="radio" name="petGender" checked value="0">남아
              </label>
              <label>
                <input type="radio" name="petGender" value="1">여아
              </label>
            </li>
          </ul>

          <ul class="center info1">
            <li class="center">
              <span class="name">특징 : </span><input class="petDetail" type="text">
            </li>
            <li class="center">
              <span class="name">전화번호 : </span><input class="tel" type="number" placeholder="예) 01012345678">
            </li>
          </ul>

          <ul class="info1 center">
            <li class="center">
              <span class="name">중성화 : </span>
              <label>
                <input type="radio" name="petType" checked value="0">완료
              </label>
              <label>
                <input type="radio" name="petType" value="1">미완료
              </label>
            </li>
            <li class="center">
              <span class="name">예방접종 : </span>
              <label>
                <input type="radio" name="petGender" checked value="0">완료
              </label>
              <label>
                <input type="radio" name="petGender" value="1">미완료
              </label>
            </li>
          </ul>
          
          <ul class="center info1">
            <li class="center">
              <span class="name">위치 : </span><input class="place" type="text" readonly><div class="btn">주소검색</div>
            </li>
          </ul>
          <div class="info1 explain">
            <div class="name">상세설명</div>
            <textarea name="content"></textarea>
          </div>

          <div class="center submit">
            <input type="submit" value="게시물 작성" class="btn"> <div class="btn list">목록</div>
          </div>
        </div>

      </div>
    </section>
  </form>
<!-- content -->
</body>
</html>