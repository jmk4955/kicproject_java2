<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/reset.css">
<style type="text/css">
	<%@ include file="common.css"%>
</style>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/header.css">
</head>
<body>

	<header class="center">
    <a href="${ pageContext.request.contextPath }/member/index">
      <div class="logo center">
        <div class="logoImg">
          <img src="${ pageContext.request.contextPath }/view/images/logo/dogcat.png" alt="logo">
        </div>
        <div class="logoText">
          헨젤 & 빵조각
        </div>
      </div>
    </a>

    <ul class="menu center">
      <li><a href="${ pageContext.request.contextPath }/board/petBoard?boardType=0">보호중인 동물</a></li>
      <li><a href="${ pageContext.request.contextPath }/board/petBoard?boardType=1">찾고있는 동물</a></li>
      <li><a href="${ pageContext.request.contextPath }/board/petBoard?boardType=2">입양공고</a></li>
      <li><a href="${ pageContext.request.contextPath }/board/petBoard?boardType=3">입양후기</a></li>
      <li><a href="${ pageContext.request.contextPath }/member/email">의견보내기</a></li>
      <li><a href="${ pageContext.request.contextPath }/board/petBoard?boardType=4">Q&A</a></li>
    </ul>

    <ul class="login center">
      <li><a href="${ pageContext.request.contextPath }/member/signIn">로그인</a></li>
      <li><a href="${ pageContext.request.contextPath }/member/signUp">회원가입</a></li>
    </ul>
  </header>

</body>
</html>