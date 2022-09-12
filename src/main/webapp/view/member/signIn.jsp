<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/member/signIn.css">
</head>
<body>

	<c:if test="${ param.id eq 'login' }">
		<script>alert("login 하세요")</script>
	</c:if>
	<c:if test="${ param.id eq 'fobidden' }">
		<script>alert("사용권한이 없습니다.")</script>
	</c:if>

	<section class="signInForm">
    <figure>
      <video src="${ pageContext.request.contextPath }/view/video/cat2.mp4" muted loop autoplay></video>
    </figure>
    <div class="video_cover"></div>
    <div class="inner center">
      <h2 class="subject">
        로그인
      </h2>
      <form action="${ pageContext.request.contextPath }/member/signInPro" class="center" method="post">
  
        <div class="name">
          <h3>아이디</h3>
          <input type="text" name="userId" required>
        </div>
        <div class="inneremail">
          <h3>비밀번호</h3>
          <input type="password" name="pwd" required>
        </div>
         
        <div class="submit center">
        <div class="autologin">
          <h3>자동 로그인</h3>
          <input id="autologin" type="checkbox" name="autoLogin" value = "0">
        </div>
          <input type="submit" value="로그인">
        </div>
      </form>
    </div>
  </section>
  <script type="text/javascript">
  	window.onload = function autoLoginActive() {
  		const isActive = document.getElementById("autologin");
  		isActive.addEventListener("click", function() {
  			isActive.value = (isActive.value == 1) ? "0" : "1";
  		})
  	}
  </script>
</body>
</html>